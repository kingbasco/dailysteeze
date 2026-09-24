@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Theme\Facades\Theme;
@endphp

<section class="section-product-tabs flat-spacing flat-animate-tab">
    <div class="container">
        <div class="tf-product-tabs">
            <ul class="tab-btn-wrap-v1" id="productDetailsTabs" role="tablist">
                <li class="nav-tab-item" role="presentation">
                    <button class="tf-btn-tab active" id="tab-description-trigger" data-bs-toggle="tab"
                            data-bs-target="#tab-description" type="button" role="tab"
                            aria-controls="tab-description" aria-selected="true">
                        <span class="h5 fw-medium">{{ __('Description') }}</span>
                    </button>
                </li>
                @if ($hasSpecificationTab)
                    <li class="nav-tab-item" role="presentation">
                        <button class="tf-btn-tab" id="tab-specification-trigger" data-bs-toggle="tab"
                                data-bs-target="#tab-specification" type="button" role="tab"
                                aria-controls="tab-specification" aria-selected="false">
                            <span class="h5 fw-medium">{{ __('Product Specification') }}</span>
                        </button>
                    </li>
                @endif
                @if ($hasReviewTab)
                    <li class="nav-tab-item" role="presentation">
                        <button class="tf-btn-tab" id="tab-review-trigger" data-bs-toggle="tab"
                                data-bs-target="#tab-review" type="button" role="tab"
                                aria-controls="tab-review" aria-selected="false">
                            <span class="h5 fw-medium">{{ __('Reviews (:count)', ['count' => $product->reviews_count]) }}</span>
                        </button>
                    </li>
                @endif
                @if ($hasVendorTab)
                    <li class="nav-tab-item" role="presentation">
                        <button class="tf-btn-tab" id="tab-vendor-trigger" data-bs-toggle="tab"
                                data-bs-target="#tab-vendor" type="button" role="tab"
                                aria-controls="tab-vendor" aria-selected="false">
                            <span class="h5 fw-medium">{{ __('Vendor') }}</span>
                        </button>
                    </li>
                @endif
                @if ($hasFaqTab)
                    <li class="nav-tab-item" role="presentation">
                        <button class="tf-btn-tab" id="tab-faq-trigger" data-bs-toggle="tab"
                                data-bs-target="#tab-faq" type="button" role="tab"
                                aria-controls="tab-faq" aria-selected="false">
                            <span class="h5 fw-medium">{{ __('FAQs') }}</span>
                        </button>
                    </li>
                @endif
                {!! BaseHelper::clean(apply_filters('ecommerce_product_detail_extra_tab_headers', '', $product)) !!}
            </ul>

            <div class="tab-content" id="productDetailsTabsContent">
                <div class="tab-pane fade show active" id="tab-description" role="tabpanel"
                     aria-labelledby="tab-description-trigger" tabindex="0">
                    <div class="ck-content">
                        {!! BaseHelper::clean($product->content) !!}
                    </div>

                    {!! BaseHelper::clean(apply_filters(BASE_FILTER_PUBLIC_COMMENT_AREA, '', $product)) !!}
                </div>

                @if ($hasSpecificationTab)
                    <div class="tab-pane fade" id="tab-specification" role="tabpanel"
                         aria-labelledby="tab-specification-trigger" tabindex="0">
                        @include(EcommerceHelper::viewPath('includes.product-specification'))
                    </div>
                @endif

                @if ($hasReviewTab)
                    <div class="tab-pane fade" id="tab-review" role="tabpanel"
                         aria-labelledby="tab-review-trigger" tabindex="0">
                        <div id="product-review">
                            @include(EcommerceHelper::viewPath('includes.reviews'))
                        </div>
                    </div>
                @endif

                @if ($hasVendorTab)
                    <div class="tab-pane fade" id="tab-vendor" role="tabpanel"
                         aria-labelledby="tab-vendor-trigger" tabindex="0">
                        @includeIf(Theme::getThemeNamespace('views.marketplace.includes.vendor-card'), ['store' => $product->store])
                    </div>
                @endif

                @if ($hasFaqTab)
                    <div class="tab-pane fade" id="tab-faq" role="tabpanel"
                         aria-labelledby="tab-faq-trigger" tabindex="0">
                        @include(EcommerceHelper::viewPath('includes.product-faqs'), ['faqs' => $product->faq_items])
                    </div>
                @endif

                {!! BaseHelper::clean(apply_filters('ecommerce_product_detail_extra_tab_contents', '', $product)) !!}
            </div>
        </div>
    </div>
</section>
