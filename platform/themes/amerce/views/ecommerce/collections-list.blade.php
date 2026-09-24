@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Theme\Facades\Theme;
@endphp

{{-- Breadcrumb is rendered by layouts/base.blade.php. --}}

<section class="flat-spacing">
    <div class="container">
        @if (! empty($subtitle))
            <p class="text-center text-body-1 cl-text-2 mb-40">{{ $subtitle }}</p>
        @endif

        @if ($categories->isNotEmpty())
            <div class="tf-grid-layout ssm-col-2 xl-col-4 gap-lg-30">
                @foreach ($categories as $category)
                    <div class="category-v03 style-2 hover-img4">
                        <a href="{{ $category->url }}" class="cate-image img-style4">
                            @if ($category->image)
                                <img
                                    loading="lazy"
                                    width="330"
                                    height="440"
                                    src="{{ RvMedia::getImageUrl($category->image, 'medium', false, RvMedia::getDefaultImage()) }}"
                                    alt="{{ $category->name }}"
                                >
                            @else
                                <img
                                    loading="lazy"
                                    width="330"
                                    height="440"
                                    src="{{ RvMedia::getDefaultImage() }}"
                                    alt="{{ $category->name }}"
                                >
                            @endif
                        </a>
                        <div class="cate-content text-center">
                            <a href="{{ $category->url }}" class="cate_name h5 fw-medium">
                                {{ $category->name }}
                                <i class="icon icon-ArrowUpRight1"></i>
                            </a>
                        </div>
                    </div>
                @endforeach
            </div>

            @if (method_exists($categories, 'links') && $categories->hasPages())
                <div class="d-flex justify-content-center mt-40">
                    {!! BaseHelper::clean($categories->links()) !!}
                </div>
            @endif
        @else
            <div class="text-center cl-text-2 py-60">
                {{ __('No collections available yet.') }}
            </div>
        @endif
    </div>
</section>
