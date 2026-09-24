<?php

namespace Database\Seeders\Themes\HomeSport;

use Database\Seeders\Themes\Main\BlogCategorySeeder as MainBlogCategorySeeder;
use Database\Seeders\Themes\Main\BlogSeeder as MainBlogSeeder;
use Database\Seeders\Themes\Main\Ecommerce\BrandSeeder as MainBrandSeeder;
use Database\Seeders\Themes\Main\Ecommerce\ProductCategorySeeder as MainProductCategorySeeder;
use Database\Seeders\Themes\Main\Ecommerce\ProductCollectionSeeder as MainProductCollectionSeeder;
use Database\Seeders\Themes\Main\Ecommerce\ProductSeeder as MainProductSeeder;
use Database\Seeders\Themes\Main\PageSeeder as MainPageSeeder;
use Database\Seeders\Themes\Main\TestimonialSeeder as MainTestimonialSeeder;
use Database\Seeders\Themes\Main\ThemeOptionSeeder as MainThemeOptionSeeder;
use Database\Seeders\Themes\Main\TranslationSeeder as MainTranslationSeeder;

class DatabaseSeeder extends \Database\Seeders\Themes\Main\DatabaseSeeder
{
    public function getSeeders(): array
    {
        $parent = array_filter(
            parent::getSeeders(),
            fn ($s) => $s !== MainPageSeeder::class
                    && $s !== MainThemeOptionSeeder::class
                    && $s !== MainTranslationSeeder::class
                    && $s !== MainTestimonialSeeder::class
                    && $s !== MainBlogCategorySeeder::class
                    && $s !== MainBlogSeeder::class
                    && $s !== MainBrandSeeder::class
                    && $s !== MainProductCategorySeeder::class
                    && $s !== MainProductCollectionSeeder::class
                    && $s !== MainProductSeeder::class
        );

        return [
            ...$parent,
            BlogCategorySeeder::class,
            BlogSeeder::class,
            Ecommerce\BrandSeeder::class,
            Ecommerce\ProductCategorySeeder::class,
            Ecommerce\ProductCollectionSeeder::class,
            Ecommerce\ProductSeeder::class,
            TestimonialSeeder::class,
            PageSeeder::class,
            ThemeOptionSeeder::class,
            TranslationSeeder::class,
        ];
    }
}
