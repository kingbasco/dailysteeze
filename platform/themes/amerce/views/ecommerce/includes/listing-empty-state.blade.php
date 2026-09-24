@php
    use Botble\Base\Facades\BaseHelper;

    $title = $title ?? __('No products found');
    $description = $description ?? __('We couldn\'t find any products matching your filters. Try adjusting your search or browse all products.');
    $route = $route ?? route('public.products');
    $label = $label ?? __('Browse all products');
@endphp

<div class="tf-empty-state text-center py-5">
    <div class="empty-state__icon mb-3">
        <i class="icon icon-MagnifyingGlass"></i>
    </div>
    <h3 class="empty-state__title mb-3">{!! BaseHelper::clean($title) !!}</h3>
    <p class="empty-state__description cl-text-2 mb-4">{!! BaseHelper::clean($description) !!}</p>
    <a href="{{ $route }}" class="tf-btn animate-btn">
        <span class="text">{!! BaseHelper::clean($label) !!}</span>
    </a>
</div>
