<div class="widget widget-social-links">
    @if (! empty($config['title']))
        <h4 class="widget-title">{{ $config['title'] }}</h4>
    @endif

    @php
        $socialLinks = Theme::getSocialLinks() ?? [];
        $target = $config['target'] ?? '_blank';
    @endphp

    @if (! empty($socialLinks))
        <ul class="widget-social-list list-unstyled d-flex gap-2">
            @foreach ($socialLinks as $link)
                <li>
                    <a href="{{ $link->url }}" target="{{ $target }}" class="widget-social-link" aria-label="{{ $link->name }}">
                        @if (! empty($link->icon))
                            <i class="{{ $link->icon }}"></i>
                        @else
                            <span>{{ $link->name }}</span>
                        @endif
                    </a>
                </li>
            @endforeach
        </ul>
    @endif
</div>
