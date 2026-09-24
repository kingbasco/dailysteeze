@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;
    use Botble\Shortcode\Facades\Shortcode;

    $image   = (string) ($shortcode->image ?? '');
    $heading = (string) ($shortcode->heading ?? '');
    $items   = Shortcode::fields()->getTabsData(['title', 'body'], $shortcode);

    $imageSrc = $image
        ? RvMedia::getImageUrl($image, null, false, RvMedia::getDefaultImage())
        : null;

    $accId = 'accordion-' . substr(md5(spl_object_hash($shortcode) . microtime()), 0, 6);
@endphp

<section {!! $shortcode->htmlAttributes() !!} class="flat-spacing">
    <div class="container">
        <div class="banner-why-choose">
            @if ($imageSrc)
                <div class="bn-image">
                    <img loading="lazy" width="640" height="480" src="{{ $imageSrc }}" alt="{{ $heading }}">
                </div>
            @endif
            <div class="bn-content">
                @if ($heading)
                    <h3 class="mb-12">{{ $heading }}</h3>
                @endif
                @if (! empty($items))
                    <div id="{{ $accId }}">
                        @foreach ($items as $i => $faq)
                            @php($targetId = $accId . '-' . ($i + 1))
                            @php($isFirst = $i === 0)
                            <div class="accordion-item_v2">
                                <div class="accordion-action @if (! $isFirst) collapsed @endif lh-24 fw-medium"
                                     data-bs-target="#{{ $targetId }}" data-bs-toggle="collapse"
                                     aria-expanded="{{ $isFirst ? 'true' : 'false' }}"
                                     aria-controls="{{ $targetId }}" role="button">
                                    <span>{{ $faq['title'] ?? '' }}</span>
                                    <span class="icon ic-accordion-custom cl-2"></span>
                                </div>
                                <div id="{{ $targetId }}" class="collapse @if ($isFirst) show @endif" data-bs-parent="#{{ $accId }}">
                                    <p class="faq-content cl-text-2">{!! BaseHelper::clean($faq['body'] ?? '') !!}</p>
                                </div>
                            </div>
                        @endforeach
                    </div>
                @endif
            </div>
        </div>
    </div>
</section>
