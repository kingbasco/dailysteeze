<div class="section-search pt-60 pb-60">
    <div class="container">
        <div class="search-header mb-40">
            <h1>{{ __('Search Results') }}</h1>
            @if (request()->has('q'))
                <p class="search-query">
                    {{ __('Results for: ') }}<strong>{{ request('q') }}</strong>
                </p>
            @endif
        </div>

        @php
            $query = request('q', '');
            $posts = [];
            $pages = [];
            $products = [];

            if (!empty($query)) {
                if (function_exists('app')) {
                    try {
                        if (is_plugin_active('blog')) {
                            $posts = app('Botble\Blog\Repositories\Interfaces\PostInterface')
                                ->query()
                                ->where('name', 'LIKE', "%{$query}%")
                                ->orWhere('content', 'LIKE', "%{$query}%")
                                ->limit(10)
                                ->get();
                        }
                    } catch (\Exception $e) {}
                }
            }
        @endphp

        @if (!empty($posts) && count($posts) > 0)
            <div class="search-section mb-40">
                <h3 class="search-section__title">{{ __('Blog Posts') }}</h3>
                <div class="row">
                    @foreach ($posts as $post)
                        <div class="col-lg-4 col-md-6 mb-30">
                            @include(Theme::getThemeNamespace('partials.blog.post-card'), ['post' => $post])
                        </div>
                    @endforeach
                </div>
            </div>
        @endif

        @if ((empty($posts) || count($posts) === 0) && empty($query))
            <div class="search-empty">
                <p>{{ __('Please enter a search query.') }}</p>
            </div>
        @elseif ((empty($posts) || count($posts) === 0) && !empty($query))
            <div class="search-empty">
                <p>{{ __('No results found for your search.') }}</p>
            </div>
        @endif
    </div>
</div>
