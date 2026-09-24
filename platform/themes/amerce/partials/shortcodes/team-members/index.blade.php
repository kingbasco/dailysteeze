@php
    $allowed = ['style-grid', 'style-slider'];
    $style = in_array($shortcode->style ?? '', $allowed, true) ? $shortcode->style : 'style-grid';
    $members = \Botble\Shortcode\Facades\Shortcode::fields()->getTabsData(
        ['photo', 'name', 'role', 'bio', 'social_links'],
        $shortcode
    );
@endphp

<section {!! $shortcode->htmlAttributes() !!} class="tf-section team-members team-members-{{ $style }} flat-spacing">
    <div class="container">
        @if (! empty($shortcode->title ?? ''))
            <div class="sect-heading text-center">
                <h3 class="s-title">{!! BaseHelper::clean($shortcode->title) !!}</h3>
            </div>
        @endif
    </div>
    @include(Theme::getThemeNamespace("partials.shortcodes.team-members.styles.$style"), [
        'shortcode' => $shortcode,
        'members'   => $members,
    ])
</section>
