<div class="container mt-30">
    <div dir="ltr" class="swiper tf-swiper brand-logos-slider"
        data-preview="{{ $itemsPerRow }}"
        data-tablet="{{ min(4, $itemsPerRow) }}"
        data-mobile-sm="3"
        data-mobile="2"
        data-space="20"
        data-loop="true">
        <div class="swiper-wrapper">
            @forelse ($brands as $brand)
                <div class="swiper-slide">
                    <a href="{{ $brand->url ?: '#' }}" class="brand-logo d-block text-center">
                        {{-- Brand logos are wide rectangular (e.g. 200×56). RvMedia 'thumb' (400×400 square)
                             pads them with whitespace → appears as tiny center-clip. Render original via
                             getImageUrl (no size key) so aspect ratio + max-height clamp do the right thing. --}}
                        @php $logoUrl = $brand->logo ? \Botble\Media\Facades\RvMedia::getImageUrl($brand->logo) : null; @endphp
                        @if ($logoUrl)
                            <img src="{{ $logoUrl }}" alt="{{ \Botble\Base\Facades\BaseHelper::clean($brand->name) }}" class="mx-auto" style="max-height:64px;width:auto;" loading="lazy">
                        @endif
                    </a>
                </div>
            @empty
                <div class="swiper-slide text-center text-muted">{{ __('No brands selected.') }}</div>
            @endforelse
        </div>
    </div>
</div>
