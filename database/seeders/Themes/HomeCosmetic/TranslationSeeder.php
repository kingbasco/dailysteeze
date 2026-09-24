<?php

namespace Database\Seeders\Themes\HomeCosmetic;

use Database\Seeders\Themes\Main\TranslationSeeder as MainTranslationSeeder;

/**
 * Variant translation seeder. Inherits all logic from Main\TranslationSeeder;
 * exists so each variant DatabaseSeeder can re-append its own namespaced
 * TranslationSeeder::class (mirrors the ~/workspace/infinia multi-theme pattern).
 */
class TranslationSeeder extends MainTranslationSeeder
{
}
