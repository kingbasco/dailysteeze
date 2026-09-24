@php
    /**
     * Single-video slide renderer for the product gallery.
     *
     * Inputs:
     *   $video   array { url, provider: 'video'|'youtube'|'vimeo'|'iframe', thumbnail?: string }
     *   $product \Botble\Ecommerce\Models\Product (used for poster/alt fallback)
     *
     * Mirrors plugins/ecommerce/resources/views/themes/includes/product-gallery-video.blade.php
     * but scoped to ONE video at a time so it slots into a swiper-slide.
     */
    use Illuminate\Support\Facades\File;

    if (empty($video) || empty($video['url'] ?? null)) {
        return;
    }

    $provider = $video['provider'] ?? 'iframe';
    // Theme supports first-party providers only. TikTok/Twitter require external
    // widget scripts hosted on third-party CDNs (rejected by Envato review).
    if (in_array($provider, ['tiktok', 'twitter'], true)) {
        return;
    }

    $url = $video['url'];
    $poster = $video['thumbnail'] ?? null;
@endphp

<div class="bb-product-video">
    @switch($provider)
        @case('video')
            @php
                $ext = File::extension($url) ?: 'mp4';
                if ($ext === 'mov') { $ext = 'mp4'; }
                $videoId = 'video-' . md5($url);
            @endphp
            {{-- 3:4 aspect wrapper matches portrait image slides (576x768). The poster
                 shows behind a circular .bb-button-trigger-play-video overlay; click
                 triggers playback (handled in product-gallery.js) and the
                 .bb-product-video-playing class hides the overlay. --}}
            <div class="bb-product-video__frame">
                <video
                    id="{{ $videoId }}"
                    playsinline
                    muted
                    preload="metadata"
                    loop
                    class="bb-product-video__media"
                    aria-label="{{ $product->name }}"
                    @if ($poster) poster="{{ $poster }}" @endif
                >
                    <source src="{{ $url }}" type="video/{{ $ext }}">
                    @if ($poster)
                        <img src="{{ $poster }}" alt="{{ $product->name }}">
                    @endif
                </video>
                <button type="button"
                        class="bb-button-trigger-play-video bb-product-video__play"
                        data-target="{{ $videoId }}"
                        aria-label="{{ __('Play video') }}">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="26" viewBox="0 0 22 26" fill="#101010" aria-hidden="true">
                        <path d="M0 0L22 13L0 26Z"/>
                    </svg>
                </button>
            </div>
            @break

        @case('youtube')
        @case('vimeo')
            <div class="bb-product-video__frame">
                <iframe
                    data-provider="{{ $provider }}"
                    src="{{ $url }}"
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    referrerpolicy="strict-origin-when-cross-origin"
                    allowfullscreen
                    title="{{ $product->name }}"
                    class="bb-product-video__iframe"
                ></iframe>
            </div>
            @break

        @default
            <div class="bb-product-video__frame">
                <iframe
                    data-provider="{{ $provider }}"
                    src="{{ $url }}"
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen
                    class="bb-product-video__iframe">
                </iframe>
            </div>
    @endswitch
</div>
