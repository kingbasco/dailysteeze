@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * 2-up product-spotlight pair under a centered section heading —
     * mirrors html/home-garden.html lines 2624-2700 ("Plant Care, Elevated for Home").
     *
     * Markup:
     *   <section><div class="container">
     *     <div class="sect-heading type-2 text-center"><h3>...</h3><p>...</p></div>
     *     <div class="row gap-x-40">
     *       <div class="col-lg-6"><div class="plan-care-item hover-img4 ips-1">...</div>
     *       <div class="col-lg-6"><div class="plan-care-item hover-img4 ips-2">...</div>
     *
     * Each cell: image (square 400x400) + title link + description + "Buy now - $X.XX" CTA.
     * The `ips-1` / `ips-2` class hooks the floating decorative PNG (garden-item-2.png) the demo overlays.
     *
     * Shortcode attrs (admin-driven):
     *   heading, subheading                  — section title + subtitle
     *   image_1, title_1, desc_1, price_1, link_1
     *   image_2, title_2, desc_2, price_2, link_2
     *   button_text  (default "Buy now")
     */
    $heading    = (string) ($shortcode->heading ?? '');
    $subheading = (string) ($shortcode->subheading ?? '');

    $items = [];
    for ($i = 1; $i <= 2; $i++) {
        $img   = (string) ($shortcode->{"image_$i"} ?? '');
        $title = (string) ($shortcode->{"title_$i"} ?? '');
        if ($img === '' && $title === '') {
            continue;
        }
        $items[] = [
            'image' => $img,
            'title' => $title,
            'desc'  => (string) ($shortcode->{"desc_$i"} ?? ''),
            'price' => (string) ($shortcode->{"price_$i"} ?? ''),
            'link'  => (string) ($shortcode->{"link_$i"} ?? '#'),
            'ips'   => "ips-$i",
        ];
    }
    $btnText = trim((string) ($shortcode->button_text ?? __('Buy now')));
@endphp

<div class="container">
    @if ($heading !== '' || $subheading !== '')
        <div class="sect-heading type-2 text-center wow fadeInUp">
            @if ($heading !== '')
                <h3 class="s-title">{!! BaseHelper::clean($heading) !!}</h3>
            @endif
            @if ($subheading !== '')
                <p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($subheading) !!}</p>
            @endif
        </div>
    @endif

    @if (! empty($items))
        <div class="row gap-x-40">
            @foreach ($items as $item)
                <div class="col-lg-6">
                    <div class="plan-care-item hover-img4 {{ $item['ips'] }}">
                        <a href="{{ $item['link'] ?: '#' }}" class="img-style4">
                            {!! RvMedia::image($item['image'], $item['title'] ?: 'Plant care', 'thumb', false, ['loading' => 'lazy']) !!}
                        </a>
                        <div class="content">
                            <div>
                                @if ($item['title'] !== '')
                                    <h4 class="title mb-12">
                                        <a href="{{ $item['link'] ?: '#' }}" class="link text-line-clamp-2">
                                            {!! BaseHelper::clean($item['title']) !!}
                                        </a>
                                    </h4>
                                @endif
                                @if ($item['desc'] !== '')
                                    <p class="text-body-1 cl-text-2 text-line-clamp-3">
                                        {!! BaseHelper::clean($item['desc']) !!}
                                    </p>
                                @endif
                            </div>
                            <a href="{{ $item['link'] ?: '#' }}" class="tf-btn animate-btn small-2">
                                <span class="text-caption-01">
                                    {!! BaseHelper::clean($btnText) !!}@if ($item['price'] !== '') &mdash; {{ $item['price'] }}@endif
                                </span>
                            </a>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    @endif
</div>
