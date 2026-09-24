@php
    use Botble\Language\Facades\Language;

    $supportedLocales = collect();
    $currentLocale = app()->getLocale();
    $flagBase = rtrim(asset(BASE_LANGUAGE_FLAG_PATH), '/') . '/';

    if (is_plugin_active('language')) {
        try {
            $supportedLocales = collect(Language::getSupportedLocales());
            $currentLocale = Language::getCurrentLocale();
        } catch (\Throwable $e) {
            $supportedLocales = collect();
        }
    }
@endphp

@php
    // Dark-header variants pass colorMode='dark' so option text shows white-on-black.
    $colorMode = $colorMode ?? 'light';
    $langSelectClasses = 'tf-dropdown-select style-default type-languages' . ($colorMode === 'dark' ? ' color-white' : '');
@endphp

@if ($supportedLocales->count() > 1)
    <div class="tf-languages">
        <select class="{{ $langSelectClasses }}">
            @foreach ($supportedLocales as $localeCode => $properties)
                <option
                    value="{{ $localeCode }}"
                    data-action-url="{{ Language::getSwitcherUrl($localeCode, $properties['lang_code']) }}"
                    @if (! empty($properties['lang_flag'])) data-thumbnail="{{ $flagBase . $properties['lang_flag'] . '.svg' }}" @endif
                    @if ($currentLocale === $localeCode) selected @endif
                >{{ $properties['lang_name'] }}</option>
            @endforeach
        </select>
    </div>
@endif
