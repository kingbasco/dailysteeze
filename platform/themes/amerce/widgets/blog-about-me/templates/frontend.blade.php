@if (! is_plugin_active('blog'))
    @php return; @endphp
@endif

<div class="widget widget-blog-about-me">
    @if (! empty($config['title']))
        <h4 class="widget-title">{{ $config['title'] }}</h4>
    @endif

    <div class="widget-about-content">
        @if (! empty($config['image']))
            <div class="widget-author-image mb-3">
                {!! RvMedia::image($config['image'], BaseHelper::clean($config['name'] ?? ''), 'thumb', false, [], null, true) !!}
            </div>
        @endif

        @if (! empty($config['name']))
            <h5 class="widget-author-name">{{ $config['name'] }}</h5>
        @endif

        @if (! empty($config['bio']))
            <p class="widget-author-bio">{{ $config['bio'] }}</p>
        @endif

        @php
            $socialLinks = $config['social_links'] ?? [];
            // Maps the platform string from the admin form to the theme's
            // custom icon font (assets/fonts/icons-*). Unknown platforms fall
            // back to a globe icon so links still render.
            $socialIconMap = [
                'facebook'  => 'icon-FacebookLogo',
                'twitter'   => 'icon-XLogo',
                'x'         => 'icon-XLogo',
                'instagram' => 'icon-InstagramLogo',
                'tiktok'    => 'icon-TiktokLogo',
                'snapchat'  => 'icon-SnapchatLogo',
                'youtube'   => 'icon-YoutubeLogo',
                'linkedin'  => 'icon-LinkedinLogo',
                'pinterest' => 'icon-PinterestLogo',
            ];
        @endphp

        @if (! empty($socialLinks))
            <ul class="widget-author-socials list-unstyled d-flex gap-2">
                @foreach ($socialLinks as $item)
                    @if (! empty($item['platform']) && ! empty($item['url']))
                        @php
                            $iconClass = $socialIconMap[strtolower($item['platform'])] ?? 'icon-Globe';
                        @endphp
                        <li>
                            <a href="{{ $item['url'] }}" target="_blank" rel="noopener noreferrer" class="widget-social-link" aria-label="{{ $item['platform'] }}">
                                <i class="icon {{ $iconClass }}"></i>
                            </a>
                        </li>
                    @endif
                @endforeach
            </ul>
        @endif
    </div>
</div>
