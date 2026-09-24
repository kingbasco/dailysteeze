@php
    /**
     * About block at the top of the store's main column.
     * Mirrors farmart's info-box description toggle: short description visible
     * by default, full content revealed via "show more".
     *
     * Inputs:
     *   $store  \Botble\Marketplace\Models\Store
     */
    use Botble\Base\Facades\BaseHelper;

    $description = trim((string) $store->description);
    $content = trim((string) $store->content);
    $cleanDescription = $description !== '' ? BaseHelper::clean($description) : '';
    $cleanContent = $content !== '' ? BaseHelper::clean($content) : '';
@endphp

@if ($cleanDescription !== '' || $cleanContent !== '')
    @php($hasMore = $cleanContent !== '' && $cleanDescription !== '' && strip_tags($cleanContent) !== strip_tags($cleanDescription))
    <div class="marketplace-store__about" data-bb-toggle="store-about">
        <div class="marketplace-store__about-inner">
            @if ($hasMore)
                <div class="marketplace-store__about-full ck-content d-none" data-store-about-full>
                    {!! $cleanContent !!}
                </div>
            @endif

            <div class="marketplace-store__about-short ck-content" data-store-about-short>
                {!! $cleanDescription !== '' ? $cleanDescription : $cleanContent !!}
            </div>

            @if ($hasMore)
                <a href="#" class="marketplace-store__about-toggle" data-store-about-toggle data-label-more="{{ __('show more') }}" data-label-less="{{ __('show less') }}">
                    {{ __('show more') }}
                </a>
            @endif
        </div>
    </div>

    {{-- Show more / show less toggle handler lives in assets/js/main.js
         → storeAboutToggle(). Labels read from data-label-more / data-label-less
         attributes on the toggle button. --}}
@endif
