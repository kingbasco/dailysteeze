@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Media\Facades\RvMedia;

    $imageUrl = RvMedia::getImageUrl($shortcode->image ?? null, 'banner-half');
    $overline = trim((string) ($shortcode->overline ?? ''));
    $heading  = trim((string) ($shortcode->heading ?? ''));
    $btnText  = trim((string) ($shortcode->button_text ?? ''));
    $btnUrl   = $shortcode->button_url ?: '#';
@endphp

{{-- Mirrors html/home-fashion.html "Weekly Top Highlights" (line 2050-2452):
     section heading on top, then a 2-col `row`: banner (banner-image-text
     type-abs style-15) on the left, 2x2 product grid (`tf-grid-layout tf-col-2`)
     on the right. Uses the existing style-1 product card partial so swatches
     and other card features stay consistent across the page. --}}
<section {!! $shortcode->htmlAttributes() !!} class="section-banner-highlight flat-spacing">
    <div class="container">
        @if (! empty($shortcode->title ?? '') || ! empty($shortcode->subtitle ?? ''))
            <div class="sect-heading type-6 text-center wow fadeInUp">
                @if (! empty($shortcode->title ?? ''))
                    <h3 class="s-title">{!! BaseHelper::clean($shortcode->title) !!}</h3>
                @endif
                @if (! empty($shortcode->subtitle ?? ''))
                    <p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
                @endif
            </div>
        @endif

        <div class="row">
            <div class="col-lg-6">
                <div class="banner-image-text type-abs style-15">
                    <a href="{{ $btnUrl }}" class="bn-image img-style">
                        <img loading="lazy" width="450" height="608" src="{{ $imageUrl }}" alt="{{ BaseHelper::clean($heading ?: ($shortcode->title ?? '')) }}">
                    </a>
                    <div class="bn-content">
                        @if ($overline !== '')
                            <p class="desc text-body-1 text-white mb-4">{!! BaseHelper::clean($overline) !!}</p>
                        @endif
                        @if ($heading !== '')
                            <div class="h1 title text-white mb-28">{!! BaseHelper::clean($heading) !!}</div>
                        @endif
                        @if ($btnText !== '')
                            <a href="{{ $btnUrl }}" class="btn-action tf-btn btn-white hv-primary">
                                {!! BaseHelper::clean($btnText) !!}
                            </a>
                        @endif
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="tf-grid-layout tf-col-2">
                    @forelse ($products as $product)
                        <div class="card-product">
                            @include(EcommerceHelper::viewPath('includes.product.style-1.grid'), [
                                'product' => $product,
                                'showQuickView' => false,
                                'showQuickShop' => true,
                            ])
                        </div>
                    @empty
                        <p class="text-muted">{{ __('No products to show.') }}</p>
                    @endforelse
                </div>
            </div>
        </div>
    </div>
</section>
