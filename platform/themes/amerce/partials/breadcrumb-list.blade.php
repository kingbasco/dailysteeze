{{-- Breadcrumb anchor list — caret-separated, used by Theme::breadcrumb().
     Botble's Breadcrumb::render() doesn't pass $crumbs to the view, so fetch
     them ourselves (matches packages/theme/resources/views/partials/breadcrumb.blade.php). --}}
@php
    $crumbs = $crumbs ?? Theme::breadcrumb()->getCrumbs();
@endphp
@if (! empty($crumbs))
    @foreach ($crumbs as $i => $crumb)
        @if ($i !== array_key_first($crumbs))
            <i class="icon icon-CaretRightThin"></i>
        @endif

        @if ($i !== array_key_last($crumbs) && ! empty($crumb['url']))
            <a href="{{ $crumb['url'] }}" class="link cl-text-2">{{ $crumb['label'] }}</a>
        @else
            <p class="cl-text">{{ $crumb['label'] }}</p>
        @endif
    @endforeach
@endif
