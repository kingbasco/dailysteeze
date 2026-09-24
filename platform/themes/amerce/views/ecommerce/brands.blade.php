@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Theme\Facades\Theme;
@endphp

{{-- Breadcrumb is rendered by layouts/base.blade.php. --}}

<section class="brands-page flat-spacing">
    <div class="container">
        @if (! empty($title))
            <div class="sect-heading text-center mb-40">
                <h1 class="s-title">{{ $title }}</h1>
                @if (! empty($subtitle))
                    <p class="s-sub-title cl-text-2">{{ $subtitle }}</p>
                @endif
            </div>
        @endif

        @if ($brands->isNotEmpty())
            <div class="row gy-30">
                @foreach ($brands as $brand)
                    <div class="col-xl-3 col-lg-4 col-sm-6">
                        <a href="{{ $brand->url ?: '#' }}" class="brand-card d-flex flex-column align-items-center text-center p-30 h-100 border rounded-3 link-hover-primary">
                            <div class="brand-card__logo d-flex align-items-center justify-content-center mb-20">
                                {!! RvMedia::image($brand->logo ?? null, $brand->name, 'thumb', false, ['class' => 'mw-100 mh-100', 'loading' => 'lazy']) !!}
                            </div>
                            <h6 class="brand-card__name fw-medium mb-4">{{ $brand->name }}</h6>
                            @if (isset($brand->products_count))
                                <span class="brand-card__count cl-text-2 text-caption-01">
                                    {{ trans_choice('{0} No products|{1} :count product|[2,*] :count products', $brand->products_count, ['count' => $brand->products_count]) }}
                                </span>
                            @endif
                        </a>
                    </div>
                @endforeach
            </div>

            @if (method_exists($brands, 'links'))
                <div class="d-flex justify-content-center mt-40">
                    {!! BaseHelper::clean($brands->links()) !!}
                </div>
            @endif
        @else
            <div class="text-center cl-text-2 py-60">
                {{ __('No brands available yet.') }}
            </div>
        @endif
    </div>
</section>
