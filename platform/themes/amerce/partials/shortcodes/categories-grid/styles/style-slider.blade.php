@php
    // Per-preset card class knob (default: category-v06).
    // Demo presets request: category-v01 (decor), category-v05 (pet-care), category-v08 (bag).
    // Allowlist guards against arbitrary input. Inner markup (cate-image / cate-content)
    // is shared — only the outer wrapper class flips.
    $cardClass    = (string) ($shortcode->card_class ?? 'category-v06');
    $cardAllowed  = ['category-v01', 'category-v02', 'category-v03', 'category-v04', 'category-v05', 'category-v06', 'category-v07', 'category-v08'];
    $cardClass    = in_array($cardClass, $cardAllowed, true) ? $cardClass : 'category-v06';
    $cardModifier = trim((string) ($shortcode->card_modifier ?? 'hover-img4'));
    // Optional secondary modifier on the card wrapper (e.g. fashion-2 uses
    // `category-v06 style-2 hover-img4`).
    $cardExtraModifier = trim((string) ($shortcode->card_extra_modifier ?? ''));

    // Pet-care demo (html/home-pet-care.html lines 1255-1363) cycles each card
    // through bg-v1..bg-v7 pastel backgrounds. Other slider presets
    // (decor/bag/furniture) use plain neutral cards. Activate the cycle only
    // when the seller picked category-v05 cards (the pet-care pattern).
    $useColorCycle = $cardClass === 'category-v05';
    // Pet-care swiper exposes 7 cards on laptop / 5 on desktop (different from
    // the other style-slider consumers which keep the existing 5/4 layout).
    // The width is controlled by data-laptop attr; default to 5 elsewhere.
    $laptopCount = (string) ($shortcode->swiper_preview_lg ?? ($useColorCycle ? 7 : 5));
    $previewCount = (string) ($shortcode->swiper_preview ?? ($useColorCycle ? 5 : 5));
    // Wrapper class: pet-care demo uses container-full-width (`container-full`)
    // while decor/bag use the existing px-10 margin gutter. Per-preset can override
    // entirely (e.g. fashion-2 uses `container-layout-right` for asymmetric right-bleed).
    $wrapperClassRaw = trim((string) ($shortcode->wrapper_class ?? ''));
    $wrapperClass = $wrapperClassRaw === 'none' ? '' : ($wrapperClassRaw ?: ($useColorCycle ? 'container-full' : 'px-10 mt-30'));

    // Per-card count override — CSV of integers in the same order as $categories.
    // Use when demo shows hardcoded marketing numbers that don't match real DB counts
    // (e.g. fashion-2 demo "78 items" vs real seeded 3 products in Clothing).
    $countOverrides = array_values(array_filter(array_map(
        fn ($v) => $v === '' ? null : (int) trim($v),
        explode(',', (string) ($shortcode->count_overrides ?? ''))
    ), fn ($v) => $v !== null));
    // Word(s) after the count number — "Products" (default) or "items" (fashion-2).
    $countLabel = trim((string) ($shortcode->count_label ?? '')) ?: 'Products';

    // Swiper grid rows — `data-grid` attribute. Set to "2" for a 2-row grid
    // (e.g. construction demo's 5×2 category grid). Empty = single-row slider.
    $swiperGrid    = trim((string) ($shortcode->swiper_grid ?? ''));
    // Swiper CSS class — overrides the default `categories-grid-slider`
    // (e.g. `swiper-cate` for construction category-v04).
    $swiperClass   = trim((string) ($shortcode->swiper_class ?? '')) ?: 'categories-grid-slider';
    // Swiper spacing — data-space-lg attribute (default 20).
    $swiperSpaceLg = (string) ($shortcode->swiper_space_lg ?? '20');
    // Image wrapper class — controls the shape style (default img-style4, v04 uses img-style).
    $imageStyleClass = trim((string) ($shortcode->card_image_class ?? ''));
    if ($imageStyleClass === '') {
        $imageStyleClass = $useColorCycle ? '' : 'img-style4';
    }
    // RvMedia size for the card image — default `thumb` (400x400 square). Presets
    // with portrait demo art (fashion-2 cate images are 800x1066) pass `original`
    // so the source aspect is kept instead of being center-cropped square.
    $cardImageSize = trim((string) ($shortcode->card_image_size ?? '')) ?: 'thumb';
    $cardImageSize = $cardImageSize === 'original' ? false : $cardImageSize;
    // Extra classes on cate-content (e.g. "text-center" for construction demo).
    $contentExtraClass = trim((string) ($shortcode->card_content_class ?? ''));
    // Cate name typography. Pet-care demo (category-v05) uses h6 — smaller than the
    // default h5 fw-medium used by other slider variants. Allow per-preset override.
    $nameClass = trim((string) ($shortcode->card_name_class ?? ''));
    if ($nameClass === '') {
        $nameClass = $useColorCycle ? 'h6' : 'h5 fw-medium';
    }
