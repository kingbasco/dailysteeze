@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;
    use Botble\Shortcode\Facades\Shortcode;

    // Tabs items: each tab is one Q&A.
    // - `category`: groups questions under a category heading. Items with the
    //               same `category` are rendered together; switching to a new
    //               value starts a new group.
    // - `category_id`: used as the in-page anchor + sidebar nav target.
    // - `question`, `answer`: the FAQ pair itself.
    $items = Shortcode::fields()->getTabsData(
        ['category', 'category_id', 'question', 'answer'],
        $shortcode
    );

    // Group consecutive items by category_id (preserves seeder/admin order).
    $groups = [];
    foreach ($items as $item) {
        $cid = (string) ($item['category_id'] ?? '');
        if (! $cid) {
            continue;
        }
        if (! isset($groups[$cid])) {
            $groups[$cid] = [
                'id'    => $cid,
                'title' => (string) ($item['category'] ?? $cid),
                'items' => [],
            ];
        }
        $groups[$cid]['items'][] = [
            'q' => (string) ($item['question'] ?? ''),
            'a' => (string) ($item['answer'] ?? ''),
        ];
    }
    $groups = array_values($groups);

    // Sidebar promo banner.
    $sidebarImage    = (string) ($shortcode->sidebar_image ?? '');
    $sidebarTitle    = (string) ($shortcode->sidebar_title ?? '');
    $sidebarSubtitle = (string) ($shortcode->sidebar_subtitle ?? '');
    $sidebarCta      = (string) ($shortcode->sidebar_cta ?? '');
    $sidebarUrl      = (string) ($shortcode->sidebar_url ?? '');
    $categoriesLabel = (string) ($shortcode->categories_label ?? __('Categories'));

    $sidebarSrc = $sidebarImage
        ? RvMedia::getImageUrl($sidebarImage, null, false, RvMedia::getDefaultImage())
        : null;
@endphp

{{-- .section-faq accordion cursor + arrow rotate rules live in
     assets/sass/component/_inline-migrated.scss. --}}
<section {!! $shortcode->htmlAttributes() !!} class="section-faq flat-spacing">
    <div class="container">
        <div class="row">
            <div class="col-lg-9">
                <ul class="faq-list">
                    @foreach ($groups as $group)
                        <li class="faq-item" id="{{ $group['id'] }}">
                            @if ($group['title'])
                                <h4 class="faq_title">{{ $group['title'] }}</h4>
                            @endif
                            <div class="faq_wrap" id="wrap-{{ $group['id'] }}">
                                @foreach ($group['items'] as $i => $entry)
                                    @php($targetId = $group['id'] . '-' . ($i + 1))
                                    <div class="accordion-faq">
                                        <div class="accordion-title collapsed"
                                             data-bs-target="#{{ $targetId }}" role="button"
                                             data-bs-toggle="collapse" aria-expanded="false"
                                             aria-controls="{{ $targetId }}">
                                            <span class="text h6">{{ $entry['q'] }}</span>
                                            <span class="icon">
                                                <span class="ic-accordion-custom"></span>
                                            </span>
                                        </div>
                                        <div id="{{ $targetId }}" class="collapse" data-bs-parent="#wrap-{{ $group['id'] }}">
                                            <div class="accordion-body">
                                                <p class="cl-text-2">{!! BaseHelper::clean($entry['a']) !!}</p>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </li>
                    @endforeach
                </ul>
            </div>

            <div class="col-lg-3 d-none d-lg-block">
                <div class="faq-sidebar blog-sidebar sidebar-content-wrap sticky-top">
                    @if (! empty($groups))
                        <div class="sidebar-item">
                            <h5 class="sb-title">{{ $categoriesLabel }}</h5>
                            <ul class="sb-category list-unstyled">
                                @foreach ($groups as $group)
                                    <li><a href="#{{ $group['id'] }}" class="link">{{ $group['title'] }}</a></li>
                                @endforeach
                            </ul>
                        </div>
                    @endif

                    @if ($sidebarSrc || $sidebarTitle)
                        <div class="sidebar-item">
                            <div class="banner-image-text type-abs style-4">
                                @if ($sidebarSrc)
                                    <a href="{{ $sidebarUrl ?: '#' }}" class="bn-image img-style">
                                        <img loading="lazy" width="450" height="608" src="{{ $sidebarSrc }}" alt="{{ $sidebarTitle }}">
                                    </a>
                                @endif
                                <div class="bn-content">
                                    @if ($sidebarTitle)
                                        <a href="{{ $sidebarUrl ?: '#' }}" class="title h3 fw-medium text-white link">
                                            {!! BaseHelper::clean($sidebarTitle) !!}
                                        </a>
                                    @endif
                                    @if ($sidebarSubtitle)
                                        <p class="desc cl-text-3 mb-28">{{ $sidebarSubtitle }}</p>
                                    @endif
                                    @if ($sidebarCta)
                                        <a href="{{ $sidebarUrl ?: '#' }}" class="btn-action tf-btn btn-white small">
                                            {{ $sidebarCta }}
                                        </a>
                                    @endif
                                </div>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</section>
