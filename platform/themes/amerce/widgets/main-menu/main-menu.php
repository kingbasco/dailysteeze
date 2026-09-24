<?php

namespace Theme\Amerce\Widgets;

use Botble\Menu\Widgets\Fronts\CustomMenu;

/**
 * Thin wrapper around Botble's CustomMenu widget. Parent provides the admin
 * form (name + menu_id selector keyed by menu slug) and config defaults.
 *
 * Customise output in templates/frontend.blade.php only.
 */
class MainMenuWidget extends CustomMenu
{
}
