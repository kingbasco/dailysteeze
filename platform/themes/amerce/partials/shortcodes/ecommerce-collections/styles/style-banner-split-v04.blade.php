@php
    /**
     * Mirrors html/home-electronics.html §2 (lines 1588-1654) and html/home-pet-care.html §2 (lines 1372-1437).
     * Two-col layout with 1 large hero on the LEFT and 2 stacked cards on the RIGHT.
     *
     * Shortcode attributes:
     * - container_class: e.g. "container-full" (pet-care) or empty (electronics)
     * - wrapper_class: e.g. "main-section" (pet-care) or empty (electronics)
     * - image_radius_class: e.g. "radius-20" or "rounded-0"
     * - gap: flex gap between col-left and col-right (default 10)
     */
    $collections = collect($collections);
    $hero = $collections->first();
    $sideCards = $collections->slice(1, 2)->values();

    $containerClass = trim((string) ($shortcode->container_class ?? ''));
    $wrapperClass   = trim((string) ($shortcode->wrapper_class ?? ''));
    $radiusClass    = trim((string) ($shortcode->image_radius_class ?? 'rounded-0'));
    $flexGap        = (int) ($shortcode->gap ?? 10);
@endphp

@if ($hero)
    <div class="{{ $containerClass }}">
        <div class="section-collection banner-cls--custom {{ $wrapperClass }}" style="--banner-split-gap: {{ $flexGap }}px;">
            <div class="col-left">
                <div class="banner-image-text type-abs style-14 h-100">
                    <a href="{{ $hero->url }}" class="bn-image img-style {{ $radiusClass }}">
                        {!! \Botble\Media\Facades\RvMedia::image($hero->image, strip_tags((string) $hero->name), 'hero-banner', false, ['width' => 1290, 'height' => 860, 'class' => 'w-100', 'loading' => 'lazy']) !!}
                    </a>
                    <div class="bn-content wow fadeInUp">
                        {{-- Demo (html lines 1381-1386) uses `text-display` (clamp 36-80px) — bigger
                             than `h1` (34-56px). `link-underline-white` shows white underline on hover. --}}
                        <a href="{{ $hero->url }}" class="title text-display fw-medium text-white link-underline-white text-decoration-thickness_3">
                            {!! nl2br(\Botble\Base\Facades\BaseHelper::clean($shortcode->banner_heading ?: $hero->name)) !!}
                        </a>
                        @php
                            $description = $shortcode->banner_description ?: ($shortcode->banner_subheading ?: $hero->description);
                        @endphp
                        @if (! empty($description))
                            <h6 class="desc text-body-1 text-white letter-space--1">
                                {!! nl2br(\Botble\Base\Facades\BaseHelper::clean($description)) !!}
                            </h6>
                        @endif
                        <a href="{{ $hero->url }}" class="btn-action tf-btn btn-white hv-primary">
                            {{ $shortcode->banner_button_text ?: __('Shop Now') }}
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-right">
                @foreach ($sideCards as $card)
                    <div class="box-image_v04 type-2 hover-img {{ $radiusClass }}">
                        <a href="{{ $card->url }}" class="box-image_img img-style">
                            {!! \Botble\Media\Facades\RvMedia::image($card->image, $card->name, '', false, ['width' => 620, 'height' => 425, 'class' => 'w-100', 'loading' => 'lazy']) !!}
                        </a>
                        {{-- Demo (html lines 1404-1415) renders side cards over light pastel
                             backgrounds (cls-17/cls-18) — title uses default DARK color,
                             desc uses `cl-text-2` (gray), Shop Now button uses `style-primary`. --}}
                        <div class="box-image_content wow fadeInUp">
                            <a href="{{ $card->url }}" class="title h3 fw-medium link-underline-text text-decoration-thickness_3">
                                {!! nl2br(\Botble\Base\Facades\BaseHelper::clean($card->name)) !!}
                            </a>
                            @if (! empty($card->description))
                                <p class="desc cl-text-2 mt-8">
                                    {!! nl2br(\Botble\Base\Facades\BaseHelper::clean($card->description)) !!}
                                </p>
                            @endif
                            <a href="{{ $card->url }}" class="btn-action tf-btn-line-2 style-primary mt-15">
                                <span class="fw-semibold">{{ __('Shop Now') }}</span>
                            </a>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
@endif
