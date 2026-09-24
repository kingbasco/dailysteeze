{{-- Paired-banner overlay (container-full grid) — html/home-pet-care.html §6 (Banner Product).
     Mirrors `bare-section / container-full / tf-grid-layout md-col-2 gap-20 / banner-image-text type-abs style-6`.
     Each tab item: image (875x680), link, title (h2 overlay), description, button_text.
     `text_color_$idx` ('white' or 'dark', default dark) lets per-banner copy pick a tone — the
     pet-care demo uses white text on banner-17 (purple) and dark text on banner-18 (yellow).
     Newlines (\n) in titles convert to `<br>` so multi-line headlines like "Fuel Their Energy / Every Day"
     wrap exactly where the demo wraps them. --}}
<div class="bare-section">
    <div class="container-full">
        <div class="tf-grid-layout md-col-2 gap-20">
            @foreach ($items as $i => $item)
                @php
                    $idx = $i + 1;
                    $image = $item['image'] ?? null;
                    $link  = $item['link']  ?? '#';
                    $title = (string) ($shortcode->{"title_$idx"} ?? '');
                    $desc  = (string) ($shortcode->{"description_$idx"} ?? '');
                    $btn   = (string) ($shortcode->{"button_text_$idx"} ?? '');
                    $tone  = strtolower(trim((string) ($shortcode->{"text_color_$idx"} ?? 'dark')));
                    $isWhite = $tone === 'white' || $tone === 'light';
                    $titleClass = 'title h2 fw-medium link' . ($isWhite ? ' text-white' : '');
                    $descClass  = 'desc text-caption-01 fw-semibold' . ($isWhite ? ' text-white' : '');
                    $titleHtml  = nl2br(e($title));
                @endphp
                <div class="banner-image-text type-abs style-6">
                    <a href="{{ $link }}" class="bn-image img-style">
                        <img loading="lazy" width="875" height="680"
                             src="{{ $image ? \Botble\Media\Facades\RvMedia::getImageUrl($image) : \Botble\Media\Facades\RvMedia::getDefaultImage() }}"
                             alt="{{ $title ?: 'Image' }}">
                    </a>
                    <div class="bn-content wow fadeInUp">
                        @if ($desc !== '')
                            <p class="{{ $descClass }}">
                                {!! BaseHelper::clean($desc) !!}
                            </p>
                        @endif
                        @if ($title !== '')
                            <a href="{{ $link }}" class="{{ $titleClass }} mb-24">
                                {!! $titleHtml !!}
                            </a>
                        @endif
                        @if ($btn !== '')
                            <a href="{{ $link }}" class="btn-action tf-btn btn-white">
                                {!! BaseHelper::clean($btn) !!}
                            </a>
                        @endif
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
