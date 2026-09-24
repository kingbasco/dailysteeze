@php
    $items = \Botble\Shortcode\Facades\Shortcode::fields()->getTabsData(
        ['heading', 'image', 'link', 'icon_class'],
        $shortcode
    );
    $items = array_values(array_filter($items, fn ($item) => ! empty($item['heading']) || ! empty($item['image']) || ! empty($item['icon_class'])));

    $bgClass    = $shortcode->background_class ?? 'bg-main-2';
    $bgClass    = in_array($bgClass, ['bg-main-2', 'bg-main', ''], true) ? $bgClass : 'bg-main-2';
    $cloneCount = max(1, (int) ($shortcode->clone_count ?? 3));

    // Variant selector — controls wrapper class + inner element structure.
    //   default     : `infiniteSlide-cls` + cls-wrap link + h4 + img-cls (current/legacy)
    //   policy      : `infiniteSlide-policy` + h5 policy-text + policy-image (baby §2 demo)
    //   policy-v2   : `infiniteSlide-policy-v2` + h1 policy-text + policy-image (decor §2 demo)
    //   policy-icon : `infiniteSlide-policy style-2` + font icon + p.policy-text uppercase
    //                 (cosmetic §2 demo — no image, uses icon_class per item)
    //   text-v03    : `infiniteSlide-text-v03` + p.text.fw-medium + icon-Star2 separators
    //                 (construction demo — thin announcement strip below header)
    //   text-v02    : `infiniteSlide-text-v02` + p.text.h5.fw-medium + icon-Star2 separators
    //                 wrapped in `<div class="container-full flat-spacing">` (jewelry demo
    //                 html/home-jewelry.html L1837-1850 — slightly larger heading vs text-v03)
    $variant         = (string) ($shortcode->variant ?? 'default');
    $allowedVariants = ['default', 'policy', 'policy-v2', 'policy-icon', 'text-v02', 'text-v03'];
    $variant         = in_array($variant, $allowedVariants, true) ? $variant : 'default';

    $isTextV03 = $variant === 'text-v03';
    $isTextV02 = $variant === 'text-v02';

    $wrapperClass = match ($variant) {
        'policy'      => 'infiniteSlide-policy',
        'policy-v2'   => 'infiniteSlide-policy-v2',
        'policy-icon' => 'infiniteSlide-policy style-2',
        'text-v02'    => 'infiniteSlide-text-v02',
        'text-v03'    => 'infiniteSlide-text-v03',
        default       => 'infiniteSlide-cls',
    };

    $headingClass = match ($variant) {
        'policy'      => 'h5 policy-text',
        'policy-v2'   => 'policy-text h1 fw-medium',
        'policy-icon' => 'policy-text text-caption-02 lh-20 fw-semibold text-uppercase',
        default       => '',
    };

    $imageClass = match ($variant) {
        'policy', 'policy-v2' => 'policy-image',
        default               => 'img-cls',
    };

    $isPolicyImg  = in_array($variant, ['policy', 'policy-v2'], true);
    $isPolicyIcon = $variant === 'policy-icon';

    // text-v03 uses a minimal outer wrapper (no flat-spacing-3, no bg class).
    // Extra classes on the outer div (e.g. mb-40) can be passed via extra_class.
    $extraClass = trim((string) ($shortcode->extra_class ?? ''));

    // spacing_class: outer vertical spacing block — default `flat-spacing-3`
    // (legacy). home-baby §2 demo uses the taller `flat-spacing`; home-fashion-2 §6
    // demo (line 4068) has NO spacing class at all — pass an explicit '' to clear it.
    $spacingClass = $shortcode->spacing_class !== null
        ? trim((string) $shortcode->spacing_class)
        : 'flat-spacing-3';
    // use_container='yes' wraps the slide row in a `.container` (home-baby §2 demo).
    $useContainer = ($shortcode->use_container ?? 'no') === 'yes';
@endphp

