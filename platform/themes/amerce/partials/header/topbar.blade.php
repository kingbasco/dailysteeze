@php
    use Botble\Base\Facades\BaseHelper;

    // Newline-delimited center-strip slides. Falls back to single legacy `topbar_text`
    // for backwards-compat with installs seeded before topbar_slides existed.
    $rawSlides = (string) theme_option('topbar_slides', (string) theme_option('topbar_text', ''));
    $slides = array_values(array_filter(array_map('trim', preg_split('/\r?\n/', $rawSlides))));

    // Admin override — populating header_top_sidebar replaces the entire bar.
    $headerTopSidebar = trim((string) dynamic_sidebar('header_top_sidebar'));

    // Right-side: 5 social icons (Facebook, X, Instagram, TikTok, Snapchat) — only
    // those with URLs configured render.
    $socialLinks = array_filter([
        'facebook'  => ['url' => (string) theme_option('facebook_url'),  'icon' => 'icon-FacebookLogo',  'label' => 'Facebook'],
        'twitter'   => ['url' => (string) theme_option('twitter_url'),   'icon' => 'icon-XLogo',         'label' => 'X'],
        'instagram' => ['url' => (string) theme_option('instagram_url'), 'icon' => 'icon-InstagramLogo', 'label' => 'Instagram'],
        'tiktok'    => ['url' => (string) theme_option('tiktok_url'),    'icon' => 'icon-TiktokLogo',    'label' => 'TikTok'],
        'snapchat'  => ['url' => (string) theme_option('snapchat_url'),  'icon' => 'icon-SnapchatLogo',  'label' => 'Snapchat'],
    ], fn ($s) => $s['url'] !== '');

    // Currency / language switchers — only render when those plugins expose a switchable list.
    $hasCurrencies = is_plugin_active('ecommerce')
        && method_exists(\Botble\Ecommerce\Supports\CurrencySupport::class, 'currencies')
        && get_all_currencies()->count() > 1;
    $hasLanguages = is_plugin_active('language')
        && count(\Botble\Language\Facades\Language::getSupportedLocales() ?? []) > 1;

    // Topbar style switch: presets pick the layout via the `topbar_style` theme option.
    //   'style-3' (default — fashion preset): curr/lang LEFT, slides CENTER, socials RIGHT, bg-dark
    //   'style-2' (furniture preset): phone+links LEFT, vertical slides CENTER, curr/lang RIGHT, bg-secondary, NO socials
    $topbarStyle = (string) theme_option('topbar_style', 'style-3');

    // Inner-content layout override (independent of $topbarStyle / $tbWrapperOverride).
    //   'slides-only' (fashion-3, sneaker, sport, garden): centered swiper + prev/next arrows pushed
    //                 via ms-auto/me-auto, NO curr/lang, NO socials. Matches their HTML demos.
    $topbarLayout = (string) theme_option('topbar_layout', '');

    // Optional contact links shown in style-2's LEFT slot.
    $hotline       = (string) theme_option('hotline', '');
    $ourStoreUrl   = (string) theme_option('our_store_url', '');
    $contactUrl    = (string) theme_option('contact_url', '');
    $topbarBgClass = trim((string) theme_option('topbar_bg_class', 'bg-dark'));
    $topbarColorMode = trim((string) theme_option('topbar_color_mode', ''));
    $topbarColorMode = $topbarColorMode !== '' ? $topbarColorMode : ($topbarBgClass === '' ? 'light' : 'dark');
    $topbarInnerContainer = trim((string) theme_option('topbar_inner_container', ''));
    $topbarInnerContainer = $topbarInnerContainer !== ''
        ? $topbarInnerContainer
        : ($topbarStyle === 'style-2' && $topbarBgClass === '' && empty($slides) ? 'container' : 'container-full');
    $topbarLinkClass = trim(($topbarColorMode === 'dark' ? 'text-white ' : '') . 'link');
@endphp