@endphp

<div class="{{ $wrapperClass }}">
    <div dir="ltr" class="swiper tf-swiper {{ $swiperClass }}"
        data-laptop="{{ $laptopCount }}" data-preview="{{ $previewCount }}" data-tablet="4" data-mobile-sm="3" data-mobile="2"
        data-space-lg="{{ $swiperSpaceLg }}" data-space-md="15" data-space="10"
        @if (! empty($swiperGrid)) data-grid="{{ $swiperGrid }}" @endif
        data-pagination="2" data-pagination-sm="3" data-pagination-md="4" data-pagination-lg="{{ $laptopCount }}">
        <div class="swiper-wrapper">
            @if (($shortcode->sale_card_active ?? 'no') === 'yes')
                <div class="swiper-slide">
                    <a href="{{ $shortcode->sale_card_url ?? '/products' }}" class="{{ trim($cardClass . ' style-2 ' . $cardModifier) }}">
                        <div class="cate-sale fw-medium text-white">
                            <span class="h3">{{ $shortcode->sale_card_discount ?? '15%' }}</span>
                            <span class="h6">{{ $shortcode->sale_card_label ?? 'OFF' }}</span>
                        </div>
                        <div class="cate-content {{ $contentExtraClass }}">
                            <h6 class="cate_name text-primary link-underline">{!! BaseHelper::clean($shortcode->sale_card_title ?? 'Sale Off') !!}</h6>
                            <p class="cate_quantity cl-text-2">{{ $shortcode->sale_card_count ?? '52 Items' }}</p>
                        </div>
                    </a>
                </div>
            @endif
            @forelse ($categories as $idx => $category)
                @php
                    // bg-v1..bg-v7 cycle for pet-care; null otherwise.
                    $bgClass = $useColorCycle ? 'bg-v' . (($idx % 7) + 1) : '';
                    // Per-card count: override CSV wins over real DB count.
                    $resolvedCount = $countOverrides[$idx] ?? (int) ($category->products_count ?? 0);
                @endphp
                <div class="swiper-slide">
                    <div class="{{ trim($cardClass . ' ' . $cardExtraModifier . ' ' . $bgClass . ' ' . $cardModifier) }}">
                        <a href="{{ $category->url ?: '#' }}" class="cate-image {{ $imageStyleClass }}">
                            {!! RvMedia::image($category->image ?? null, $category->name, $cardImageSize, false, ['loading' => 'lazy']) !!}
                        </a>
                        <div class="cate-content {{ $contentExtraClass }}">
                            <a href="{{ $category->url ?: '#' }}" class="cate_name {{ $nameClass }} link">
                                {!! BaseHelper::clean($category->name) !!}
                            </a>
                            @if ($showCount)
                                <p class="cate_quantity cl-text-2">
                                    {{ $resolvedCount }} {{ $countLabel }}
                                </p>
                            @endif
                        </div>
                    </div>
                </div>
            @empty
                <div class="swiper-slide text-center text-muted">{{ __('No categories selected.') }}</div>
            @endforelse
        </div>
        <div class="sw-dots sw-pagination-categories"></div>
    </div>
</div>
