@php
    /**
     * @var \Botble\Shortcode\Compilers\Shortcode $shortcode
     * @var \Illuminate\Support\Collection|\Illuminate\Pagination\LengthAwarePaginator $products
     */
    $allowed = ['style-grid', 'style-slider', 'style-list', 'style-featured', 'style-mini-list', 'style-tabs', 'style-grid-with-banner', 'style-banner-carousel-side', 'style-slider-countdown', 'style-slider-side-heading', 'style-auto-flash-sale', 'style-auto-featured-tabs', 'style-auto-mini-list-with-banner', 'style-thumbs-arrival'];
    $style = in_array($shortcode->style, $allowed, true) ? $shortcode->style : 'style-grid';
    $tabs = $tabs ?? null;
    $hasViewAllHeading = false;
    // Styles that render their own heading column + a full-bleed container
    // (home-fashion-2 §7: left col-lg-3 heading + right col-lg-9 slider).
    // style-thumbs-arrival renders its own 2-col layout (LEFT: tag+title+desc+thumb-swiper,
    // RIGHT: main-product-swiper) per html/home-decor.html §6 lines 1994-2133. Suppress
    // the outer .container wrap so the inner sw-thumbs-arrival owns the row.
    $selfHeadingStyles = ['style-tabs', 'style-auto-featured-tabs', 'style-slider-side-heading', 'style-thumbs-arrival'];
    // container_class: per-preset override of the inner container wrapper.
    // home-office-equipment §6 needs `container-full full-v2`; default keeps the
    // existing per-style behaviour.
    $containerClassOverride = trim((string) ($shortcode->container_class ?? ''));
    $containerClass = $containerClassOverride !== ''
        ? $containerClassOverride
        : ($style === 'style-slider-side-heading' ? 'container-full' : 'container');
    // Per-preset section class override (e.g. "section-top-pick-v02" for construction).
    $sectionClassOverride = trim((string) ($shortcode->section_class ?? ''));
    $sectionClasses = $sectionClassOverride !== ''
        ? $sectionClassOverride
        : trim('ecommerce-products ecommerce-products--' . $style . ' flat-spacing ' . ($style === 'style-auto-flash-sale' ? 'pt-0' : ''));
@endphp

@if (! empty($products) && (is_countable($products) ? count($products) : 0) > 0)
    <section class="{{ $sectionClasses }}">
        <div class="{{ $containerClass }}">
            @if (! in_array($style, $selfHeadingStyles, true) && ($shortcode->title || $shortcode->subtitle))
                @php
                    $titleAlign = $shortcode->title_align ?: 'center';
                    $useSideNav = $titleAlign === 'side-nav';
                    $sliderId = 'ecommerce-products-slider-' . uniqid();
                    $viewAllUrl = trim((string) ($shortcode->view_all_url ?? ''));
                    $viewAllText = $shortcode->view_all_text ?: __('View All');
                    $hasViewAllHeading = $titleAlign === 'left' && $viewAllUrl !== '';
                @endphp
    
                @if ($useSideNav)
                    <div class="sect-heading type-4 align-items-end mb-43">
                        <div class="flex-sm-1 wow fadeInUp">
                            @if ($shortcode->title)
                                <h3 class="s-title mb-6">{!! \Botble\Base\Facades\BaseHelper::clean($shortcode->title) !!}</h3>
                            @endif
                            @if ($shortcode->subtitle)
                                <p class="s-subtitle text-body-1 cl-text-2">{!! \Botble\Base\Facades\BaseHelper::clean($shortcode->subtitle) !!}</p>
                            @endif
                        </div>
                        <div class="group-btn-slider wow fadeInUp d-md-flex d-none" data-wow-delay="0.1s">
                            <div class="tf-sw-nav-2 style-large rounded-8 nav-prev-{{ $sliderId }} nav-prev-swiper">
                                <i class="icon icon-ArrowLeft"></i>
                            </div>
                            <div class="tf-sw-nav-2 style-large rounded-8 nav-next-{{ $sliderId }} nav-next-swiper">
                                <i class="icon icon-ArrowRight"></i>
                            </div>
                        </div>
                    </div>
                @elseif ($hasViewAllHeading)
                    {{-- subtitle_position:
                         'left'  (default) subtitle stacks under title in left col
                         'right' subtitle moves into the right column ABOVE the CTA
                                 — matches html/home-furniture.html §3 L1582-1604
                         'above' subtitle (eyebrow) renders ABOVE the title in the left col
                                 with `s-desc cl-text-3 fw-semibold mb-8` + `h2 s-title
                                 font-outfit mb-0 letter-space-0` — matches
                                 html/home-organic.html §5 L2032-2048. --}}
                    @php
                        $subtitlePos = in_array($shortcode->subtitle_position ?? '', ['left', 'right', 'above'], true)
                            ? $shortcode->subtitle_position
                            : 'left';
                    @endphp
                    <div class="sect-heading type-2 has-col-right wow fadeInUp">
                        <div>
                            @if ($shortcode->subtitle && $subtitlePos === 'above')
                                <p class="s-desc cl-text-3 fw-semibold mb-8">{!! \Botble\Base\Facades\BaseHelper::clean($shortcode->subtitle) !!}</p>
                            @endif
                            @if ($shortcode->title)
                                @if ($subtitlePos === 'above')
                                    <h2 class="s-title font-outfit mb-0 letter-space-0">{!! \Botble\Base\Facades\BaseHelper::clean($shortcode->title) !!}</h2>
                                @else
                                    <h3 class="s-title">{!! \Botble\Base\Facades\BaseHelper::clean($shortcode->title) !!}</h3>
                                @endif
                            @endif
                            @if ($shortcode->subtitle && $subtitlePos === 'left')
                                <p class="s-desc text-body-1 cl-text-2">{!! \Botble\Base\Facades\BaseHelper::clean($shortcode->subtitle) !!}</p>
                            @endif
                        </div>
                        <div class="col-right d-flex flex-column align-items-end gap-12">
                            @if ($shortcode->subtitle && $subtitlePos === 'right')
                                <p class="s-desc text-body-1 cl-text-2 mb-0 text-end">{!! \Botble\Base\Facades\BaseHelper::clean($shortcode->subtitle) !!}</p>
                            @endif
                            <a href="{{ $viewAllUrl }}" class="tf-btn-line-2 style-primary py-4">
                                <span class="fw-semibold">{!! \Botble\Base\Facades\BaseHelper::clean($viewAllText) !!}</span>
                            </a>
                        </div>
                    </div>
                @else
                    @include(Theme::getThemeNamespace('partials.section-title'), [
                        'title' => $shortcode->title,
                        'subtitle' => $shortcode->subtitle,
                        'align' => $titleAlign,
                    ])
                @endif
            @endif
    
            @include(Theme::getThemeNamespace('partials.shortcodes.ecommerce-products.styles.' . $style), ['sliderId' => $sliderId ?? null])
    
            @if (! $hasViewAllHeading && $shortcode->show_view_all && $shortcode->view_all_url)
                <div class="ecommerce-products__view-all text-center mt-4">
                    <a href="{{ $shortcode->view_all_url }}" class="btn btn-outline-dark">
                        {{ __('View all') }}
                    </a>
                </div>
            @endif
        </div>
    </section>
@endif
