@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * 4-tab Banner Product (home-furniture §4 pattern).
     * Mirrors html/home-furniture.html lines 2166-2249 — `flat-animate-tab-2 banner-collect-v02`:
     *
     *   <div class="flat-animate-tab-2"><div class="container-full">
     *     <div class="banner-collect-v02">
     *       <div class="col-left">                  <-- tab nav LEFT
     *         <ul class="tab-btn-wrap-v3 style-2"><li><a data-bs-toggle="tab" href="#tabN">{label h3}</a></li>...</ul>
     *         <div class="bottom">                  <-- shared bottom block (thumbs + desc + CTA)
     *           <ul class="list-thumb-image"><li class="thumb-item"><img/></li>...</ul>
     *           <p class="desc">{description}</p>
     *           <a class="tf-btn animate-btn">{button_text}</a>
     *         </div>
     *       </div>
     *       <div class="col-right">                 <-- tab content panes RIGHT
     *         <div class="tab-content"><div class="tab-pane active show" id="tabN"><img/></div>...</div>
     *       </div>
     *     </div>
     *   </div></div>
     *
     * Bootstrap's data-bs-toggle="tab" handles the JS — no custom script needed.
     * Tab IDs are auto-generated `bcv02-tab-N-{uniqid}` to avoid collisions if the
     * shortcode appears multiple times on a page.
     *
     * Attrs (all optional):
     *   tab_1_label..tab_4_label     — h3 nav labels (default: empty tab skipped)
     *   tab_1_image..tab_4_image     — content pane image (defaults to tab_1_image fallback)
     *   thumb_1..thumb_3             — bottom thumbs strip (transparent PNG works best)
     *   description                  — bottom shared paragraph
     *   button_text, button_url      — bottom shared CTA
     */
    $uid = uniqid('bcv02-tab-');

    $tabs = [];
    for ($i = 1; $i <= 4; $i++) {
        $label = trim((string) ($shortcode->{'tab_' . $i . '_label'} ?? ''));
        $image = trim((string) ($shortcode->{'tab_' . $i . '_image'} ?? ''));
        if ($label === '' && $image === '') {
            continue;
        }
        $tabs[] = [
            'id'    => $uid . '-' . $i,
            'label' => $label !== '' ? $label : __('Tab :n', ['n' => $i]),
            'image' => $image,
        ];
    }

    // Fallback: every tab gets the same image if only tab_1_image is supplied.
    $fallbackImage = $tabs[0]['image'] ?? '';
    foreach ($tabs as &$tab) {
        if ($tab['image'] === '' && $fallbackImage !== '') {
            $tab['image'] = $fallbackImage;
        }
    }
    unset($tab);

    $thumbs = array_filter([
        trim((string) ($shortcode->thumb_1 ?? '')),
        trim((string) ($shortcode->thumb_2 ?? '')),
        trim((string) ($shortcode->thumb_3 ?? '')),
    ]);

    $description = trim((string) ($shortcode->description ?? ''));
    $buttonText  = trim((string) ($shortcode->button_text ?? __('Shop Collection')));
    $buttonUrl   = trim((string) ($shortcode->button_url ?? '#'));
@endphp

@if (! empty($tabs))
    <div class="flat-animate-tab-2">
        <div class="container-full">
            <div class="banner-collect-v02">
                <div class="col-left wow fadeInUp">
                    <ul class="tab-btn-wrap-v3 style-2 lg-overflow-auto" role="tablist">
                        @foreach ($tabs as $i => $tab)
                            <li class="nav-tab-item" role="presentation">
                                <a href="#{{ $tab['id'] }}"
                                   data-bs-toggle="tab"
                                   class="tf-btn-tab @if ($i === 0) active @endif"
                                   role="tab">
                                    <span class="h3">{!! BaseHelper::clean($tab['label']) !!}</span>
                                </a>
                            </li>
                        @endforeach
                    </ul>
                    @if (! empty($thumbs) || $description !== '' || $buttonText !== '')
                        <div class="bottom">
                            @if (! empty($thumbs))
                                <ul class="list-thumb-image">
                                    @foreach ($thumbs as $thumb)
                                        <li class="thumb-item">
                                            {!! RvMedia::image($thumb, 'thumb', 'thumb', false, ['width' => 100, 'height' => 100, 'loading' => 'lazy', 'class' => 'bg-white']) !!}
                                        </li>
                                    @endforeach
                                </ul>
                            @endif
                            @if ($description !== '')
                                <p class="desc text-body-1 cl-text-2">{!! BaseHelper::clean($description) !!}</p>
                            @endif
                            @if ($buttonText !== '')
                                <a href="{{ $buttonUrl }}" class="tf-btn animate-btn">
                                    {!! BaseHelper::clean($buttonText) !!}
                                </a>
                            @endif
                        </div>
                    @endif
                </div>
                <div class="col-right">
                    <div class="tab-content">
                        @foreach ($tabs as $i => $tab)
                            <div class="tab-pane @if ($i === 0) active show @endif" id="{{ $tab['id'] }}" role="tabpanel">
                                <div class="collect-image">
                                    @if ($tab['image'])
                                        {!! RvMedia::image($tab['image'], $tab['label'], 'medium', false, ['width' => 805, 'height' => 604, 'loading' => 'lazy']) !!}
                                    @endif
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
@endif
