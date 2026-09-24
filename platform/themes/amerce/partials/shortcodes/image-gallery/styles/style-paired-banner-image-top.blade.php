@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Image-top paired banner swiper — mirrors html/home-bag-accessories.html §4
     * "Collection" (lines 2140-2197).
     *
     * Demo markup:
     *   <section class="bare-section">
     *     <div class="container-full">
     *       <div class="swiper tf-swiper" data-preview="2" data-tablet="2" ...>
     *         <div class="swiper-slide">
     *           <div class="banner-image-text style-top-left tl-3">
     *             <a class="bn-image img-style radius-20"><img width="870" height="680">
     *             <div class="bn-content">
     *               <h2 class="title mb-8"><a class="link">{title}</a></h2>
     *               <p class="desc text-body-1 text-cl-2 mb-24">{description}</p>
     *               <a class="btn-action tf-btn animate-btn">{button_text}</a>
     *
     * Per-tab attrs: image_N, link_N, title_N, description_N, button_text_N.
     * Title supports HTML — admins should use `<br class="d-none d-sm-block">` for
     * the demo's line-break behavior (lesson #16 — `\n` collapses to a space).
     */
@endphp
<div class="container-full">
    <div dir="ltr" class="swiper tf-swiper"
         data-preview="2" data-tablet="2" data-mobile-sm="1" data-mobile="1"
         data-space-lg="30" data-space-md="20" data-space="15"
         data-pagination="1" data-pagination-sm="1" data-pagination-md="2" data-pagination-lg="2">
        <div class="swiper-wrapper">
            @foreach ($items as $i => $item)
                @php
                    $idx = $i + 1;
                    $image = $item['image'] ?? null;
                    $link  = $item['link']  ?? '#';
                    $title = (string) ($shortcode->{"title_$idx"} ?? '');
                    $desc  = (string) ($shortcode->{"description_$idx"} ?? '');
                    $btn   = (string) ($shortcode->{"button_text_$idx"} ?? '');
                @endphp
                <div class="swiper-slide">
                    <div class="banner-image-text style-top-left tl-3">
                        <a href="{{ $link }}" class="bn-image img-style radius-20">
                            {!! RvMedia::image($image, $title ?: 'Image', false, false, ['width' => 870, 'height' => 680, 'loading' => 'lazy']) !!}
                        </a>
                        <div class="bn-content wow fadeInUp">
                            @if ($title !== '')
                                <h2 class="title mb-8">
                                    <a href="{{ $link }}" class="link">{!! BaseHelper::clean($title) !!}</a>
                                </h2>
                            @endif
                            @if ($desc !== '')
                                <p class="desc text-body-1 text-cl-2 mb-24">{!! BaseHelper::clean($desc) !!}</p>
                            @endif
                            @if ($btn !== '')
                                <a href="{{ $link }}" class="btn-action tf-btn animate-btn">
                                    {!! BaseHelper::clean($btn) !!}
                                </a>
                            @endif
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
        <div class="sw-dot-default tf-sw-pagination"></div>
    </div>
</div>
