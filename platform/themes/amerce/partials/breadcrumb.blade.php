@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\SeoHelper\Facades\SeoHelper;

    $isHomepage = BaseHelper::isHomepage() || request()->is('/');

    if ($isHomepage) {
        return;
    }

    // Single post detail renders its own section-page-title-single (no h3,
    // includes prev/all/next nav). Skip the default title section here so
    // we don't double up.
    if (Theme::get('renderingPost')) {
        return;
    }

    // Product detail renders its own section-page-title-single (breadcrumb
    // only, with prev/grid/next nav). Skip default title to avoid duplicate.
    if (Theme::get('renderingProduct')) {
        return;
    }

    // Store detail renders its own banner with name + breadcrumb baked in;
    // skip the default page-title section to avoid duplicate heading.
    if (Theme::get('renderingStore')) {
        return;
    }

    $title = Theme::get('section-name') ?: SeoHelper::getTitle();
    $intro = Theme::get('breadcrumbIntro');
@endphp

<section class="section-page-title text-center flat-spacing-2 pb-0">
    <div class="container-full">
        <div class="main-page-title">
            <div class="breadcrumbs">
                {!! Theme::breadcrumb()->render(Theme::getThemeNamespace('partials.breadcrumb-list')) !!}
            </div>
            @if ($title)
                <h3 class="title">{{ $title }}</h3>
            @endif
            @if ($intro)
                <p class="text">{!! BaseHelper::clean($intro) !!}</p>
            @endif
        </div>
    </div>
</section>
