@php
    use Botble\Base\Facades\BaseHelper;

    $headerCategories = collect();
    if (is_plugin_active('ecommerce')) {
        $headerCategories = app(\Botble\Ecommerce\Repositories\Interfaces\ProductCategoryInterface::class)
            ->advancedGet([
                'condition' => ['parent_id' => 0, 'status' => 'published'],
                'with'      => ['slugable', 'activeChildren', 'activeChildren.activeChildren'],
                'take'      => 8,
            ]);
    }

    // Newline-delimited announcement strip below the header bar (demo `tf-btn-swiper-main
    // swip-text`, html/home-cosmetic.html lines 1320-1359). Empty option = no strip.
    $announcementSlides = array_values(array_filter(array_map(
        'trim',
        preg_split('/\r?\n/', (string) theme_option('header_announcement_slides', ''))
    )));
@endphp

{{-- Header Style 13 — Transparent overlay variant: logo + category dropdown left, main-menu center, inline search + icons right (header-abs). --}}
<div class="header-inner_wrap">
    <div class="container-full">
        <div class="header-inner">
            <div class="box-open-menu-mobile d-xl-none">
                <a href="#mobileMenu" data-bs-toggle="offcanvas" class="btn-open-menu" aria-label="{{ __('Open menu') }}">
                    <i class="icon icon-List"></i>
                </a>
            </div>

            <div class="header-left">
                <a href="{{ BaseHelper::getHomepageUrl() }}" class="logo-site">
                    {{ Theme::getLogoImage(['class' => 'logo-light'], 'logo', 30) }}
                    {{ Theme::getLogoImage(['class' => 'logo-dark'], 'logo_dark', 30) }}
                </a>
                @include(Theme::getThemeNamespace('partials.header.browse-by-category'), [
                    'categories'   => $headerCategories,
                    'wrapClass'    => 'nav-category-wrap style-3 main-action-active d-none d-xxl-block',
                    'btnIconClass' => '',
                    'nameClass'    => 'name-category fw-medium lh-24',
                ])
                <nav class="box-navigation d-none d-xl-block">
                    @include(Theme::getThemeNamespace('partials.header.main-menu'))
                </nav>
            </div>

            <div class="header-right">
                @include(Theme::getThemeNamespace('partials.header.search-form'), ['formClasses' => 'form-search-nav style-3 d-none d-xl-block'])
                @include(Theme::getThemeNamespace('partials.header.ecommerce-action-buttons'), ['inlineSearchAtXl' => true])
            </div>
        </div>
    </div>
</div>

@if (! empty($announcementSlides))
    <div class="tf-btn-swiper-main swip-text d-none d-xl-block">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-sm-1 ms-auto d-none d-sm-block">
                    <div class="nav-prev-swiper d-flex link justify-content-end" aria-label="{{ __('Previous') }}">
                        <i class="icon icon-CaretLeft"></i>
                    </div>
                </div>
                <div class="col-sm-10 col-md-8 col-lg-6">
                    <div class="text-center">
                        <div dir="ltr" class="swiper tf-swiper" data-auto="true" data-loop="true" data-speed="1500" data-delay="1500">
                            <div class="swiper-wrapper">
                                @foreach ($announcementSlides as $slide)
                                    <div class="swiper-slide">
                                        <div class="d-flex align-items-center justify-content-center gap-8">
                                            <i class="icon icon-SealPercent fs-20"></i>
                                            <p class="text-line-clamp-1">{!! BaseHelper::clean($slide) !!}</p>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-1 me-auto d-none d-sm-block">
                    <div class="nav-next-swiper d-flex link" aria-label="{{ __('Next') }}">
                        <i class="icon icon-CaretRightThin"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endif
