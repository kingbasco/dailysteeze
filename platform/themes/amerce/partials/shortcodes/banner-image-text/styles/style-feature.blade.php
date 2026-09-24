@php
    /**
     * banner-image-text style-feature — centered-heading product feature spread.
     * Mirrors html/home-office-equipment.html line 1910 (the "Future Mouse
     * Technology" section): `section-feature` > `sect-heading type-2` + a
     * `banner-feature` block with a centered square product image and 4
     * `feature-detail` callouts (`pst-s1..s4`) radiating around it.
     *
     * Emits its own `<section>` — registered in the index `$skipWrapper` list.
     *
     * Knobs:
     *   heading / subheading                       — section heading
     *   image                                      — centered product shot (square, 471×471 in demo)
     *   feature_{1..4}_name / _desc / _icon         — the 4 callouts. _icon is
     *                                                 DUAL-MODE: an icomoon class
     *                                                 (`icon-*`) renders a font
     *                                                 glyph; any other value is
     *                                                 treated as a media path and
     *                                                 rendered as an <img> (the
     *                                                 demo ships line-art PNGs).
     *
     * pst-s1/s2 sit on the left, illustration-after-text (order-md-2 / fadeInRight);
     * pst-s3/s4 sit on the right, illustration-before-text (fadeInLeft) — matches
     * the demo's left/right column split inside `tf-grid-layout sm-col-2`.
     */
    $features = [];
    foreach ([1, 2, 3, 4] as $n) {
        $name = trim((string) ($shortcode->{"feature_{$n}_name"} ?? ''));
        $desc = trim((string) ($shortcode->{"feature_{$n}_desc"} ?? ''));
        if ($name === '' && $desc === '') {
            continue;
        }
        $icon = trim((string) ($shortcode->{"feature_{$n}_icon"} ?? ''));
        // Dual-mode icon: `icon-*` => font glyph; anything else => media image path.
        $iconIsImage = $icon !== '' && ! \Illuminate\Support\Str::startsWith($icon, 'icon-');
        // Per-icon pixel size for image icons — demo §5 svgs are 48×48 except
        // DPI Settings at 40×40. Default 48.
        $iconSize = (int) ($shortcode->{"feature_{$n}_icon_size"} ?? 48) ?: 48;
        $features[] = [
            'name' => $name,
            'desc' => $desc,
            'icon' => $icon ?: 'icon-Star2',
            'iconIsImage' => $iconIsImage,
            'iconSize' => $iconSize,
        ];
    }
@endphp

<section {!! $shortcode->htmlAttributes() !!} class="section-feature flat-spacing">
    <div class="container">
        @if (! empty($shortcode->heading ?? '') || ! empty($shortcode->subheading ?? ''))
            <div class="sect-heading type-2 text-center wow fadeInUp">
                @if (! empty($shortcode->heading ?? ''))
                    <h2 class="s-title">{!! BaseHelper::clean($shortcode->heading) !!}</h2>
                @endif
                @if (! empty($shortcode->subheading ?? ''))
                    <p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($shortcode->subheading) !!}</p>
                @endif
            </div>
        @endif

        <div class="banner-feature">
            <div class="feature-image">
                <div class="image">
                    {!! RvMedia::image($shortcode->image ?? null, BaseHelper::clean($shortcode->heading ?? ''), false, false, ['width' => 471, 'height' => 471, 'loading' => 'lazy']) !!}
                </div>
            </div>

            @if (! empty($features))
                <div class="feature-detail_list tf-grid-layout sm-col-2 gap-20">
                    @foreach ($features as $i => $feature)
                        @php
                            $isLeft = $i < 2;
                            $detailClass = 'feature-detail pst-s' . ($i + 1) . ($isLeft ? ' justify-content-md-end' : '');
                            $illusClass = 'feature_illus' . ($isLeft ? ' order-md-2' : '');
                            $infoClass = 'feature_info' . ($isLeft ? ' order-md-1 wow fadeInRight' : ' wow fadeInLeft');
                        @endphp
                        <div class="{{ $detailClass }}">
                            <div class="{{ $illusClass }}">
                                <div class="ic wow fadeZoom">
                                    @if ($feature['iconIsImage'])
                                        {!! RvMedia::image($feature['icon'], BaseHelper::clean($feature['name']), false, false, ['width' => $feature['iconSize'], 'height' => $feature['iconSize'], 'loading' => 'lazy']) !!}
                                    @else
                                        <span class="icon {{ $feature['icon'] }}"></span>
                                    @endif
                                </div>
                            </div>
                            <div class="{{ $infoClass }}">
                                @if ($feature['name'] !== '')
                                    <p class="info__name h6">{!! BaseHelper::clean($feature['name']) !!}</p>
                                @endif
                                @if ($feature['desc'] !== '')
                                    <p class="info__desc text-caption-02 cl-text-2">{!! BaseHelper::clean($feature['desc']) !!}</p>
                                @endif
                            </div>
                        </div>
                    @endforeach
                </div>
            @endif
        </div>
    </div>
</section>
