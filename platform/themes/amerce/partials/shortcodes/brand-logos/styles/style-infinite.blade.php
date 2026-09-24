@php
    $cloneCount = max(1, (int) ($shortcode->clone_count ?? 3));
    $modifierClass = $shortcode->modifier_class ?? 'style-2';
    $logoSizes = [
        'bohome.png' => [112, 30],
        'living.png' => [170, 60],
        'west-elm.png' => [150, 24],
        'anthro.png' => [196, 12],
        'stanza-2.png' => [99, 60],
        'urban.png' => [219, 24],
        'crate.png' => [106, 60],
        'findr.png'   => [97, 32],
        'intdeco.png' => [117, 32],
        'sopify.png'  => [81, 32],
        'modave.png'  => [141, 32],
        'vanfava.png' => [168, 32],
        // HomeSport brand strip — sizes from html/home-sport.html §6 (lines 2393-2419).
        'shangxi.png'   => [159, 44],
        'cheryl.png'    => [109, 44],
        'vanfaba.png'   => [139, 32],
        'carolin.png'   => [128, 36],
        'panadoxn.png'  => [156, 33],
        'textitles.png' => [126, 40],
    ];
@endphp

<div class="infiniteSlide-brand {{ $modifierClass }} wow fadeInUp">
    <div class="infiniteSlide infiniteSlide-wrapper" data-clone="{{ $cloneCount }}">
        @forelse ($brands as $brand)
            <div class="infiniteSlide-item">
                <div class="img-brand">
                    @php
                        $logoUrl = $brand->logo ? RvMedia::getImageUrl($brand->logo) : null;
                        [$logoWidth, $logoHeight] = $logoSizes[basename((string) $brand->logo)] ?? [null, null];
                    @endphp

                    @if ($logoUrl)
                        <img
                            @if ($logoWidth) width="{{ $logoWidth }}" @endif
                            @if ($logoHeight) height="{{ $logoHeight }}" @endif
                            src="{{ $logoUrl }}"
                            alt="{{ BaseHelper::clean($brand->name) }}"
                            loading="lazy"
                        >
                    @endif
                </div>
            </div>
        @empty
            <div class="infiniteSlide-item text-center text-muted">{{ __('No brands selected.') }}</div>
        @endforelse
    </div>
</div>
