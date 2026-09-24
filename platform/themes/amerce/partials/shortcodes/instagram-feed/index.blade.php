@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    $allowedStyles = ['style-grid', 'style-carousel'];
    $style = in_array($shortcode->style ?? '', $allowedStyles, true) ? $shortcode->style : 'style-grid';

    $columns = max(2, min(8, (int) ($shortcode->columns ?? 6)));
    $gap     = max(0, min(32, (int) ($shortcode->gap ?? 8)));
    $limit   = max(0, (int) ($shortcode->limit ?? 12));
    $showOverlay = ($shortcode->show_overlay ?? 'yes') !== 'no';

    $gallery = null;
    $items = [];

    // NOTE: Botble's Shortcode magic accessor's __isset() returns false even when __get()
    // yields a value, so empty()/!empty() can't be trusted here — read into a local first.
    $galleryId = (int) ($shortcode->gallery_id ?? 0);

    if ($galleryId > 0 && is_plugin_active('gallery')) {
        $gallery = \Botble\Gallery\Models\Gallery::query()
            ->wherePublished()
            ->find($galleryId);

        if ($gallery && function_exists('gallery_meta_data')) {
            $items = gallery_meta_data($gallery);
            if ($limit > 0) {
                $items = array_slice($items, 0, $limit);
            }
        }
    }

    $heading    = trim((string) ($shortcode->heading ?? '')) ?: ($gallery?->name ?? '');
    $subheading = trim((string) ($shortcode->subheading ?? '')) ?: ($gallery?->description ?? '');
    $galleryUrl = $gallery?->url ?? '#';
@endphp

<section
    {!! $shortcode->htmlAttributes() !!}
    class="tf-section tf-instagram-feed-section tf-instagram-{{ $style }}"
>
    <div class="container">
        @if ($heading !== '' || $subheading !== '')
            <div class="tf-instagram-heading text-center">
                @if ($heading !== '')
                    <h2 class="heading fw-medium">{!! BaseHelper::clean($heading) !!}</h2>
                @endif
                @if ($subheading !== '')
                    <p class="subheading text-body-1 mt-10">{!! BaseHelper::clean($subheading) !!}</p>
                @endif
                @if ($gallery)
                    <a
                        href="{{ $galleryUrl }}"
                        class="tf-instagram-handle mt-10 d-inline-flex align-items-center gap-2"
                    >
                        <span class="icon icon-InstagramLogo"></span>
                        <span>{{ __('View gallery') }}</span>
                    </a>
                @endif
            </div>
        @endif

        @if (empty($items))
            @if (function_exists('is_in_admin') && is_in_admin())
                <div class="alert alert-warning text-center">
                    {{ __('Select a gallery (with images attached via its metabox) to display the feed.') }}
                </div>
            @endif
        @elseif ($style === 'style-carousel')
            <div
                dir="ltr"
                class="swiper tf-swiper tf-instagram-carousel"
                data-preview="{{ $columns }}"
                data-tablet="3"
                data-mobile-sm="3"
                data-mobile="2"
                data-space="{{ $gap }}"
                data-loop="true"
                data-pagination="2"
                data-pagination-sm="3"
                data-pagination-md="4"
                data-pagination-lg="{{ $columns }}"
            >
                <div class="swiper-wrapper">
                    @foreach ($items as $item)
                        @php
                            $img = $item['img'] ?? null;
                            $alt = $item['description'] ?? ($gallery?->name ?? __('Gallery image'));
                        @endphp
                        @if ($img)
                            <div class="swiper-slide">
                                <a
                                    href="{{ $galleryUrl }}"
                                    class="tf-instagram-item hover-img {{ $showOverlay ? 'hover-overlay' : '' }}"
                                    aria-label="{{ $alt }}"
                                >
                                    <div class="image img-style">
                                        {!! RvMedia::image($img, $alt, 'medium', false, ['loading' => 'lazy']) !!}
                                    </div>
                                    @if ($showOverlay)
                                        <span class="tf-instagram-overlay-icon" aria-hidden="true">
                                            <span class="icon icon-InstagramLogo"></span>
                                        </span>
                                    @endif
                                </a>
                            </div>
                        @endif
                    @endforeach
                </div>
                <div class="sw-dot-default tf-sw-pagination"></div>
            </div>
        @else
            <div
                class="tf-instagram-grid"
                style="--tf-ig-columns: {{ $columns }}; --tf-ig-gap: {{ $gap }}px;"
            >
                @foreach ($items as $item)
                    @php
                        $img = $item['img'] ?? null;
                        $alt = $item['description'] ?? ($gallery?->name ?? __('Gallery image'));
                    @endphp
                    @if ($img)
                        <a
                            href="{{ $galleryUrl }}"
                            class="tf-instagram-item hover-img {{ $showOverlay ? 'hover-overlay' : '' }}"
                            aria-label="{{ $alt }}"
                        >
                            <div class="image img-style">
                                {!! RvMedia::image($img, $alt, 'medium', false, ['loading' => 'lazy']) !!}
                            </div>
                            @if ($showOverlay)
                                <span class="tf-instagram-overlay-icon" aria-hidden="true">
                                    <span class="icon icon-InstagramLogo"></span>
                                </span>
                            @endif
                        </a>
                    @endif
                @endforeach
            </div>
        @endif
    </div>
</section>
