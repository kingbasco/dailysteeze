@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Testimonials style-v2-product.
     *
     * Default render is the existing `testimonial-v01 style-2` card (used by other variants).
     * Two opt-in extensions:
     *   - card_type='type-3'   — 4-up small-avatar list (existing, used by home-fashion).
     *   - card_type='type-2'   — home-baby.html §8 layout (lines 5324-5531):
     *                            `testimonial-v01 style-2 type-2` 4-up swiper —
     *                            avatar (60x60) → star → author h6 + Verified Buyer
     *                            → quote → product mini-card. Like type-3 but inside
     *                            a centered `.container` and with an `<h6>` author tag.
     *   - card_type='style-8'  — home-sport.html §9 layout (lines 2714-2870):
     *                            `testimonial-v01 style-8 style-def` w/ LEFT image
     *                            (234x330) + RIGHT content (star → author h6 → quote
     *                            → product mini-card). Renders inside a cream
     *                            `bg-main flat-spacing` outer when bg_main='yes'.
     */
    $autoplay = ($shortcode->autoplay ?? 'yes') === 'yes';
    $cardType = trim((string) ($shortcode->card_type ?? ''));
    $isType3 = $cardType === 'type-3';
    $isType2 = $cardType === 'type-2';
    $isStyle8 = $cardType === 'style-8';
    //   - card_type='style-1-cosmetic' — html/home-cosmetic.html §8 (lines 2356-2415):
    //                            `testimonial-v01 style-1 type-3 style-def` 2-up swiper —
    //                            LEFT image (285x380) + RIGHT content (star → h6 author
    //                            + Verified Buyer → quote → product mini-card 88x88).
    //                            Like style-8 but with the cosmetic demo's class names,
    //                            image size and wider 60px desktop gap.
    //   - card_type='style-1-pod' — html/home-pod.html §9 (lines 3160-3320):
    //                            `testimonial-v01 style-1 type-2` 2-up swiper — LEFT
    //                            image (285x380) + RIGHT content ordered star → quote
    //                            (`flex-unset`) → author (h6 + br-line + Verified Buyer,
    //                            `mb-xl-auto`) → product mini-card 88x88. No `style-def`.
    //   - card_type='style-1-bag' — html/home-bag-accessories.html §9 (lines 2751-2861):
    //                            `testimonial-v01 style-1 style-def` 2-up swiper — LEFT
    //                            image (285x380) + RIGHT content (star → p.author-name+h6 +
    //                            Verified Buyer → quote h6 text-capitalize → product mini-card
    //                            88x88 with `link-underline-primary`). Like style-1-cosmetic but
    //                            without `type-3`, with `<p class="author-name h6">` instead of
    //                            `<h6 class="author-name">`, and quote uses h6+text-capitalize.
    //   - card_type='style-1-decor' — html/home-decor.html §7 (lines 2135-2242):
    //                            `testimonial-v01 style-def style-4` 2-up swiper — LEFT
    //                            image (234x312) `tes-image hover-overlay` + Eye box-icon
    //                            + RIGHT content ordered star (fs-16) → plain quote → p.author-name
    //                            + verified ICON ONLY (no "Verified Buyer" label) + product mini-card
    //                            (60x60, plain `.link` w/ underline, plain `prd_price`). No style-1.
    //   - outer_class='bare-section' wraps the swiper in a bare zero-padding section
    //                              instead of the default no-outer (style-1-* family).
    //                              Used by home-decor §7 (`<section class="bare-section">`).
    $isStyle1Cosmetic = $cardType === 'style-1-cosmetic';
    $isStyle1Pod = $cardType === 'style-1-pod';
    $isStyle1Bag = $cardType === 'style-1-bag';
    $isStyle1Decor = $cardType === 'style-1-decor';
    // outer_class='bare-section' renders a bare `<section class="bare-section">` + `.container`
    // wrap around the swiper + heading (mirrors home-decor §7 demo wrapper).
    $outerClass = trim((string) ($shortcode->outer_class ?? ''));
    $useOuter = $outerClass !== '';
    // type-2 and type-3 share the 4-up small-avatar list layout.
    $isCompactList = $isType3 || $isType2;
    $useBgMain = ($shortcode->bg_main ?? 'no') === 'yes';

    if ($isStyle8 || $isStyle1Cosmetic || $isStyle1Pod || $isStyle1Bag || $isStyle1Decor) {
        $containerClass = 'container';
        $preview = 2; $tablet = 2; $mobileSm = 1;
        $pagination = ($isStyle1Pod || $isStyle1Bag) ? 2 : 1; $paginationSm = 2; $paginationMd = 2; $paginationLg = 2;
        // home-decor §7 demo: data-space-lg="30" data-space-md="20" data-space="15"
        $spaceLg = $isStyle1Decor ? 30 : (($isStyle1Cosmetic || $isStyle1Pod || $isStyle1Bag) ? 60 : 30);
        $spaceMd = $isStyle1Decor ? 20 : (($isStyle1Cosmetic || $isStyle1Pod || $isStyle1Bag) ? 30 : 20);
        $space = 15;
    } else {
        $containerClass = $isType3 ? 'container-full' : 'container';
        $preview = $isCompactList ? 4 : 2;
        $tablet = $isCompactList ? 3 : 2;
        $mobileSm = $isCompactList ? 2 : 1;
        $pagination = $isCompactList ? 2 : 1;
        $paginationSm = $isCompactList ? 1 : 2;
        $paginationMd = $isCompactList ? 3 : 2;
        $paginationLg = $isCompactList ? 4 : 2;
        $spaceLg = $isCompactList ? 20 : 30;
        $spaceMd = 15; $space = 10;
    }
