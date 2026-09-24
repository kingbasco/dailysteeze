@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Asymmetric hero grid — mirrors home-sport.html §1 (lines 1330-1420):
     * `grid-cls-layout grid-cls-v3` containing 1 LARGE hero (`item1 banner-v04 style-2 rounded-0`,
     * full-width with title+desc+solid-white CTA) + 2 SMALL stacked cards
     * (`item2/item3 box-cls-v1 style-3 hover-img`, half-width each with absolute-positioned
     * content + line-button CTA).
     *
     * Layout: 2-col grid where item1 spans col 1 (full height) + item2/item3 stack in col 2.
     */

    $heroImage     = $shortcode->hero_image ?? null;
    $heroTitle     = trim((string) ($shortcode->hero_title ?? ''));
    $heroDesc      = trim((string) ($shortcode->hero_desc ?? ''));
    $heroBtnText   = trim((string) ($shortcode->hero_button_text ?? ''));
    $heroBtnUrl    = $shortcode->hero_button_url ?: '#';

    $cards = [];
    foreach ([1, 2] as $i) {
        $img = $shortcode->{"card_{$i}_image"} ?? null;
        if (! $img) continue;
        $cards[] = [
            'image'       => $img,
            'title'       => trim((string) ($shortcode->{"card_{$i}_title"} ?? '')),
            'desc'        => trim((string) ($shortcode->{"card_{$i}_desc"} ?? '')),
            'button_text' => trim((string) ($shortcode->{"card_{$i}_button_text"} ?? '')),
            'button_url'  => $shortcode->{"card_{$i}_button_url"} ?: '#',
        ];
    }
@endphp

{{-- .grid-cls-layout.grid-cls-v3 grid template + banner-v04.style-2 overlay
     positioning live in assets/sass/component/_inline-migrated.scss. --}}

{{-- No `flat-spacing` — demo §1 is a bare grid flush under the header; the
     following section (site-features) supplies the gap with its own top padding.
     No `.container-full` wrapper either — the demo grid is fully edge-to-edge
     (`.container-full` carries 15px side padding the demo doesn't have). --}}
<section {!! $shortcode->htmlAttributes() !!} class="tf-section section-hero-grid-asymmetric">
        <div class="grid-cls-layout grid-cls-v3">
            {{-- ITEM 1 — large hero --}}
            <div class="item1 banner-v04 style-2 rounded-0">
                <div class="bn_image h-100">
                    {{-- Original size (not 'hero-banner' 1920x1080) — RvMedia crops would
                         double-crop with the CSS object-fit:cover, zooming the subject in. --}}
                    {!! RvMedia::image($heroImage, $heroTitle ?: '', null, false, ['width' => 1260, 'height' => 770, 'class' => 'aspect-ratio-0', 'loading' => 'lazy']) !!}
                </div>
                <div class="bn_content">
                    <div class="wrap wow fadeInUp">
                        @if ($heroTitle !== '')
                            <h1 class="title mb-8">
                                <a href="{{ $heroBtnUrl }}" class="text-white link-underline-white text-decoration-thickness_3">
                                    {!! BaseHelper::clean($heroTitle) !!}
                                </a>
                            </h1>
                        @endif
                        @if ($heroDesc !== '')
                            <p class="desc text-body-1 text-white mb-36">{!! BaseHelper::clean($heroDesc) !!}</p>
                        @endif
                        @if ($heroBtnText !== '')
                            <a href="{{ $heroBtnUrl }}" class="tf-btn btn-white">{!! BaseHelper::clean($heroBtnText) !!}</a>
                        @endif
                    </div>
                </div>
            </div>

            {{-- ITEMS 2 & 3 — small stacked cards --}}
            @foreach ($cards as $i => $card)
                <div class="item{{ $i + 2 }} box-cls-v1 style-3 hover-img">
                    <a href="{{ $card['button_url'] }}" class="cls-image img-style rounded-0">
                        {{-- Original size (not 'medium' 800x800 square) — square crop would
                             center-crop the landscape card source. --}}
                        {!! RvMedia::image($card['image'], $card['title'], null, false, ['width' => 690, 'height' => 446, 'loading' => 'lazy']) !!}
                    </a>
                    <div class="cls-content wow fadeInUp">
                        @if ($card['title'] !== '')
                            <a href="{{ $card['button_url'] }}" class="cls_title h3 text-white mb-4 link-underline-white text-decoration-thickness_3">
                                {!! BaseHelper::clean($card['title']) !!}
                            </a>
                        @endif
                        @if ($card['desc'] !== '')
                            <p class="cls_desc text-white mb-20">{!! BaseHelper::clean($card['desc']) !!}</p>
                        @endif
                        @if ($card['button_text'] !== '')
                            <a href="{{ $card['button_url'] }}" class="tf-btn-line-2 style-white py-4">
                                <span class="fw-semibold text-caption-01">{!! BaseHelper::clean($card['button_text']) !!}</span>
                            </a>
                        @endif
                    </div>
                </div>
            @endforeach
        </div>
</section>
