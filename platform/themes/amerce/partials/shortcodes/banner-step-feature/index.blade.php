@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Banner with step features + product showcase — mirrors home-sneaker.html §6
     * (lines 2503-2670) `<section class="banner-v07">`: full-bleed bg image + overlay
     * with: large h1 title TOP-LEFT + 6 benefit pills (icon + text, 2x3 grid)
     * BOTTOM-LEFT + 2 featured product cards BOTTOM-RIGHT.
     *
     * Benefits configured via `benefit_N_icon` + `benefit_N_name` attrs (up to 6).
     * Product cards resolved via `product_id_1` + `product_id_2` attrs.
     */

    $heading = trim((string) ($shortcode->heading ?? ''));

    $benefits = [];
    foreach ([1, 2, 3, 4, 5, 6] as $i) {
        $name = trim((string) ($shortcode->{"benefit_{$i}_name"} ?? ''));
        $icon = trim((string) ($shortcode->{"benefit_{$i}_icon"} ?? ''));
        if ($name === '' && $icon === '') continue;
        $benefits[] = ['name' => $name, 'icon' => $icon];
    }

    $productIds = [];
    foreach ([1, 2] as $i) {
        $pid = (int) ($shortcode->{"product_id_$i"} ?? 0);
        if ($pid > 0) $productIds[] = $pid;
    }
    $products = collect();
    if (! empty($productIds) && is_plugin_active('ecommerce') && class_exists(\Botble\Ecommerce\Models\Product::class)) {
        $products = \Botble\Ecommerce\Models\Product::query()
            ->whereIn('id', $productIds)
            ->wherePublished()
            ->with(['slugable'])
            ->orderByRaw('FIELD(id, ' . implode(',', $productIds) . ')')
            ->get();
    }
@endphp

{{-- .banner-v07 layout (full-bleed hero + benefits row + product cards) lives in
     assets/sass/component/_inline-migrated.scss. --}}
<section {!! $shortcode->htmlAttributes() !!} class="banner-v07">
    <div class="banner-image">
        {!! RvMedia::image($shortcode->image ?? null, $heading ?: '', 'hero-banner', false, ['width' => 1920, 'height' => 900, 'loading' => 'lazy']) !!}
    </div>
    <div class="banner-content flat-spacing-2">
        <div class="container-full full-v3">
            @if ($heading !== '')
                <p class="bn_title text-128 fw-medium text-white wow fadeInUp">{!! BaseHelper::clean($heading) !!}</p>
            @endif
            <div class="row justify-content-between align-items-end gy-30">
                <div class="col-lg-6 col-xxl-4">
                    <div class="tf-grid-layout ssm-col-2 md-col-3 gap-20 wow fadeInUp">
                        @foreach ($benefits as $b)
                            <div class="wg-benefit text-white">
                                @if ($b['icon'] !== '')
                                    <i class="bnf-ic icon {{ $b['icon'] }}"></i>
                                @endif
                                @if ($b['name'] !== '')
                                    <h6 class="bnf-text text-white">{!! BaseHelper::clean($b['name']) !!}</h6>
                                @endif
                            </div>
                        @endforeach
                    </div>
                </div>
                <div class="col-lg-6 col-xxl-5">
                    <div class="tf-grid-layout d-sm-flex justify-content-end gap-20 cl-xl-gap-38">
                        @foreach ($products as $product)
                            @php
                                $price = format_price($product->front_sale_price_with_taxes ?? $product->sale_price ?? $product->price);
                                $oldPrice = ($product->front_sale_price && $product->front_sale_price < $product->price)
                                    ? format_price($product->price) : '';
                                $badge = $oldPrice ? '-' . round((1 - $product->front_sale_price / $product->price) * 100) . '%' : __('Sale');
                            @endphp
                            <div class="card-product card-product_v02 style-2 wow fadeInUp">
                                <div class="card-product_wrapper square">
                                    <a href="{{ $product->url ?: '#' }}" class="product-img rounded-0">
                                        {!! RvMedia::image($product->image ?? null, $product->name, 'thumb', false, ['class' => 'img-product', 'width' => 300, 'height' => 300, 'loading' => 'lazy']) !!}
                                    </a>
                                    <ul class="product-badge_list">
                                        <li class="product-badge_item text-caption-01 sale">{{ $badge }}</li>
                                    </ul>
                                </div>
                                <div class="card-product_info">
                                    <a href="{{ $product->url ?: '#' }}" class="name-product lh-24 fw-medium link-underline-text-primary">
                                        {!! BaseHelper::clean($product->name) !!}
                                    </a>
                                    <div class="infor_price price-wrap">
                                        <span class="price-new">{!! $price !!}</span>
                                        @if ($oldPrice !== '')
                                            <span class="price-old text-caption-01 cl-text-2">{!! $oldPrice !!}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
