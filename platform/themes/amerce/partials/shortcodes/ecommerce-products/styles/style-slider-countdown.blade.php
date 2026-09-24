@php
    use Botble\Base\Facades\BaseHelper;

    /**
     * Section heading with countdown widget in col-right + product swiper.
     * Mirrors html/home-bag-accessories.html lines 2199-2548 (`Product Countdown`):
     *   <section class="flat-spacing"><div class="container">
     *     <div class="sect-heading type-2 has-col-right align-items-center">
     *       <div><h3>Title</h3><p>Subtitle</p></div>
     *       <div class="col-right">
     *         <div class="countdown-v08 h4">
     *           <div class="js-countdown" data-timer="..." data-labels="Days,Hours,Mins,Secs"></div>
     *         </div>
     *       </div>
     *     </div>
     *     <div class="swiper">...4-up product slider...</div>
     *   </div></section>
     *
     * Seeder must pass `title=''` + `subtitle=''` (suppresses index's centered heading)
     * and use `custom_title` / `custom_subtitle` here. `target_date` is parsed via strtotime
     * → seconds-from-now for the countdown JS timer.
     */
    $sliderId = 'ecommerce-products-countdown-slider-' . uniqid();
    $perView = (int) ($shortcode->items_per_row ?: 4);
    $perView = max(1, min(6, $perView));

    $customTitle    = trim((string) ($shortcode->custom_title ?? ''));
    $customSubtitle = trim((string) ($shortcode->custom_subtitle ?? ''));
    $targetDate     = trim((string) ($shortcode->target_date ?? ''));

    // Compute seconds-from-now for the countdown widget. Defaults to 12 days
    // out so the timer always shows non-zero on a freshly seeded site.
    $secondsRemaining = 1093120;
    if ($targetDate !== '') {
        $ts = strtotime($targetDate);
        if ($ts !== false) {
            $diff = $ts - time();
            if ($diff > 0) {
                $secondsRemaining = $diff;
            }
        }
    }

    $countdownClass = trim((string) ($shortcode->countdown_class ?? 'countdown-v08'));
@endphp

@if ($customTitle !== '' || $customSubtitle !== '')
    <div class="sect-heading type-2 has-col-right align-items-center wow fadeInUp">
        <div>
            @if ($customTitle !== '')
                <h3 class="s-title">{!! BaseHelper::clean($customTitle) !!}</h3>
            @endif
            @if ($customSubtitle !== '')
                <p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($customSubtitle) !!}</p>
            @endif
        </div>
        <div class="col-right">
            <div class="{{ $countdownClass }} h4">
                <div class="js-countdown cd-has-zero cd-custom"
                     data-timer="{{ $secondsRemaining }}"
                     data-labels="{{ __('Days,Hours,Mins,Secs') }}"></div>
            </div>
        </div>
    </div>
@endif

<div class="ecommerce-products__slider tf-btn-swiper-main hover-sw-nav">
    <div dir="ltr"
         id="{{ $sliderId }}"
         class="swiper tf-swiper wrap-sw-over"
         data-preview="{{ $perView }}"
         data-tablet="3"
         data-mobile="2"
         data-mobile-sm="2"
         data-space="10"
         data-space-md="20"
         data-space-lg="30">
        <div class="swiper-wrapper">
            @foreach ($products as $product)
                <div class="swiper-slide">
                    @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), ['product' => $product])
                </div>
            @endforeach
        </div>
    </div>
    <div class="tf-sw-nav nav-prev-{{ $sliderId }} nav-prev-swiper" aria-label="{{ __('Previous') }}">
        <i class="icon icon-arrLeft"></i>
    </div>
    <div class="tf-sw-nav nav-next-{{ $sliderId }} nav-next-swiper" aria-label="{{ __('Next') }}">
        <i class="icon icon-arrRight"></i>
    </div>
</div>
