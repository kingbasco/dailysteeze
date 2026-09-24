<div class="widget widget-site-info">
    @if (! empty($config['name']))
        <h4 class="widget-title">{{ $config['name'] }}</h4>
    @endif

    @if (! empty($config['description']))
        <p class="widget-description">{{ $config['description'] }}</p>
    @endif

    @if (! empty($config['address']))
        <p class="widget-address">
            <i class="fa-light fa-location-dot"></i>
            <span>{{ $config['address'] }}</span>
        </p>
    @endif

    @if (! empty($config['phone']))
        <p class="widget-phone">
            <i class="fa-light fa-phone"></i>
            <a href="tel:{{ $config['phone'] }}">{{ $config['phone'] }}</a>
        </p>
    @endif

    @if (! empty($config['email']))
        <p class="widget-email">
            <i class="fa-light fa-envelope"></i>
            <a href="mailto:{{ $config['email'] }}">{{ $config['email'] }}</a>
        </p>
    @endif
</div>
