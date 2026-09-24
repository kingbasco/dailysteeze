<?php

namespace Database\Seeders\Themes\Main\Marketplace;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\Customer;
use Botble\Ecommerce\Models\Product;
use Botble\Marketplace\Enums\StoreStatusEnum;
use Botble\Marketplace\Models\Store;
use Botble\Marketplace\Models\VendorInfo;
use Botble\Slug\Facades\SlugHelper;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

/**
 * Seeds marketplace vendor stores AND wires every product to a vendor.
 *
 * Patterned on shofy's database/seeders/Themes/Main/MarketplaceSeeder.php and
 * the plugin's HasMarketplaceSeeder trait, but inlined here so the hardcoded
 * contact info (email/phone/address) survives — the plugin trait overwrites
 * those fields with $faker output, which would break the "no fake data" seeder
 * convention amerce follows.
 *
 * Order of operations:
 *   1. Reset is_vendor flags on all customers
 *   2. Mark up to 8 customers as vendors (creates VendorInfo with bank details)
 *   3. Truncate stores + vendor info
 *   4. Create each store with explicit data, customer link, slug, logo, metadata
 *   5. Backfill store_id on every published non-variation product (round-robin)
 *   6. Propagate store_id to variations so cart-validation sees same vendor per family
 */
class StoreSeeder extends BaseSeeder
{
    protected const MAX_VENDORS = 8;

    public function run(): void
    {
        if (! is_plugin_active('marketplace')) {
            return;
        }

        $this->markVendors();

        Store::query()->truncate();
        VendorInfo::query()->truncate();

        $createdStoreIds = [];
        $vendorCustomerIds = Customer::query()->where('is_vendor', 1)->pluck('id');

        foreach ($this->getStores() as $key => $item) {
            $item['logo'] = $this->safeAvatar($key + 1);
            $item['status'] = StoreStatusEnum::PUBLISHED;
            $item['customer_id'] = $this->resolveCustomerId($key, $vendorCustomerIds);

            if (! $item['customer_id']) {
                continue;
            }

            $store = Store::query()->create($item);

            SlugHelper::createSlug($store);

            $this->createMetadata($store, $item);

            $createdStoreIds[] = $store->getKey();
        }

        $this->assignStoresToProducts($createdStoreIds);

        // MarketplaceHelper::getCategoriesForVendor() caches each store's
        // category list for 1 hour. If the helper was hit before store_id
        // backfill (e.g. fresh page render between truncate and assign),
        // the cache holds an empty result — clear it so the sidebar
        // populates immediately after seeding.
        foreach ($createdStoreIds as $storeId) {
            Cache::forget('marketplace_store_categories_' . $storeId);
        }
    }

    /**
     * Reset vendor flags then promote up to MAX_VENDORS customers (excluding
     * the demo customer@botble.com) to vendors with a VendorInfo bank record.
     */
    protected function markVendors(): void
    {
        Customer::query()->where('is_vendor', 1)->update(['is_vendor' => 0]);

        $customers = Customer::query()
            ->whereNot('email', 'customer@botble.com')
            ->get();

        $promoted = 0;
        foreach ($customers as $customer) {
            $shouldPromote = $promoted < self::MAX_VENDORS;
            $customer->is_vendor = $shouldPromote;
            $customer->vendor_verified_at = $shouldPromote ? $this->now() : null;
            $customer->save();

            if ($shouldPromote) {
                $promoted++;

                VendorInfo::query()->create([
                    'customer_id' => $customer->id,
                    'bank_info' => [
                        'name' => 'Demo Bank',
                        'number' => '0000-' . str_pad((string) $customer->id, 8, '0', STR_PAD_LEFT),
                        'full_name' => $customer->name,
                        'description' => 'Auto-seeded vendor bank account for demo purposes.',
                    ],
                ]);
            }
        }
    }

    /**
     * Pin the first store to vendor@botble.com (canonical demo vendor login);
     * subsequent stores get a random vendor customer.
     */
    protected function resolveCustomerId(int $index, $vendorCustomerIds): ?int
    {
        if ($index === 0) {
            $id = Customer::query()->where('email', 'vendor@botble.com')->value('id');
            if ($id) {
                return (int) $id;
            }
        }

        return $vendorCustomerIds->isEmpty() ? null : (int) $vendorCustomerIds->random();
    }

