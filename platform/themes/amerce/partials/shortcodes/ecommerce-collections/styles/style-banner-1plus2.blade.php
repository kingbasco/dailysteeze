@php
    /**
     * Asymmetric 1-tall + 2-stacked banner grid — mirrors
     * html/home-bag-accessories.html lines 1320-1389.
     *
     * Layout:
     *   <div class="tf-grid-layout md-col-2 gap-xl-30">
     *     <div class="box-image_v07 hover-img"> [collection 1 — tall image with overlay text]
     *     <div class="tf-grid-layout gap-xl-30">
     *       <div class="box-cls-v1 style-2 hover-img"> [collection 2 — image + text below]
     *       <div class="box-cls-v1 hover-img">         [collection 3 — image + text below]
     *
     * Expects exactly 3 collections; gracefully degrades if fewer.
     */
    $list = collect($collections)->values();
    $left  = $list->get(0);
    $right1 = $list->get(1);
    $right2 = $list->get(2);

    // Per-cell description (eyebrow under headline). Fall back to collection
    // description; admins can also pin per-cell via shortcode attrs
    // `desc_1`, `desc_2`, `desc_3` (matching demo's "Up to 50% Off Bestsellers").
    $desc = static function ($collection, $attrName, $shortcode) {
        $attr = trim((string) ($shortcode->{$attrName} ?? ''));
        if ($attr !== '') {
            return $attr;
        }
        return trim((string) ($collection->description ?? '')) ?: __('Up to 50% Off Bestsellers');
    };

    $btnText = trim((string) ($shortcode->button_text ?? __('Shop Now')));

    // Optional per-cell title override (HTML allowed) — admins can pin per-cell titles to match
    // demo wording like "Jacquard Bucket <br> Bag With Logo" via shortcode attrs `title_1/2/3`.
    // Falls back to collection name when empty.
    $title = static function ($collection, string $attrName, $shortcode): string {
        $attr = trim((string) ($shortcode->{$attrName} ?? ''));
        if ($attr !== '') {
            return $attr;
        }
        return (string) ($collection->name ?? '');
    };
@endphp

@if ($left)
    <div class="tf-grid-layout md-col-2 gap-xl-30">
        {{-- LEFT — tall card with white overlay text (demo: 690x922 portrait) --}}
        <div class="box-image_v07 hover-img">
            <a href="{{ $left->url ?: '#' }}" class="box-image_img img-style">
                {!! \Botble\Media\Facades\RvMedia::image($left->image, $left->name, false, false, ['width' => 690, 'height' => 922, 'loading' => 'lazy']) !!}
            </a>
            <div class="box-image_content wow fadeInUp">
                <a href="{{ $left->url ?: '#' }}" class="bn_title h2 text-white link mb-8">
                    {!! \Botble\Base\Facades\BaseHelper::clean($title($left, 'title_1', $shortcode)) !!}
                </a>
                <p class="bn_desc text-white mb-20">{{ $desc($left, 'desc_1', $shortcode) }}</p>
                <a href="{{ $left->url ?: '#' }}" class="tf-btn-line-2 style-white py-4">
                    <span class="fw-semibold text-caption-01">{{ $btnText }}</span>
                </a>
            </div>
        </div>

        {{-- RIGHT — 2 stacked cards with text below image (demo: 690x446 landscape) --}}
        @if ($right1 || $right2)
            <div class="tf-grid-layout gap-xl-30">
                @if ($right1)
                    <div class="box-cls-v1 style-2 hover-img">
                        <a href="{{ $right1->url ?: '#' }}" class="cls-image img-style">
                            {!! \Botble\Media\Facades\RvMedia::image($right1->image, $right1->name, false, false, ['width' => 690, 'height' => 446, 'loading' => 'lazy']) !!}
                        </a>
                        <div class="cls-content wow fadeInUp">
                            <a href="{{ $right1->url ?: '#' }}" class="cls_title h2 link mb-8">
                                {!! \Botble\Base\Facades\BaseHelper::clean($title($right1, 'title_2', $shortcode)) !!}
                            </a>
                            <p class="cls_desc mb-20">{{ $desc($right1, 'desc_2', $shortcode) }}</p>
                            <a href="{{ $right1->url ?: '#' }}" class="tf-btn-line-2 style-primary py-4">
                                <span class="fw-semibold text-caption-01">{{ $btnText }}</span>
                            </a>
                        </div>
                    </div>
                @endif
                @if ($right2)
                    <div class="box-cls-v1 hover-img">
                        <a href="{{ $right2->url ?: '#' }}" class="cls-image img-style">
                            {!! \Botble\Media\Facades\RvMedia::image($right2->image, $right2->name, false, false, ['width' => 690, 'height' => 446, 'loading' => 'lazy']) !!}
                        </a>
                        <div class="cls-content wow fadeInUp">
                            <a href="{{ $right2->url ?: '#' }}" class="cls_title h2 link mb-8">
                                {!! \Botble\Base\Facades\BaseHelper::clean($title($right2, 'title_3', $shortcode)) !!}
                            </a>
                            <p class="cls_desc mb-20">{{ $desc($right2, 'desc_3', $shortcode) }}</p>
                            <a href="{{ $right2->url ?: '#' }}" class="tf-btn-line-2 style-primary py-4">
                                <span class="fw-semibold text-caption-01">{{ $btnText }}</span>
                            </a>
                        </div>
                    </div>
                @endif
            </div>
        @endif
    </div>
@endif