@php
    // Per-preset wrapper class OVERRIDE — replaces ALL auto-derived classes for the outer
    // <div class="tf-topbar ...">. Wins regardless of $topbarStyle. Use when a demo's class
    // string is unique (e.g. home-sport `bg-dark tf-btn-swiper-main`, home-construction `bg-dark`).
    $tbWrapperOverride = trim((string) theme_option('topbar_wrapper_override', ''));

    // Inline color overrides from Theme Options → Header. `$headerTopBackgroundColor`
    // and `$headerTopTextColor` are injected by partialComposer('header.*') in config.php.
    // Use inline style so admin values win over Bootstrap utility classes (bg-dark, bg-secondary)
    // already on the `.tf-topbar` wrapper.
    $tbStyleAttr = '';
    if (! empty($headerTopBackgroundColor) || ! empty($headerTopTextColor)) {
        $tbStyleParts = [];
        if (! empty($headerTopBackgroundColor)) {
            $tbStyleParts[] = 'background-color: ' . e($headerTopBackgroundColor);
        }
        if (! empty($headerTopTextColor)) {
            $tbStyleParts[] = 'color: ' . e($headerTopTextColor);
        }
        $tbStyleAttr = ' style="' . implode('; ', $tbStyleParts) . '"';
    }
@endphp

@if ($headerTopSidebar)
<div class="tf-topbar bg-dark"{!! $tbStyleAttr !!}>
    <div class="{{ $topbarInnerContainer }}">
        {!! BaseHelper::clean($headerTopSidebar) !!}
    </div>
</div>
@elseif ($topbarLayout === 'slides-only')
{{-- Slides-only layout (fashion-3, sneaker, sport, garden HTML demos): centered swiper with
     prev/next arrows pushed inward via ms-auto/me-auto. No curr/lang, no socials.
     Wrapper class still honors $tbWrapperOverride; falls back to topbar_bg_class. --}}
@php
    $tbSlidesWrapper = $tbWrapperOverride !== ''
        ? 'tf-topbar ' . $tbWrapperOverride
        : 'tf-topbar ' . trim((string) theme_option('topbar_bg_class', 'bg-dark')) . ' tf-btn-swiper-main';
@endphp
<div class="{{ trim($tbSlidesWrapper) }}"{!! $tbStyleAttr !!}>
    <div class="container">
        <div class="row align-items-center">
            @if (! empty($slides))
                <div class="col-sm-1 ms-auto d-none d-sm-block">
                    <div class="nav-prev-swiper d-flex text-white link justify-content-end" aria-label="{{ __('Previous') }}">
                        <i class="icon icon-CaretLeft"></i>
                    </div>
                </div>
                <div class="col-sm-10 col-md-8 col-lg-6">
                    <div class="text-center">
                        <div dir="ltr" class="swiper tf-swiper" data-auto="true" data-loop="true" data-speed="1500" data-delay="1500">
                            <div class="swiper-wrapper">
                                @foreach ($slides as $slide)
                                    <div class="swiper-slide">
                                        <p class="text-white text-line-clamp-1">{!! BaseHelper::clean($slide) !!}</p>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-1 me-auto d-none d-sm-block">
                    <div class="nav-next-swiper d-flex text-white link" aria-label="{{ __('Next') }}">
                        <i class="icon icon-CaretRightThin"></i>
                    </div>
                </div>
            @endif
        </div>
    </div>
</div>
@elseif ($tbWrapperOverride !== '' && $topbarStyle !== 'style-2')
{{-- Per-preset full override for non-style-2 presets — style-2 has its own override handler
     below that preserves its phone-LEFT / slides-CENTER / curr-RIGHT layout. Without this
     guard, a style-2 preset that sets topbar_wrapper_override would land in this style-3-ish
     layout (curr LEFT, socials RIGHT) instead of its own. --}}
{{-- Inner content uses style-3 layout (curr/lang LEFT, slides CENTER, socials RIGHT). --}}
<div class="{{ trim('tf-topbar ' . $tbWrapperOverride) }}"{!! $tbStyleAttr !!}>
    <div class="{{ $topbarInnerContainer }}">
        <div class="row align-items-center">
            <div class="col-lg-3 col-xxl-2 d-none d-lg-block">
                @if ($hasCurrencies || $hasLanguages)
                    <div class="tf-list list-currenci">
                        @if ($hasCurrencies)
                            @include(Theme::getThemeNamespace('partials.currency-switcher'), ['colorMode' => 'dark'])
                        @endif
                        @if ($hasLanguages)
                            @include(Theme::getThemeNamespace('partials.language-switcher'), ['colorMode' => 'dark'])
                        @endif
                    </div>
                @endif
            </div>
            @if (! empty($slides))
                <div class="col-sm-1 d-none d-xl-block">
                    <div class="nav-prev-swiper d-flex text-white link justify-content-end" aria-label="{{ __('Previous') }}">
                        <i class="icon icon-CaretLeft"></i>
                    </div>
                </div>
                <div class="col-lg-6 col-xl-4 col-xxl-6">
                    <div class="text-center">
                        <div dir="ltr" class="swiper tf-swiper" data-auto="true" data-loop="true" data-speed="1500" data-delay="1500">
                            <div class="swiper-wrapper">
                                @foreach ($slides as $slide)
                                    <div class="swiper-slide">
                                        <p class="text-white text-line-clamp-1">{!! BaseHelper::clean($slide) !!}</p>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-1 d-none d-xl-block">
                    <div class="nav-next-swiper d-flex text-white link" aria-label="{{ __('Next') }}">
                        <i class="icon icon-CaretRightThin"></i>
                    </div>
                </div>
            @endif
            <div class="col-lg-3 col-xxl-2 d-none d-lg-block">
                @if (! empty($socialLinks))
                    <div class="tf-list-socials d-flex justify-content-end">
                        @foreach ($socialLinks as $key => $social)
                            <a href="{{ $social['url'] }}" target="_blank" rel="noopener noreferrer" class="link" aria-label="{{ $social['label'] }}">
                                <i class="icon {{ $social['icon'] }}"></i>
                            </a>
                        @endforeach
                    </div>
                @endif
            </div>
        </div>
    </div>
