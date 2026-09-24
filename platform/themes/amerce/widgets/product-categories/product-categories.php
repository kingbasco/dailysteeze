<?php

namespace Theme\Amerce\Widgets;

use Botble\Base\Forms\FieldOptions\NumberFieldOption;
use Botble\Base\Forms\FieldOptions\OnOffFieldOption;
use Botble\Base\Forms\FieldOptions\SelectFieldOption;
use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\Fields\NumberField;
use Botble\Base\Forms\Fields\OnOffField;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Widget\AbstractWidget;
use Botble\Widget\Forms\WidgetForm;
use Illuminate\Support\Collection;

class ProductCategoriesWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('Product Categories'),
            'description' => __('Display product category tree (requires ecommerce plugin).'),
            'max_depth' => 2,
            'show_count' => false,
        ]);
    }

    protected function data(): array|Collection
    {
        $config    = $this->getConfig();
        $parentId  = $config['parent_id'] ?? null;
        $maxDepth  = (int) ($config['max_depth'] ?? 2);
        $showCount = (bool) ($config['show_count'] ?? false);

        $query = ProductCategory::query()->where('status', 'published');

        if ($parentId) {
            $query->where('parent_id', $parentId);
        } else {
            // Botble seeds top-level rows with parent_id=0 (not NULL); accept both.
            $query->where(fn ($q) => $q->whereNull('parent_id')->orWhere('parent_id', 0));
        }

        if ($maxDepth > 1) {
            $query->with(['children' => fn ($q) => $q->where('status', 'published')]);
        }

        $categories = $query->orderBy('order')->orderBy('name')->get();

        return compact('categories', 'maxDepth', 'showCount');
    }

    protected function settingForm(): WidgetForm|string|null
    {
        $parentCategories = function_exists('get_product_categories') ? get_product_categories() : collect();
        if ($parentCategories instanceof Collection) {
            $parentCategories = $parentCategories->pluck('name', 'id')->toArray();
        }

        return WidgetForm::createFromArray($this->getConfig())
            ->add('title', TextField::class, TextFieldOption::make()
                ->label(__('Title')))
            ->add('parent_id', SelectField::class, SelectFieldOption::make()
                ->label(__('Parent Category'))
                ->choices(['' => __('All Categories')] + $parentCategories))
            ->add('max_depth', NumberField::class, NumberFieldOption::make()
                ->label(__('Maximum Depth'))
                ->defaultValue(2)
                ->min(1)
                ->max(3))
            ->add('show_count', OnOffField::class, OnOffFieldOption::make()
                ->label(__('Show Product Count')));
    }

    protected function requiredPlugins(): array
    {
        return ['ecommerce'];
    }
}
