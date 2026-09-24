<?php

namespace Database\Seeders\Themes\Main;

use Botble\Base\Supports\BaseSeeder;
use Botble\Language\Models\Language;

/**
 * Creates the default English row plus the four translation locales BEFORE
 * MenuSeeder / WidgetSeeder / ThemeOptionSeeder run.
 *
 * Why so early: Botble's MenuSeeder calls LanguageMeta::saveMetaData() during
 * createMenus(), and that helper resolves the default locale code via
 * Language::getDefaultLocaleCode(). If no language rows exist at that moment
 * the helper falls back to the dummy 'en_US' code, which leaves every original
 * menu tagged with a code that doesn't match the active default — breaking the
 * frontend language filter and causing every translated menu to render
 * simultaneously at the same menu location.
 */
class LanguageSeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('language')) {
            return;
        }

        Language::query()->truncate();

        foreach ($this->languages() as $language) {
            Language::query()->updateOrCreate(
                ['lang_code' => $language['lang_code']],
                $language
            );
        }
    }

    public function languages(): array
    {
        return [
            [
                'lang_name' => 'English',
                'lang_locale' => 'en',
                'lang_is_default' => true,
                'lang_code' => 'en',
                'lang_is_rtl' => false,
                'lang_flag' => 'us',
                'lang_order' => 0,
            ],
            [
                'lang_name' => 'Tiếng Việt',
                'lang_locale' => 'vi',
                'lang_is_default' => false,
                'lang_code' => 'vi',
                'lang_is_rtl' => false,
                'lang_flag' => 'vn',
                'lang_order' => 1,
            ],
            [
                'lang_name' => 'العربية',
                'lang_locale' => 'ar',
                'lang_is_default' => false,
                'lang_code' => 'ar',
                'lang_is_rtl' => true,
                'lang_flag' => 'sa',
                'lang_order' => 2,
            ],
            [
                'lang_name' => 'Français',
                'lang_locale' => 'fr',
                'lang_is_default' => false,
                'lang_code' => 'fr',
                'lang_is_rtl' => false,
                'lang_flag' => 'fr',
                'lang_order' => 3,
            ],
            [
                'lang_name' => 'Bahasa Indonesia',
                'lang_locale' => 'id',
                'lang_is_default' => false,
                'lang_code' => 'id',
                'lang_is_rtl' => false,
                'lang_flag' => 'id',
                'lang_order' => 4,
            ],
            [
                'lang_name' => 'Türkçe',
                'lang_locale' => 'tr',
                'lang_is_default' => false,
                'lang_code' => 'tr',
                'lang_is_rtl' => false,
                'lang_flag' => 'tr',
                'lang_order' => 5,
            ],
        ];
    }
}
