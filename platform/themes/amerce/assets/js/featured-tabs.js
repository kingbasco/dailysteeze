/**
 * Generic AJAX-loaded tab handler used by:
 *  - shortcodes/ecommerce-products/styles/style-auto-featured-tabs.blade.php
 *  - shortcodes/ecommerce-products/styles/style-tabs.blade.php
 *
 * Section wires the AJAX endpoint + request params via `data-*` attributes;
 * every section data attr is forwarded into the request payload, so adding
 * a new knob is a Blade-only change going forward.
 *
 * Required section attrs: data-featured-tabs, data-ajax-url
 * Required tab anchor: data-featured-tab[, data-source][, data-category]
 * Required tab pane child: data-featured-tabs-content (where response.html renders)
 *
 * jQuery `data()` lowercases + camelCases keys; this script converts them
 * back to snake_case for the request payload (`itemsPerRow` → `items_per_row`).
 */
(function ($) {
    "use strict";

    function i18n(key, fallback) {
        return (window.amerceI18n && window.amerceI18n[key]) || fallback;
    }

    function camelToSnake(s) {
        return s.replace(/[A-Z]/g, function (c) { return "_" + c.toLowerCase(); });
    }

    function activateTab($section, $tab) {
        var target = $tab.attr("href");
        var $pane = target ? $section.find(target) : $();

        if (!$pane.length) {
            return;
        }

        $section.find("[data-featured-tab]").removeClass("active");
        $tab.addClass("active");
        $section.find(".tab-pane").removeClass("active show");
        $pane.addClass("active show");
    }

    function initInjectedContent($content) {
        if (typeof window.amerceInitSwipers === "function") {
            window.amerceInitSwipers($content[0]);
        }

        $content.find(".marquee-wrapper").css("animation", "");
    }

    function buildRequestData($section, $tab) {
        // Tab-level overrides take priority; section-level attrs are the base.
        var sectionData = $section.data() || {};
        var tabData = $tab.data() || {};
        var payload = {};

        // Reserved keys live on the section but aren't request params.
        var reserved = ["ajaxUrl", "featuredTabs"];

        Object.keys(sectionData).forEach(function (key) {
            if (reserved.indexOf(key) !== -1) return;
            payload[camelToSnake(key)] = sectionData[key];
        });

        // Tab-level: source/category typically; only forward known fields.
        ["source", "category"].forEach(function (key) {
            if (tabData[key] !== undefined && tabData[key] !== "") {
                payload[key] = tabData[key];
            }
        });

        // Sensible defaults if the section/tab didn't provide them.
        if (payload.source === undefined) payload.source = "latest";

        return payload;
    }

    $(document).on("click", "[data-featured-tab]", function (event) {
        event.preventDefault();

        var $tab = $(this);
        var $section = $tab.closest("[data-featured-tabs]");

        activateTab($section, $tab);

        if ($tab.attr("data-loaded") === "true" || $tab.data("loading")) {
            return;
        }

        var ajaxUrl = $section.data("ajax-url");
        var target = $tab.attr("href");
        var $pane = target ? $section.find(target) : $();
        var $content = $pane.find("[data-featured-tabs-content]");

        if (!ajaxUrl || !$content.length) {
            return;
        }

        $tab.data("loading", true);
        $content.html('<div class="featured-tabs-loading py-5 text-center cl-text-2">' + i18n("loading", "Loading...") + '</div>');

        $.ajax({
            url: ajaxUrl,
            method: "GET",
            dataType: "json",
            headers: {
                Accept: "application/json",
                "X-Requested-With": "XMLHttpRequest",
            },
            data: buildRequestData($section, $tab),
        })
            .done(function (response) {
                var safeHtml = (response && response.html)
                    ? (typeof window.bbSanitizeHtml === "function"
                        ? window.bbSanitizeHtml(response.html)
                        : response.html)
                    : "";
                $content.html(safeHtml);
                $tab.attr("data-loaded", "true");
                initInjectedContent($content);
            })
            .fail(function () {
                $content.html('<p class="text-center text-muted py-4">' + i18n("unable_to_load", "Unable to load products.") + '</p>');
            })
            .always(function () {
                $tab.data("loading", false);
            });
    });
})(jQuery);