</div>
@elseif ($topbarStyle === 'style-2')
{{-- Style-2 topbar (phone+links LEFT, optional center swiper slides, curr/lang RIGHT).
     Two demo flavors share this branch:
       - Furniture (slides + bg-secondary): 3-col with vertical swiper.
       - Electronics / auto / mental / pod / bag-accessories (NO slides + bg-dark): 2-col simple.
     Layout switches on $slides presence. bg driven by `topbar_bg_class` theme_option. --}}
@php
    $tb2Bg = $topbarBgClass;
    $tb2HasSlides = ! empty($slides);
    // Demo class strings differ between three flavors:
    //   slides+sage  (furniture)               → `tf-topbar bg-secondary tf-btn-swiper-main` (no d-none, no topbar-s2)
    //   slides+dark  (organic, jewelry)        → `tf-topbar d-none d-md-flex bg-dark`        (no tf-btn-swiper-main, no topbar-s2)
    //   no-slides+dark (electronics/auto/mental/pod/bag) → `tf-topbar topbar-s2 d-none d-md-flex bg-dark` (no tf-btn-swiper-main)
    if ($tb2HasSlides) {
        $tb2OuterClasses = ($tb2Bg === 'bg-secondary')
            ? 'tf-topbar ' . $tb2Bg . ' tf-btn-swiper-main'
            : 'tf-topbar d-none d-md-flex ' . $tb2Bg;
    } else {
        $tb2OuterClasses = 'tf-topbar topbar-s2 d-none d-md-flex ' . $tb2Bg;
    }
    // Per-preset wrapper class OVERRIDE — replaces auto-derived classes entirely.
    // Use when a demo's `<div class="tf-topbar ...">` needs a unique combination not
    // covered by the auto-derivation above (e.g. home-sport `tf-topbar bg-dark tf-btn-swiper-main`,
    // home-construction `tf-topbar bg-dark`, home-auto `tf-topbar topbar-s2 d-none d-md-flex` no bg).
    $tb2WrapperOverride = trim((string) theme_option('topbar_wrapper_override', ''));
    if ($tb2WrapperOverride !== '') {
        $tb2OuterClasses = 'tf-topbar ' . $tb2WrapperOverride;
    }
    $tb2LeftCol = $tb2HasSlides ? 'col-6 col-lg-3 d-none d-xxl-block' : 'col-6';
    $tb2RightCol = $tb2HasSlides ? 'col-6 col-lg-3 d-none d-xxl-block' : 'col-6';
