<?php

namespace Database\Seeders\Themes\Main\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\Address;
use Botble\Ecommerce\Models\Customer;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Hash;

/**
 * Mirrors the shofy CustomerSeeder pattern: 2 special accounts (customer + vendor)
 * plus 8 numbered demo customers, each with a primary address. Required by the
 * base Botble ecommerce ReviewSeeder which assigns reviews to existing customers.
 */
class CustomerSeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        Customer::query()->truncate();
        Address::query()->truncate();

        $names = $this->getNames();
        $phones = $this->getPhones();
        $countries = $this->getCountries();
        $states = $this->getStates();
        $cities = $this->getCities();
        $addresses = $this->getAddresses();
        $zipCodes = $this->getZipCodes();

        $primaryEmails = ['customer@botble.com', 'vendor@botble.com'];
        $now = $this->now();
        $avatarIndex = 1;

        foreach ($primaryEmails as $index => $email) {
            $customer = Customer::query()->forceCreate([
                'name' => $names[$index] ?? Arr::random($names),
                'email' => $email,
                'password' => Hash::make('12345678'),
                'phone' => $phones[$index] ?? Arr::random($phones),
                'avatar' => $this->safeAvatar($avatarIndex++),
                'dob' => $now->copy()->subYears(rand(20, 50))->subDays(rand(1, 30)),
                'confirmed_at' => $now,
            ]);

            $this->seedAddress($customer, $names, $phones, $countries, $states, $cities, $addresses, $zipCodes, true);
            $this->seedAddress($customer, $names, $phones, $countries, $states, $cities, $addresses, $zipCodes, false);
        }

        for ($i = 0; $i < 8; $i++) {
            $customer = Customer::query()->forceCreate([
                'name' => $names[$i + 2] ?? Arr::random($names),
                'email' => sprintf('customer%d@example.com', $i + 1),
                'password' => Hash::make('12345678'),
                'phone' => Arr::random($phones),
                'avatar' => $this->safeAvatar($avatarIndex++),
                'dob' => $now->copy()->subYears(rand(20, 50))->subDays(rand(1, 30)),
                'confirmed_at' => $now,
            ]);

            $this->seedAddress($customer, $names, $phones, $countries, $states, $cities, $addresses, $zipCodes, true);
        }
    }

    private function seedAddress(
        Customer $customer,
        array $names,
        array $phones,
        array $countries,
        array $states,
        array $cities,
        array $addresses,
        array $zipCodes,
        bool $isDefault
    ): void {
        Address::query()->create([
            'name' => $customer->name,
            'phone' => Arr::random($phones),
            'email' => $customer->email,
            'country' => Arr::random($countries),
            'state' => Arr::random($states),
            'city' => Arr::random($cities),
            'address' => Arr::random($addresses),
            'zip_code' => Arr::random($zipCodes),
            'customer_id' => $customer->getKey(),
            'is_default' => $isDefault,
        ]);
    }

    /**
     * Reuse seeded testimonial avatars (avatar-1.jpg .. avatar-10.jpg) since
     * amerce ships those assets but no dedicated customer avatar set.
     */
    private function safeAvatar(int $index): ?string
    {
        $index = (($index - 1) % 10) + 1;

        try {
            return $this->filePath(sprintf('testimonials/avatar-%d.jpg', $index));
        } catch (\Throwable) {
            return null;
        }
    }

    private function getNames(): array
    {
        return [
            'Emma Collins',
            'Sophia Ramirez',
            'Olivia Carter',
            'Ava Mitchell',
            'Isabella Brooks',
            'James Whitfield',
            'Liam Bennett',
            'Noah Patterson',
            'Charlotte Reed',
            'Amelia Foster',
        ];
    }

    private function getPhones(): array
    {
        return [
            '+1-555-0101', '+1-555-0102', '+1-555-0103', '+1-555-0104', '+1-555-0105',
            '+1-555-0106', '+1-555-0107', '+1-555-0108', '+1-555-0109', '+1-555-0110',
        ];
    }

    private function getCountries(): array
    {
        return ['US', 'GB', 'CA', 'AU', 'DE'];
    }

    private function getStates(): array
    {
        return [
            'California', 'New York', 'Texas', 'Florida', 'Illinois',
            'Pennsylvania', 'Ohio', 'Georgia', 'Michigan', 'Arizona',
        ];
    }

    private function getCities(): array
    {
        return [
            'Los Angeles', 'New York', 'Houston', 'Miami', 'Chicago',
            'Phoenix', 'San Diego', 'Dallas', 'Austin', 'Denver',
        ];
    }

    private function getAddresses(): array
    {
        return [
            '123 Main Street', '456 Oak Avenue', '789 Pine Road', '321 Maple Drive',
            '654 Cedar Lane', '987 Birch Boulevard', '147 Elm Court', '258 Walnut Way',
            '369 Cherry Circle', '741 Spruce Street',
        ];
    }

    private function getZipCodes(): array
    {
        return [
            '10001', '90210', '60601', '33101', '77001',
            '85001', '48201', '30301', '19101', '80201',
        ];
    }
}
