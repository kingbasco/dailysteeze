@if($sizeGuide)
    @php
        $modalTitle = setting('product_size_guide_modal_title', 'Size Chart');
        $sectionTitle = setting('product_size_guide_section_title', 'Size Guide');
        $showImage = setting('product_size_guide_show_image', true);

        // Body diagram silhouette shown next to the measuring tips, matching
        // the HTML demo (assets/images/section/size-chart.jpg). Theme can
        // override the asset path via product_size_guide_diagram_url.
        $diagramUrl = (string) setting(
            'product_size_guide_diagram_url',
            asset('vendor/core/plugins/fob-product-size-guide/images/measuring-diagram.svg')
        );
    @endphp

    {{-- Modal mirrors html/product-open-lightbox.html#findSize so it inherits
         the theme's `.modal-find_size` styles (max-width 900px, padded
         content, themed table + 8/4 grid for tips). --}}
    <div class="modal modalCentered fade modal-find_size" id="sizeGuideModal" tabindex="-1" aria-labelledby="sizeGuideModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-heading d-flex align-items-center justify-content-between">
                    <h4 class="title-pop mb-0" id="sizeGuideModalLabel">{{ $modalTitle }}</h4>
                    <span class="cs-pointer d-flex link" data-bs-dismiss="modal" aria-label="{{ trans('plugins/fob-product-size-guide::size-guide.frontend.close') }}">
                        <i class="icon icon-X2 fs-24"></i>
                    </span>
                </div>

                <div class="modal-main">
                    <div class="tf-rte">
                        @if($showImage && $sizeGuide->image)
                            <div class="bb-size-guide-hero mb-20">
                                <img src="{{ RvMedia::getImageUrl($sizeGuide->image) }}"
                                     alt="{{ $sizeGuide->name }}"
                                     class="img-fluid rounded">
                            </div>
                        @endif

                        @if($sizeGuide->table_headers && $sizeGuide->table_rows)
                            @php
                                $headerModels = \FriendsOfBotble\ProductSizeGuide\Models\SizeGuideHeader::query()
                                    ->whereIn('slug', $sizeGuide->table_headers)
                                    ->pluck('name', 'slug');
                            @endphp
                            <div class="tf-table-res-df mb-20">
                                <p class="h6 fw-medium mb-16 cl-text-main">{{ $sectionTitle }}</p>
                                <div class="overflow-auto">
                                    <table class="tf-sizeguide-table">
                                        <thead>
                                            <tr>
                                                @foreach($sizeGuide->table_headers as $header)
                                                    <th>{{ $headerModels->get($header, $header) }}</th>
                                                @endforeach
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($sizeGuide->table_rows as $row)
                                                <tr>
                                                    @foreach($row as $cell)
                                                        <td>{{ $cell }}</td>
                                                    @endforeach
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        @endif

                        @if($sizeGuide->description)
                            <div class="tf-page-size-chart-content">
                                <div class="bb-size-guide-tips">
                                    <p class="h6 fw-medium mb-16 cl-text-main">{{ __('Measuring Tips') }}</p>
                                    {!! $sizeGuide->description !!}
                                </div>

                                @if ($diagramUrl)
                                    <div class="bb-size-guide-figure">
                                        <img loading="lazy" src="{{ $diagramUrl }}" alt="{{ __('Body measurement diagram') }}">
                                    </div>
                                @endif
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endif
