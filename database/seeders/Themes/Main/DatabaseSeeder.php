<?php

namespace Database\Seeders\Themes\Main;

use Botble\ACL\Database\Seeders\UserSeeder;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\CurrencySeeder as EcommerceCurrencySeeder;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Str;

class DatabaseSeeder extends BaseSeeder
{
    /**
     * Returns the ordered list of seeders Main runs.
     *
     * Variant DatabaseSeeders (phase-12, Home2..Home21) override this and
     * spread parent::getSeeders() then array_filter-remove the entries they
     * intend to redefine (PageSeeder, ThemeOptionSeeder, optionally
     * WidgetSeeder), then re-append their own version + Main\TranslationSeeder
     * LAST so translations cover the variant content.
     */
    public function getSeeders(): array
    {
        return [
            SettingSeeder::class,
            UserSeeder::class,
            LanguageSeeder::class,
            BlogCategorySeeder::class,
            BlogTagSeeder::class,
            BlogSeeder::class,
            ContactSeeder::class,
            FaqSeeder::class,
            TestimonialSeeder::class,
            SimpleSliderSeeder::class,
            // Ecommerce (each seeder gates itself with is_plugin_active('ecommerce'))
            // Currency MUST run before ProductSeeder so format_price() has a default.
            // Use the plugin-shipped seeder (USD/EUR/VND/NGN) so demo currencies stay
            // in sync with plugin updates instead of maintaining a theme-local copy.
            EcommerceCurrencySeeder::class,
            Ecommerce\ProductCategorySeeder::class,
            Ecommerce\ProductAttributeSetSeeder::class,
            Ecommerce\ProductLabelSeeder::class,
            Ecommerce\ProductCollectionSeeder::class,
            Ecommerce\ProductOptionSeeder::class,
            Ecommerce\ProductTagSeeder::class,
            Ecommerce\BrandSeeder::class,
            Ecommerce\ProductSeeder::class,
            Ecommerce\SpecificationSeeder::class,
            Ecommerce\SizeGuideSeeder::class,
            Ecommerce\CustomerSeeder::class,
            Ecommerce\ReviewSeeder::class,
            Ecommerce\FlashSaleSeeder::class,
            Ecommerce\DiscountSeeder::class,
            Ecommerce\ShippingSeeder::class,
            // Marketplace (gated inside seeder)
            Marketplace\StoreSeeder::class,
            // Theme content — depends on ecommerce data being present
            // for product references in homepage shortcodes
            PageSeeder::class,
            MenuSeeder::class,
            WidgetSeeder::class,
            ThemeOptionSeeder::class,
            // MUST be last
            TranslationSeeder::class,
        ];
    }

    public function run(): void
    {
        $this->prepareRun();

        // Basename-keyed dispatch — when variants spread parent::getSeeders()
        // and re-append their own PageSeeder, the variant entry wins (last write)
        // without duplicating the run.
        $seeders = [];
        foreach ($this->getSeeders() as $seeder) {
            $seeders[Str::afterLast($seeder, '\\')] = $seeder;
        }

        // Enforce dependency order: variants append their own ProductSeeder LAST,
        // but parent ReviewSeeder/FlashSaleSeeder/DiscountSeeder stay at their
        // original (earlier) positions. After dedup that still leaves these
        // running BEFORE the variant ProductSeeder — so reviews seed against
        // zero products. Move all product-dependents to immediately after
        // ProductSeeder so review/flash-sale/discount seeders see the variant's
        // products instead of an empty table.
        $seeders = $this->orderProductDependents($seeders);

        $this->call($seeders);

        // BaseSeeder::filePath() short-circuits when a source file already exists
        // in storage (from a prior seed run) — skipping both media_files
        // registration AND thumbnail generation. After prepareRun() truncates
        // media_files, those pre-existing storage files are left as orphaned
        // sources whose -WxH thumbnail variants 404/403 on the storefront.
        // Force-regenerate thumbnails for every media_file row to repair this
        // — covers files seeded via the upload path AND any re-seeds where
        // sources already existed.
        $this->regenerateThumbnailsAfterSeed();

        $this->finished();
    }

    /**
     * Run the cms:media:thumbnail:generate command at the end of the seed.
     * Idempotent — only regenerates for files registered in media_files.
     */
    protected function regenerateThumbnailsAfterSeed(): void
    {
        try {
            Artisan::call('cms:media:thumbnail:generate', [
                '--override' => true,
                '--silent' => true,
            ]);
        } catch (\Throwable) {
            // Non-fatal: missing thumbs result in storefront 403s but seeding succeeded.
        }
    }

    /**
     * Re-order the deduped seeder list so seeders that depend on products
     * (CustomerSeeder, ReviewSeeder, FlashSaleSeeder, DiscountSeeder,
     * ShippingSeeder) always follow ProductSeeder, regardless of original
     * position.
     *
     * CustomerSeeder MUST appear before ReviewSeeder so reviews have customers
     * to attach to — the early-return guard `if ($customers->isEmpty())` in
     * ReviewSeeder otherwise produces zero reviews when CustomerSeeder is left
     * at its later original position after the dependents are moved up.
     *
     * @param  array<string, class-string>  $seeders  basename => fqcn
     * @return array<string, class-string>
     */
    protected function orderProductDependents(array $seeders): array
    {
        $productKey = 'ProductSeeder';
        if (! isset($seeders[$productKey])) {
            return $seeders;
        }

        // StoreSeeder backfills store_id onto every non-variation product, so
        // it MUST run after the (possibly variant-overridden) ProductSeeder —
        // otherwise the variant's truncate wipes the assignments. CustomerSeeder
        // also needs to precede StoreSeeder since the trait promotes existing
        // customers to vendors.
        $dependents = ['CustomerSeeder', 'ReviewSeeder', 'FlashSaleSeeder', 'DiscountSeeder', 'ShippingSeeder', 'StoreSeeder'];
        $extracted = [];
        foreach ($dependents as $dep) {
            if (isset($seeders[$dep])) {
                $extracted[$dep] = $seeders[$dep];
                unset($seeders[$dep]);
            }
        }

        if (empty($extracted)) {
            return $seeders;
        }

        // Splice extracted seeders in immediately after ProductSeeder.
        $reordered = [];
        foreach ($seeders as $key => $value) {
            $reordered[$key] = $value;
            if ($key === $productKey) {
                foreach ($extracted as $dKey => $dValue) {
                    $reordered[$dKey] = $dValue;
                }
            }
        }

        return $reordered;
    }
}
