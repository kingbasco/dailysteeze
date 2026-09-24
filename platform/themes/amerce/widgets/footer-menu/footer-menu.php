<?php

namespace Theme\Amerce\Widgets;

use Botble\Menu\Widgets\Fronts\CustomMenu;

/**
 * Thin wrapper around Botble's CustomMenu widget. Parent provides the admin
 * form (name + menu_id selector keyed by menu slug). The frontend template
 * renders `$config['name']` as the column heading when present.
 *
 * Customise output in templates/frontend.blade.php only.
 */
class FooterMenuWidget extends CustomMenu
{
}
