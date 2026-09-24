<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Setting\Facades\Setting;
use Illuminate\Support\Facades\Artisan;

/**
 * ThemeWorkModeSeeder — temporary seeder to deactivate UX-noise plugins
 * and disable the debug bar so visual diff captures stay clean.
 *
 * Disables: sale-popup, newsletter, cookie-consent (overlay popups).
 * Patches .env to set APP_DEBUG=false (Botble's debug bar gates on app.debug).
 *
 * Usage:
 *   php artisan db:seed --class='Database\Seeders\ThemeWorkModeSeeder' --force
 *
 * Reactivate later via admin UI or by re-running the matching theme variant
 * DatabaseSeeder (which seeds the full activated_plugins list from Main).
 * Restore APP_DEBUG=true manually in .env when done with theme work.
 */
class ThemeWorkModeSeeder extends BaseSeeder
{
    public function run(): void
    {
        $deactivate = ['sale-popup', 'newsletter', 'cookie-consent'];

        $activated = json_decode((string) Setting::get('activated_plugins', '[]'), true) ?: [];
        $filtered = array_values(array_diff($activated, $deactivate));

        if ($filtered !== $activated) {
            Setting::forceSet('activated_plugins', json_encode($filtered))->save();
            $this->command?->info('Deactivated plugins: ' . implode(', ', array_intersect($activated, $deactivate)));
        } else {
            $this->command?->line('No target plugins were active — nothing to deactivate.');
        }

        cache()->forget('core_installed_plugins');
        $this->command?->line('Cleared plugin cache.');

        $this->disableDebugBar();
    }

    private function disableDebugBar(): void
    {
        $envPath = base_path('.env');

        if (! is_file($envPath) || ! is_writable($envPath)) {
            $this->command?->warn('.env not writable — set APP_DEBUG=false manually to hide the debug bar.');

            return;
        }

        $content = (string) file_get_contents($envPath);

        if (preg_match('/^APP_DEBUG=true\s*$/m', $content)) {
            $content = preg_replace('/^APP_DEBUG=true\s*$/m', 'APP_DEBUG=false', $content);
            file_put_contents($envPath, $content);
            $this->command?->info('Set APP_DEBUG=false in .env (debug bar hidden).');
        } else {
            $this->command?->line('APP_DEBUG already non-true in .env — no change needed.');
        }

        Artisan::call('config:clear');
    }
}
