<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Database\Seeders\Themes\Main\DatabaseSeeder as MainThemeSeeder;

class DatabaseSeeder extends BaseSeeder
{
    public function run(): void
    {
        $this->call(MainThemeSeeder::class);
    }
}
