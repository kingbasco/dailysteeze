@php
    /**
     * Shared "Browse by Category" dropdown with sub-category fly-out panels.
     * Used by every `has-by-category` header style (style-7/8/10/11/13) + sticky.
     *
     * Callers MUST eager-load `activeChildren` + `activeChildren.activeChildren`
     * on $categories, e.g.:
     *   'with' => ['slugable', 'activeChildren', 'activeChildren.activeChildren']
     *
     * Params (all optional except $categories):
     *   $categories    \Illuminate\Support\Collection  root categories
     *   $wrapClass     outer .nav-category-wrap classes
     *   $btnClass      .btn-nav-drop trigger classes
     *   $btnIconClass  trigger icon classes
     *   $nameClass     trigger label classes
     *   $listClass     .box-nav-category list classes
     *   $showCaretDown render the trailing CaretDown on the trigger (default true)
     */
    $categories = $categories ?? collect();
    $wrapClass = $wrapClass ?? 'nav-category-wrap main-action-active';
    $btnClass = $btnClass ?? 'btn-nav-drop btn-active text-nowrap radius-8';
    $btnIconClass = $btnIconClass ?? 'icon icon-List fs-24';
    $nameClass = $nameClass ?? 'name-category fw-medium';
    $listClass = $listClass ?? 'box-nav-category active-item';
    $showCaretDown = $showCaretDown ?? true;
@endphp

@if ($categories->isNotEmpty())
    <div class="{{ $wrapClass }}">
        <div class="{{ $btnClass }}">
            @if ($btnIconClass)
                <i class="{{ $btnIconClass }}"></i>
            @endif
            <span class="{{ $nameClass }}">{{ __('Browse by Category') }}</span>
            @if ($showCaretDown)
                <i class="icon icon-CaretDown"></i>
            @endif
        </div>
        <ul class="{{ $listClass }}">
            @foreach ($categories as $category)
                @php $hasChildren = $category->activeChildren->isNotEmpty(); @endphp
                <li @class(['has-sub-nav-category' => $hasChildren])>
                    <a href="{{ $category->url }}" class="nav-category_link">
                        {{ $category->name }}
                        @if ($hasChildren)
                            <i class="icon icon-CaretRightThin"></i>
                        @endif
                    </a>
                    @if ($hasChildren)
                        @php
                            // 3-level taxonomy → demo grid layout (one column per child,
                            // child = title, grandchildren = links). 2-level taxonomy →
                            // a single compact link column (children ARE the leaves).
                            $isThreeLevel = $category->activeChildren->contains(
                                fn ($child) => $child->activeChildren->isNotEmpty()
                            );
                        @endphp
                        <div class="sub-nav-category">
                            @if ($isThreeLevel)
                                <div class="tf-grid-layout xl-col-4">
                                    @foreach ($category->activeChildren as $child)
                                        <div class="sub-nav-category_list">
                                            <a href="{{ $child->url }}" class="sub-nav__title fw-semibold d-block">{{ $child->name }}</a>
                                            @foreach ($child->activeChildren as $subChild)
                                                <a href="{{ $subChild->url }}" class="sub-nav__link tf-btn-line">{{ $subChild->name }}</a>
                                            @endforeach
                                        </div>
                                    @endforeach
                                </div>
                            @else
                                <div class="sub-nav-category_list">
                                    @foreach ($category->activeChildren as $child)
                                        <a href="{{ $child->url }}" class="sub-nav__link tf-btn-line">{{ $child->name }}</a>
                                    @endforeach
                                </div>
                            @endif
                        </div>
                    @endif
                </li>
            @endforeach
        </ul>
    </div>
@endif
