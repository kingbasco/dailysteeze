@if (! is_plugin_active('newsletter'))
    @php return; @endphp
@endif

<div class="widget widget-newsletter">
    @if (! empty($config['heading']))
        <h4 class="widget-title">{{ $config['heading'] }}</h4>
    @endif

    @if (! empty($config['subheading']))
        <p class="widget-newsletter__subheading">{{ $config['subheading'] }}</p>
    @endif

    <form action="{{ route('public.newsletter.subscribe') }}" method="POST" class="widget-newsletter__form">
        @csrf
        <div class="input-group">
            <input type="email" name="email" class="form-control" placeholder="{{ __('Your email') }}" required>
            <button type="submit" class="btn btn-primary">
                {{ $config['button_text'] ?? __('Subscribe') }}
            </button>
        </div>
    </form>
</div>
