/**
 * Category-search-dropdown — converts the AJAX-populated <select.dropdown_product_cate>
 * into a styled custom dropdown (matches html/home-electronics.html demo + Shofy theme pattern).
 *
 * Hooks into the ecommerce plugin's AJAX flow:
 *   1. Plugin's front-ecommerce.js fetches public.ajax.categories-dropdown on page load
 *      and appends <option> elements to <select.dropdown_product_cate[data-bb-toggle="init-categories-dropdown"]>.
 *   2. After AJAX success, plugin dispatches `ecommerce.categories-dropdown.success`.
 *   3. This script listens for that event and replaces the native select with .tf-select-custom + .select-options.
 *
 * Markup produced (matches demo home-electronics.html main.js customSelectCate pattern):
 *   <select class="dropdown_product_cate hide-select"> (hidden, retains form value)
 *   <div class="tf-select-custom">All Categories</div>  (visible toggle)
 *   <ul class="select-options">                          (dropdown menu, hidden by default)
 *     <div class="header-select-option"><span>Select Categories</span><span class="close-option"><i class="icon icon-X2"></i></span></div>
 *     <li data-value="..."><a href="...">Category Name</a></li>
 *   </ul>
 */
(function ($) {
    if (typeof $ === 'undefined') {
        return;
    }

    function buildCustomSelect($select) {
        if ($select.data('cs-init')) {
            return;
        }
        $select.data('cs-init', 1);
        $select.addClass('hide-select');

        var $custom = $('<div class="tf-select-custom" />').text(
            $select.children('option').eq(0).text() || 'All Categories'
        );
        $select.after($custom);

        var $list = $(
            '<ul class="select-options" />'
        );
        $list.append(
            $('<div class="header-select-option" />').append(
                $('<span />').text('Select Categories'),
                $('<span class="close-option" />').append(
                    $('<i class="icon icon-X2" />')
                )
            )
        );
        $custom.after($list);

        $select.children('option').each(function () {
            var $opt = $(this);
            var value = $opt.attr('value') || '';
            var text = $opt.text();
            // First option = label only, no link.
            if (!value) {
                return;
            }
            var url = $opt.data('url') || '#';
            var $li = $('<li />').attr('data-value', value);
            $li.append($('<a />').attr('href', url).text(text));
            $list.append($li);
        });

        // Toggle dropdown.
        $custom.on('click', function (e) {
            e.stopPropagation();
            $('div.tf-select-custom.active').not(this).each(function () {
                $(this).removeClass('active').next('ul.select-options').hide();
            });
            $(this).toggleClass('active');
            $list.slideToggle(150);
        });

        // Click on item — update label + native select value.
        $list.on('click', 'li[data-value]', function (e) {
            e.preventDefault();
            e.stopPropagation();
            var $li = $(this);
            $custom.text($li.find('a').text()).removeClass('active');
            $select.val($li.data('value'));
            $list.hide();
        });

        // Close on outside click.
        $(document).on('click', function () {
            $custom.removeClass('active');
            $list.hide();
        });

        // Close button inside header.
        $list.on('click', '.close-option', function (e) {
            e.stopPropagation();
            $custom.removeClass('active');
            $list.hide();
        });
    }

    // Run on AJAX-success event from ecommerce plugin.
    document.addEventListener('ecommerce.categories-dropdown.success', function () {
        $('select.dropdown_product_cate[data-bb-toggle="init-categories-dropdown"]').each(function () {
            buildCustomSelect($(this));
        });
    });

    // Fallback: run on DOMContentLoaded (in case the select is server-rendered without AJAX).
    $(function () {
        $('select.dropdown_product_cate').each(function () {
            var $sel = $(this);
            // Only build if select already has options OR has no AJAX trigger (server-rendered fallback).
            if ($sel.children('option').length > 1 || !$sel.attr('data-bb-toggle')) {
                buildCustomSelect($sel);
            }
        });
    });
})(window.jQuery);