@endphp
<div class="{{ trim($tb2OuterClasses) }}"{!! $tbStyleAttr !!}>
    <div class="{{ $topbarInnerContainer }}">
        <div class="row align-items-center">
            <div class="{{ $tb2LeftCol }}">
                <div class="tf-list">
                    @if ($hotline !== '')
                        <a href="tel:{{ preg_replace('/[^0-9+]/', '', $hotline) }}" class="{{ $topbarLinkClass }}">{{ $hotline }}</a>
                    @endif
                    @if ($ourStoreUrl !== '')
                        <a href="{{ $ourStoreUrl }}" class="text-decoration-underline {{ $topbarLinkClass }}">{{ __('Our Store') }}</a>
                    @endif
                    @if ($contactUrl !== '')
                        <a href="{{ $contactUrl }}" class="{{ $topbarLinkClass }}">{{ __('Contact') }}</a>
                    @endif
                </div>
            </div>

            @if ($tb2HasSlides)
                <div class="col-sm-1 d-none d-lg-block ms-auto">
                    <div class="nav-prev-swiper d-flex text-white link justify-content-end" aria-label="{{ __('Previous') }}">
                        <i class="icon icon-CaretLeft"></i>
                    </div>
                </div>

                <div class="col-lg-6 col-xxl-4">
                    <div class="text-center">
                        <div dir="ltr" class="swiper tf-swiper swiper-topbar" data-auto="true" data-loop="true" data-speed="1500" data-delay="3500" data-direction="vertical">
                            <div class="swiper-wrapper">
                                @foreach ($slides as $slide)
                                    <div class="swiper-slide">
                                        <p class="text-white text-line-clamp-1">{!! BaseHelper::clean($slide) !!}</p>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-1 d-none d-lg-block me-auto">
                    <div class="nav-next-swiper d-flex text-white link" aria-label="{{ __('Next') }}">
                        <i class="icon icon-CaretRightThin"></i>
                    </div>
                </div>
            @endif

            <div class="{{ $tb2RightCol }}">
                <div class="d-flex justify-content-end">
                    @if ($hasCurrencies || $hasLanguages)
                        <div class="tf-list list-currenci">
                            @if ($hasCurrencies)
                                @include(Theme::getThemeNamespace('partials.currency-switcher'), ['colorMode' => $topbarColorMode])
                            @endif
                            @if ($hasLanguages)
                                @include(Theme::getThemeNamespace('partials.language-switcher'), ['colorMode' => $topbarColorMode])
                            @endif
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@else
{{-- Fashion-style topbar (style-3 default): curr/lang LEFT, slides CENTER, socials RIGHT.
     `topbar_bg_class` theme_option lets per-preset override the bg color (bg-dark/bg-primary/bg-secondary/etc). --}}
@php $topbarBg = trim((string) theme_option('topbar_bg_class', 'bg-dark')); @endphp
<div class="tf-topbar topbar-s3 {{ $topbarBg }} tf-btn-swiper-main"{!! $tbStyleAttr !!}>
    <div class="container-full">
        <div class="row align-items-center">
            <div class="col-lg-3 col-xxl-2 d-none d-lg-block">
                @if ($hasCurrencies || $hasLanguages)
                    <div class="tf-list list-currenci">
                        @if ($hasCurrencies)
                            @include(Theme::getThemeNamespace('partials.currency-switcher'), ['colorMode' => 'dark'])
                        @endif
                        @if ($hasLanguages)
                            @include(Theme::getThemeNamespace('partials.language-switcher'), ['colorMode' => 'dark'])
                        @endif
                    </div>
                @endif
            </div>

            @if (! empty($slides))
                <div class="col-sm-1 d-none d-xl-block">
                    <div class="nav-prev-swiper d-flex text-white link justify-content-end" aria-label="{{ __('Previous') }}">
                        <i class="icon icon-CaretLeft"></i>
                    </div>
                </div>
            @endif

            <div class="col-lg-6 col-xl-4 col-xxl-6">
                @if (! empty($slides))
                    <div class="text-center">
                        <div dir="ltr" class="swiper tf-swiper" data-auto="true" data-loop="true" data-speed="1500" data-delay="3500">
                            <div class="swiper-wrapper">
                                @foreach ($slides as $slide)
                                    <div class="swiper-slide">
                                        <div class="d-flex align-items-center justify-content-center gap-8">
                                            <i class="icon icon-SealPercent text-primary fs-20"></i>
                                            <p class="text-white text-start text-line-clamp-1">{!! BaseHelper::clean($slide) !!}</p>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                @endif
            </div>

            @if (! empty($slides))
                <div class="col-sm-1 d-none d-xl-block">
                    <div class="nav-next-swiper d-flex text-white link" aria-label="{{ __('Next') }}">
                        <i class="icon icon-CaretRightThin"></i>
                    </div>
                </div>
            @endif

            <div class="col-lg-3 col-xxl-2 d-none d-lg-block">
                @if (! empty($socialLinks))
                    <div class="d-flex align-items-center justify-content-end gap-20">
                        @foreach ($socialLinks as $key => $social)
                            <a href="{{ $social['url'] }}" target="_blank" rel="noopener noreferrer" class="d-flex" aria-label="{{ $social['label'] }}">
                                <i class="fs-20 text-white link icon {{ $social['icon'] }}"></i>
                            </a>
                        @endforeach
                    </div>
                @endif
            </div>
        </div>
    </div>
</div>
@endif
