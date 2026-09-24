@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;
    use Botble\Shortcode\Facades\Shortcode;

    $heading  = (string) ($shortcode->heading ?? '');
    $subtitle = (string) ($shortcode->subtitle ?? '');
    $items    = Shortcode::fields()->getTabsData(['image', 'name', 'role', 'social_links'], $shortcode);

    $resolveImage = static fn (?string $path): string =>
        $path ? RvMedia::getImageUrl($path, null, false, RvMedia::getDefaultImage()) : RvMedia::getDefaultImage();

    // Default social icons used when the member's `social_links` is empty.
    $defaultSocials = [
        ['url' => 'https://www.facebook.com/',  'icon' => 'icon-FacebookLogo',  'label' => 'Facebook'],
        ['url' => 'https://x.com/',             'icon' => 'icon-XLogo',         'label' => 'X / Twitter'],
        ['url' => 'https://www.instagram.com/', 'icon' => 'icon-InstagramLogo', 'label' => 'Instagram'],
        ['url' => 'https://www.tiktok.com/',    'icon' => 'icon-TiktokLogo',    'label' => 'TikTok'],
    ];

    // Member-level `social_links` may be JSON `{"icon-FacebookLogo": "https://..."}`
    // mapping or a comma-separated url list — both fall back to defaults if empty.
    $resolveSocials = static function (?string $raw) use ($defaultSocials): array {
        if (! $raw) {
            return $defaultSocials;
        }
        $decoded = json_decode($raw, true);
        if (is_array($decoded) && $decoded) {
            $out = [];
            foreach ($decoded as $icon => $url) {
                $out[] = ['url' => $url, 'icon' => $icon, 'label' => $icon];
            }
            return $out;
        }
        return $defaultSocials;
    };
@endphp

{{-- .card-member-v01 image-style + member-info rules live in
     assets/sass/component/_inline-migrated.scss. --}}
<section {!! $shortcode->htmlAttributes() !!} class="flat-spacing pt-0">
    <div class="container">
        @if ($heading || $subtitle)
            <div class="sect-heading type-2 text-center">
                @if ($heading)<h3 class="s-title">{{ $heading }}</h3>@endif
                @if ($subtitle)<p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($subtitle) !!}</p>@endif
            </div>
        @endif
        <div dir="ltr" class="swiper tf-swiper"
             data-preview="4" data-tablet="3" data-mobile-sm="2" data-mobile="1"
             data-space-lg="30" data-space-md="20" data-space="10"
             data-pagination="1" data-pagination-sm="2" data-pagination-md="3" data-pagination-lg="4">
            <div class="swiper-wrapper">
                @foreach ($items as $member)
                    @php($socials = $resolveSocials($member['social_links'] ?? null))
                    <div class="swiper-slide">
                        <div class="card-member-v01 hover-img">
                            <div class="member-image">
                                @if (! empty($member['image']))
                                    <div class="image img-style">
                                        <img loading="lazy" width="330" height="440" src="{{ $resolveImage($member['image']) }}" alt="{{ $member['name'] ?? '' }}">
                                    </div>
                                @endif
                                <div class="social-wrap">
                                    <ul class="tf-social-icon-2 style-2 d-grid">
                                        @foreach ($socials as $s)
                                            <li>
                                                <a href="{{ $s['url'] }}" rel="noopener noreferrer" target="_blank" aria-label="{{ $s['label'] }}">
                                                    <i class="icon {{ $s['icon'] }}"></i>
                                                </a>
                                            </li>
                                        @endforeach
                                    </ul>
                                </div>
                            </div>
                            <div class="member-info">
                                @if (! empty($member['name']))
                                    <span class="name h5 fw-medium d-block">{{ $member['name'] }}</span>
                                @endif
                                @if (! empty($member['role']))
                                    <p class="duty cl-text-2">{{ $member['role'] }}</p>
                                @endif
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            <div class="sw-line-default style-2 tf-sw-pagination"></div>
        </div>
    </div>
</section>
