@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Shortcode\Facades\Shortcode;

    $items = Shortcode::fields()->getTabsData(['title', 'body'], $shortcode);
@endphp

<section {!! $shortcode->htmlAttributes() !!} class="section-term-user flat-spacing">
    <div class="container">
        <div class="content">
            @foreach ($items as $item)
                <div class="term-item">
                    @if (! empty($item['title']))
                        <h5 class="term-title">{!! BaseHelper::clean($item['title']) !!}</h5>
                    @endif
                    @if (! empty($item['body']))
                        <div class="text-wrap">{!! BaseHelper::clean($item['body']) !!}</div>
                    @endif
                </div>
            @endforeach
        </div>
    </div>
</section>