    /**
     * Round-robin assign created stores across every parent product, then copy
     * each parent's store_id down to its variations so vendor-scoped queries
     * and cart-validation see one vendor per product family.
     *
     * @param  array<int>  $storeIds
     */
    protected function assignStoresToProducts(array $storeIds): void
    {
        if (! is_plugin_active('ecommerce') || empty($storeIds)) {
            return;
        }

        $parents = Product::query()
            ->where('is_variation', false)
            ->orderBy('id')
            ->pluck('id')
            ->all();

        if (empty($parents)) {
            return;
        }

        $storeCount = count($storeIds);

        foreach ($parents as $index => $parentId) {
            $storeId = $storeIds[$index % $storeCount];

            Product::query()->whereKey($parentId)->update(['store_id' => $storeId]);

            $variationProductIds = DB::table('ec_product_variations')
                ->where('configurable_product_id', $parentId)
                ->pluck('product_id');

            if ($variationProductIds->isNotEmpty()) {
                Product::query()->whereIn('id', $variationProductIds)->update(['store_id' => $storeId]);
            }
        }
    }

    /**
     * Resolve a testimonial avatar as the store logo (no separate store-asset
     * directory needed). Falls back to null so RvMedia renders a generated
     * initials avatar via Store::logoUrl when the source file is missing.
     */
    protected function safeAvatar(int $index): ?string
    {
        $index = (($index - 1) % 10) + 1;

        try {
            return $this->filePath(sprintf('testimonials/avatar-%d.jpg', $index));
        } catch (\Throwable) {
            return null;
        }
    }

    public function getStores(): array
    {
        return [
            [
                'name' => 'Anthro Studio',
                'email' => 'hello@anthro.example.com',
                'phone' => '+1-415-555-0142',
                'address' => '512 Valencia Street',
                'country' => 'US',
                'state' => 'California',
                'city' => 'San Francisco',
                'zip_code' => '94110',
                'company' => 'Anthro Studio Inc.',
                'description' => 'Eclectic apparel and home goods inspired by global craftsmanship traditions.',
                'content' => '<p>Anthro Studio sources from independent artisans across four continents. Every piece is checked by hand before it ships from our San Francisco fulfilment center.</p>',
                'is_verified' => true,
            ],
            [
                'name' => 'Crate Furniture Co.',
                'email' => 'orders@crate.example.com',
                'phone' => '+1-503-555-0188',
                'address' => '1840 NE Alberta Street',
                'country' => 'US',
                'state' => 'Oregon',
                'city' => 'Portland',
                'zip_code' => '97211',
                'company' => 'Crate Furniture Co.',
                'description' => 'Mid-century-inspired furniture built to last generations.',
                'content' => '<p>Every Crate piece is built one at a time in our Portland workshop using sustainably harvested American hardwoods.</p>',
                'is_verified' => true,
            ],
            [
                'name' => 'Findr Audio',
                'email' => 'support@findr.example.com',
                'phone' => '+44-20-7946-0310',
                'address' => '17 Hanbury Street',
                'country' => 'GB',
                'state' => 'Greater London',
                'city' => 'London',
                'zip_code' => 'E1 6QR',
                'company' => 'Findr Audio Ltd.',
                'description' => 'Audio gear engineered for studio-grade clarity in everyday environments.',
                'content' => '<p>Founded by ex-studio engineers, Findr brings reference-quality sound to wireless headphones and earbuds.</p>',
                'is_verified' => true,
            ],
            [
                'name' => 'Bohome Living',
                'email' => 'hello@bohome.example.com',
                'phone' => '+34-93-555-0122',
                'address' => 'Carrer de Sepulveda 102',
                'country' => 'ES',
                'state' => 'Catalonia',
                'city' => 'Barcelona',
                'zip_code' => '08015',
                'company' => 'Bohome Living S.L.',
                'description' => 'Bohemian-inspired homewares and textiles for the relaxed modern home.',
                'content' => '<p>Bohome partners with co-operatives in Morocco, Turkey, and India to bring you authentic, fair-traded textiles.</p>',
                'is_verified' => true,
            ],
        ];
    }
}
