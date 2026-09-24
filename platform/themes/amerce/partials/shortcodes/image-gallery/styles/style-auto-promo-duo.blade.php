{{-- HomeAuto promo duo — mirrors html/home-auto.html "Banner Image" section:
     bare-section / container / tf-grid-layout md-col-2 / box-image_v04 type-3. --}}
<div class="bare-section">
    <div class="container">
        <div class="tf-grid-layout md-col-2">
            @foreach ($items as $i => $item)
                @php
                    $idx = $i + 1;
                    $image = $item['image'] ?? null;
                    $link = $item['link'] ?? '#';
                    $title = (string) ($shortcode->{"title_$idx"} ?? '');
                    $desc = (string) ($shortcode->{"description_$idx"} ?? '');
                    $btn = (string) ($shortcode->{"button_text_$idx"} ?? __('Shop Now'));
                @endphp
                <div class="box-image_v04 type-3">
                    <a href="{{ $link }}" class="box-image_img img-style">
                        <img loading="lazy" width="690" height="388"
                             src="{{ $image ? \Botble\Media\Facades\RvMedia::getImageUrl($image) : \Botble\Media\Facades\RvMedia::getDefaultImage() }}"
                             alt="{{ $title ?: 'Image' }}">
                    </a>
                    <div class="box-image_content wow fadeInUp">
                        @if ($title !== '')
                            <a href="{{ $link }}" class="title h3 fw-medium text-white link">
                                {!! nl2br(BaseHelper::clean($title)) !!}
                            </a>
                        @endif
                        @if ($desc !== '')
                            <p class="desc text-white">
                                {!! BaseHelper::clean($desc) !!}
                            </p>
                        @endif
                        @if ($btn !== '')
                            <a href="{{ $link }}" class="btn-action tf-btn-line-2 style-white">
                                <span class="fw-semibold">
                                    {!! BaseHelper::clean($btn) !!}
                                </span>
                            </a>
                        @endif
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
