@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    // Composite layout — mirrors home-organic.html lines 1935-2030: countdown card LEFT
    // (col 1 of `tf-grid-layout sm-col-2 xl-col-3`) + 2 stacked banner-image-text cards
    // in col 2 + 2 stacked banner-image-text cards in col 3. Each banner is `banner-image-text
    // type-abs style-13` with red overline (`text-primary`) + black h3 title + Shop Now CTA.
    //
    // Computes seconds-to-target server-side; the JS countdown widget just decrements.
    $targetSeconds = 0;
    if (! empty($shortcode->target_date ?? '')) {
        try {
            $target = \Carbon\Carbon::parse($shortcode->target_date);
            $targetSeconds = (int) max(0, now()->diffInSeconds($target));
        } catch (\Throwable $e) {
            $targetSeconds = 0;
        }
    }

    // outer_spacing_class: allowlist-validated section padding class. Default keeps
    // back-compat (`flat-spacing pt-0`); pass `''` for demos with no section padding
    // (home-organic.html §4 L1934-2028 is a bare `<div>` with no `<section>` wrapper).
    $allowedSpacing = ['flat-spacing pt-0', 'flat-spacing', 'flat-spacing-2', 'flat-spacing-3', ''];
    $rawSpacing = $shortcode->outer_spacing_class ?? 'flat-spacing pt-0';
    $outerSpacingClass = in_array($rawSpacing, $allowedSpacing, true) ? $rawSpacing : 'flat-spacing pt-0';

    $banners = [];
    foreach ([1, 2, 3, 4] as $i) {
        $img = $shortcode->{"banner_{$i}_image"} ?? null;
        if (! $img) {
            continue;
        }
        $banners[] = [
            'image'       => $img,
            'overline'    => trim((string) ($shortcode->{"banner_{$i}_overline"} ?? '')),
            'title'       => trim((string) ($shortcode->{"banner_{$i}_title"} ?? '')),
            'button_text' => trim((string) ($shortcode->{"banner_{$i}_button_text"} ?? '')),
            'button_url'  => $shortcode->{"banner_{$i}_button_url"} ?: '#',
        ];
    }
@endphp

<section {!! $shortcode->htmlAttributes() !!} @class(['tf-section', 'section-countdown-banner-quad', $outerSpacingClass => $outerSpacingClass !== ''])>
    <div class="container">
        <div class="tf-grid-layout sm-col-2 xl-col-3 gap-10">
            {{-- Col 1 — countdown card (banner-countdown-v04 inline) --}}
            <div class="banner-countdown-v04">
                <div class="banner-image">
                    {!! RvMedia::image($shortcode->countdown_image ?? null, $shortcode->countdown_heading ?? '', 'hero-banner', false, ['class' => 'w-100', 'loading' => 'lazy']) !!}
                </div>
                <div class="banner-content text-center">
                    @if (! empty($shortcode->countdown_heading ?? ''))
                        <h2 class="title text-white mb-8 wow fadeInUp">{!! BaseHelper::clean($shortcode->countdown_heading) !!}</h2>
                    @endif
                    @if (! empty($shortcode->countdown_subheading ?? ''))
                        <p class="desc text-white mb-20 wow fadeInUp">{!! BaseHelper::clean($shortcode->countdown_subheading) !!}</p>
                    @endif
                    <div class="countdown-v01 text-white d-flex justify-content-center mb-20">
                        <div class="js-countdown cd-has-zero cd-custom" data-timer="{{ $targetSeconds }}"
                             data-labels="{{ __('Days') }},{{ __('Hours') }},{{ __('Mins') }},{{ __('Secs') }}">
                        </div>
                    </div>
                    @if (! empty($shortcode->countdown_button_text ?? ''))
                        <a href="{{ $shortcode->countdown_button_url ?: '#' }}" class="tf-btn btn-white">
                            {!! BaseHelper::clean($shortcode->countdown_button_text) !!}
                        </a>
                    @endif
                </div>
            </div>

            {{-- Col 2 — banners 1+2 stacked --}}
            <div class="tf-grid-layout gap-10">
                @foreach (array_slice($banners, 0, 2) as $b)
                    @include(Theme::getThemeNamespace('partials.shortcodes.countdown-banner-quad.partials.banner-card'), ['b' => $b])
                @endforeach
            </div>

            {{-- Col 3 — banners 3+4 stacked --}}
            <div class="tf-grid-layout gap-10 sm-col-2 xl-col-1 xl-wd-full">
                @foreach (array_slice($banners, 2, 2) as $b)
                    @include(Theme::getThemeNamespace('partials.shortcodes.countdown-banner-quad.partials.banner-card'), ['b' => $b])
                @endforeach
            </div>
        </div>
    </div>
</section>
