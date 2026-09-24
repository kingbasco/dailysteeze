<div class="accordion mt-30" id="{{ $uid }}-accordion">
    @forelse ($faqs as $i => $faq)
        @php $itemId = $uid . '-item-' . $i; @endphp
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
                data-bs-parent="#{{ $uid }}-accordion">
                <div class="accordion-body">
                    {!! BaseHelper::clean($faq->answer) !!}
                </div>
            </div>
        </div>
    @empty
        <p class="text-center text-muted">{{ __('No FAQs found.') }}</p>
    @endforelse
</div>
