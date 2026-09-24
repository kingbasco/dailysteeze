@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Theme\Facades\Theme;

    $accordionId = 'prdDes';
    $sections = collect([
        ['key' => 'description', 'label' => __('Description'),                                          'enabled' => true],
        ['key' => 'specification','label' => __('Product Specification'),                                'enabled' => $hasSpecificationTab ?? false],
        ['key' => 'review',      'label' => __('Reviews (:count)', ['count' => $product->reviews_count]),'enabled' => $hasReviewTab ?? false],
        ['key' => 'vendor',      'label' => __('Vendor'),                                               'enabled' => $hasVendorTab ?? false],
        ['key' => 'faq',         'label' => __('FAQs'),                                                 'enabled' => $hasFaqTab ?? false],
    ])->filter(fn ($section) => $section['enabled'])->values();
@endphp

<section class="section-product-description flat-spacing">
    <div class="container">
        <div class="faq-descriptions" id="{{ $accordionId }}">
            @foreach ($sections as $index => $section)
                @php
                    $panelId = 'prd-section-' . $section['key'];
                    $isOpen = $index === 0;
                @endphp
                <div class="accordion-item_v2 style-2">
                    <div
                        @class([
                            'accordion-action h5 fw-medium',
                            'collapsed' => ! $isOpen,
                        ])
                        data-bs-target="#{{ $panelId }}"
                        data-bs-toggle="collapse"
                        aria-expanded="{{ $isOpen ? 'true' : 'false' }}"
                        aria-controls="{{ $panelId }}"
                        role="button"
                    >
                        <span>{{ $section['label'] }}</span>
                        <span class="icon ic-accordion-custom cl-2"></span>
                    </div>
                    <div
                        id="{{ $panelId }}"
                        @class(['collapse', 'show' => $isOpen])
                        data-bs-parent="#{{ $accordionId }}"
                    >
                        <div class="accordion-content">
                            @switch ($section['key'])
                                @case ('description')
                                    <div class="ck-content">
                                        {!! BaseHelper::clean($product->content) !!}
                                    </div>
                                    {!! BaseHelper::clean(apply_filters(BASE_FILTER_PUBLIC_COMMENT_AREA, '', $product)) !!}
                                    @break
                                @case ('specification')
                                    @include(EcommerceHelper::viewPath('includes.product-specification'))
                                    @break
                                @case ('review')
                                    <div id="product-review">
                                        @include(EcommerceHelper::viewPath('includes.reviews'))
                                    </div>
                                    @break
                                @case ('vendor')
                                    @includeIf(Theme::getThemeNamespace('views.marketplace.includes.vendor-card'), ['store' => $product->store])
                                    @break
                                @case ('faq')
                                    @include(EcommerceHelper::viewPath('includes.product-faqs'), ['faqs' => $product->faq_items])
                                    @break
                            @endswitch
                        </div>
                    </div>
                </div>
            @endforeach

            {!! BaseHelper::clean(apply_filters('ecommerce_product_detail_extra_tab_contents', '', $product)) !!}
        </div>
    </div>
</section>
