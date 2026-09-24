<div class="faq-tabs mt-30">
    @if ($categories->isEmpty())
        <p class="text-center text-muted">{{ __('No FAQs found.') }}</p>
    @else
        <ul class="nav nav-tabs faq-tab-nav" role="tablist">
            @foreach ($categories as $catId => $items)
                @php
                    $first = $items->first();
                    $label = $first->category?->name ?? __('General');
                    $tabId = $uid . '-tab-' . ($catId ?: 'general');
                @endphp
                <li class="nav-item" role="presentation">
                    <button class="nav-link {{ $loop->first ? 'active' : '' }}"
                        id="{{ $tabId }}-btn"
                        data-bs-toggle="tab"
                        data-bs-target="#{{ $tabId }}-pane"
                        type="button" role="tab"
                        aria-controls="{{ $tabId }}-pane"
                        aria-selected="{{ $loop->first ? 'true' : 'false' }}">
                        {!! BaseHelper::clean($label) !!}
                    </button>
                </li>
            @endforeach
        </ul>
        <div class="tab-content mt-15">
            @foreach ($categories as $catId => $items)
                @php $tabId = $uid . '-tab-' . ($catId ?: 'general'); @endphp
                <div class="tab-pane fade {{ $loop->first ? 'show active' : '' }}"
                    id="{{ $tabId }}-pane" role="tabpanel"
                    aria-labelledby="{{ $tabId }}-btn">
                    <div class="accordion" id="{{ $tabId }}-accordion">
                        @foreach ($items as $i => $faq)
                            @php $itemId = $tabId . '-item-' . $i; @endphp
                            <div class="accordion-item mb-15 radius-10 overflow-hidden">
                                <h2 class="accordion-header" id="{{ $itemId }}-heading">
                                    <button class="accordion-button collapsed" type="button"
                                        data-bs-toggle="collapse"
                                        data-bs-target="#{{ $itemId }}-collapse"
                                        aria-expanded="false"
                                        aria-controls="{{ $itemId }}-collapse">
                                        {!! BaseHelper::clean($faq->question) !!}
                                    </button>
                                </h2>
                                <div id="{{ $itemId }}-collapse" class="accordion-collapse collapse"
                                    aria-labelledby="{{ $itemId }}-heading"
                                    data-bs-parent="#{{ $tabId }}-accordion">
                                    <div class="accordion-body">
                                        {!! BaseHelper::clean($faq->answer) !!}
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            @endforeach
        </div>
    @endif
</div>
