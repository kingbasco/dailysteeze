<?php

namespace Theme\Amerce\Widgets;

use Botble\Widget\Widgets\SiteCopyright;

/**
 * Thin wrapper around the canonical Botble SiteCopyright widget. Parent
 * provides the admin help blurb (with a link to Theme Options) and `data()`
 * resolving `$copyright` via ThemeSupport::getSiteCopyright().
 *
 * Customise output in templates/frontend.blade.php only.
 */
class SiteCopyrightWidget extends SiteCopyright
{
}
