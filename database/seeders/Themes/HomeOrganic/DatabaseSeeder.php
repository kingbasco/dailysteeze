<?php

namespace Database\Seeders\Themes\HomeOrganic;

use Database\Seeders\Themes\Main\BlogCategorySeeder as MainBlogCategorySeeder;
use Database\Seeders\Themes\Main\BlogSeeder as MainBlogSeeder;
use Database\Seeders\Themes\Main\Ecommerce\ProductCategorySeeder as MainProductCategorySeeder;
use Database\Seeders\Themes\Main\Ecommerce\ProductSeeder as MainProductSeeder;
use Database\Seeders\Themes\Main\PageSeeder as MainPageSeeder;
use Database\Seeders\Themes\Main\SimpleSliderSeeder as MainSimpleSliderSeeder;
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
                    && $s !== MainBlogCategorySeeder::class
                    && $s !== MainBlogSeeder::class
                    && $s !== MainProductCategorySeeder::class
                    && $s !== MainProductSeeder::class
                    && $s !== MainSimpleSliderSeeder::class
        );

        return [
            ...$parent,
            SimpleSliderSeeder::class,
            BlogCategorySeeder::class,
            BlogSeeder::class,
            Ecommerce\ProductCategorySeeder::class,
            Ecommerce\ProductSeeder::class,
            TestimonialSeeder::class,
            PageSeeder::class,
            ThemeOptionSeeder::class,
            TranslationSeeder::class,
        ];
    }
}
