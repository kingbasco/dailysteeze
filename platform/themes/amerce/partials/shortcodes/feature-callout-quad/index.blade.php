@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Feature callout quad — central exploded product image + 4 feature callouts arranged
     * around it. Mirrors home-sneaker.html §7 (lines 2670-2740) `section-feature-v2 >
     * banner-feature style-2` with `feature-image` (central) + `feature-detail_list
     * sm-col-2` (2x2 grid of pst-s1..s4 callouts).
     *
     * Each callout has icon + name + desc. Position classes (pst-s1..s4) determine the
     * layout: s1+s2 = LEFT side (text-right aligned), s3+s4 = RIGHT side.
     */

    $features = [];
    foreach ([1, 2, 3, 4] as $i) {
        $name = trim((string) ($shortcode->{"feature_{$i}_name"} ?? ''));
        $icon = trim((string) ($shortcode->{"feature_{$i}_icon"} ?? ''));
        $desc = trim((string) ($shortcode->{"feature_{$i}_desc"} ?? ''));
        if ($name === '' && $icon === '') continue;
        $features[] = ['name' => $name, 'icon' => $icon, 'desc' => $desc];
    }
@endphp

{{-- .section-feature-v2 central exploded product image + 4 feature callouts
     layout lives in assets/sass/component/_inline-migrated.scss. --}}
<section {!! $shortcode->htmlAttributes() !!} class="section-feature-v2 flat-spacing">
    <div class="container-full">
        @if (! empty($shortcode->title ?? '') || ! empty($shortcode->subtitle ?? ''))
            <div class="sect-heading text-center wow fadeInUp">
                @if (! empty($shortcode->title ?? ''))
                    <h3 class="s-title mb-8">{!! BaseHelper::clean($shortcode->title) !!}</h3>
                @endif
                @if (! empty($shortcode->subtitle ?? ''))
                    <p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
                @endif
            </div>
        @endif

        <div class="banner-feature style-2">
            <div class="feature-image">
                <div class="image">
                    {!! RvMedia::image($shortcode->image ?? null, $shortcode->title ?? '', 'hero-banner', false, ['width' => 687, 'height' => 863, 'loading' => 'lazy']) !!}
                </div>
            </div>
            <div class="feature-detail_list tf-grid-layout sm-col-2 gap-20">
                @foreach ($features as $i => $f)
                    @php
                        $pstClass = 'pst-s' . ($i + 1);
                        // s1 + s2 are LEFT-side (text-right justified); s3 + s4 are RIGHT-side
                        $isLeft = $i < 2;
                        $alignClass = $isLeft ? 'justify-content-md-end' : '';
                        $infoOrder = $isLeft ? 'order-md-1' : '';
                        $iconOrder = $isLeft ? 'order-md-2' : '';
                        $textAlign = $isLeft ? 'text-md-end' : '';
                    @endphp
                    <div class="feature-detail {{ $pstClass }} {{ $alignClass }}">
                        @if ($f['icon'] !== '')
                            <div class="feature_illus {{ $iconOrder }}">
                                <i class="icon {{ $f['icon'] }} wow fadeZoom"></i>
                            </div>
                        @endif
                        <div class="feature_info {{ $infoOrder }} {{ $textAlign }} wow fadeInRight">
                            @if ($f['name'] !== '')
                                <p class="info__name h6">{!! BaseHelper::clean($f['name']) !!}</p>
                            @endif
                            @if ($f['desc'] !== '')
                                <p class="info__desc cl-text-2">{!! BaseHelper::clean($f['desc']) !!}</p>
                            @endif
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
</section>