@endphp

@if ($useBgMain)
<section class="bg-main flat-spacing">
    <div class="container">
        @if (! empty($shortcode->title ?? '') || ! empty($shortcode->subtitle ?? ''))
            <div class="sect-heading type-2 text-center wow fadeInUp">
                @if (! empty($shortcode->title ?? ''))
                    <h3 class="s-title">{!! BaseHelper::clean($shortcode->title) !!}</h3>
                @endif
                @if (! empty($shortcode->subtitle ?? ''))
                    <p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
                @endif
            </div>
        @endif
@elseif ($useOuter)
{{-- outer_class wrapper opens the demo's bare `<section class="bare-section">` container.
     Heading is NOT rendered here — testimonials/index.blade.php already renders
     `sect-heading type-2 text-center` before including this partial. --}}
<section class="{{ $outerClass }}">
    <div class="container">
@endif

<div class="{{ ($useBgMain || $useOuter) ? '' : $containerClass }}">
    <div dir="ltr" class="swiper tf-swiper testimonials-v2-product"
         data-preview="{{ $preview }}" data-tablet="{{ $tablet }}" data-mobile-sm="{{ $mobileSm }}" data-mobile="1"
         data-space-lg="{{ $spaceLg }}" data-space-md="{{ $spaceMd }}" data-space="{{ $space }}"
         data-pagination="{{ $pagination }}" data-pagination-sm="{{ $paginationSm }}" data-pagination-md="{{ $paginationMd }}" data-pagination-lg="{{ $paginationLg }}"
         @if (! $isStyle8 && ! $isStyle1Cosmetic && ! $isStyle1Pod && ! $isStyle1Bag && ! $isStyle1Decor) data-loop="true" @endif
         data-auto="{{ $autoplay ? 'true' : 'false' }}">
        <div class="swiper-wrapper">
            @foreach ($items as $index => $item)
                @php
                    $rating       = max(0, min(5, (int) ($item['rating'] ?? 5)));
                    $avatar       = $item['avatar']        ?? null;
                    $name         = $item['name']          ?? '';
                    $role         = $item['role']          ?? '';
                    $content      = $item['content']       ?? '';
                    $productImage = $item['product_image'] ?? null;
                    $productName  = $item['product_name']  ?? '';
                    $productPrice = $item['product_price'] ?? '';
                    $productUrl   = $item['product_url']   ?? '#';
                @endphp
                <div class="swiper-slide">
                    @if ($isStyle8)
                        {{-- home-sport.html §9 — testimonial-v01.style-8.style-def with LEFT image + RIGHT content. --}}
                        <div class="testimonial-v01 style-8 style-def wow fadeInLeft" @if ($index > 0) data-wow-delay="0.1s" @endif>
                            @if (! empty($avatar))
                                <div class="tes-image">
                                    {!! RvMedia::image($avatar, $name, null, false, ['width' => 234, 'height' => 330, 'loading' => 'lazy']) !!}
                                </div>
                            @endif
                            <div class="tes-content">
                                @if ($rating > 0)
                                    <div class="star-wrap d-flex align-items-center mb-12">
                                        @for ($i = 1; $i <= $rating; $i++)
                                            <i class="icon icon-Star fs-24"></i>
                                        @endfor
                                    </div>
                                @endif
                                @if (! empty($name))
                                    <div class="tes_author mb-16">
                                        <p class="author-name h6">{!! BaseHelper::clean($name) !!}</p>
                                        <div class="author-verified">
                                            <i class="icon icon-CheckCircle1"></i>
                                            <span class="cl-text-2">
                                                {{ ! empty($role) ? $role : __('Verified Buyer') }}
                                            </span>
                                        </div>
                                    </div>
                                @endif
                                @if (! empty($content))
                                    <p class="tes_text text-body-1">{!! BaseHelper::clean($content) !!}</p>
                                @endif
                                @if (! empty($productImage) || ! empty($productName))
                                    <div class="tes_product">
                                        @if (! empty($productImage))
                                            <div class="product-image radius-8">
                                                {!! RvMedia::image($productImage, $productName, 'thumb', false, ['width' => 60, 'height' => 60, 'class' => 'aspect-ratio-1 object-fit-cover', 'loading' => 'lazy']) !!}
                                            </div>
                                        @endif
                                        <div class="product-infor">
                                            @if (! empty($productName))
                                                <a href="{{ $productUrl ?: '#' }}" class="link-underline-primary fw-medium lh-24">
                                                    {!! BaseHelper::clean($productName) !!}
                                                </a>
                                            @endif
                                            @if (! empty($productPrice))
                                                <p class="prd_price fw-semibold text-primary">{!! BaseHelper::clean($productPrice) !!}</p>
                                            @endif
                                        </div>
                                    </div>
                                @endif
                            </div>
                        </div>
                    @elseif ($isStyle1Cosmetic)
                        {{-- html/home-cosmetic.html §8 — testimonial-v01.style-1.type-3.style-def
                             LEFT image (285x380) + RIGHT content + product mini-card (88x88). --}}
                        <div class="testimonial-v01 style-1 type-3 style-def wow fadeInUp" @if ($index > 0) data-wow-delay="0.1s" @endif>
                            @if (! empty($avatar))
                                <div class="tes-image">
                                    {!! RvMedia::image($avatar, $name, null, false, ['width' => 285, 'height' => 380, 'loading' => 'lazy']) !!}
                                </div>
                            @endif
                            <div class="tes-content">
                                @if ($rating > 0)
                                    <div class="star-wrap d-flex align-items-center mb-8">
                                        @for ($i = 1; $i <= $rating; $i++)
                                            <i class="icon icon-Star fs-24"></i>
                                        @endfor
                                    </div>
                                @endif
                                @if (! empty($name))
                                    <div class="tes_author mb-16">
                                        <h6 class="author-name">{!! BaseHelper::clean($name) !!}</h6>
                                        <div class="author-verified">
                                            <i class="icon icon-CheckCircle1"></i>
                                            <span class="cl-text-2">
                                                {{ ! empty($role) ? $role : __('Verified Buyer') }}
                                            </span>
                                        </div>
                                    </div>
                                @endif
                                @if (! empty($content))
                                    <p class="tes_text text-body-1">{!! BaseHelper::clean($content) !!}</p>
                                @endif
                                @if (! empty($productImage) || ! empty($productName))
                                    <div class="tes_product gap-20">
                                        @if (! empty($productImage))
                                            <div class="product-image">
                                                {!! RvMedia::image($productImage, $productName, 'thumb', false, ['width' => 88, 'height' => 88, 'class' => 'aspect-ratio-1 object-fit-cover', 'loading' => 'lazy']) !!}
                                            </div>
                                        @endif
                                        <div class="product-infor">
                                            @if (! empty($productName))
                                                <a href="{{ $productUrl ?: '#' }}" class="link fw-medium lh-24">
                                                    {!! BaseHelper::clean($productName) !!}
                                                </a>
                                            @endif
                                            @if (! empty($productPrice))
                                                <p class="prd_price fw-semibold text-primary">{!! BaseHelper::clean($productPrice) !!}</p>
                                            @endif
                                        </div>
                                    </div>
                                @endif
                            </div>
                        </div>
                    @elseif ($isStyle1Bag)
                        {{-- html/home-bag-accessories.html §9 — testimonial-v01.style-1.style-def
                             LEFT image (285x380) + RIGHT content + product mini-card (88x88).
                             Differs from style-1-cosmetic by NO `type-3`, p.author-name vs
                             h6.author-name, quote uses h6+text-capitalize, product link uses
                             `link-underline-primary`. --}}
                        <div class="testimonial-v01 style-1 style-def wow fadeInLeft" @if ($index > 0) data-wow-delay="0.1s" @endif>
                            @if (! empty($avatar))
                                <div class="tes-image">
                                    {!! RvMedia::image($avatar, $name, null, false, ['width' => 285, 'height' => 380, 'loading' => 'lazy']) !!}
                                </div>
                            @endif
                            <div class="tes-content">
                                @if ($rating > 0)
                                    <div class="star-wrap d-flex align-items-center">
                                        @for ($i = 1; $i <= $rating; $i++)
                                            <i class="icon icon-Star fs-24"></i>
                                        @endfor
                                    </div>
                                @endif
                                @if (! empty($name))
                                    <div class="tes_author mb-20">
                                        <p class="author-name h6">{!! BaseHelper::clean($name) !!}</p>
                                        <div class="author-verified">
                                            <i class="icon icon-CheckCircle1"></i>
                                            <span class="cl-text-2">
                                                {{ ! empty($role) ? $role : __('Verified Buyer') }}
                                            </span>
                                        </div>
                                    </div>
                                @endif
                                @if (! empty($content))
                                    <p class="tes_text h6 text-capitalize">{!! BaseHelper::clean($content) !!}</p>
                                @endif
                                @if (! empty($productImage) || ! empty($productName))
                                    <div class="tes_product">
                                        @if (! empty($productImage))
                                            <div class="product-image radius-8">
                                                {!! RvMedia::image($productImage, $productName, 'thumb', false, ['width' => 88, 'height' => 88, 'class' => 'aspect-ratio-1 object-fit-cover', 'loading' => 'lazy']) !!}
                                            </div>
                                        @endif
                                        <div class="product-infor">
                                            @if (! empty($productName))
                                                <a href="{{ $productUrl ?: '#' }}" class="link-underline-primary fw-medium lh-24">
                                                    {!! BaseHelper::clean($productName) !!}
                                                </a>
                                            @endif
                                            @if (! empty($productPrice))
                                                <p class="prd_price fw-semibold text-primary">{!! BaseHelper::clean($productPrice) !!}</p>
                                            @endif
                                        </div>
                                    </div>
                                @endif
                            </div>
                        </div>
                    @elseif ($isStyle1Decor)
                        {{-- html/home-decor.html §7 — testimonial-v01.style-def.style-4
                             LEFT image (234x312) `tes-image.hover-overlay` + Eye box-icon
                             + RIGHT content: star (fs-16) → plain quote → p.author-name +
                             verified-icon-only (NO "Verified Buyer" label) → product mini-card
                             (60x60 plain link, plain prd_price). --}}
                        <div class="testimonial-v01 style-def style-4 wow fadeInLeft" @if ($index > 0) data-wow-delay="0.1s" @endif>
                            @if (! empty($avatar))
                                <div class="tes-image hover-overlay">
                                    @if (! empty($productUrl))
                                        <a href="{{ $productUrl ?: '#' }}" class="box-icon hover-tooltip">
                                            <span class="icon icon-Eye"></span>
                                            <span class="tooltip">{{ __('View product') }}</span>
                                        </a>
                                    @endif
                                    {!! RvMedia::image($avatar, $name, null, false, ['width' => 234, 'height' => 312, 'loading' => 'lazy']) !!}
                                </div>
                            @endif
                            <div class="tes-content">
                                @if ($rating > 0)
                                    <div class="star-wrap d-flex align-items-center">
                                        @for ($i = 1; $i <= $rating; $i++)
                                            <i class="icon icon-Star fs-16"></i>
                                        @endfor
                                    </div>
                                @endif
                                @if (! empty($content))
                                    <p class="tes_text">{!! BaseHelper::clean($content) !!}</p>
                                @endif
                                @if (! empty($name))
                                    <div class="tes_author">
                                        <p class="author-name fw-medium lh-24">{!! BaseHelper::clean($name) !!}</p>
                                        <div class="author-verified">
                                            <i class="icon icon-CheckCircle fs-20"></i>
                                        </div>
                                    </div>
                                @endif
                                @if (! empty($productImage) || ! empty($productName))
                                    <div class="tes_product">
                                        @if (! empty($productImage))
                                            <div class="product-image">
                                                {!! RvMedia::image($productImage, $productName, 'thumb', false, ['width' => 60, 'height' => 60, 'class' => 'aspect-ratio-1 object-fit-cover', 'loading' => 'lazy']) !!}
                                            </div>
                                        @endif
                                        <div class="product-infor">
                                            @if (! empty($productName))
                                                <a href="{{ $productUrl ?: '#' }}" class="link fw-medium lh-24">
                                                    {!! BaseHelper::clean($productName) !!}
                                                </a>
                                            @endif
                                            @if (! empty($productPrice))
                                                <p class="prd_price fw-semibold">{!! BaseHelper::clean($productPrice) !!}</p>
                                            @endif
                                        </div>
                                    </div>
                                @endif
                            </div>
                        </div>
                    @elseif ($isStyle1Pod)
                        {{-- html/home-pod.html §9 — testimonial-v01.style-1.type-2
                             LEFT image (285x380) + RIGHT content ordered
                             star → quote → author (h6 + br-line) → product mini-card. --}}
                        <div class="testimonial-v01 style-1 type-2 wow fadeInUp" @if ($index > 0) data-wow-delay="0.1s" @endif>
                            @if (! empty($avatar))
                                <div class="tes-image">
                                    {!! RvMedia::image($avatar, $name, null, false, ['width' => 285, 'height' => 380, 'loading' => 'lazy']) !!}
                                </div>
                            @endif
                            <div class="tes-content">
                                @if ($rating > 0)
                                    <div class="star-wrap d-flex align-items-center">
                                        @for ($i = 1; $i <= $rating; $i++)
                                            <i class="icon icon-Star fs-24"></i>
                                        @endfor
                                    </div>
                                @endif
                                @if (! empty($content))
                                    <p class="tes_text text-body-1 flex-unset">{!! BaseHelper::clean($content) !!}</p>
                                @endif
                                @if (! empty($name))
                                    <div class="tes_author mb-xl-auto">
                                        <h6 class="author-name">{!! BaseHelper::clean($name) !!}</h6>
                                        <div class="br-line"></div>
                                        <div class="author-verified">
                                            <i class="icon icon-CheckCircle1"></i>
                                            <span class="cl-text-2">
                                                {{ ! empty($role) ? $role : __('Verified Buyer') }}
                                            </span>
                                        </div>
                                    </div>
                                @endif
                                @if (! empty($productImage) || ! empty($productName))
                                    <div class="tes_product">
                                        @if (! empty($productImage))
                                            <div class="product-image flex-shrink-0">
                                                {!! RvMedia::image($productImage, $productName, 'thumb', false, ['width' => 88, 'height' => 88, 'class' => 'aspect-ratio-1 object-fit-cover', 'loading' => 'lazy']) !!}
                                            </div>
                                        @endif
                                        <div class="product-infor">
                                            @if (! empty($productName))
                                                <a href="{{ $productUrl ?: '#' }}" class="link fw-medium lh-24 text-line-clamp-2">
                                                    {!! BaseHelper::clean($productName) !!}
                                                </a>
                                            @endif
                                            @if (! empty($productPrice))
                                                <p class="prd_price fw-semibold text-primary">{!! BaseHelper::clean($productPrice) !!}</p>
                                            @endif
                                        </div>
                                    </div>
                                @endif
                            </div>
                        </div>
                    @else
                        <div class="testimonial-v01 style-2 {{ $cardType }} wow {{ $isCompactList ? 'fadeInLeft' : 'fadeInUp' }}" @if($isCompactList && $index > 0) data-wow-delay="{{ number_format($index / 10, 1) }}s" @endif>
                            <div class="tes-content">
                                @if ($isCompactList && ! empty($avatar))
                                    <div class="tes_avatar">
                                        {!! RvMedia::image($avatar, $name ?: __('Avatar'), null, false, ['width' => 60, 'height' => 60, 'loading' => 'lazy']) !!}
                                    </div>
                                @endif
                                @if ($rating > 0)
                                    <div class="star-wrap d-flex align-items-center">
                                        @for ($i = 1; $i <= $rating; $i++)
                                            <i class="icon icon-Star fs-24"></i>
                                        @endfor
                                    </div>
                                @endif
                                @if (! empty($name))
                                    <div class="tes_author">
                                        @if ($isType2)
                                            <h6 class="author-name">{!! BaseHelper::clean($name) !!}</h6>
                                        @elseif ($isType3)
                                            <div class="h6 author-name">{!! BaseHelper::clean($name) !!}</div>
                                        @else
                                            <h5 class="author-name">{!! BaseHelper::clean($name) !!}</h5>
                                            <div class="br-line"></div>
                                        @endif
                                        <div class="author-verified">
                                            <i class="icon icon-CheckCircle1"></i>
                                            <span @class(['cl-text-2', 'text' => $isCompactList])>
                                                {{ ! empty($role) ? $role : __('Verified Buyer') }}
                                            </span>
                                        </div>
                                    </div>
                                @endif
                                @if (! empty($content))
                                    <p class="tes_text h6 fw-medium {{ $isType2 ? '' : 'text-capitalize' }}">{!! BaseHelper::clean($content) !!}</p>
                                @endif
                                @if (! empty($productImage) || ! empty($productName))
                                    <div class="tes_product">
                                        @if (! empty($productImage))
                                            <div class="product-image">
                                                {!! RvMedia::image($productImage, $productName, 'thumb', false, ['width' => 60, 'height' => 60, 'class' => 'aspect-ratio-1 object-fit-cover', 'loading' => 'lazy']) !!}
                                            </div>
                                        @endif
                                        <div class="product-infor">
                                            @if (! empty($productName))
                                                <a href="{{ $productUrl ?: '#' }}" class="prd_name link fw-medium lh-24 text-line-clamp-1">
                                                    {!! BaseHelper::clean($productName) !!}
                                                </a>
                                            @endif
                                            @if (! empty($productPrice))
                                                <p class="prd_price fw-semibold text-primary">{!! BaseHelper::clean($productPrice) !!}</p>
                                            @endif
                                        </div>
                                    </div>
                                @endif
                            </div>
                        </div>
                    @endif
                </div>
            @endforeach
        </div>
        <div class="{{ $isStyle8 ? 'sw-dot-default style-2 tf-sw-pagination mt-xl-44' : 'sw-line-default style-2 tf-sw-pagination' }}"></div>
    </div>
</div>

@if ($useBgMain || $useOuter)
    </div>
</section>
@endif
