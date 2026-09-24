{{-- Botble Menu loop renderer — produces demo-compatible markup.
     Single-column dropdown for short submenus, mega-menu (auto-paginated 7-per-column) for long ones.
     When `has-mega-menu` is set AND any child has grandchildren, switches to grouped
     layout: each child becomes a `<p class="menu-heading">` column with its grandchildren listed below. --}}
@if (isset($menu_nodes) && count($menu_nodes))
    @php
        $isMegaMenu = isset($mega_menu) && $mega_menu;
        $isSubMenuList = isset($sub_menu_list) && $sub_menu_list;
        $defaultClass = $isMegaMenu ? 'box-nav-menu' : 'sub-menu_list';
        $optionsAttr = $options ?? ['class' => $defaultClass];
    @endphp
    <ul {!! BaseHelper::clean($optionsAttr) !!}>
        @foreach ($menu_nodes as $row)
            @php
                $childCount = $row->relationLoaded('child') ? $row->child->count() : 0;
                $hasChildren = $childCount > 0;
                // Opt-in via css_class. Use `has-mega-menu` (not `mega-menu`) to avoid
                // colliding with the global `.mega-menu { width: 100% }` rule that would
                // stretch the parent <li> across the nav and wrap siblings to a new row.
                $useMegaMenu = $hasChildren && str_contains((string) $row->css_class, 'has-mega-menu');
                // Grouped mega-menu: every child has its own children → render heading columns.
                $useGroupedMega = $useMegaMenu && $row->child->every(fn ($child) => $child->relationLoaded('child') && $child->child->count() > 0);
                $css = trim(implode(' ', array_filter([
                    $isSubMenuList ? null : 'menu-item',
                    ($hasChildren && ! $isSubMenuList) ? 'position-relative' : '',
                    $row->css_class,
                ])));
                $linkClass = $isSubMenuList ? 'sub-menu_link has-text' : 'item-link';
                $textClass = 'cus-text';
            @endphp
            <li @if ($css) class="{{ $css }}" @endif>
                <a href="{{ $row->url }}" target="{{ $row->target }}" class="{{ $linkClass }}">
                    <span class="{{ $isSubMenuList ? $textClass : 'text ' . $textClass }}">{{ $row->title }}</span>
                    @if ($hasChildren && ! $isSubMenuList)
                        <i class="icon icon-CaretDown"></i>
                    @endif
                </a>

                @if ($hasChildren && ! $isSubMenuList)
                    @if ($useGroupedMega)
                        {{-- Heading-column mega menu (Shop dropdown).
                             Uses mega-menu_home_v2 wrapper — same pattern as Home menu —
                             so the dropdown is content-sized (display:flex) instead of
                             forced to 100% of the parent <li>. The previous .mega-menu
                             class together with width:100% + position-relative parent
                             rendered the dropdown as a narrow strip, see Image #23. --}}
                        <div class="sub-menu mega-menu_home_v2 mega-menu_grouped">
                            @foreach ($row->child as $group)
                                <div class="mega-menu-item menu-lv-2">
                                    <p class="menu-heading">{{ strtoupper($group->title) }}</p>
                                    <ul class="sub-menu_list">
                                        @foreach ($group->child as $leaf)
                                            <li>
                                                <a href="{{ $leaf->url }}" target="{{ $leaf->target }}" class="sub-menu_link has-text">
                                                    <span class="cus-text">{{ $leaf->title }}</span>
                                                </a>
                                            </li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endforeach
                        </div>
                    @elseif ($useMegaMenu)
                        {{-- Mirrors home-fashion.html mega-menu_home_v2: flex container with
                             one <ul class="sub-menu_list"> per column (auto-sized via min-width). --}}
                        @php $columns = array_chunk($row->child->all(), 7); @endphp
                        <div class="sub-menu mega-menu_home_v2">
                            @foreach ($columns as $columnNodes)
                                <ul class="sub-menu_list">
                                    @foreach ($columnNodes as $child)
                                        <li>
                                            <a href="{{ $child->url }}" target="{{ $child->target }}" class="sub-menu_link has-text">
                                                <span class="cus-text">{{ $child->title }}</span>
                                            </a>
                                        </li>
                                    @endforeach
                                </ul>
                            @endforeach
                        </div>
                    @else
                        <div class="sub-menu">
                            <ul class="sub-menu_list">
                                @foreach ($row->child as $child)
                                    <li>
                                        <a href="{{ $child->url }}" target="{{ $child->target }}" class="sub-menu_link has-text">
                                            <span class="cus-text">{{ $child->title }}</span>
                                        </a>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                @endif
            </li>
        @endforeach
    </ul>
@endif
