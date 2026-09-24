@php
    use Botble\Theme\Facades\Theme;

    $title  = trim((string) ($config['title'] ?? ''));
    $images = array_filter(
        (array) ($config['images'] ?? []),
        fn ($item) => ! empty($item['image'])
    );

    // Default card set (theme assets). Used when admin hasn't uploaded
    // custom payment icons yet — keeps the Safe Checkout block visible
    // out-of-the-box, mirrors html/product-detail.html demo.
    $defaultCards = [
        ['url' => Theme::asset()->url('images/payment/visa.svg'),        'alt' => 'Visa'],
        ['url' => Theme::asset()->url('images/payment/master-card.svg'), 'alt' => 'Mastercard'],
        ['url' => Theme::asset()->url('images/payment/amex.svg'),        'alt' => 'American Express'],
        ['url' => Theme::asset()->url('images/payment/paypal.svg'),      'alt' => 'PayPal'],
        ['url' => Theme::asset()->url('images/payment/water.svg'),       'alt' => 'Diners Club'],
        ['url' => Theme::asset()->url('images/payment/discover.svg'),    'alt' => 'Discover'],
    ];

    $useDefaults = empty($images);
@endphp

@if ($title !== '')
    {{-- Product detail "Guaranteed Safe Checkout" layout — matches html/product-detail.html. --}}
    <div class="widget widget-payment-methods tf-product-trust-seal">
        <p class="h6 text-seal mb-0">{{ $title }}</p>
        <ul class="list-card">
            @if ($useDefaults)
                @foreach ($defaultCards as $card)
                    <li class="card-item">
                        <img loading="lazy" width="50" height="32" src="{{ $card['url'] }}" alt="{{ $card['alt'] }}">
                    </li>
                @endforeach
            @else
                @foreach ($images as $item)
                    <li class="card-item">
                        {!! RvMedia::image($item['image'], '', 'thumb', false, ['width' => 50, 'height' => 32], null, true) !!}
                    </li>
                @endforeach
            @endif
        </ul>
    </div>
@elseif (! $useDefaults)
    <div class="widget widget-payment-methods d-flex flex-wrap gap-3 align-items-center">
        @foreach ($images as $item)
            <div class="widget-payment-item">
                {!! RvMedia::image($item['image'], '', 'thumb', false, [], null, true) !!}
            </div>
        @endforeach
    </div>
@endif