@if (! empty($items))
    @if ($isTextV02)
        {{-- text-v02: announcement strip with p.text.h5.fw-medium + icon-Star2 separators
             wrapped in container-full flat-spacing. Mirrors html/home-jewelry.html L1837-1850. --}}
        <div {!! $shortcode->htmlAttributes() !!} class="container-full flat-spacing">
            <div @class([$wrapperClass, 'wow fadeInUp', $extraClass => ! empty($extraClass)])>
                <div class="infiniteSlide infiniteSlide-wrapper" data-clone="{{ $cloneCount }}">
                    @foreach ($items as $item)
                        @php $heading = $item['heading'] ?? ''; @endphp
                        @if (! empty($heading))
                            <p class="text h5 fw-medium">{!! BaseHelper::clean($heading) !!}</p>
                            <i class="icon-Star2"></i>
                        @endif
                    @endforeach
                </div>
            </div>
        </div>
    @elseif ($isTextV03)
        {{-- text-v03: thin announcement strip with p.text.fw-medium + icon-Star2 separators.
             Mirrors html/home-construction.html lines 1321-1336. --}}
        <div {!! $shortcode->htmlAttributes() !!} @class([$wrapperClass, $extraClass => ! empty($extraClass)])>
            <div class="infiniteSlide infiniteSlide-wrapper" data-clone="{{ $cloneCount }}">
                @foreach ($items as $item)
                    @php $heading = $item['heading'] ?? ''; @endphp
                    @if (! empty($heading))
                        <p class="text fw-medium">{!! BaseHelper::clean($heading) !!}</p>
                        <i class="icon-Star2"></i>
                    @endif
                @endforeach
            </div>
        </div>
    @else
        <div {!! $shortcode->htmlAttributes() !!} @class(['infinity-marquee', $spacingClass, $bgClass => ! empty($bgClass)])>
            @if ($useContainer)<div class="container">@endif
            <div class="{{ $wrapperClass }} wow fadeInUp">
                <div class="infiniteSlide infiniteSlide-wrapper" data-clone="{{ $cloneCount }}">
                    @foreach ($items as $item)
                        @php
                            $heading   = $item['heading'] ?? '';
                            $image     = $item['image']   ?? null;
                            $link      = $item['link']    ?? '#';
                            $iconClass = trim((string) ($item['icon_class'] ?? ''));
                        @endphp
                        @if ($isPolicyIcon)
                            {{-- policy-icon variant: font icon + p.policy-text uppercase as siblings.
                                 Each item emits its own icon_class (or fallback `icon-Lightning-1`). --}}
                            <i class="icon {{ $iconClass !== '' ? $iconClass : 'icon-Lightning-1' }}"></i>
                            @if (! empty($heading))
                                <p class="{{ $headingClass }}">{!! BaseHelper::clean($heading) !!}</p>
                            @endif
                        @elseif ($isPolicyImg)
                            {{-- Policy variants: emit heading + image as siblings (no link wrapper, no cls-wrap). --}}
                            @if (! empty($heading))
                                @if ($variant === 'policy-v2')
                                    <p class="{{ $headingClass }}">{!! BaseHelper::clean($heading) !!}</p>
                                @else
                                    <div class="{{ $headingClass }}">{!! BaseHelper::clean($heading) !!}</div>
                                @endif
                            @endif
                            @if (! empty($image))
                                <div class="{{ $imageClass }}">
                                    @php
                                        // policy-v2 demo (html/home-decor.html §2 line 1419) renders
                                        // 160x80 (2:1) pill images — source is 960x480 landscape.
                                        // 'thumb' is square (400x400) and center-crops the pill,
                                        // breaking the aspect. Pass `false` (original) for policy-v2.
                                        // Legacy `policy` variant keeps `thumb` for back-compat with
                                        // home-baby §2 (whose source art is square).
                                        $isV2 = $variant === 'policy-v2';
                                        $rvSize = $isV2 ? false : 'thumb';
                                        $imgW   = $isV2 ? 160 : 90;
                                        $imgH   = $isV2 ? 80  : 48;
                                    @endphp
                                    {!! RvMedia::image($image, $heading ?: '', $rvSize, false, ['width' => $imgW, 'height' => $imgH, 'loading' => 'lazy']) !!}
                                </div>
                            @endif
                        @else
                            {{-- Default: link-wrapped item with h4 + img-cls (legacy markup). --}}
                            <div class="infiniteSlide-item">
                                <a href="{{ $link ?: '#' }}" class="cls-wrap">
                                    @if (! empty($heading))
                                        <h4>{!! BaseHelper::clean($heading) !!}</h4>
                                    @endif
                                    @if (! empty($image))
                                        <div class="{{ $imageClass }}">
                                            {!! RvMedia::image($image, $heading ?: '', 'thumb', false, ['width' => 80, 'height' => 80, 'loading' => 'lazy']) !!}
                                        </div>
                                    @endif
                                </a>
                            </div>
                        @endif
                    @endforeach
                </div>
            </div>
            @if ($useContainer)</div>@endif
        </div>
    @endif
@endif
