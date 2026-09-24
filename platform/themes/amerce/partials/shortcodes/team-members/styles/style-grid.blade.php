<div class="container mt-30">
    <div class="row gy-30">
        @foreach ($members as $member)
            @php
                $socials = [];
                if (! empty($member['social_links'])) {
                    try {
                        $decoded = json_decode($member['social_links'], true);
                        if (is_array($decoded)) {
                            $socials = $decoded;
                        }
                    } catch (\Throwable $e) {
                        $socials = [];
                    }
                }
            @endphp
            <div class="col-lg-3 col-md-4 col-sm-6">
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
                        @if (! empty($member['bio']))
                            <p class="bio text-body-1 cl-text-2 mt-10">{!! BaseHelper::clean($member['bio']) !!}</p>
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
