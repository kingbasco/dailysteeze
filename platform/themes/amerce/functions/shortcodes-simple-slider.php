<?php

// ============================================================
// [simple-slider] — theme override for the simple-slider plugin
// Renders the slider via amerce's swiper-based partial so the
// homepage hero matches the theme design (subtitle + display
// title + CTA button on a full-bleed slide).
// ============================================================

use Botble\Base\Forms\FieldOptions\SelectFieldOption;
use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\FieldOptions\UiSelectorFieldOption;
use Botble\Base\Forms\FormAbstract;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\Fields\UiSelectorField;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Shortcode\Forms\ShortcodeForm;
use Botble\SimpleSlider\Models\SimpleSlider;
use Botble\SimpleSlider\Models\SimpleSliderItem;
use Botble\Theme\Facades\Theme;
use Illuminate\Support\Arr;

app()->booted(function (): void {
    if (! is_plugin_active('simple-slider')) {
        return;
    }

    add_filter(SIMPLE_SLIDER_VIEW_TEMPLATE, function (): string {
        return Theme::getThemeNamespace('partials.shortcodes.simple-slider.index');
    }, 120);

    Shortcode::modifyAdminConfig('simple-slider', function (ShortcodeForm $form) {
        $styles = [
            'style-1' => [
                'label' => __('Default'),
                'image' => Theme::asset()->url('images/shortcodes/simple-slider/style-1.png'),
            ],
            'style-2' => [
                'label' => __('Split'),
                'image' => Theme::asset()->url('images/shortcodes/simple-slider/style-2.png'),
            ],
        ];

        $sliderChoices = SimpleSlider::query()
            ->wherePublished()
            ->pluck('name', 'key')
            ->all();

        $form
            ->addBefore(
                'key',
                'style',
                UiSelectorField::class,
                UiSelectorFieldOption::make()
                    ->label(__('Layout'))
                    ->choices($styles)
                    ->selected(Arr::get($form->getModel(), 'style', 'style-1'))
                    ->numberItemsPerRow(2)
            )
            ->add(
                'is_autoplay',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(__('Autoplay?'))
                    ->choices(['yes' => __('Yes'), 'no' => __('No')])
                    ->selected(Arr::get($form->getModel(), 'is_autoplay', 'yes'))
            )
            ->add(
                'autoplay_speed',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(__('Autoplay speed (ms)'))
                    ->choices(array_combine(
                        [3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000],
                        [3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000]
                    ))
                    ->selected((int) Arr::get($form->getModel(), 'autoplay_speed', 5000))
            )
            ->add(
                'show_arrows',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(__('Show navigation arrows'))
                    ->choices(['yes' => __('Yes'), 'no' => __('No')])
                    ->selected(Arr::get($form->getModel(), 'show_arrows', 'yes'))
            )
            ->add(
                'show_dots',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(__('Show pagination dots'))
                    ->choices(['yes' => __('Yes'), 'no' => __('No')])
                    ->selected(Arr::get($form->getModel(), 'show_dots', 'yes'))
            );

        // Re-bind the existing key field with the slider choices
        // populated by the plugin (preserve original behavior).
        if (empty($sliderChoices)) {
            return $form;
        }

        return $form;
    });

    try {
        Shortcode::ignoreCaches(['simple-slider']);
    } catch (Throwable) {
    }

    // ============================================================
    // Per-slide "Button label" field on SimpleSliderItem admin form.
    // The blade templates (simple-slider/style-{1,2,3,split}.blade.php)
    // already read $sliderItem->getMetaData('button_label', true) and
    // fall back to __('Shop Now') when empty. This hook exposes the
    // metadata key as an editable field so customers can override the
    // CTA copy per slide ("Discover", "Explore the Collection", etc.)
    // without touching code.
    //
    // MUST hook BASE_FILTER_AFTER_FORM_CREATED (fires on every form
    // build) - NOT BASE_FILTER_BEFORE_RENDER_FORM (fires only on
    // renderForm(), i.e. GET). The controller's store()/update() call
    // ->save() WITHOUT renderForm(), so a field added on the render
    // hook is absent from $form->fields at save time and
    // FormAbstract::saveMetadataFields() never persists it - the saved
    // value silently disappears. AFTER_FORM_CREATED runs in both paths
    // so the field is present for load (setupMetadataFields() on render)
    // and save (saveMetadataFields()).
    // ============================================================
    add_filter(BASE_FILTER_AFTER_FORM_CREATED, function (FormAbstract $form, $data): FormAbstract {
        if (! $data instanceof SimpleSliderItem) {
            return $form;
        }

        $form->addAfter(
            'link',
            'button_label',
            TextField::class,
            TextFieldOption::make()
                ->label(__('Button label'))
                ->placeholder(__('Leave empty to use the default "Shop Now"'))
                ->maxLength(120)
                ->metadata()
        );

        return $form;
    }, 120, 2);
});
