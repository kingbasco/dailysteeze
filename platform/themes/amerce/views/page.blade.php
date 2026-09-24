@php
    // The blog plugin's `renderBlogPage` hook replaces the blog page's static
    // content with the rendered loop view (forms, inputs, sidebar widgets).
    // BaseHelper::clean() is HTMLPurifier-based and strips form/input/fieldset,
    // so skip it for the blog page where the content is trusted theme output.
    $isBlogPage = function_exists('get_blog_page_id')
        && (int) get_blog_page_id() === (int) $page->getKey();
@endphp

@php
    // Generic layouts only (default / full-width / landing / homepage).
    // For pages with dynamic data that cannot live in CMS content (contact
    // form, store grid pulled from theme_option), dispatch by SLUG to a
    // bespoke view. Pages whose content is purely presentational use the
    // shortcode system (e.g. [about-page], [faq-page], [term-content]) and
    // fall through to the standard content render below.
    $slug = optional($page->slugable)->key;
    $bespokeTemplateView = match ($slug) {
        'contact-us', 'contact' => Theme::getThemeNamespace('views.contact'),
        'our-stores', 'our-store' => Theme::getThemeNamespace('views.our-store'),
        default => null,
    };
@endphp

@if ($bespokeTemplateView && view()->exists($bespokeTemplateView))
    @include($bespokeTemplateView)
@elseif (function_exists('shortcode'))
    @if ($isBlogPage)
        {!! apply_filters(PAGE_FILTER_FRONT_PAGE_CONTENT, $page->content, $page) !!}
    @else
        {!! BaseHelper::clean(apply_filters(PAGE_FILTER_FRONT_PAGE_CONTENT, $page->content, $page)) !!}
    @endif
@else
    {!! BaseHelper::clean($page->content) !!}
@endif

@if ($page->template === 'default' && theme_option('sidebar_enabled'))
    @include(Theme::getThemeNamespace('partials.sidebar'))
@endif
