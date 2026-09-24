@php
    /**
     * 5-item collection mosaic (`section-banner-collection-v02`).
     * Mirrors html/home-headphone.html lines 2546-2615:
     *   `<div class="section-banner-collection-v02 flat-spacing"><div class="container-full">
     *    <div class="wrap-banner">` with 5 `banner-image-text type-abs style-17 hover-img4`
     *   items. Index 0,1,3,4 = small (428x317, item-1 & item-4 add `mb-20`),
     *   index 2 = `large` (875x653, extra `<p>` description).
     *
     * This style emits its OWN outer section + container-full wrapper, so the
     * parent index must NOT double-wrap it (see $bareStyles in index.blade.php).
     *
     * Knobs:
     *   spacing_class — outer spacing modifier (default `flat-spacing`, explicit '' allowed).
     *
     * @var \Botble\Shortcode\Compilers\Shortcode $shortcode
     * @var \Illuminate\Support\Collection $collections
     */
    use Botble\Media\Facades\RvMedia;

    $collections = collect($collections)->values();
    $spacingClass = $shortcode->spacing_class !== null
        ? trim((string) $shortcode->spacing_class)
        : 'flat-spacing';
@endphp

<div class="section-banner-collection-v02 {{ $spacingClass }}">
    <div class="container-full">
        <div class="wrap-banner">
            @foreach ($collections as $i => $collection)
                @php
                    $isLarge = $i === 2;
                    $itemClass = 'banner-image-text type-abs style-17 hover-img4';
                    if ($isLarge) {
                        $itemClass .= ' large';
                    }
                    if ($i === 0 || $i === 3) {
                        $itemClass .= ' mb-20';
                    }
                    $itemClass .= ' item-' . ($i + 1);
                    $imgWidth  = $isLarge ? 875 : 428;
                    $imgHeight = $isLarge ? 653 : 317;
                @endphp
                <div class="{{ $itemClass }}">
                    <a href="{{ $collection->url }}" class="bn-image img-style img-style4">
                        {{-- Original image — NOT `medium` (800x800 square), which center-crops
                             the landscape mosaic art (428x317 / 875x653) to a square. --}}
                        {!! RvMedia::image($collection->image, $collection->name, null, false, ['width' => $imgWidth, 'height' => $imgHeight, 'loading' => 'lazy']) !!}
                    </a>
                    <div class="bn-content wow fadeInUp">
                        <a href="{{ $collection->url }}" class="title {{ $isLarge ? 'h3' : 'h4' }} fw-medium text-white link {{ $isLarge ? 'mb-8' : '' }}">
                            {{ $collection->name }}
                        </a>
                        @if ($isLarge && ! empty($collection->description))
                            <p class="text-body-1 text-white">{{ $collection->description }}</p>
                        @endif
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
