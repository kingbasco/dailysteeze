@php
    use Botble\Ecommerce\Facades\EcommerceHelper;

    Theme::layout('full-width');
    Theme::set('pageTitle', __('Wishlist'));
    Theme::set('hideBreadcrumb', true);
@endphp

<section class="section-page-title text-center flat-spacing-2 pb-0">
    <div class="container">
        <div class="main-page-title">
            <h3 class="letter-space-0">{{ __('Wishlist') }}</h3>
            <p class="text-body-1 cl-text-2">
                {{ __('All the items you saved for later — review, add to cart or remove anytime.') }}
            </p>
        </div>
    </div>
</section>

@if (! EcommerceHelper::isWishlistEnabled())
    <div class="container py-5 text-center">
        <h4 class="mb-3">{{ __('Wishlist is disabled') }}</h4>
        <p class="cl-text-2">
            {{ __('The wishlist feature is currently turned off. Please contact us for more information.') }}
        </p>
        <a href="{{ route('public.products') }}" class="tf-btn animate-btn mt-3">
            {{ __('Continue shopping') }}
        </a>
    </div>
@else
    <div class="section-wishlist flat-spacing">
        <div class="container">
            @if (! isset($products) || (is_countable($products) && count($products) === 0))
                <div class="empty-state text-center py-5">
                    <span class="icon icon-Heart fs-1 mb-3 d-inline-block" aria-hidden="true"></span>
                    <h4 class="mb-3">{{ __('Your wishlist is empty') }}</h4>
                    <p class="cl-text-2 mb-3">
                        {{ __("Browse our shop and save the items you love for later.") }}
                    </p>
                    <a href="{{ route('public.products') }}" class="tf-btn animate-btn">
                        {{ __('Continue shopping') }}
                    </a>
                </div>
            @else
                <div class="tf-grid-layout tf-col-2 md-col-3 xl-col-4 wrapper-wishlist">
                    @foreach ($products as $product)
                        <div class="card-product" data-wishlist-row="{{ $product->id }}">
                            @include(Theme::getThemeNamespace('views.ecommerce.includes.product.style-1.grid'), [
                                'product' => $product,
                                'showQuickView' => false,
                                'showQuickShop' => true,
                            ])

                            <form
                                action="{{ route('public.wishlist.remove', $product->id) }}"
                                method="POST"
                                class="product-action_remove-form">
                                @csrf
                                @method('DELETE')
                                <button
                                    type="submit"
                                    class="product-action_remove remove box-icon hover-tooltip tooltip-left"
                                    aria-label="{{ __('Remove from wishlist') }}">
                                    <i class="icon icon-trash" aria-hidden="true"></i>
                                    <span class="tooltip">{{ __('Remove') }}</span>
                                </button>
                            </form>
                        </div>
                    @endforeach
                </div>
            @endif
        </div>
    </div>
@endif
