<?php

namespace Theme\Amerce\Widgets;

use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\Fields\TextField;
use Botble\Widget\AbstractWidget;
use Botble\Widget\Forms\WidgetForm;

class BlogSearchWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('Blog Search'),
            'description' => __('Display blog post search form (requires blog plugin).'),
        ]);
    }

    protected function settingForm(): WidgetForm|string|null
    {
        return WidgetForm::createFromArray($this->getConfig())
            ->add('title', TextField::class, TextFieldOption::make()
                ->label(__('Title')))
            ->add('placeholder', TextField::class, TextFieldOption::make()
                ->label(__('Placeholder Text'))
                ->defaultValue(__('Search posts...')));
    }
}
