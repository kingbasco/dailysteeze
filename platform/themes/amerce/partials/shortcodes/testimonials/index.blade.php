@php
    $allowed = ['style-v1', 'style-v2', 'style-thumbs', 'style-thumbs-product', 'style-v3-product', 'style-v2-product', 'style-v3-image', 'style-v4', 'style-image-card', 'style-organic-verified', 'style-card-image-left', 'style-v01-banner'];
    $style = in_array($shortcode->style ?? '', $allowed, true) ? $shortcode->style : 'style-v1';
    $items = \Botble\Shortcode\Facades\Shortcode::fields()->getTabsData(
        ['avatar', 'name', 'role', 'content', 'rating', 'product_image', 'product_name', 'product_price', 'product_url'],
        $shortcode
    );

    // Fall back to the testimonial plugin's seeded records when no shortcode tabs are configured.
    if (empty($items) && is_plugin_active('testimonial') && class_exists(\Botble\Testimonial\Models\Testimonial::class)) {
        $limit = (int) ($shortcode->limit ?? 0) ?: 10;
        $items = \Botble\Testimonial\Models\Testimonial::query()
            ->wherePublished()
            ->orderByDesc('id')
            ->limit($limit)
            ->get()
            ->map(fn ($t) => [
                'avatar'  => $t->image,
                'name'    => $t->name,
                'role'    => $t->company,
                'content' => $t->content,
                'rating'  => 5,
            ])
            ->all();

        // For style-thumbs-product (home-electronics §8): the demo shows a small product
        // showcase under each quote. Enrich the fallback items with the first ecommerce
        // products so the partial's tes_product block renders something sensible.
        if (in_array(($shortcode->style ?? ''), ['style-thumbs-product', 'style-organic-verified', 'style-v4', 'style-v3-image', 'style-v3-product', 'style-v2-product', 'style-v01-banner'], true)
            && ! empty($items)
            && is_plugin_active('ecommerce')
            && class_exists(\Botble\Ecommerce\Models\Product::class)
        ) {
            // Per-testimonial product IDs via CSV. Preserves order so $items[$i] pairs with $ids[$i].
            // Falls back to first-N products ordered by id.
            $idsCsv = trim((string) ($shortcode->testimonial_product_ids ?? ''));
            if ($idsCsv !== '') {
                $ids = collect(explode(',', $idsCsv))->map(fn ($v) => (int) trim($v))->filter()->values();
                $featured = \Botble\Ecommerce\Models\Product::query()
                    ->whereIn('id', $ids)
                    ->wherePublished()
                    ->get()
                    ->sortBy(fn ($p) => $ids->search($p->id))
                    ->values();
            } else {
                $featured = \Botble\Ecommerce\Models\Product::query()
                    ->where('is_variation', false)
                    ->wherePublished()
                    ->orderBy('id')
                    ->limit(count($items))
                    ->get();
            }
            foreach ($items as $i => &$item) {
                $product = $featured[$i] ?? null;
                if ($product) {
                    $item['product_image'] = $product->image;
                    $item['product_name']  = $product->name;
                    $item['product_price'] = format_price($product->front_sale_price_with_taxes ?? $product->sale_price ?? $product->price);
                    $item['product_url']   = $product->url ?: '#';
                    // Old (strikethrough) price — only when the product is actually on sale.
                    if ($product->front_sale_price !== null && $product->price > 0
                        && (float) $product->front_sale_price < (float) $product->price) {
                        $item['product_old_price'] = format_price($product->price);
                    }
                }
            }
            unset($item);
        }
    }
@endphp

@php
    // Variants that render their own heading or have no heading at all:
    //   style-thumbs-product (home-electronics §8) — no heading
    //   style-v4 (home-furniture §10) — heading inside partial w/ col-right nav
    //   style-v01-banner (home-headphone §9) — full-bleed banner, no heading
    // style-v3-product with bg_main renders its OWN heading inside the cream wrapper.
    $hideHeading = in_array($style, ['style-thumbs-product', 'style-v4', 'style-v01-banner'], true)
        || ($style === 'style-v3-product' && ($shortcode->bg_main ?? 'no') === 'yes')
        || ($style === 'style-v2-product' && ($shortcode->bg_main ?? 'no') === 'yes');
    // style-v01-banner emits its own `container-full` + `section-testimonials`
    // wrapper — the index must not wrap it in the default `tf-section` <section>.
    $bareStyle = $style === 'style-v01-banner';
    $sectionClass = trim((string) ($shortcode->section_class ?? 'flat-spacing'));
    $headingContainerClass = trim((string) ($shortcode->heading_container_class ?? 'container'));
    // When `view_all_url` is set, render the two-column `type-2 has-col-right`
    // heading with a CTA on the right (home-baby §8 demo, line 5327).
    $viewAllUrl  = trim((string) ($shortcode->view_all_url ?? ''));
    $viewAllText = trim((string) ($shortcode->view_all_text ?? '')) ?: __('View All Products');
    $hasViewAll  = $viewAllUrl !== '';
@endphp
@if ($bareStyle)
    @include(Theme::getThemeNamespace("partials.shortcodes.testimonials.styles.$style"), [
        'shortcode' => $shortcode,
        'items'     => $items,
    ])
@else
<section {!! $shortcode->htmlAttributes() !!} @class(['tf-section', 'section-testimonial-thumbs', 'testimonials', "testimonials-$style", 'tf-sw-thumbs', $sectionClass => $sectionClass !== ''])>
    @if (! $hideHeading)
        <div class="{{ $headingContainerClass }}">
            @if ($hasViewAll && (! empty($shortcode->title ?? '') || ! empty($shortcode->subtitle ?? '')))
                <div class="sect-heading type-2 has-col-right wow fadeInUp">
                    <div>
                        @if (! empty($shortcode->title ?? ''))
                            <h3 class="s-title">{!! BaseHelper::clean($shortcode->title) !!}</h3>
                        @endif
                        @if (! empty($shortcode->subtitle ?? ''))
                            <p class="s-desc cl-text-2 text-body-1">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
                        @endif
                    </div>
                    <div class="col-right">
                        <a href="{{ $viewAllUrl }}" class="tf-btn-line-2 py-4 style-primary">
                            <span class="fw-semibold">{!! BaseHelper::clean($viewAllText) !!}</span>
                        </a>
                    </div>
                </div>
            @elseif (! empty($shortcode->title ?? '') || ! empty($shortcode->subtitle ?? ''))
                <div class="sect-heading type-2 text-center wow fadeInUp">
                    @if (! empty($shortcode->title ?? ''))
                        <h3 class="s-title">{!! BaseHelper::clean($shortcode->title) !!}</h3>
                    @endif
                    @if (! empty($shortcode->subtitle ?? ''))
                        <p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
                    @endif
                </div>
            @endif
        </div>
    @endif
    @include(Theme::getThemeNamespace("partials.shortcodes.testimonials.styles.$style"), [
        'shortcode' => $shortcode,
        'items'     => $items,
    ])
</section>
@endif
