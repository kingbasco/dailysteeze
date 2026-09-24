@php
    $relatedPosts = collect();
    if (function_exists('get_related_posts')) {
        $relatedPosts = get_related_posts($post->getKey(), 6);
    } elseif (app()->bound('Botble\Blog\Repositories\Interfaces\PostInterface')) {
        $relatedPosts = app('Botble\Blog\Repositories\Interfaces\PostInterface')->getRelated($post, 6);
    }
@endphp

@if ($relatedPosts->isNotEmpty())
    <section class="section-related flat-spacing">
        <div class="container">
            <div class="sect-heading text-center">
                <h3 class="s-title">{{ __('Related Posts') }}</h3>
                <p class="s-desc text-body-1 cl-text-2">
                    {{ __('Discover more stories and style tips to keep your inspiration flowing.') }}
                </p>
            </div>
            <div dir="ltr" class="swiper tf-swiper"
                 data-preview="3" data-tablet="2" data-mobile-sm="1" data-mobile="1"
                 data-space-lg="30" data-space-md="15" data-space="15"
                 data-pagination="1" data-pagination-sm="1" data-pagination-md="2" data-pagination-lg="3">
                <div class="swiper-wrapper">
                    @foreach ($relatedPosts as $related)
                        <div class="swiper-slide">
                            @include(Theme::getThemeNamespace('partials.blog.post-card'), ['post' => $related])
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </section>
@endif
