@php
    Theme::set('breadcrumbStyle', 'none');

    // Pull the canonical homepage shortcode block from Main\PageSeeder so the
    // displayed snippet always tracks the seeder's getHomepageContent().
    $shortcodeBlock = '';

    try {
        $seederClass = \Database\Seeders\Themes\Main\PageSeeder::class;

        if (class_exists($seederClass)) {
            $seeder = new $seederClass();
            $reflection = new \ReflectionMethod($seeder, 'getHomepageContent');
            $reflection->setAccessible(true);
            $shortcodeBlock = html_entity_decode((string) $reflection->invoke($seeder), ENT_NOQUOTES, 'UTF-8');
        }
    } catch (\Throwable) {
        // Fail silently — the page still shows the setup instructions.
    }
@endphp

<div class="container py-5">
    <h4 class="text-danger">{{ __('You need to set up your homepage first!') }}</h4>

    <ul class="list-unstyled">
        <li class="mb-2"><strong>1. {{ __('Go to Admin → Plugins and activate all required plugins.') }}</strong></li>

        <li class="mb-2">
            <strong>2. {{ __('Go to Admin → Pages and create a new page:') }}</strong>

            <div class="mt-2">
                <label>{{ __('Copy and paste the following code into the page content (Source / HTML mode):') }}</label>
                <pre class="border p-2 mb-1" style="white-space: pre-wrap; word-break: break-word; max-height: 480px; overflow: auto;"><code>{{ $shortcodeBlock ?: '[simple-slider key="home-hero" style="style-1"][/simple-slider]' }}</code></pre>

                <p>{{ __('Choose the') }} <strong>{{ __('Homepage') }}</strong> {{ __('template.') }}</p>

                <p class="text-muted small">
                    {{ __('Tip: this snippet is generated from') }}
                    <code>database/seeders/Themes/Main/PageSeeder.php::getHomepageContent()</code>.
                    {{ __('Run') }}
                    <code>php artisan db:seed --class="Database\\Seeders\\Themes\\Main\\DatabaseSeeder" --force</code>
                    {{ __('to seed the demo content automatically.') }}
                </p>
            </div>
        </li>

        <li><strong>3. {{ __('Go to Admin → Appearance → Theme options → General to set this page as your homepage.') }}</strong></li>
    </ul>
</div>
