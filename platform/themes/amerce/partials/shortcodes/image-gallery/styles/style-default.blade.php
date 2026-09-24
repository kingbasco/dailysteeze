@php
    $title = $shortcode->title;
    $subtitle = $shortcode->subtitle;
    // Per-preset overrides:
    //   wrapper_class : 'container' (default) | 'container-full-4' for full-bleed presets (home-garden).
    //   card_modifier : extra utility classes appended to .gallery-item (e.g. 'style-2 rounded-0').
    //   data_laptop   : swiper `data-laptop` per-view count for the ≥1600px breakpoint
    //                   (html/home-pod.html §11 line 3402 uses data-laptop="6"). Unset = omit.
    $wrapperClass = trim((string) ($shortcode->wrapper_class ?? 'container'));
    $cardModifier = trim((string) ($shortcode->card_modifier ?? ''));
    $dataLaptop = (int) ($shortcode->data_laptop ?? 0);
    $dataLaptop = ($dataLaptop >= 1 && $dataLaptop <= 8) ? $dataLaptop : 0;
@endphp

<div class="{{ $wrapperClass }}">
    @if (! empty($title) || ! empty($subtitle))
        <div class="sect-heading type-2 text-center wow fadeInUp">
            @if (! empty($title))
                <h3 class="s-title">{!! BaseHelper::clean($title) !!}</h3>
            @endif
            @if (! empty($subtitle))
                <p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($subtitle) !!}</p>
            @endif
        </div>
    @endif

    <div dir="ltr" class="swiper tf-swiper" data-preview="5" data-tablet="3" data-mobile-sm="3"
        data-mobile="2" data-space="10" data-pagination="2" data-pagination-sm="3" data-pagination-md="4"
        data-pagination-lg="5"@if ($dataLaptop > 0) data-laptop="{{ $dataLaptop }}"@endif>
        <div class="swiper-wrapper">
            @foreach ($items as $item)
                @php
                    $image = $item['image'] ?? null;
                    $link = $item['link'] ?? '#';
                @endphp
                <div class="swiper-slide">
                    <div class="gallery-item {{ $cardModifier }} hover-img hover-overlay wow fadeInUp">
                        <div class="image img-style">
                            {!! \Botble\Media\Facades\RvMedia::image(
                                $image,
                                __('Gallery image'),
                                'medium',
                                false,
                                ['width' => 274, 'height' => 274]
                            ) !!}
                        </div>
                        <a href="{{ $link }}" class="box-icon hover-tooltip">
                            <span class="icon icon-Eye"></span>
                            <span class="tooltip">{{ __('View product') }}</span>
                        </a>
                    </div>
                </div>
            @endforeach
        </div>
        <div class="sw-dot-default tf-sw-pagination"></div>
    </div>
</div>
