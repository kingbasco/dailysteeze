<?php

namespace Theme\Amerce\Widgets;

use Botble\Blog\Widgets\Fronts\Categories;

/**
 * Thin wrapper around the canonical blog plugin Categories widget. Provides
 * `$categories` (with optional `posts_count`) to the frontend template; the
 * admin form, data fetching, and plugin-required guard come from the parent.
 *
 * Customise output in templates/frontend.blade.php only.
 */
class BlogCategoriesWidget extends Categories
{
}
