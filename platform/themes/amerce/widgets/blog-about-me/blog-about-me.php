<?php

namespace Theme\Amerce\Widgets;

use Botble\Base\Forms\FieldOptions\MediaImageFieldOption;
use Botble\Base\Forms\FieldOptions\TextareaFieldOption;
use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\Fields\MediaImageField;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Shortcode\Forms\FieldOptions\ShortcodeTabsFieldOption;
use Botble\Shortcode\Forms\Fields\ShortcodeTabsField;
use Botble\Widget\AbstractWidget;
use Botble\Widget\Forms\WidgetForm;

class BlogAboutMeWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('Blog About Me'),
            'description' => __('Display author bio and social links in blog sidebar.'),
        ]);
    }

    protected function settingForm(): WidgetForm|string|null
    {
        return WidgetForm::createFromArray($this->getConfig())
            ->add('title', TextField::class, TextFieldOption::make()
                ->label(__('Title')))
            ->add('image', MediaImageField::class, MediaImageFieldOption::make()
                ->label(__('Author Image')))
            ->add('name', TextField::class, TextFieldOption::make()
                ->label(__('Author Name')))
            ->add('bio', TextareaField::class, TextareaFieldOption::make()
                ->label(__('Author Bio')))
            ->add('social_links', ShortcodeTabsField::class, ShortcodeTabsFieldOption::make()
                ->label(__('Social Links'))
                ->fields([
                    'platform' => ['title' => __('Platform (e.g. facebook, twitter)')],
                    'url' => ['title' => __('URL'), 'type' => 'url'],
                ]));
    }
}
