@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Tab product showcase — mirrors home-sport.html §5 (lines 2230-2450):
     * `banner-collect-v03 flat-animate-tab-2` — 2-col layout: heading + numbered tab list +
     * View More CTA on LEFT, tab-pane image+product overlay card on RIGHT. Each tab swaps
     * the image AND the overlaid product info card (price + Add to cart).
     *
     * Tabs are configured via `tab_N_*` attrs (label, image, product_id). Each tab
     * resolves the linked product to render its name + sale price + URL inside the
     * RIGHT overlay card.
     */

    $heading    = trim((string) ($shortcode->title ?? ''));
    $subtitle   = trim((string) ($shortcode->subtitle ?? ''));
    $viewAllUrl = trim((string) ($shortcode->view_all_url ?? '/products'));
    $viewAllText = trim((string) ($shortcode->view_all_text ?? __('View More')));

    // Build tabs array. Up to 4 tabs (matches demo).
    $tabs = [];
    $productIds = [];
    foreach ([1, 2, 3, 4] as $i) {
        $label = trim((string) ($shortcode->{"tab_{$i}_label"} ?? ''));
        $img   = $shortcode->{"tab_{$i}_image"} ?? null;
        $pid   = (int) ($shortcode->{"tab_{$i}_product_id"} ?? 0);
        if ($label === '' && ! $img && ! $pid) continue;
        $tabs[] = ['label' => $label, 'image' => $img, 'product_id' => $pid];
        if ($pid) $productIds[] = $pid;
    }

    // Resolve linked products in one query
    $products = collect();
    if (! empty($productIds) && is_plugin_active('ecommerce') && class_exists(\Botble\Ecommerce\Models\Product::class)) {
        $products = \Botble\Ecommerce\Models\Product::query()
            ->whereIn('id', $productIds)
            ->wherePublished()
            ->with(['slugable'])
            ->get()
            ->keyBy('id');
    }

    $domId = 'tabShowcase-' . substr(md5((string) ($shortcode->id ?? uniqid())), 0, 6);
@endphp

<section {!! $shortcode->htmlAttributes() !!} class="tf-section section-tab-product-showcase flat-spacing">
    <div class="banner-collect-v03 flat-animate-tab-2">
        <div class="container">
            <div class="row align-items-center gy-5 flex-wrap-reverse">
                {{-- LEFT — heading + numbered tab list + View More CTA --}}
                <div class="col-md-6">
                    <div class="col-left wow fadeInUp">
                        @if ($heading !== '' || $subtitle !== '')
                            <div class="heading">
                                @if ($heading !== '')
                                    <h3 class="mb-8">{!! BaseHelper::clean($heading) !!}</h3>
                                @endif
                                @if ($subtitle !== '')
                                    <p class="text-body-1 cl-text-2">{!! BaseHelper::clean($subtitle) !!}</p>
                                @endif
                            </div>
                        @endif
                        <ul class="tab-btn-wrap-v3 style-3" role="tablist">
                            @foreach ($tabs as $i => $tab)
                                @php $tabId = $domId . '-pane-' . ($i + 1); $isActive = $i === 0; @endphp
                                <li class="nav-tab-item" role="presentation">
                                    <a href="#{{ $tabId }}" data-bs-toggle="tab"
                                       class="tf-btn-tab {{ $isActive ? 'active' : '' }}" role="tab">
                                        <span class="text h5 fw-medium">{{ ($i + 1) . '. ' . BaseHelper::clean($tab['label']) }}</span>
                                        <i class="icon icon-ArrowUpRight fs-24"></i>
                                    </a>
                                </li>
                            @endforeach
                        </ul>
                        @if ($viewAllText !== '')
                            <a href="{{ $viewAllUrl }}" class="tf-btn-line-2 py-4 fw-semibold style-primary">
                                {!! BaseHelper::clean($viewAllText) !!}
                            </a>
                        @endif
                    </div>
                </div>

                {{-- RIGHT — tab-pane with image + product overlay card --}}
                <div class="col-md-6">
                    <div class="col-right">
                        <div class="tab-content">
                            @foreach ($tabs as $i => $tab)
                                @php
                                    $tabId = $domId . '-pane-' . ($i + 1);
                                    $isActive = $i === 0;
                                    $product = $products->get($tab['product_id']);
                                    $price = $product
                                        ? format_price($product->front_sale_price_with_taxes ?? $product->sale_price ?? $product->price)
                                        : '';
                                    $oldPrice = ($product && $product->front_sale_price && $product->front_sale_price < $product->price)
                                        ? format_price($product->price)
                                        : '';
                                @endphp
                                <div class="tab-pane {{ $isActive ? 'active show' : '' }}" id="{{ $tabId }}" role="tabpanel">
                                    <div class="banner-v06">
                                        <div class="bn_image">
                                            {!! RvMedia::image($tab['image'], $tab['label'] ?? '', 'medium', false, ['width' => 700, 'height' => 700, 'loading' => 'lazy']) !!}
                                        </div>
                                        @if ($product)
                                            <div class="bn_content">
                                                <div class="prd_info d-grid">
                                                    <a href="{{ $product->url ?: '#' }}"
                                                       class="info__name fw-medium link lh-24 text-line-clamp-1">
                                                        {!! BaseHelper::clean($product->name) !!}
                                                    </a>
                                                    <div class="info__price price-wrap">
                                                        <span class="price-new fw-medium">{!! $price !!}</span>
                                                        @if ($oldPrice !== '')
                                                            <span class="price-old cl-text-2">{!! $oldPrice !!}</span>
                                                        @endif
                                                    </div>
                                                </div>
                                                <a href="{{ $product->url ?: '#' }}" class="tf-btn small animate-btn text-nowrap">
                                                    {{ __('Add to cart') }}
                                                </a>
                                            </div>
                                        @endif
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
