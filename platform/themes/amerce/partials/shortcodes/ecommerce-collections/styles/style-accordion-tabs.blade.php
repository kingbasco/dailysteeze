@php
    /**
     * 2-column accordion+image layout.
     *
     * Base render mirrors home-jewelry.html "Banner Collection" (lines 2395-2495):
     * left column accordion list, right column shows the active collection image.
     *
     * home-fashion-2.html §5 "Collection style" (lines 3954-4066) is the same
     * structure with cosmetic modifiers — opt in via knobs:
     *   container_class    — wrapper container (default `container-full`; fashion-2 `container`)
     *   card_modifier      — extra classes on `.banner-collect-v01` (fashion-2 `style-2 st-2_2`)
     *   accordion_modifier — extra classes on `.list-btn-tab-accordion` (fashion-2 `style-2`)
     *   title_class        — accordion item title span class (default `h4 fw-medium`; fashion-2 `h5 fw-medium`)
     *   button_text/url    — optional CTA button below the accordion (fashion-2 "Shop Collections")
     *   image_size         — RvMedia size for the right-column image (default `hero-banner`;
     *                        fashion-2 demo art is 705x705 square → pass `original`)
     *   expanded_index     — 0-based numeric index of the tab/accordion to open by
     *                        default. Default `0` (first item). Set to a different
     *                        index to expand a different collection on load.
     *                        Allowlist: integers in [0, count(collections) - 1].
     *
     * First item starts open. Falls back to a flat list when only one collection is supplied.
     */
    $collections = collect($collections)->values();
    $domId = 'bnClsV01-' . substr(md5((string) ($shortcode->id ?? uniqid())), 0, 6);

    $containerClass    = trim((string) ($shortcode->container_class ?? '')) ?: 'container-full';
    $cardModifier      = trim((string) ($shortcode->card_modifier ?? ''));
    $accordionModifier = trim((string) ($shortcode->accordion_modifier ?? ''));
    $titleClass        = trim((string) ($shortcode->title_class ?? '')) ?: 'h4 fw-medium';
    $buttonText        = trim((string) ($shortcode->button_text ?? ''));
    $buttonUrl         = trim((string) ($shortcode->button_url ?? '')) ?: '#';
    $imageSize         = trim((string) ($shortcode->image_size ?? '')) ?: 'hero-banner';
    $imageSize         = $imageSize === 'original' ? false : $imageSize;

    // expanded_index: which tab is open on first render. Default 0 (first item).
    // Validate against the collections count to avoid no-tab-open edge cases.
    $expandedRaw = $shortcode->expanded_index ?? null;
    $expandedIndex = is_numeric($expandedRaw) ? (int) $expandedRaw : 0;
    if ($expandedIndex < 0 || $expandedIndex >= $collections->count()) {
        $expandedIndex = 0;
    }
@endphp

<div class="{{ trim($containerClass . ' flat-animate-tab-2') }}">
    <div class="{{ trim('banner-collect-v01 ' . $cardModifier . ' tf-grid-layout lg-col-2') }}">
        <div class="col-left">
            @if (! empty($shortcode->title ?? '') || ! empty($shortcode->subtitle ?? ''))
                <div class="heading wow fadeInUp">
                    @if (! empty($shortcode->title ?? ''))
                        <h3 class="mb-8">{!! BaseHelper::clean($shortcode->title) !!}</h3>
                    @endif
                    @if (! empty($shortcode->subtitle ?? ''))
                        <p class="text-body-1 cl-text-2">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
                    @endif
                </div>
            @endif
            <ul class="{{ trim('list-btn-tab-accordion ' . $accordionModifier . ' wow fadeInUp') }}" role="tablist" id="{{ $domId }}">
                @foreach ($collections as $i => $collection)
                    @php
                        $isActive = $i === $expandedIndex;
                        $tabId = $domId . '-tab-' . ($i + 1);
                        $accId = $domId . '-acc-' . ($i + 1);
                    @endphp
                    <li class="nav-tab-item {{ $isActive ? 'active' : '' }}" role="presentation"
                        data-bs-toggle="tab" data-bs-target="#{{ $tabId }}">
                        <div class="accordion-title {{ $isActive ? '' : 'collapsed' }}"
                             data-bs-target="#{{ $accId }}" role="button"
                             data-bs-toggle="collapse" aria-expanded="{{ $isActive ? 'true' : 'false' }}"
                             aria-controls="{{ $accId }}">
                            <span class="{{ $titleClass }}">{{ $collection->name }}</span>
                            <span class="icon icon-ArrowRight"></span>
                        </div>
                        <div id="{{ $accId }}" class="collapse {{ $isActive ? 'show' : '' }}"
                             data-bs-parent="#{{ $domId }}">
                            @if (! empty($collection->description))
                                <p class="accordion-content cl-text-2">{!! BaseHelper::clean($collection->description) !!}</p>
                            @endif
                        </div>
                    </li>
                    @if (! $loop->last)
                        <li class="br-line"></li>
                    @endif
                @endforeach
            </ul>
            @if ($buttonText !== '')
                <div class="wow fadeInUp">
                    <a href="{{ $buttonUrl }}" class="tf-btn animate-btn">{!! BaseHelper::clean($buttonText) !!}</a>
                </div>
            @endif
        </div>
        <div class="col-right">
            <div class="tab-content">
                @foreach ($collections as $i => $collection)
                    @php
                        $isActive = $i === $expandedIndex;
                        $tabId = $domId . '-tab-' . ($i + 1);
                    @endphp
                    <div class="tab-pane {{ $isActive ? 'active show' : '' }}" id="{{ $tabId }}" role="tabpanel">
                        <div class="collect-image">
                            {!! \Botble\Media\Facades\RvMedia::image($collection->image, $collection->name, $imageSize, false, ['loading' => 'lazy']) !!}
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
</div>
