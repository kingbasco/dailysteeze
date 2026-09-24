<?php

namespace Theme\Amerce\Widgets;

use Botble\Blog\Widgets\Fronts\Posts;

/**
 * Thin wrapper around the canonical blog plugin Posts widget. Parent provides
 * the admin form with a `type` selector (latest / featured / popular / recent)
 * plus `number_display` limit, and `data()` resolving `$posts` via the matching
 * get_*_posts() helper.
 *
 * Customise output in templates/frontend.blade.php only.
 */
class BlogPostsWidget extends Posts
{
}
