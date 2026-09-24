@php
    $tabsId = 'ecommerce-product-groups-tabs-' . uniqid();
@endphp

<div class="ecommerce-product-groups__tabs">
    <ul class="nav nav-pills justify-content-center mb-4 ecommerce-product-groups__tab-nav"
        id="{{ $tabsId }}-nav"
        role="tablist">
        @foreach ($resolved as $index => $group)
            <li class="nav-item" role="presentation">
                <button class="nav-link {{ $index === 0 ? 'active' : '' }}"
                        id="{{ $tabsId }}-trigger-{{ $index }}"
                        data-bs-toggle="tab"
                        data-bs-target="#{{ $tabsId }}-pane-{{ $index }}"
                        type="button"
                        role="tab"
                        aria-controls="{{ $tabsId }}-pane-{{ $index }}"
                        aria-selected="{{ $index === 0 ? 'true' : 'false' }}">
                    {{ $group['tab_label'] ?: __('Group :n', ['n' => $index + 1]) }}
                </button>
            </li>
        @endforeach
    </ul>

    <div class="tab-content" id="{{ $tabsId }}-content">
        @foreach ($resolved as $index => $group)
            <div class="tab-pane fade {{ $index === 0 ? 'show active' : '' }}"
                 id="{{ $tabsId }}-pane-{{ $index }}"
                 role="tabpanel"
                 aria-labelledby="{{ $tabsId }}-trigger-{{ $index }}">
                <div class="row gy-4">
                    @foreach ($group['products'] ?? [] as $product)
                        <div class="col-lg-3 col-md-4 col-6 ecommerce-product-groups__item">
                            @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), ['product' => $product])
                        </div>
                    @endforeach
                </div>
            </div>
        @endforeach
    </div>
</div>
