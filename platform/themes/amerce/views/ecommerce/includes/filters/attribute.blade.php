@php
    use Botble\Base\Facades\BaseHelper;

    $rendered = function_exists('render_product_swatches_filter')
        ? render_product_swatches_filter(isset($view) ? compact('categoryId', 'view') : compact('categoryId'))
        : null;
@endphp

@if (! empty($rendered))
    <div class="widget-facet bb-product-filter-attributes" data-bb-toggle="filter-attribute">
        {!! BaseHelper::clean($rendered) !!}
    </div>
@endif
