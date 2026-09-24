<?php

namespace Theme\Amerce\Widgets;

use Botble\Blog\Widgets\Fronts\Tags;

/**
 * Thin wrapper around the canonical blog plugin Tags widget. Provides `$tags`
 * (popular tags, controlled by `number_display` config) to the frontend
 * template. Admin form, data fetching, and plugin-required guard come from
 * the parent.
 *
 * Customise output in templates/frontend.blade.php only.
 */
class BlogTagsWidget extends Tags
{
}
