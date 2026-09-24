<div class="container mt-30">
    <div dir="ltr" class="swiper tf-swiper team-members-slider"
        data-preview="4" data-tablet="3" data-mobile-sm="2" data-mobile="1" data-space="20"
        data-loop="true">
        <div class="swiper-wrapper">
            @foreach ($members as $member)
                @php
                    $socials = [];
                    if (! empty($member['social_links'])) {
                        $decoded = json_decode($member['social_links'], true);
                        if (is_array($decoded)) {
                            $socials = $decoded;
                        }
                    }
                @endphp
                <div class="swiper-slide">
                    <div class="team-card text-center">
                        @if (! empty($member['photo']))
                            <div class="photo radius-10 overflow-hidden">
                                {!! RvMedia::image($member['photo'], $member['name'] ?? '', 'medium', false, ['class' => 'w-100', 'loading' => 'lazy']) !!}
                            </div>
                        @endif
                        <div class="content mt-15">
                            @if (! empty($member['name']))
                                <h5 class="name fw-medium mb-5">{!! BaseHelper::clean($member['name']) !!}</h5>
                            @endif
                            @if (! empty($member['role']))
                                <p class="role text-caption-01 cl-text-3">{!! BaseHelper::clean($member['role']) !!}</p>
                            @endif
                            @if (! empty($socials))
                                <ul class="social-list d-flex justify-content-center gap-10 mt-15 list-unstyled">
                                    @foreach ($socials as $platform => $url)
                                        <li>
                                            <a href="{{ $url }}" class="social-link" rel="noopener noreferrer" target="_blank" aria-label="{{ $platform }}">
                                                <i class="icon icon-{{ $platform }}"></i>
                                            </a>
                                        </li>
                                    @endforeach
                                </ul>
                            @endif
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
