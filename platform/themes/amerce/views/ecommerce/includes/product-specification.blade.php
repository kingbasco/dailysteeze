@php
    use Botble\Ecommerce\Models\ProductSpecificationAttributeTranslation;
    use Botble\Ecommerce\Models\SpecificationTable;

    $currentLangCode = ProductSpecificationAttributeTranslation::getCurrentLanguageCode();

    // Prefer the table's sorted-by-group view so we can render group headings.
    // Falls back to the flat visible-attributes list when a product has no
    // table assigned (e.g. legacy data).
    $specificationTable = $product->specificationTable ?? null;
    $groupedSpecs = $specificationTable
        ? collect($specificationTable->getSortedAttributesForProduct($product))
            ->map(function ($section) use ($product) {
                $section['attributes'] = $section['attributes']->filter(function ($attribute) use ($product) {
                    $pivot = $product->specificationAttributes->firstWhere('id', $attribute->getKey());
                    return $pivot && ! (bool) $pivot->pivot->getAttribute('hidden');
                });
                return $section;
            })
            ->filter(fn ($section) => $section['attributes']->isNotEmpty())
            ->values()
        : collect();

    $visibleAttributes = $groupedSpecs->isEmpty()
        ? $product->getVisibleSpecificationAttributes()
        : null;
@endphp

<div class="bb-product-specs">
    @if ($groupedSpecs->isNotEmpty())
        @foreach ($groupedSpecs as $section)
            @php
                $group = $section['group'];
                $attributes = $section['attributes'];
            @endphp
            <section class="bb-product-specs__section">
                <h5 class="bb-product-specs__group-title">{{ $group->name }}</h5>

                <dl class="bb-product-specs__list">
                    @foreach ($attributes as $attribute)
                        <div class="bb-product-specs__row">
                            <dt class="bb-product-specs__label">{{ $attribute->name }}</dt>
                            <dd class="bb-product-specs__value">
                                @include(Theme::getThemeNamespace('views.ecommerce.includes.product-specification-value'), [
                                    'product' => $product,
                                    'attribute' => $attribute,
                                    'currentLangCode' => $currentLangCode,
                                ])
                            </dd>
                        </div>
                    @endforeach
                </dl>
            </section>
        @endforeach
    @elseif ($visibleAttributes && count($visibleAttributes))
        {{-- Flat fallback: no spec table assigned. Render a single un-grouped
             definition list so the tab still has structure. --}}
        <section class="bb-product-specs__section">
            <dl class="bb-product-specs__list">
                @foreach ($visibleAttributes as $attribute)
                    <div class="bb-product-specs__row">
                        <dt class="bb-product-specs__label">{{ $attribute->name }}</dt>
                        <dd class="bb-product-specs__value">
                            @include(Theme::getThemeNamespace('views.ecommerce.includes.product-specification-value'), [
                                'product' => $product,
                                'attribute' => $attribute,
                                'currentLangCode' => $currentLangCode,
                            ])
                        </dd>
                    </div>
                @endforeach
            </dl>
        </section>
    @endif
</div>
