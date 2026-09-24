/** 45
 * Select Image
 * Button Quantity
 * Delete File
 * Go Top
 * Variant Picker
 * Sidebar Mobile
 * Stagger Wrap
 * Modal Second
 * Header Sticky
 * Auto Popup
 * Total Price Variant
 * Handle Progress
 * Handle Footer
 * Infinite Slide
 * Add Wishlist
 * Handle Sidebar Filter
 * Estimate Shipping
 * Coupon Copy
 * Parallaxie
 * Update Compare Empty
 * Delete Wishlist
 * Click Active
 * Handle Mobile Menu
 * Color Swatch Product
 * Custom Dropdown
 * Bottom Sticky
 * Show Password
 * Change Image Dashboard
 * Select Category
 * Hover Pin
 * Rate Click
 * Check Box Transfer Checkout Page
 * Counter Odo
 * Couter
 * Update Bundle Total
 * Filter Isotope
 * Reveal
 * Hover Lookbook
 * Notice Popup
 * Offcanvas Quick View
 * Popup Product Action
 * Write Review
 * Scroll Grid Product
 * Circle Text
 * Preloader
 */

/* Global HTML sanitizer for AJAX-injected markup.
   Parses untrusted HTML, strips <script> / <iframe> / <object> / <embed>,
   removes all on* event handler attributes, and neutralizes javascript: URLs.
   Used by cart-area replaceWith() and featured-tabs .html() calls so any
   server-side leak of unescaped user input cannot execute. */
/* Attribute-context escape — for safely interpolating untrusted strings
   into HTML attribute values inside template literals. Smaller than
   bbSanitizeHtml (which parses DOM); use this when you only need to
   neutralize attribute injection. */
window.bbEscapeAttr = function (value) {
    return String(value == null ? "" : value)
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#39;");
};

window.bbSanitizeHtml = function (html) {
    if (typeof html !== "string" || html === "") return html;
    var doc;
    try {
        doc = new DOMParser().parseFromString(html, "text/html");
    } catch (e) {
        return "";
    }
    var DANGEROUS_TAGS = ["script", "iframe", "object", "embed", "link", "meta"];
    for (var t = 0; t < DANGEROUS_TAGS.length; t++) {
        var nodes = doc.querySelectorAll(DANGEROUS_TAGS[t]);
        for (var n = 0; n < nodes.length; n++) {
            nodes[n].parentNode && nodes[n].parentNode.removeChild(nodes[n]);
        }
    }
    var all = doc.body.querySelectorAll("*");
    for (var i = 0; i < all.length; i++) {
        var el = all[i];
        var attrs = el.attributes;
        for (var j = attrs.length - 1; j >= 0; j--) {
            var name = attrs[j].name;
            var value = attrs[j].value || "";
            if (name.toLowerCase().indexOf("on") === 0) {
                el.removeAttribute(name);
                continue;
            }
            if ((name === "href" || name === "src" || name === "xlink:href") &&
                /^\s*javascript:/i.test(value)) {
                el.removeAttribute(name);
            }
        }
    }
    return doc.body.innerHTML;
};

(function ($) {
    "use strict";

    /* Select Image
    -------------------------------------------------------------------------*/
    var dropdownSelect = function () {
        if ($(".tf-dropdown-select").length > 0) {
            const selectIMG = $(".tf-dropdown-select");

            // Escape data interpolated into data-content HTML to prevent any
            // server-supplied value from injecting markup into the selectpicker
            // dropdown. Values are normally controlled (admin currency/locale list)
            // but defensive escaping is required for Envato review.
            var escapeHtml = function (str) {
                return String(str)
                    .replace(/&/g, "&amp;")
                    .replace(/</g, "&lt;")
                    .replace(/>/g, "&gt;")
                    .replace(/"/g, "&quot;")
                    .replace(/'/g, "&#39;");
            };

            selectIMG.find("option").each((idx, elem) => {
                const selectOption = $(elem);
                const imgURL = selectOption.attr("data-thumbnail");
                if (imgURL) {
                    selectOption.attr(
                        "data-content",
                        '<img src="' + escapeHtml(imgURL) + '" alt="Country" /> ' + escapeHtml(selectOption.text())
                    );
                }
            });
            if (typeof $.fn.selectpicker === "function") {
                selectIMG.selectpicker();
            }

            // Currency / language switcher: navigate to the chosen option's data-action-url.
            // Server-rendered options carry the absolute switch URL (route('public.change-currency', ...)
            // or Language::getSwitcherUrl(...)). Without this handler, picking a different option only
            // updates the visible selection — no actual locale/currency switch happens.
            selectIMG.on("change", function () {
                const url = $(this).find("option:selected").attr("data-action-url");
                if (url) {
                    window.location.href = url;
                }
            });
        }
    };

    /* Button Quantity
    -------------------------------------------------------------------------*/
    var btnQuantity = function () {
        $(".minus-btn").on("click", function (e) {
            e.preventDefault();
            var $this = $(this);
            var $input = $this.closest("div").find("input");
            var value = parseInt($input.val(), 10);

            if (value > 1) {
                value = value - 1;
            }
            $input.val(value);
        });

        $(".plus-btn").on("click", function (e) {
            e.preventDefault();
            var $this = $(this);
            var $input = $this.closest("div").find("input");
            var value = parseInt($input.val(), 10);

            if (value > -1) {
                value = value + 1;
            }
            $input.val(value);
        });
    };

    /* Delete File 
    -------------------------------------------------------------------------*/
    var deleteFile = function (e) {
        function updateCount() {
            var count = $(".list-file-delete .file-delete").length;
            $(".prd-count").text(count);
        }

        function updateTotalPrice() {
            var total = 0;

            $(".list-file-delete .tf-mini-cart-item").each(function () {
                var priceText = $(this).find(".tf-mini-card-price").text().replace("$", "").replace(",", "").trim();
                var price = parseFloat(priceText);
                if (!isNaN(price)) {
                    total += price;
                }
            });

            var formatted = total.toLocaleString("en-US", { style: "currency", currency: "USD" });
            $(".tf-totals-total-value").text(formatted);
        }

        function updatePriceEach() {
            $(".each-prd").each(function () {
                var priceText = $(this).find(".each-price").text().replace("$", "").replace(",", "").trim();
                var price = parseFloat(priceText);
                var quantity = parseInt($(this).find(".quantity-product").val(), 10);
                if (!isNaN(price) && !isNaN(quantity)) {
                    var subtotal = price * quantity;
                    var formatted = subtotal.toLocaleString("en-US", { style: "currency", currency: "USD" });
                    $(this).find(".each-subtotal-price").text(formatted);
                }
            });
        }

        function updateTotalPriceEach() {
            var total = 0;

            $(".each-list-prd .each-prd").each(function () {
                var priceText = $(this)
                    .find(".each-subtotal-price")
                    .text()
                    .replace(/[$,]/g, "")
                    .trim();

                var subtotal = parseFloat(priceText);

                if (!isNaN(subtotal)) {
                    total += subtotal;
                }
            });

            var formatted = total.toLocaleString("en-US", {
                style: "currency",
                currency: "USD"
            });

            $(".each-total-price").text(formatted);
        }


        function checkListEmpty() {
            $(".wrap-empty_text").each(function () {
                var $listEmpty = $(this);
                var $textEmpty = $listEmpty.find(".box-text_empty");
                var $otherChildren = $listEmpty.find(".list-empty").children().not(".box-text_empty");
                var $boxEmpty = $listEmpty.find(".box-empty_clear");
                var $progress = $listEmpty
                    .closest(".popup-shopping-cart")
                    .find(".tf-progress-bar .value");


                if ($otherChildren.length > 0) {
                    $textEmpty.hide();
                } else {
                    $textEmpty.show();
                    $boxEmpty.hide();
                    if ($textEmpty.is(":visible")) {
                        $progress.css("width", "0%");
                    }
                }
            });
        }

        if ($(".main-list-clear").length) {
            $(".main-list-clear").each(function () {
                var $mainList = $(this);

                $mainList.find(".clear-list-empty").on("click", function () {
                    $mainList.find(".list-empty").children().not(".box-text_empty").remove();
                    checkListEmpty();
                });
            });
        }
        function ortherDel() {
            $(".container .orther-del").remove();
        }
        $(".list-file-delete").on("input", ".quantity-product", function () {
            updateTotalPrice();
        });

        $(".list-file-delete,.each-prd").on("click", ".minus-quantity, .plus-quantity", function () {
            var $quantityInput = $(this).siblings(".quantity-product");
            var currentQuantity = parseInt($quantityInput.val(), 10);

            if ($(this).hasClass("plus-quantity")) {
                $quantityInput.val(currentQuantity + 1);
            } else if ($(this).hasClass("minus-quantity") && currentQuantity > 1) {
                $quantityInput.val(currentQuantity - 1);
            }

            updateTotalPrice();
            updatePriceEach();
            updateTotalPriceEach();
        });

        $(".remove").on("click", function (e) {
            e.preventDefault();
            var $this = $(this);
            $this.closest(".file-delete").remove();
            updateCount();
            updateTotalPrice();
            checkListEmpty();
            updateTotalPriceEach();
            ortherDel();
        });

        $(".clear-file-delete").on("click", function (e) {
            e.preventDefault();
            $(this).closest(".list-file-delete").find(".file-delete").remove();
            updateCount();
            updateTotalPrice();
            checkListEmpty();
        });
        checkListEmpty();
        updateCount();
        updateTotalPrice();
        updatePriceEach();
        updateTotalPriceEach();
    };

    /* Go Top
    -------------------------------------------------------------------------*/
    var goTop = function () {
        var $goTop = $("#goTop");
        var $borderProgress = $(".border-progress");

        $(window).on("scroll", function () {
            var scrollTop = $(window).scrollTop();
            var docHeight = $(document).height() - $(window).height();
            var scrollPercent = (scrollTop / docHeight) * 100;
            var progressAngle = (scrollPercent / 100) * 360;

            $borderProgress.css("--progress-angle", progressAngle + "deg");

            if (scrollTop > 100) {
                $goTop.addClass("show");
            } else {
                $goTop.removeClass("show");
            }
        });

        $goTop.on("click", function () {
            $("html, body").animate({ scrollTop: 0 }, 0);
        });
    };

    /* Variant Picker
    -------------------------------------------------------------------------*/
    // Use delegated handlers so swatches loaded later (quick-shop / quick-view
    // modals, ajax-rendered variation pickers) also toggle active state and
    // refresh the label readout. The plugin's change-product-swatches.js owns
    // radio :checked + the AJAX call; this handler only mirrors that selection
    // back onto the .active class and the visible label text.
    var variantPicker = function () {
        var $body = $("body");

        $body.off("click.amerceVariantColor").on("click.amerceVariantColor", ".color-btn", function () {
            var $btn = $(this);
            if ($btn.hasClass("select-item") || $btn.hasClass("disabled")) {
                return;
            }
            var $wrapper = $btn.closest(".variant-picker-item");
            // Prefer the human-readable title from the tooltip span (rendered
            // by the override visual.blade.php) — fall back to data-color slug
            // for the older demo markup that lacks a tooltip.
            var tooltipText = $btn.find(".tooltip").first().text();
            var label = (tooltipText && tooltipText.split(" — ")[0].trim())
                || $btn.data("color")
                || $btn.data("scroll")
                || "";

            $wrapper.find(".variant-picker-label-value, .value-currentColor").text(label);
            $wrapper.find(".color-btn").removeClass("active");
            $btn.addClass("active");
        });

        $body.off("click.amerceVariantSize").on("click.amerceVariantSize", ".size-btn", function () {
            var $btn = $(this);
            if ($btn.hasClass("select-item") || $btn.hasClass("disabled")) {
                return;
            }
            var $wrapper = $btn.closest(".variant-picker-item");
            var label = $btn.data("size") || $btn.text().trim();

            $wrapper.find(".variant-picker-label-value, .value-currentSize").text(label);
            $wrapper.find(".size-btn").removeClass("active");
            $btn.addClass("active");
        });
    };

    /* Sidebar Mobile
    -------------------------------------------------------------------------*/
    var sidebarMobile = function () {
        if ($(".sidebar-content-wrap").length > 0) {
            var sidebar = $(".sidebar-content-wrap").html();
            $(".sidebar-mobile-append").append(sidebar);
        }
    };

    /* Stagger Wrap
    -------------------------------------------------------------------------*/
    var staggerWrap = function () {
        if ($(".stagger-wrap").length) {
            var count = $(".stagger-item").length;
            for (var i = 1, time = 0.2; i <= count; i++) {
                $(".stagger-item:nth-child(" + i + ")")
                    .css("transition-delay", time * i + "s")
                    .addClass("stagger-finished");
            }
        }
    };

    /* Modal Second
    -------------------------------------------------------------------------*/
    var clickModalSecond = function () {
        $(".show-shopping-cart").on("click", function () {
            $("#shoppingCart").modal("show");
        });
        $(".btn-icon-action.wishlist").on("click", function () {
            $("#wishlist").modal("show");
        });

        $(".btn-add-to-cart").on("click", function () {
            $(".tf-add-cart-success").addClass("active");
        });
        $(".tf-add-cart-success .tf-add-cart-close").on("click", function () {
            $(".tf-add-cart-success").removeClass("active");
        });

        $(".btn-add-note, .btn-estimate-shipping, .btn-add-gift").on("click", function (event) {
            var classList = {
                "btn-add-note": ".add-note",
                "btn-estimate-shipping": ".estimate-shipping",
                "btn-add-gift": ".add-gift",
            };

            $.each(classList, function (btnClass, targetClass) {
                if ($(event.currentTarget).hasClass(btnClass)) {
                    $(targetClass).addClass("open");
                }
            });
        });

        $(".tf-mini-cart-tool-close").on("click", function () {
            $(".tf-mini-cart-tool-openable").removeClass("open");
        });
    };

    /* Header Sticky
    -------------------------------------------------------------------------*/
    var headerSticky = function () {
        const customHeaderCategory = () => {
            const header = document.querySelector(".tf-header");

            if (!header || !header.classList.contains("has-by-category")) {
                return null;
            }

            const headerBottom = header.querySelector(".header-bottom_wrap");
            const btnOpen = header.querySelector(".btn-open-header-bottom");

            if (!headerBottom || !btnOpen) return null;

            btnOpen.addEventListener("click", () => {
                headerBottom.classList.toggle("hide");
            });

            return {
                hideHeaderBottom: () => headerBottom.classList.add("hide"),
                showHeaderBottom: () => headerBottom.classList.remove("hide"),
            };
        };

        const S3 = customHeaderCategory();

        let lastScrollTop = 0;
        let delta = 5;
        let navbarHeight = $("header").outerHeight();
        let didScroll = false;
        let adminBarOffset = function () {
            return $("body").hasClass("show-admin-bar") ? ($("#admin_bar").outerHeight() || 40) : 0;
        };

        $(window).on("scroll", function () {
            didScroll = true;
        });

        // Capture handle so the timer is cleared on pagehide — otherwise the
        // page can't enter the back-forward cache and the timer keeps firing
        // after navigation.
        const headerScrollInterval = setInterval(function () {
            if (didScroll) {
                let st = $(window).scrollTop();
                navbarHeight = $("header").outerHeight();

                if (st > navbarHeight) {
                    let stickyTop = adminBarOffset();

                    if (st > lastScrollTop + delta) {

                        $("header").css("top", `-${navbarHeight}px`);
                        $(".sticky-top").css("top", `${15 + stickyTop}px`);
                        $(".sticky-top.no-offset").css("top", `${stickyTop}px`);

                        if (S3) S3.hideHeaderBottom();

                    } else if (st < lastScrollTop - delta) {

                        if ($("header").hasClass("header-abs")) {
                            $("header").css("top", `${15 + stickyTop}px`);
                        } else {
                            $("header").css("top", `${stickyTop}px`);
                        }

                        $("header").addClass("header-sticky");
                        $(".sticky-top").css("top", `${30 + navbarHeight + stickyTop}px`);
                        $(".sticky-top.no-offset").css("top", `${navbarHeight + stickyTop}px`);


                    }

                } else {

                    $("header").css("top", "unset");
                    $("header").removeClass("header-sticky");
                    $(".sticky-top").css("top", `${15 + adminBarOffset()}px`);
                    $(".sticky-top.no-offset").css("top", `${adminBarOffset()}px`);

                    if (S3) S3.showHeaderBottom();
                }

                lastScrollTop = st;
                didScroll = false;
            }
        }, 250);

        $(window).on("pagehide", function () {
            clearInterval(headerScrollInterval);
        });
    };

    /* Auto Popup
    -------------------------------------------------------------------------*/
    var autoPopup = function () {
        if ($(".auto-popup").length > 0) {
            let showPopup = sessionStorage.getItem("showPopup");
            if (!JSON.parse(showPopup)) {
                setTimeout(function () {
                    $(".auto-popup").modal("show");
                }, 2000);
            }
        }
        $(".btn-hide-popup").on("click", function () {
            sessionStorage.setItem("showPopup", true);
        });
    };

    /* Total Price Variant
    -------------------------------------------------------------------------*/
    var totalPriceVariant = function () {
        $(".tf-product-info-wrap").each(function () {
            var productItem = $(this);
            var priceEl = productItem.find(".price-on-sale");
            var quantityInput = productItem.find(".quantity-product");
            if (!priceEl.data("price")) {
                var initialPrice = parseFloat(priceEl.text().replace("$", "").replace(/,/g, ""));
                priceEl.data("price", initialPrice);
            }
            productItem.find(".size-btn").on("click", function () {
                var rawPrice = $(this).attr("data-price");
                var newPrice = parseFloat(rawPrice.replace(/,/g, "")) || basePrice;
                quantityInput.val(1);
                productItem.find(".price-on-sale")
                    .text(`$${newPrice.toLocaleString("en-US", { minimumFractionDigits: 2 })}`)
                    .data("price", newPrice);
                updateTotalPrice(newPrice, productItem);
            });

            // NOTE: the actual +1/-1 increment is handled by the single global
            // delegated handler on [data-bb-toggle='increase-qty' / 'decrease-qty']
            // further down this file, which triggers a "change" event on the
            // quantity input after updating it. Binding a second click handler
            // here on .btn-increase/.btn-decrease used to double-fire the
            // increment (this element carries BOTH the .btn-increase class and
            // the data-bb-toggle attribute), causing +2 per click. We only react
            // to the resulting "change" event to refresh the displayed total.
            quantityInput.on("change", function () {
                updateTotalPrice(null, productItem);
            });

            function updateTotalPrice(price, scope) {
                var currentPrice = price || parseFloat(scope.find(".price-on-sale").data("price"));
                var quantity = parseInt(scope.find(".quantity-product").val(), 10);
                var totalPrice = currentPrice * quantity;
                scope.find(".price-add").text(`$${totalPrice.toLocaleString("en-US", { minimumFractionDigits: 2 })}`);
            }
            updateTotalPrice(null, productItem);
        });
    };
    /* Handle Progress
    -------------------------------------------------------------------------*/
    var handleProgress = function () {
        if ($(".progress-cart").length > 0) {
            var progressValue = $(".progress-cart .value").data("progress");
            setTimeout(function () {
                $(".progress-cart .value").css("width", progressValue + "%");
            }, 800);
        }

        function handleProgressBar(showEvent, hideEvent, target) {
            $(target).on(hideEvent, function () {
                $(".tf-progress-bar .value").css("width", "0%");
            });

            $(target).on(showEvent, function () {
                setTimeout(function () {
                    var progressValue = $(".tf-progress-bar .value").data("progress");
                    $(".tf-progress-bar .value").css("width", progressValue + "%");
                }, 600);
            });
        }

        if ($(".popup-shopping-cart").length > 0) {
            handleProgressBar("show.bs.offcanvas", "hide.bs.offcanvas", ".popup-shopping-cart");
        }

        if ($(".popup-shopping-cart").length > 0) {
            handleProgressBar("show.bs.modal", "hide.bs.modal", ".popup-shopping-cart");
        }
    };

    /* Handle Footer
    -------------------------------------------------------------------------*/
    var handleFooter = function () {
        var footerAccordion = function () {
            var args = { duration: 250 };
            $(".footer-heading-mobile").on("click", function () {
                var $parent = $(this).parent(".footer-col-block");
                var $content = $(this).next();

                $parent.toggleClass("open");

                if (!$parent.hasClass("open")) {
                    $content.slideUp(args);
                } else {
                    $content.slideDown(args);
                }
            });
        };

        function handleAccordion() {
            if (window.matchMedia("only screen and (max-width: 575px)").matches) {
                if (!$(".footer-heading-mobile").data("accordion-initialized")) {
                    footerAccordion();
                    $(".footer-heading-mobile").data("accordion-initialized", true);
                }
            } else {
                $(".footer-heading-mobile")
                    .off("click")
                    .removeData("accordion-initialized")
                    .each(function () {
                        $(this).parent(".footer-col-block").removeClass("open").end().next().removeAttr("style");
                    });
            }
        }

        handleAccordion();
        $(window).on("resize", handleAccordion);
    };

    /* Infinite Slide 
    -------------------------------------------------------------------------*/
    var infiniteSlide = function () {
        if ($(".infiniteSlide").length > 0) {
            $(".infiniteSlide").each(function () {
                var $this = $(this);
                var style = $this.data("style") || "left";
                var clone = $this.data("clone") || 2;
                var speed = $this.data("speed") || 50;
                $this.infiniteslide({
                    speed: speed,
                    direction: style,
                    clone: clone,
                });
            });
        }
    };

    /* Add Wishlist
    -------------------------------------------------------------------------*/
    var addWishList = function () {
        $(".btn-add-wishlist,.btn-wishlist, .card-product .wishlist").on("click", function (e) {
            e.preventDefault();
            let $this = $(this);
            let icon = $this.find(".icon");
            let tooltip = $this.find(".tooltip");

            $this.toggleClass("addwishlist");

            var i18n = window.amerceI18n || {};
            if ($this.hasClass("addwishlist")) {
                icon.removeClass("icon-heart").addClass("icon-trash");
                tooltip.text(i18n.remove_wishlist || "Remove Wishlist");
            } else {
                icon.removeClass("icon-trash").addClass("icon-heart");
                tooltip.text(i18n.add_to_wishlist || "Add to Wishlist");
            }
        });
    };

    /* Handle Sidebar Filter
       Pinned sidebar variant (Left / Right shop layout) is rendered as a
       drawer below the xl breakpoint (1200px) — see _pop-up.scss. The
       trigger lives in product-filters-top.blade.php with
       data-action="open-filter-sidebar"; close button lives inside
       filters-sidebar.blade.php with data-action="close-filter-sidebar".
       Use event delegation so it survives ecommerce AJAX filter re-renders
       (front-ecommerce.js replaces #filterSidebar children on filter apply).
    -------------------------------------------------------------------------*/
    var handleSidebarFilter = function () {
        $(document).off("click.sidebarFilter")
            .on("click.sidebarFilter", '[data-action="open-filter-sidebar"]', function () {
                $(".sidebar-filter").addClass("show");
                $("body").addClass("sidebar-filter-open");
            })
            .on("click.sidebarFilter", '[data-action="close-filter-sidebar"], .sidebar-filter-backdrop', function () {
                $(".sidebar-filter").removeClass("show");
                $("body").removeClass("sidebar-filter-open");
            });
    };

    /* Estimate Shipping
    -------------------------------------------------------------------------*/
    var estimateShipping = function () {
        if ($(".estimate-shipping").length) {
            const $countrySelect = $("#shipping-country-form");
            const $provinceSelect = $("#shipping-province-form");
            const $zipcodeInput = $("#zipcode");
            const $zipcodeMessage = $("#zipcode-message");
            const $zipcodeSuccess = $("#zipcode-success");
            const $shippingForm = $("#shipping-form");

            function updateProvinces() {
                const selectedCountry = $countrySelect.val();
                const $selectedOption = $countrySelect.find("option:selected");
                const provincesData = $selectedOption.attr("data-provinces");

                const provinces = JSON.parse(provincesData);
                $provinceSelect.empty();

                if (provinces.length === 0) {
                    $provinceSelect.append($("<option>").text("------"));
                } else {
                    provinces.forEach(function (province) {
                        $provinceSelect.append($("<option>").val(province[0]).text(province[1]));
                    });
                }
            }

            $countrySelect.on("change", updateProvinces);

            function validateZipcode(zipcode, country) {
                let regex;

                switch (country) {
                    case "Australia":
                    case "Austria":
                    case "Belgium":
                    case "Denmark":
                        regex = /^\d{4}$/;
                        break;
                    case "Canada":
                        regex = /^[A-Za-z]\d[A-Za-z][ -]?\d[A-Za-z]\d$/;
                        break;
                    case "Czech Republic":
                    case "Finland":
                    case "France":
                    case "Germany":
                    case "Mexico":
                    case "South Korea":
                    case "Spain":
                    case "Italy":
                        regex = /^\d{5}$/;
                        break;
                    case "United States":
                        regex = /^\d{5}(-\d{4})?$/;
                        break;
                    case "United Kingdom":
                        regex = /^[A-Za-z]{1,2}\d[A-Za-z\d]? \d[A-Za-z]{2}$/;
                        break;
                    case "India":
                    case "Vietnam":
                        regex = /^\d{6}$/;
                        break;
                    case "Japan":
                        regex = /^\d{3}-\d{4}$/;
                        break;
                    default:
                        return true;
                }

                return regex.test(zipcode);
            }

            $shippingForm.on("submit", function (event) {
                const zipcode = $zipcodeInput.val().trim();
                const country = $countrySelect.val();

                if (!validateZipcode(zipcode, country)) {
                    $zipcodeMessage.show();
                    $zipcodeSuccess.hide();
                    event.preventDefault();
                } else {
                    $zipcodeMessage.hide();
                    $zipcodeSuccess.show();
                    event.preventDefault();
                }
            });

            $(window).on("load", updateProvinces);
        }
    };

    /* Coupon Copy
    -------------------------------------------------------------------------*/
    var textCopy = function () {
        $(".coupon-copy-wrap,.btn-coppy-text").on("click", function () {
            const couponCode = $(this).find(".coupon-code,.coppyText").text().trim();

            // Use the standard Theme.showSuccess/showError toast API exposed
            // by the theme package's registerToastNotification() helper.
            var success = function (msg) {
                if (window.Theme && typeof Theme.showSuccess === "function") {
                    Theme.showSuccess(msg);
                }
            };
            var error = function (msg) {
                if (window.Theme && typeof Theme.showError === "function") {
                    Theme.showError(msg);
                }
            };

            if (navigator.clipboard) {
                navigator.clipboard
                    .writeText(couponCode)
                    .then(function () { success(couponCode); })
                    .catch(function () { error(couponCode); });
            } else {
                const tempInput = $("<input>");
                $("body").append(tempInput);
                tempInput.val(couponCode).select();
                document.execCommand("copy");
                tempInput.remove();
                success(couponCode);
            }
        });
    };

    /* Parallaxie 
    -------------------------------------------------------------------------*/
    var parallaxie = function () {
        var $window = $(window);

        if ($(".parallaxie").length && typeof $.fn.parallaxie === "function") {
            function initParallax() {
                if ($(".parallaxie").length && $window.width() > 991) {
                    $(".parallaxie").parallaxie({
                        speed: 0.55,
                        offset: 0,
                    });
                }
            }

            initParallax();

            $window.on("resize", function () {
                if ($window.width() > 991) {
                    initParallax();
                }
            });
        }
    };

    /* Click Active
    -------------------------------------------------------------------------*/
    var clickActive = function () {
        function isAllowed($container) {
            return !$container.hasClass("active-1600") || window.innerWidth < 1600;
        }

        let previousWidth = window.innerWidth;

        $(window).on("resize", function () {
            const currentWidth = window.innerWidth;

            const crossedBreakpoint = (previousWidth < 1600 && currentWidth >= 1600) || (previousWidth >= 1600 && currentWidth < 1600);

            if (crossedBreakpoint) {
                $(".main-action-active").each(function () {
                    $(this).find(".btn-active, .active-item").removeClass("active");
                });

                if (previousWidth < 1600 && currentWidth >= 1600) {
                    $(".main-action-active.active-1600").each(function () {
                        const $container = $(this);
                        const $btn = $container.find(".btn-active");
                        const $item = $container.find(".active-item");

                        $btn.addClass("active");
                        $item.addClass("active");
                    });
                }
            }

            previousWidth = currentWidth;
        });

        $(".btn-active").on("click", function (event) {
            const $container = $(this).closest(".main-action-active");

            if (!isAllowed($container)) return;

            event.stopPropagation();

            const $activeItem = $container.find(".active-item");
            const isResponsive = $container.hasClass("active-1600") && window.innerWidth < 1600;

            if (isResponsive) {
                $(".main-action-active").each(function () {
                    if (this !== $container[0]) {
                        $(this).find(".btn-active, .active-item").removeClass("active");
                    }
                });
            } else {
                $(".main-action-active").each(function () {
                    const $other = $(this);
                    if (this !== $container[0] && (!$other.hasClass("active-1600") || window.innerWidth < 1600)) {
                        $other.find(".btn-active, .active-item").removeClass("active");
                    }
                });
            }

            $(this).toggleClass("active");
            $activeItem.toggleClass("active");
        });

        $(document).on("click", function (event) {
            const isMobile = window.innerWidth < 1600;

            $(".main-action-active").each(function () {
                const $container = $(this);
                const is1600 = $container.hasClass("active-1600");

                if ((is1600 && isMobile) || !is1600) {
                    if (!$(event.target).closest($container).length) {
                        $container.find(".btn-active, .active-item").removeClass("active");
                    }
                }
            });
        });

        $(".choose-option-item").on("click", function () {
            const $container = $(this).closest(".main-action-active");
            if (!isAllowed($container)) return;

            $(this).closest(".choose-option-list").find(".select-option").removeClass("select-option");
            $(this).addClass("select-option");
        });
    };

    /* Handle Mobile Menu
    -------------------------------------------------------------------------*/
    var handleMobileMenu = function () {
        const $desktopMenu = $(".box-nav-menu:not(.not-append)").clone();
        $desktopMenu.find(".list-ver, .list-hor, .mn-none").remove();

        const $mobileMenu = $('<ul class="nav-ul-mb"></ul>');
        const $iconArrow = "ic-custom";
        const $iconArrow2 = "icon-CaretDown";



        $desktopMenu.find("> li.menu-item").each(function (i, menuItem) {
            const $item = $(menuItem);
            const $topLink = $item.find("> a.item-link").first();

            const text = $topLink
                .find(".text, .cus-text")
                .first()
                .clone()
                .children()
                .remove()
                .end()
                .text()
                .trim();

            const submenu = $item.find("> .sub-menu");
            const id = "dropdown-menu-" + i;

            const isTopActive = $topLink.hasClass("active");
            const topActiveClass = isTopActive ? "active" : "";

            if (!submenu.length) {
                const href = $topLink.attr("href") || "#";
                $mobileMenu.append(`
        <li class="nav-mb-item">
          <a href="${href}" class="mb-menu-link ${topActiveClass}">
            <span>${text}</span>
          </a>
        </li>
      `);
                return;
            }

            const $liMb = $(`
      <li class="nav-mb-item">
        <a href="#${id}" class="collapsed mb-menu-link ${topActiveClass}" data-bs-toggle="collapse"
           aria-expanded="false" aria-controls="${id}">
          <span>${text}</span>
          <span class="icon ${$iconArrow}"></span>
        </a>
        <div id="${id}" class="collapse"></div>
      </li>
    `);

            const $subNav = $('<ul class="sub-nav-menu"></ul>');
            const $groups = submenu.find(".mega-menu-item.menu-lv-2");

            const isHomeMenu = text.toLowerCase() === "home";
            const $homeDemos = $("#modalDemo .demo-item a.demo-name");
            if (isHomeMenu && $homeDemos.length) {
                $homeDemos.each(function () {
                    const $a = $(this);
                    const $demoItem = $a.closest(".demo-item");
                    const href = $a.attr("href") || "#";

                    const isSoon = $demoItem.hasClass("soon");
                    const soonClass = isSoon ? "soon" : "";

                    const text = $a
                        .clone()
                        .children(".demo-label")
                        .remove()
                        .end()
                        .text()
                        .trim();

                    const $label = $a.find(".demo-label").first();
                    let labelHTML = "";

                    if ($label.length) {
                        const labelText = $label.text().trim();
                        const labelClass = $label.attr("class").replace("demo-label", "").trim();
                        labelHTML = `<span class="demo-label ${labelClass}">${labelText}</span>`;
                    }

                    $subNav.append(`
                    <li>
                        <a href="${href}" class="sub-nav-link ${soonClass}">
                            ${text}
                            ${labelHTML}
                        </a>
                    </li>
                `);
                });
            }


            if ($groups.length) {
                $groups.each(function (j) {
                    const $groupWrap = $(this);
                    const heading = $groupWrap.find(".menu-heading").first().text().trim();
                    if (!heading) return;

                    const subId = `${id}-group-${j}`;

                    const hasActiveChild = $groupWrap.find(".sub-menu_link.active").length > 0;
                    const groupActiveClass = hasActiveChild ? "active" : "";

                    const $group = $(`
                        <li>
                        <a href="#${subId}" class="collapsed sub-nav-link ${groupActiveClass}"
                            data-bs-toggle="collapse" aria-expanded="false" aria-controls="${subId}">
                            <span>${heading}</span>
                            <span class="icon ${$iconArrow2}"></span>
                        </a>
                        <div id="${subId}" class="collapse">
                            <ul class="sub-nav-menu sub-menu-level-2"></ul>
                        </div>
                        </li>
                    `);

                    $groupWrap.find(".sub-menu_list > li > a.sub-menu_link").each(function () {
                        const $a = $(this);
                        const href = $a.attr("href") || "#";
                        const html = $a.html();
                        const activeClass = $a.hasClass("active") ? "active" : "";

                        if (html && html.trim()) {
                            $group
                                .find(".sub-menu-level-2")
                                .append(`<li><a href="${window.bbEscapeAttr(href)}" class="sub-nav-link ${activeClass}">${html}</a></li>`);
                        }
                    });

                    $subNav.append($group);
                });


            } else {
                submenu.find(".sub-menu_list > li > a.sub-menu_link").each(function () {
                    const $a = $(this);
                    const href = $a.attr("href") || "#";
                    const html = $a.html();
                    const isActive = $a.hasClass("active");
                    const activeClass = isActive ? "active" : "";
                    const isSoon = $a.hasClass("soon");
                    const soonClass = isSoon ? "soon" : "";

                    if (html && html.trim()) {
                        $subNav.append(`<li><a href="${window.bbEscapeAttr(href)}" class="sub-nav-link ${activeClass} ${soonClass}">${html}</a></li>`);
                    }
                });
            }

            $liMb.find(`#${id}`).append($subNav);
            $mobileMenu.append($liMb);
        });

        $("#wrapper-menu-navigation").empty().append($mobileMenu);
    };

    /* Color Swatch Product
    -------------------------------------------------------------------------*/
    var swatchColor = function () {
        if ($(".card-product, .banner-card_product").length > 0) {
            $(".color-swatch").on("click mouseover", function () {
                var $swatch = $(this);
                var swatchColor = $swatch.find("img:not(.swatch-img)").attr("src");
                var imgProduct = $swatch.closest(".card-product, .banner-card_product").find(".img-product");
                var colorLabel = $swatch.find(".color-label").text().trim();
                imgProduct.attr("src", swatchColor);
                $swatch.closest(".card-product, .banner-card_product").find(".quick-variant-color .variant-value").text(colorLabel);
                $swatch.closest(".card-product, .banner-card_product").find(".color-swatch.active").removeClass("active");
                $swatch.addClass("active");
            });
        }
    };

    /* Custom Dropdown
    -------------------------------------------------------------------------*/
    var customDropdown = function () {
        $(".dropdown-custom").each(function () {
            const $dropdown = $(this);

            const originalClass = $dropdown.hasClass("dropend")
                ? "dropend"
                : $dropdown.hasClass("dropstart")
                    ? "dropstart"
                    : "";

            function updateDropdownClass() {
                if ($(window).width() <= 991) {
                    $dropdown.removeClass("dropstart dropend").addClass("dropup");
                } else {
                    $dropdown.removeClass("dropup").addClass(originalClass);
                }
            }

            updateDropdownClass();
            $(window).on("resize", updateDropdownClass);
        });
    };

    /* Product detail tabs — URL hash sync
       Persists active tab in the URL so a refresh / direct link / back button
       restores the tab the user was on. Mirrors the shofy theme pattern.
    -------------------------------------------------------------------------*/
    var productTabHash = function () {
        var $tabs = $('#productDetailsTabs button[data-bs-toggle="tab"]');
        if (!$tabs.length) return;

        // tab id → url-friendly hash (and reverse map for activation)
        var idToHash = {
            'tab-description-trigger': 'description',
            'tab-specification-trigger': 'specification',
            'tab-review-trigger': 'reviews',
            'tab-vendor-trigger': 'vendor',
            'tab-faq-trigger': 'faq'
        };
        var hashToId = {};
        Object.keys(idToHash).forEach(function (k) { hashToId[idToHash[k]] = k; });

        // Persist hash when a tab is activated. replaceState avoids back-stack noise.
        $tabs.on('shown.bs.tab', function () {
            var hash = idToHash[this.id];
            if (hash) history.replaceState(null, '', '#' + hash);
        });

        // Activate the tab whose hash matches the current URL.
        var activateFromHash = function () {
            var raw = window.location.hash.replace(/^#/, '');
            // The Reviews block has its own anchor (#product-review) used by
            // the rating click handler — alias it to the reviews tab.
            if (raw === 'product-review') raw = 'reviews';
            var targetId = hashToId[raw];
            if (!targetId) return;
            var trigger = document.getElementById(targetId);
            if (!trigger || trigger.classList.contains('active')) return;
            new bootstrap.Tab(trigger).show();
        };

        activateFromHash();
        $(window).on('hashchange', activateFromHash);
    };

    /* Bottom Sticky
    -------------------------------------------------------------------------*/
    var scrollBottomSticky = function () {
        // Teleport the bar to <body> so position:fixed escapes the .container
        // ancestor (1440px max-width) and spans the full viewport.
        var $bar = $(".tf-sticky-btn-atc").first();
        if ($bar.length && $bar.parent()[0] !== document.body) {
            $bar.appendTo(document.body);
        }

        var footerOffset = $("footer").offset().top;

        $(window).on("scroll", function () {
            var addToCart = $(".section-product-single .btn-action-price")[0];
            var myElement = $(".tf-sticky-btn-atc");
            var scrollTopBtn = $("#goTop");
            var toolbar = $(".tf-toolbar");

            if (!addToCart) return;

            var rect = addToCart.getBoundingClientRect();

            var scrollBottom = $(window).scrollTop() + $(window).height();

            if (scrollBottom >= footerOffset) {
                myElement.removeClass("show");
                scrollTopBtn.css("bottom", "");
                return;
            }

            if (rect.bottom < 0) {
                myElement.addClass("show");

                if (myElement.hasClass("show")) {
                    var stickyHeight = myElement.outerHeight() + 10;
                    scrollTopBtn.css("bottom", stickyHeight + "px");

                    if (window.matchMedia("(max-width: 1199px)").matches && toolbar.length) {
                        stickyHeight += toolbar.outerHeight();
                    }

                    scrollTopBtn.css("bottom", stickyHeight + "px");
                }
            } else {
                myElement.removeClass("show");
                scrollTopBtn.css("bottom", "");
            }
        });

        // Sticky bar delegates to the in-form submit buttons so variant selection
        // and the plugin's product-form AJAX (which sets `checkout=1` for buy-now)
        // run unchanged. Two togglers map to two different form buttons:
        //   scroll-to-add-to-cart → .btn-action-price       (Add To Cart)
        //   scroll-to-buy-now     → button[name="checkout"]  (Buy It Now)
        $(document).on("click", '[data-bb-toggle="scroll-to-add-to-cart"], [data-bb-toggle="scroll-to-buy-now"]', function (event) {
            var isBuyNow = $(this).attr("data-bb-toggle") === "scroll-to-buy-now";
            var selector = isBuyNow
                ? ".section-product-single button[name='checkout']"
                : ".section-product-single .btn-action-price";
            var primary = document.querySelector(selector);
            if (!primary) return;

            event.preventDefault();
            primary.scrollIntoView({ behavior: "smooth", block: "center" });
            window.setTimeout(function () { primary.click(); }, 350);
        });
    };


    /* Show Password
    -------------------------------------------------------------------------*/
    var showPassword = function () {
        $(".toggle-pass").on("click", function () {
            const wrapper = $(this).closest(".password-wrapper");
            const input = wrapper.find(".password-field");
            const icon = $(this);

            if (input.attr("type") === "password") {
                input.attr("type", "text");
                icon.removeClass("icon-EyeSlash").addClass("icon-Eye");
            } else {
                input.attr("type", "password");
                icon.removeClass("icon-Eye").addClass("icon-EyeSlash");
            }
        });
    };

    /* Change Image Dashboard 
    -------------------------------------------------------------------------*/
    var changeImageDash = function () {
        if ($(".avatarPreview").length > 0) {
            const fileInput = document.getElementById("fileInput");
            const fileName = document.getElementById("fileName");
            const avatarPreview = document.getElementById("avatarPreview");
            fileInput.addEventListener("change", function () {
                const file = this.files[0];

                if (file) {
                    fileName.textContent = file.name;
                    fileName.style.color = "#333";

                    const reader = new FileReader();
                    reader.onload = function (e) {
                        avatarPreview.src = e.target.result;
                        avatarPreview.style.display = "block";
                    };
                    reader.readAsDataURL(file);
                } else {
                    fileName.textContent = (window.amerceI18n && window.amerceI18n.no_file_chosen) || "No File Chosen";
                    avatarPreview.style.display = "none";
                }
            });
        }
    };

    /* Select Category
    -------------------------------------------------------------------------*/
    var customSelectCate = function () {
        $("select#product_cate").each(function () {
            var $this = $(this),
                selectOptions = $(this).children("option").length;
            $this.addClass("hide-select");
            $this.after('<div class="tf-select-custom"></div>');
            var $customSelect = $this.next("div.tf-select-custom");
            $customSelect.text($this.children("option").eq(0).text());
            var $optionlist = $(
                '<ul class="select-options" /><div class="header-select-option"><span>Select Categories</span><span class="close-option"><i class="icon-X2"></i></div>'
            ).insertAfter($customSelect);
            for (var i = 0; i < selectOptions; i++) {
                var value = $this.children("option").eq(i).val();
                var text = $this.children("option").eq(i).text();

                var link = (value === "all")
                    ? "collection.html"
                    : "shop-default.html";

                var $li = $("<li />", {
                    "data-value": value
                });

                var $a = $("<a />", {
                    href: link,
                    text: text
                });

                $li.append($a).appendTo($optionlist);
            }
            var $optionlistItems = $optionlist.children("li");
            $customSelect.on("click", function (e) {
                e.stopPropagation();
                $("div.tf-select-custom.active")
                    .not(this)
                    .each(function () {
                        $(this).removeClass("active").next("ul.select-options").hide();
                    });
                $(this).toggleClass("active").next("ul.select-options").slideToggle();
            });
            $optionlistItems.on("click", function (e) {
                e.stopPropagation();
                $customSelect.text($(this).text()).removeClass("active");
                $this.val($(this).attr("rel"));
                $optionlist.hide();
            });
            $(document).on("click", function () {
                $customSelect.removeClass("active");
                $optionlist.hide();
            });
            $(".close-option").on("click", function () {
                $customSelect.removeClass("active");
                $optionlist.hide();
            });
        });
    };

    /* Hover Pin
    -------------------------------------------------------------------------*/
    var hoverPin = function () {
        $(".tf-lookbook-hover").each(function () {
            const $container = $(this);

            $container.find(".bundle-pin-item").on("mouseover", function () {
                const $hoverWrap = $container.find(".bundle-hover-wrap");
                $hoverWrap.addClass("has-hover");

                const $el = $container.find("." + this.id).show();
                $hoverWrap.find(".bundle-hover-item").not($el).addClass("no-hover");
            });

            $container.find(".bundle-pin-item").on("mouseleave", function () {
                const $hoverWrap = $container.find(".bundle-hover-wrap");
                $hoverWrap.removeClass("has-hover");
                $hoverWrap.find(".bundle-hover-item").removeClass("no-hover");
            });
        });
    };

    /* Rate Click
    -------------------------------------------------------------------------*/
    var rateClick = () => {
        const stars = document.querySelectorAll(".rate-click .icon");
        let selectedRating = 0;

        stars.forEach((star, idx) => {
            star.addEventListener("mouseenter", () => {
                resetHover();
                for (let i = 0; i <= idx; i++) {
                    stars[i].classList.add("hover");
                }
            });

            star.addEventListener("mouseleave", () => {
                resetHover();
            });
            star.addEventListener("click", () => {
                selectedRating = idx + 1;
                resetActive();
                for (let i = 0; i < selectedRating; i++) {
                    stars[i].classList.add("active");
                }
            });
        });

        function resetHover() {
            stars.forEach(s => s.classList.remove("hover"));
        }

        function resetActive() {
            stars.forEach(s => s.classList.remove("active"));
        }
    }

    /* Cart -> Checkout: gate the Proceed button behind the T&C checkbox.
       The button is a real <a href="..."> so without preventDefault the
       browser navigates regardless of the toast. Find the agreement checkbox
       by name within the same sidebar so the handler isn't tied to a
       specific element id (used by both cart.blade.php and any future page). */
    var checkOut = function () {
        $(document).on("click", "#checkout-btn", function (e) {
            var $btn = $(this);
            var $scope = $btn.closest(".box-order-summary, form, .fl-sidebar-cart");
            var $agree = $scope.length
                ? $scope.find('input[type="checkbox"][name="checkout_agree"]')
                : $('input[type="checkbox"][name="checkout_agree"]');

            if ($agree.length === 0 || $agree.is(":checked")) {
                return; // No gate present, or user agreed — let the link navigate.
            }

            e.preventDefault();

            var msg = (window.amerceI18n && window.amerceI18n.checkoutAgreeRequired) ||
                "Please agree to the Terms and Conditions before continuing.";
            if (window.Theme && typeof Theme.showError === "function") {
                Theme.showError(msg);
            }

            // Highlight the checkbox so the user sees what's required.
            $agree.closest(".checkbox-wrap, label, fieldset").addClass("has-error");
            setTimeout(function () {
                $agree.closest(".checkbox-wrap, label, fieldset").removeClass("has-error");
            }, 2400);
        });
    };

    /* Counter Odo
    -------------------------------------------------------------------------*/
    var counterOdo = () => {
        function isElementInViewport($el) {
            var top = $el.offset().top;
            var bottom = top + $el.outerHeight();
            var viewportTop = $(window).scrollTop();
            var viewportBottom = viewportTop + $(window).height();
            return bottom > viewportTop && top < viewportBottom;
        }

        function runCounterIfInView() {
            $(".couter-side").each(function () {
                var $counter = $(this);
                if (
                    isElementInViewport($counter) &&
                    !$counter.hasClass("counted")
                ) {
                    $counter.addClass("counted");
                    var targetNumber = $counter
                        .find(".odometer")
                        .data("number");

                    setTimeout(function () {
                        $counter.find(".odometer").text(targetNumber);
                    }, 200);
                }
            });
        }

        if ($(".counter-scroll").length > 0) {
            runCounterIfInView();

            $(window).on("scroll", function () {
                runCounterIfInView();
            });
        }
    };

    /* Couter
        -------------------------------------------------------------------------------------*/
    var counter = function () {
        $(".view-counter").each(function () {
            $(this).data('counted', false);
        });

        var checkCounters = function () {
            $(".view-counter").each(function () {
                var $counter = $(this);

                if ($counter.data('counted')) {
                    return;
                }

                var counterTop = $counter.offset().top;
                var counterBottom = counterTop + $counter.outerHeight();
                var viewportTop = $(window).scrollTop();
                var viewportBottom = viewportTop + $(window).height();
                var isInViewport = counterTop < viewportBottom && counterBottom > viewportTop;

                if (isInViewport) {
                    if ($().countTo) {
                        $counter.find(".number").each(function () {
                            var to = $(this).data("to"),
                                speed = $(this).data("speed");
                            $(this).countTo({
                                to: to,
                                speed: speed,
                            });
                        });
                    }
                    $counter.data('counted', true);
                }
            });
        };

        checkCounters();

        $(window).on("scroll", checkCounters);
    };

    /* Update Bundle Total 
    -------------------------------------------------------------------------*/
    var updateBundleTotal = function () {
        var $bundleItems = $(".list-bundle-prd .order-item");

        var updateBundleTotal = function () {
            var totalPrice = 0;
            $bundleItems.each(function () {
                var $this = $(this);
                if ($this.find(".tf-check").prop("checked")) {
                    var newPrice = parseFloat($this.find(".quantity-price").text().replace(/[$,]/g, "")) || 0;

                    totalPrice += newPrice;
                }
            });

            $(".total-price-bundle").text(`$${totalPrice.toLocaleString("en-US", { minimumFractionDigits: 2 })}`);
        };

        updateBundleTotal();

        $(".tf-check").on("change", function () {
            updateBundleTotal();
        });
    };

    /* Filter Isotope
    -------------------------------------------------------------------------------------*/
    var filterIsotope = function () {
        if (!$().isotope) return;

        $(".main-filter-isotope").each(function () {
            var $wrapper = $(this);
            var $container = $wrapper.find(".demo-filter");
            var $filterButtons = $wrapper.find(".posttype-filter a");

            if (!$container.length) return;

            $container.imagesLoaded(function () {
                $container.isotope({
                    itemSelector: ".item",
                    transitionDuration: "1s"
                });
            });

            $filterButtons.on("click", function (e) {
                e.preventDefault();

                var selector = $(this).attr("data-filter");

                $filterButtons.removeClass("active");
                $(this).addClass("active");

                $container.isotope({
                    filter: selector
                });
            });
        });
    };

    /* Reveal
    -------------------------------------------------------------------------*/
    const reveal = () => {
        const $reveals = $(".reveal");

        if ($reveals.length === 0) {
            return;
        }

        if ($(window).width() > 768) {
            $(window).on("scroll", function () {
                $reveals.each(function () {
                    const $el = $(this);
                    const windowHeight = $(window).height();
                    const revealTop = this.getBoundingClientRect().top;
                    const elHeight = $el.outerHeight();
                    const revealPoint = 150;
                    const posPoint = 20;

                    // Parent styles
                    $el.parent().css({
                        perspective: "700px",
                        transformStyle: "preserve-3d",
                        perspectiveOrigin: "100% 0%",
                    });

                    // Node styles
                    $el.css({
                        transformOrigin: "50% 0",
                        translate: "none",
                        rotate: "none",
                        scale: "none",
                        transition: "all .35s ease",
                    });

                    if (revealTop > windowHeight - revealPoint) {
                        $el.css({
                            opacity: "0",
                            transform: `rotateX(-${posPoint}deg)`,
                        });
                    }

                    if (revealTop < windowHeight - revealPoint) {
                        if (revealTop > -50) {
                            const schemas = Math.abs(1 - revealTop / elHeight);
                            const opacity = Math.min(Math.abs(1 - (revealTop - 350) / elHeight), 1);
                            const rotate = Math.min(posPoint * schemas - (posPoint - 10), 0);

                            $el.css({
                                opacity: opacity,
                                transform: `translate3d(0px,0px,0px) rotateX(${rotate}deg)`,
                            });
                        } else {
                            $el.css({
                                transform: `translate(0,0)`,
                            });
                        }
                    }
                });
            });
        }
    };

    /* Hover Lookbook
    -------------------------------------------------------------------------*/
    var handleHoverLookBook = () => {
        var $pins = $('.section-lookbook-hover-v03 .tf-pin-btn');
        var $productWrap = $('.section-lookbook-hover-v03 .wrap-product');
        var $products = $productWrap.find('.card-product');

        if ($pins.length === 0 || $productWrap.length === 0 || $products.length === 0) return;

        var swiperEl = document.querySelector('.section-lookbook-hover-v03 .tf-sw-mobile.swiper');
        var swiper = swiperEl && swiperEl.swiper ? swiperEl.swiper : null;

        function isInView($container, $el) {
            var c = $container[0].getBoundingClientRect();
            var e = $el[0].getBoundingClientRect();
            return e.top >= c.top && e.bottom <= c.bottom;
        }

        function setActiveProduct($target) {
            if (!$target || $target.length === 0) return;

            $products.each(function () {
                var $p = $(this);
                if ($p.is($target)) {
                    $p.addClass('is-active').removeClass('is-dim');
                } else {
                    $p.removeClass('is-active').addClass('is-dim');
                }
            });
        }

        function getSlideIndexFromProduct($target) {
            var $slide = $target.closest('.swiper-slide');
            if ($slide.length === 0) return null;

            var realIndexAttr = $slide.attr('data-swiper-slide-index');
            if (realIndexAttr != null && realIndexAttr !== '') {
                var realIndex = parseInt(realIndexAttr, 10);
                return Number.isFinite(realIndex) ? realIndex : null;
            }

            var domIndex = $slide.index();
            return Number.isFinite(domIndex) ? domIndex : null;
        }

        function slideToProduct($target) {
            if (!swiper) return;

            var idx = getSlideIndexFromProduct($target);
            if (idx == null) return;

            if (swiper.params && swiper.params.loop && typeof swiper.slideToLoop === 'function') {
                swiper.slideToLoop(idx, 300);
            } else if (typeof swiper.slideTo === 'function') {
                swiper.slideTo(idx, 300);
            }
        }

        function applyActiveFromSwiper() {
            if (!swiper) return;

            var $activeSlide = $(swiper.slides).filter('.swiper-slide-active');
            if ($activeSlide.length === 0) return;

            var $target = $activeSlide.find('.card-product').first();
            if ($target.length === 0) return;

            setActiveProduct($target);
        }

        function resetProducts() {
            if (swiper) {
                applyActiveFromSwiper();
            } else {
                $products.removeClass('is-active is-dim');
            }
        }

        function activateById(selector) {
            var $target = $(selector);
            if ($target.length === 0) return;

            setActiveProduct($target);

            if (swiper) {
                slideToProduct($target);
                return;
            }

            if (!isInView($productWrap, $target)) {
                $target[0].scrollIntoView({
                    behavior: 'smooth',
                    block: 'nearest'
                });
            }
        }

        $pins.each(function () {
            var $pin = $(this);
            var targetSelector = $pin.data('target');

            $pin.off('mouseenter.lookbookPin mouseleave.lookbookPin');

            $pin.on('mouseenter.lookbookPin', function () {
                activateById(targetSelector);
            });

            $pin.on('mouseleave.lookbookPin', function () {
                resetProducts();
            });
        });

        if (swiper && typeof swiper.on === 'function') {
            if (swiper.__tfLookbookBound) {
                applyActiveFromSwiper();
                return;
            }
            swiper.__tfLookbookBound = true;

            swiper.on('slideChange', function () {
                applyActiveFromSwiper();
            });
            swiper.on('transitionEnd', function () {
                applyActiveFromSwiper();
            });

            applyActiveFromSwiper();
        }
    };


    /* Notice Popup
    -------------------------------------------------------------------------*/
    const noticePop = () => {
        var $popup = $(".pop-notice-sale");
        var $closeBtn = $(".btn-cl-pop");

        if (!$popup.length) return;

        var showTime = 10000;
        var hideTime = 2000;
        var timerShow, timerHide;
        var stopped = false;

        function showPopup() {
            if (stopped) return;

            $popup.addClass("active");

            timerShow = setTimeout(function () {
                hidePopup();
            }, showTime);
        }

        function hidePopup() {
            if (stopped) return;

            $popup.removeClass("active");

            timerHide = setTimeout(function () {
                showPopup();
            }, hideTime);
        }

        function stopPopupCycle() {
            stopped = true;
            clearTimeout(timerShow);
            clearTimeout(timerHide);
            $popup.removeClass("active");
        }

        $closeBtn.on("click", stopPopupCycle);

        // Stop the show/hide chain when the page is hidden — otherwise the
        // setTimeout pair keeps re-scheduling itself for the lifetime of the
        // tab and blocks bfcache eligibility.
        $(window).on("pagehide", stopPopupCycle);

        setTimeout(function () {
            showPopup();
        }, hideTime);
    }

    /* Offcanvas Quick View
    -------------------------------------------------------------------------*/
    var offcanvasQuickView = () => {
        var scrollContainer = $(".canvas-quickview .wrapper-scroll-quickview");
        var activescrollBtn = null;
        var offsetTolerance = 100;

        function getTargetScroll(target, isHorizontal) {
            if (isHorizontal) {
                return (
                    target.offset().left -
                    scrollContainer.offset().left +
                    scrollContainer.scrollLeft()
                );
            } else {
                return (
                    target.offset().top -
                    scrollContainer.offset().top +
                    scrollContainer.scrollTop()
                );
            }
        }

        function isHorizontalMode() {
            return window.innerWidth < 767;
        }

        $(".btn-scroll-quickview").on("click", function () {
            var scroll = $(this).data("scroll-quickview");
            var target = $(
                `.item-scroll-quickview[data-scroll-quickview='${scroll}']`
            );

            if (target.length > 0) {
                var isHorizontal = isHorizontalMode();
                var targetScroll = getTargetScroll(target, isHorizontal);

                if (isHorizontal) {
                    scrollContainer.animate({ scrollLeft: targetScroll }, 600);
                } else {
                    scrollContainer.animate({ scrollTop: targetScroll }, 600);
                }

                $(".btn-scroll-quickview").removeClass("active");
                $(this).addClass("active");
                activescrollBtn = $(this);
            }
        });

        scrollContainer.on("scroll", function () {
            var isHorizontal = isHorizontalMode();

            $(".item-scroll-quickview").each(function () {
                var targetStart =
                    getTargetScroll($(this), isHorizontal) - offsetTolerance;
                var targetEnd =
                    targetStart +
                    (isHorizontal
                        ? $(this).outerWidth()
                        : $(this).outerHeight()) +
                    offsetTolerance;

                var currentScroll = isHorizontal
                    ? scrollContainer.scrollLeft()
                    : scrollContainer.scrollTop();

                if (currentScroll >= targetStart && currentScroll < targetEnd) {
                    var scroll = $(this).data("scroll-quickview");

                    $(".btn-scroll-quickview").removeClass("active");
                    $(
                        `.btn-scroll-quickview[data-scroll-quickview='${scroll}']`
                    ).addClass("active");
                }
            });
        });
    }

    /* Popup Product Action
    -------------------------------------------------------------------------*/
    var popupProductVariant = () => {
        if ($(".tf-quick-prd_variant").length === 0) return;

        $(".tf-quick-prd_variant").each(function () {
            var $wrap = $(this);
            var basePrice = 0;
            var $activeSize = $wrap.find(".size_btn.active");

            if ($activeSize.length) {
                basePrice = parseFloat($activeSize.data("quick-price"));
            } else {
                var priceText = $wrap.find(".price-on-sale").text();
                basePrice = parseFloat(
                    priceText.replace(/[^0-9.]/g, "")
                );
            }

            if (isNaN(basePrice)) basePrice = 0;
            $wrap.data("basePrice", basePrice);

            $wrap.find(".price-add").text("$" + basePrice.toFixed(2));

            $wrap.find(".color_btn").on("click mouseover", function () {
                var $swatch = $(this);
                var swatchColor = $swatch.find("img").data("src");
                var colorLabel = $swatch.find(".color__label").text().trim();

                $wrap.find(".img-product").attr("src", swatchColor);
                $wrap.find(".picker_color .variant__value").text(colorLabel);

                $wrap.find(".color_btn.active").removeClass("active");
                $swatch.addClass("active");
            });

            $wrap.find(".size_btn:not(.disabled)").on("click", function () {
                var $btn = $(this);
                var price = parseFloat($btn.data("quick-price"));
                var size = $btn.data("quick-size");

                if (isNaN(price)) return;

                $wrap.find(".size_btn.active").removeClass("active");
                $btn.addClass("active");

                $wrap.find(".picker_size .variant__value").text(size);
                $wrap.find(".quantity-product").val(1);
                $wrap.data("basePrice", price);

                $wrap.find(".price-on-sale").text("$" + price.toFixed(2));

                updateAddPrice();
            });

            // NOTE: same fix as totalPriceVariant() above — don't increment the
            // value here, the global [data-bb-toggle='increase-qty'/'decrease-qty']
            // handler already does that and fires "change". This function is
            // re-run every time the quick-shop modal reloads (see the
            // "ecommerce.quick-shop.completed" listener), so binding a second
            // click handler directly on .btn-increase/.btn-decrease was causing
            // every click on the products-page quick-shop popup to add +2.
            $wrap.find(".quantity-product").on("change", function () {
                updateAddPrice();
            });

            function updateAddPrice() {
                var basePrice = parseFloat($wrap.data("basePrice")) || 0;
                var qty = parseInt($wrap.find(".quantity-product").val()) || 1;

                var total = basePrice * qty;
                $wrap.find(".price-add").text("$" + total.toFixed(2));
            }
        });
    };

    /* Write Review
    -------------------------------------------------------------------------*/
    var writeReview = function () {
        $(".write-cancel-review-wrap").on("click", ".btn-comment-review", function () {
            $(this)
                .closest(".write-cancel-review-wrap")
                .toggleClass("write-review");
        });
    };


    /* Scroll Grid Product
------------------------------------------------------------------------------------- */
    var scrollGridProduct = function () {
        var scrollContainer = $(".wrapper-gallery-scroll");
        var activescrollBtn = null;
        var offsetTolerance = 20;

        function isHorizontalMode() {
            return window.innerWidth <= 767;
        }

        function getTargetScroll(target, isHorizontal) {
            if (isHorizontal) {
                return (
                    target.offset().left -
                    scrollContainer.offset().left +
                    scrollContainer.scrollLeft()
                );
            } else {
                return (
                    target.offset().top -
                    scrollContainer.offset().top +
                    scrollContainer.scrollTop()
                );
            }
        }

        $(".btn-scroll-target").on("click", function () {
            var scroll = $(this).data("scroll");
            var target = $(".item-scroll-target[data-scroll='" + scroll + "']");

            if (target.length > 0) {
                var isHorizontal = isHorizontalMode();
                var targetScroll = getTargetScroll(target, isHorizontal);

                if (isHorizontal) {
                    scrollContainer.animate({ scrollLeft: targetScroll }, 600);
                } else {
                    $("html, body").animate({ scrollTop: targetScroll }, 100);
                }

                $(".btn-scroll-target").removeClass("active");
                $(this).addClass("active");
                activescrollBtn = $(this);
            }
        });

        $(window).on("scroll", function () {
            var isHorizontal = isHorizontalMode();
            $(".item-scroll-target").each(function () {
                var target = $(this);
                var targetScroll = getTargetScroll(target, isHorizontal);

                if (isHorizontal) {
                    if (
                        $(window).scrollLeft() >= targetScroll - offsetTolerance &&
                        $(window).scrollLeft() <= targetScroll + target.outerWidth()
                    ) {
                        $(".btn-scroll-target").removeClass("active");
                        $(
                            ".btn-scroll-target[data-scroll='" + target.data("scroll") + "']"
                        ).addClass("active");
                    }
                } else {
                    if (
                        $(window).scrollTop() >= targetScroll - offsetTolerance &&
                        $(window).scrollTop() <= targetScroll + target.outerHeight()
                    ) {
                        $(".btn-scroll-target").removeClass("active");
                        $(
                            ".btn-scroll-target[data-scroll='" + target.data("scroll") + "']"
                        ).addClass("active");
                    }
                }
            });
        });
    };

    /* Circle Text
    -------------------------------------------------------------------------*/
    var circleText = () => {

        if ($(".wg-circular-text").length === 0) return;
        const originalText = document.querySelector('.original-text');
        const text = originalText.textContent.trim();
        const container = document.getElementById('circularText');

        const characters = text.split('');
        const totalCharacters = characters.length;

        const angleStep = 360 / totalCharacters;

        characters.forEach((char, index) => {
            const span = document.createElement('span');
            span.textContent = char;

            const angle = angleStep * index;
            span.style.transform = `rotate(${angle}deg)`;

            container.appendChild(span);
        });
    }

    /* Before / After Image Compare
    -------------------------------------------------------------------------*/
    // Wires the bundled image-compare-viewer vendor (loaded via config.php)
    // to any [before-after-image] shortcode rendered on the page. Each element
    // gets its own ImageCompare instance with the editor-supplied options.
    var beforeAfterImage = function () {
        if (typeof window.ImageCompare !== "function") {
            return;
        }

        $('[data-bb-toggle="before-after-image"]').each(function () {
            var el = this;

            if (el.dataset.bbInitialized === "true") {
                return;
            }

            var orientation = el.dataset.orientation === "vertical" ? "vertical" : "horizontal";
            var controlColor = el.dataset.controlColor || "#ffffff";
            var startPosition = parseInt(el.dataset.startPosition, 10);
            if (isNaN(startPosition) || startPosition < 0 || startPosition > 100) {
                startPosition = 50;
            }

            var options = {
                controlColor: controlColor,
                controlShadow: true,
                addCircle: true,
                addCircleBlur: false,
                showLabels: true,
                labelOptions: {
                    before: el.dataset.labelBefore || (window.amerceI18n && window.amerceI18n.before) || "Before",
                    after: el.dataset.labelAfter || (window.amerceI18n && window.amerceI18n.after) || "After",
                    onHover: false,
                },
                smoothing: true,
                smoothingAmount: 100,
                hoverStart: false,
                verticalMode: orientation === "vertical",
                startingPoint: startPosition,
                fluidMode: false,
            };

            try {
                new window.ImageCompare(el, options).mount();
                el.dataset.bbInitialized = "true";
            } catch (e) {
                // Silent fail — the widget is non-critical (visual flourish).
                // If init breaks, the page continues working without it.
            }
        });
    };

    /* Form Submit Loading State
       Toggles `.btn-loading` on the clicked submit button so .tf-btn.btn-loading
       SCSS rule paints a spinner. Listens to:
         - product-detail Add To Cart / Buy It Now (form posts → page reload)
         - sticky-bottom ATC bar (data-bb-toggle="scroll-to-add-to-cart" relays
           the click to the real ATC button, which then enters loading state)
         - quick-shop modal ATC
       Cleans up via `pageshow` so back/forward bfcache restores don't keep the
       spinner spinning forever.
    -------------------------------------------------------------------------*/
    var formSubmitLoading = function () {
        var stickyBarSelector = ".tf-sticky-btn-atc .btn-add-to-cart, .tf-sticky-btn-atc .btn-buy-now";
        var loadingSelector = [
            ".section-product-single .btn-action-price",
            ".section-product-single button[name='checkout']",
            stickyBarSelector,
            "#quick-shop button[type='submit']"
        ].join(", ");

        $(document).on("click", loadingSelector, function () {
            var $btn = $(this);
            if ($btn.is(":disabled") || $btn.hasClass("btn-disabled") || $btn.hasClass("btn-loading")) return;
            $btn.addClass("btn-loading");
        });

        // Mirror loading onto the real form button when the sticky bar relays a click.
        $(document).on("click", "[data-bb-toggle='scroll-to-add-to-cart']", function () {
            $(".section-product-single .btn-action-price")
                .filter(":not(.btn-disabled)")
                .addClass("btn-loading");
        });
        $(document).on("click", "[data-bb-toggle='scroll-to-buy-now']", function () {
            $(".section-product-single button[name='checkout']")
                .filter(":not(.btn-disabled)")
                .addClass("btn-loading");
        });

        // Clear sticky-bar btn-loading on success — plugin's AJAX `complete`
        // callback only clears the form's submit button, leaving the sticky
        // button stuck in spinner state forever.
        document.addEventListener("ecommerce.cart.added", function () {
            $(stickyBarSelector).removeClass("btn-loading");
        });

        // Failsafe — covers errors and any AJAX path that targets cart endpoints
        // without dispatching ecommerce.cart.added (e.g. server-side validation
        // failures returning {error: true}). For Buy Now the success path
        // navigates away (window.location.href = next_url) so the spinner
        // unloading with the page is acceptable.
        $(document).ajaxComplete(function (_event, _xhr, settings) {
            var url = (settings && settings.url) || "";
            if (url.indexOf("/cart/") !== -1 || url.indexOf("add-to-cart") !== -1) {
                $(stickyBarSelector).removeClass("btn-loading");
            }
        });

        // bfcache restore — back-button navigation re-shows the loading button.
        window.addEventListener("pageshow", function (event) {
            if (event.persisted) $(".tf-btn.btn-loading").removeClass("btn-loading");
        });
    };

    /* Preloader
    -------------------------------------------------------------------------*/
    function preloader() {
        setTimeout(function () {
            $("#preload").fadeOut(300, function () {
                $(this).remove();
            });
        }, 300);
    }

    // Re-bind variant/quantity handlers when the ecommerce plugin AJAX-loads
    // quick-shop modal content. The plugin fires this CustomEvent in
    // platform/plugins/ecommerce/resources/js/front-ecommerce.js on AJAX
    // completion. Without this, .btn-increase / .btn-decrease inside the
    // freshly-injected modal markup have no click handlers.
    document.addEventListener("ecommerce.quick-shop.completed", function () {
        popupProductVariant();
    });

    // Quick-view modal thumb -> main image swap. Markup is injected via AJAX
    // (see views/ecommerce/includes/quick-view.blade.php), so we delegate
    // from #product-quick-view-modal which exists at DOM-ready.
    $(document).on(
        "click",
        "#product-quick-view-modal [data-quick-view-thumb]",
        function (e) {
            e.preventDefault();
            var $thumb = $(this);
            var src = $thumb.attr("data-quick-view-thumb");
            if (!src) return;

            var $modal = $thumb.closest("#product-quick-view-modal");
            $modal
                .find("[data-quick-view-main]")
                .attr("src", src)
                .attr("srcset", "");
            $modal.find("[data-quick-view-thumb]").removeClass("is-active");
            $thumb.addClass("is-active");
        }
    );

    // Sync the theme's [data-cart-count] badges (header, mobile toolbar) with
    // the cart count after add/remove events. The ecommerce plugin natively
    // updates `[data-bb-value="cart-count"]` only — this theme uses its own
    // attribute, so without this listener the badge stays stale until reload.
    function updateCartCountBadges(count) {
        if (typeof count !== "number") return;

        $("[data-cart-count]").each(function () {
            var $el = $(this);
            $el.text(count);
            if (count > 0) {
                $el.removeAttr("hidden");
            } else {
                $el.attr("hidden", "hidden");
            }
        });
    }

    // Toggle a tax row's visibility based on its numeric amount. Used by both
    // the mini-cart panel and the full cart page so a $0.00 tax never clutters
    // the order summary.
    function toggleTaxRowVisibility($row, formattedTax) {
        if (!$row.length) return;
        var amount = parseFloat(
            String(formattedTax || "").replace(/[^0-9.\-]/g, "")
        );
        if (isNaN(amount) || amount <= 0) {
            $row.attr("hidden", "hidden");
        } else {
            $row.removeAttr("hidden");
        }
    }

    // Recompute the mini-cart Tax / Total rows. Prefers the exact server-side
    // values added to the cart event payload by functions.php's
    // `ecommerce_cart_data_for_response` filter (tax_amount + grand_total).
    // Falls back to a rate-based estimate from `data-tax-rate` if those keys
    // aren't present (e.g. on legacy AJAX responses).
    function updateMiniCartTaxTotal(formattedSubtotal, payload) {
        var $totals = $(".tf-mini-cart-totals");
        if (!$totals.length || $totals.attr("data-tax-enabled") !== "1") return;

        var sample = String(formattedSubtotal || "");
        var symbolMatch = sample.match(/[^0-9.,\s\-]+/);
        var currency = symbolMatch ? symbolMatch[0] : "$";

        var newTaxText, newTotalText;

        // Prefer exact server values when the payload carries them.
        if (payload && payload.tax_amount && payload.grand_total) {
            newTaxText = payload.tax_amount;
            newTotalText = payload.grand_total;
        } else {
            var rate = parseFloat($totals.attr("data-tax-rate")) || 0;
            var subtotal = parseFloat(
                String(formattedSubtotal || "").replace(/[^0-9.\-]/g, "")
            );
            if (isNaN(subtotal)) return;
            var tax = subtotal * rate;
            var total = subtotal + tax;
            newTaxText = currency + tax.toFixed(2);
            newTotalText = currency + total.toFixed(2);
        }

        $totals.find("[data-cart-tax]").text(newTaxText);
        $totals.find("[data-cart-total]").text(newTotalText);
        toggleTaxRowVisibility($totals.find("[data-cart-tax-row]"), newTaxText);
    }

    // Free-shipping progress bar in the mini-cart. Reads:
    //   - threshold from data-cart-threshold (server-rendered from theme option)
    //   - subtotal from data.total_price in the cart event (formatted string,
    //     so we strip non-numeric chars before parseFloat)
    // Updates: remaining-amount text, progress bar width, "unlocked" state.
    function updateFreeshipProgress(formattedTotalPrice) {
        var $threshold = $("[data-cart-threshold]");
        if (!$threshold.length) return;

        var threshold = parseFloat($threshold.attr("data-cart-threshold")) || 0;
        if (threshold <= 0) return;

        var subtotal = parseFloat(
            String(formattedTotalPrice || "").replace(/[^0-9.\-]/g, "")
        );
        if (isNaN(subtotal)) {
            // Fallback: parse the visible subtotal text if event didn't carry it.
            subtotal = parseFloat(
                String($("[data-cart-subtotal]").first().text() || "").replace(
                    /[^0-9.\-]/g,
                    ""
                )
            );
        }
        if (isNaN(subtotal)) subtotal = 0;

        var remaining = Math.max(0, threshold - subtotal);
        var progress = Math.min(100, (subtotal / threshold) * 100);
        var unlocked = subtotal >= threshold;

        // Format remaining using the same locale-friendly toLocaleString as
        // updateTotalPrice() above. Currency symbol comes from the existing
        // formatted price text so we don't hardcode "$".
        var currency = "$";
        var sample = String(formattedTotalPrice || $("[data-cart-subtotal]").first().text() || "");
        var symbolMatch = sample.match(/[^0-9.,\s\-]+/);
        if (symbolMatch) currency = symbolMatch[0];

        var remainingText = currency + remaining.toFixed(2);

        $threshold.find("[data-freeship-remaining]").text(remainingText);
        $threshold
            .find(".tf-progress-ship .value")
            .css("width", progress + "%")
            .attr("data-progress", progress);

        if (unlocked) {
            $threshold.attr("data-freeship-unlocked", "");
            $threshold
                .find("[data-cart-threshold-text]")
                .text("🎉 You qualify for free shipping!");
        } else {
            $threshold.removeAttr("data-freeship-unlocked");
        }
    }

    // Apply a server cart payload (data.total_price / tax_amount / grand_total / count)
    // to every order-summary surface — both mini-cart panel and cart page sidebar.
    // This is the single update path used by every cart event (added / removed /
    // qty-changed) so the figures never go out of sync.
    function applyCartTotalsFromPayload(data) {
        if (!data) return;

        if (data.total_price !== undefined) {
            $("[data-cart-subtotal]").text(data.total_price);
            updateFreeshipProgress(data.total_price);
            updateMiniCartTaxTotal(data.total_price, data);
        }
        if (data.tax_amount !== undefined) {
            $("[data-cart-tax]").text(data.tax_amount || "");
            toggleTaxRowVisibility($("[data-cart-tax-row]"), data.tax_amount);
        }
        if (data.grand_total) {
            $("[data-cart-total]").text(data.grand_total);
        }
        if (data.count !== undefined) {
            updateCartCountBadges(data.count);
        }
    }

    // --- Cart-page quantity controls --------------------------------------
    // Mirrors shofy/assets/js/ecommerce.js. The plugin only ships these
    // handlers in front/checkout.js (loaded on checkout page), so cart-page
    // qty buttons stay dead without these. Same data-bb-toggle attrs as the
    // checkout flow so existing markup works.
    function postCartFormUpdate($triggerInput) {
        var $form = $triggerInput.closest("[data-cart-form], form.cart-form");
        if (!$form.length) return;
        var $row = $triggerInput.closest(".tf-cart_item");
        if ($row.length) $row.addClass("is-updating");

        $.ajax({
            type: "POST",
            url: $form.prop("action"),
            data: $form.serialize(),
            dataType: "json",
        })
            .done(function (response) {
                if (response && response.error) {
                    if (window.Theme && Theme.showError) {
                        Theme.showError(response.message || "");
                    }
                    return;
                }

                var data = response && response.data;
                if (!data) return;

                // Mirrors shofy/assets/js/ecommerce.js loadAjaxCart(): swap the
                // entire cart-page area with the freshly server-rendered HTML.
                // This guarantees row totals + sidebar are always in sync with
                // the server, so consecutive qty changes can't drift apart.
                var $cartArea = $("[data-cart-page-area]");
                if ($cartArea.length && data.cart_content) {
                    $cartArea.replaceWith(window.bbSanitizeHtml(data.cart_content));
                }

                // Mini-cart panel + cart-count badges + freeship progress
                // (these live OUTSIDE the cart-page area so the swap above
                // doesn't touch them).
                applyCartTotalsFromPayload(data);
            })
            .fail(function () {
                if (window.Theme && Theme.showError) {
                    Theme.showError("Unable to update cart, please try again.");
                }
            })
            .always(function () {
                if ($row.length) $row.removeClass("is-updating");
            });
    }

    $(document).on("click", "[data-bb-toggle='decrease-qty']", function (e) {
        e.preventDefault();
        var $input = $(this).parent().find("input[type='number']");
        if (!$input.length) return;
        var count = (parseInt($input.val(), 10) || 1) - 1;
        if (count < 1) return;
        $input.val(count).trigger("change");
    });

    $(document).on("click", "[data-bb-toggle='increase-qty']", function (e) {
        e.preventDefault();
        var $input = $(this).parent().find("input[type='number']");
        if (!$input.length) return;
        var max = parseInt($input.prop("max"), 10);
        var current = parseInt($input.val(), 10) || 1;
        if (max && current >= max) return;
        $input.val(current + 1).trigger("change");
    });

    $(document).on("change", "[data-bb-toggle='update-cart']", function () {
        postCartFormUpdate($(this));
    });
    // ----------------------------------------------------------------------

    // --- Mini-cart quantity controls --------------------------------------
    // The plugin's checkout.js wires `data-bb-toggle="decrease-qty"` etc but
    // those handlers only run on the checkout page. Mini-cart needs its own
    // self-contained AJAX → public.cart.update flow.
    function parseCurrencyToFloat(text) {
        var n = parseFloat(String(text || "").replace(/[^0-9.\-]/g, ""));
        return isNaN(n) ? 0 : n;
    }

    function postMiniCartQty($widget) {
        var $row = $widget.closest(".tf-mini-cart-item");
        var $input = $widget.find("[data-bb-toggle='mini-cart-qty']");
        var rowId = $widget.attr("data-cart-row-id");
        var url = $widget.attr("data-cart-update-url");
        var qty = Math.max(1, parseInt($input.val(), 10) || 1);
        var unitPrice = parseFloat($widget.attr("data-line-price")) || 0;
        var token = $('meta[name="csrf-token"]').attr("content");

        if (!rowId || !url) return;

        // Build the items[<rowId>][rowId] / items[<rowId>][values][qty] payload
        // that PublicCartController::update expects.
        var payload = { _token: token };
        payload["items[" + rowId + "][rowId]"] = rowId;
        payload["items[" + rowId + "][values][qty]"] = qty;

        $widget.addClass("is-updating");
        $row.addClass("is-updating");

        $.ajax({
            url: url,
            method: "POST",
            data: payload,
            dataType: "json",
        })
            .done(function (response) {
                if (response && response.error) {
                    if (window.Theme && Theme.showError) {
                        Theme.showError(response.message || "");
                    }
                    return;
                }

                // Update line total from the unit price (cheaper than re-rendering
                // the row; quantity already reflects the new value in the input).
                var lineTotal = unitPrice * qty;
                var sample = $("[data-cart-subtotal]").first().text() || "$";
                var symbolMatch = sample.match(/[^0-9.,\s\-]+/);
                var currency = symbolMatch ? symbolMatch[0] : "$";
                $row
                    .find("[data-mini-cart-line-total]")
                    .text(currency + lineTotal.toFixed(2));

                if (response && response.data) {
                    if (response.data.total_price !== undefined) {
                        $("[data-cart-subtotal]").text(response.data.total_price);
                        updateFreeshipProgress(response.data.total_price);
                        updateMiniCartTaxTotal(response.data.total_price, response.data);
                    }
                    if (response.data.count !== undefined) {
                        updateCartCountBadges(response.data.count);
                    }
                }
            })
            .fail(function () {
                if (window.Theme && Theme.showError) {
                    Theme.showError("Unable to update cart, please try again.");
                }
            })
            .always(function () {
                $widget.removeClass("is-updating");
                $row.removeClass("is-updating");
            });
    }

    $(document).on("click", "[data-bb-toggle='mini-cart-qty-down']", function (e) {
        e.preventDefault();
        var $widget = $(this).closest(".wg-quantity--mini");
        if ($widget.hasClass("is-updating")) return;
        var $input = $widget.find("[data-bb-toggle='mini-cart-qty']");
        var current = parseInt($input.val(), 10) || 1;
        if (current <= 1) return;
        $input.val(current - 1);
        postMiniCartQty($widget);
    });

    $(document).on("click", "[data-bb-toggle='mini-cart-qty-up']", function (e) {
        e.preventDefault();
        var $widget = $(this).closest(".wg-quantity--mini");
        if ($widget.hasClass("is-updating")) return;
        var $input = $widget.find("[data-bb-toggle='mini-cart-qty']");
        $input.val((parseInt($input.val(), 10) || 1) + 1);
        postMiniCartQty($widget);
    });

    $(document).on("change", "[data-bb-toggle='mini-cart-qty']", function () {
        var $widget = $(this).closest(".wg-quantity--mini");
        if ($widget.hasClass("is-updating")) return;
        // Clamp to >= 1
        var qty = Math.max(1, parseInt($(this).val(), 10) || 1);
        $(this).val(qty);
        postMiniCartQty($widget);
    });
    // ----------------------------------------------------------------------

    document.addEventListener("ecommerce.cart.added", function (e) {
        var data = e.detail && e.detail.data;
        applyCartTotalsFromPayload(data);

        // Mini-cart bottom (Subtotal + Checkout + View Cart) gets hidden when
        // the cart starts empty: (1) Blade renders the `hidden` attribute,
        // (2) checkListEmpty() in this file runs at DOMReady and calls
        // jQuery .hide() on .box-empty_clear, leaving inline display:none.
        // The ecommerce plugin re-renders the items slot on add but doesn't
        // touch the bottom — restore both so Checkout reappears.
        if (!data || data.count === undefined || data.count > 0) {
            $("[data-cart-bottom]").removeAttr("hidden").css("display", "");
        }
    });

    document.addEventListener("ecommerce.cart.removed", function (e) {
        var data = e.detail && e.detail.data;

        // Replace the cart-page area with the server-rendered HTML when this
        // event was triggered from the /cart page. Same approach as the qty
        // update handler — eliminates client-side total drift.
        var $cartArea = $("[data-cart-page-area]");
        if ($cartArea.length && data && data.cart_content) {
            $cartArea.replaceWith(window.bbSanitizeHtml(data.cart_content));
        }

        // Mini-cart + badges + freeship — outside the cart-area, update them
        // from the same payload.
        applyCartTotalsFromPayload(data);

        // Plugin's success handler removes `closest('tr')` which works on the
        // cart page table (.tf-cart_item) but doesn't match the mini-cart's
        // <div class="tf-mini-cart-item">. Belt-and-braces: drop the mini-cart
        // row ourselves.
        var $btn = $(e.detail && e.detail.element);
        if ($btn.length) {
            $btn.closest(".tf-mini-cart-item").remove();
        }
        if (data && data.count === 0) {
            $("[data-cart-bottom]").attr("hidden", "hidden");
        }
    });

    /* Auto-Submit Form Inputs
       Delegated change listener for any form control marked `data-auto-submit`.
       Replaces inline `onchange="this.form.submit()"` so the theme is CSP-safe
       and Envato-compliant. Use on category checkboxes, sort selects, etc.
    -------------------------------------------------------------------------*/
    var autoSubmitForm = function () {
        document.addEventListener("change", function (event) {
            var target = event.target;
            if (!target || !target.closest) return;
            var trigger = target.closest("[data-auto-submit]");
            if (!trigger) return;
            var form = trigger.form || (trigger.closest && trigger.closest("form"));
            if (form && typeof form.submit === "function") {
                form.submit();
            }
        });
    };

    /* Copy Share Link
       Self-contained clipboard handler for `[data-bb-toggle="copy-share-link"]`.
       Does NOT delegate to the social-sharing package's clipboard helper because
       its execCommand fallback appends the temp <input> to document.body, which
       Bootstrap marks [inert] when the share modal is open — so input.select()
       fails silently. This handler scopes the temp input INSIDE the modal so
       inert does not apply, then fires Theme.showSuccess / Theme.showError.
       Translation strings come from window.amerceI18n.
    -------------------------------------------------------------------------*/
    var copyShareLink = function () {
        function flipLabel(btn) {
            var idle = btn.querySelector('[data-copy-state="idle"]');
            var done = btn.querySelector('[data-copy-state="done"]');
            if (!idle || !done) return;
            idle.style.display = "none";
            done.style.display = "inline-block";
            setTimeout(function () {
                idle.style.display = "inline-block";
                done.style.display = "none";
            }, 2500);
        }

        function toast(ok, successMsg, errorMsg) {
            if (typeof window.Theme === "undefined") return;
            if (ok && typeof window.Theme.showSuccess === "function") {
                window.Theme.showSuccess(successMsg);
            } else if (!ok && typeof window.Theme.showError === "function") {
                window.Theme.showError(errorMsg);
            }
        }

        function copyViaExecCommand(text, host) {
            var ta = document.createElement("textarea");
            ta.value = text;
            ta.setAttribute("readonly", "");
            ta.style.position = "fixed";
            ta.style.opacity = "0";
            ta.style.pointerEvents = "none";
            ta.style.left = "0";
            ta.style.top = "0";
            (host || document.body).appendChild(ta);
            ta.focus();
            ta.select();
            ta.setSelectionRange(0, text.length);
            var ok = false;
            try { ok = document.execCommand("copy"); } catch (e) { ok = false; }
            ta.parentNode.removeChild(ta);
            return ok;
        }

        document.addEventListener("click", function (event) {
            var btn = event.target.closest && event.target.closest('[data-bb-toggle="copy-share-link"]');
            if (!btn) return;
            event.preventDefault();

            var text = btn.getAttribute("data-clipboard-text") || "";
            var host = btn.closest(".modal-content") || btn.closest(".modal") || document.body;
            var i18n = window.amerceI18n || {};
            var successMsg = i18n.link_copied || "Link copied to clipboard";
            var errorMsg = i18n.copy_failed || "Copy failed, please copy the link manually.";

            var afterCopy = function (ok) {
                if (ok) flipLabel(btn);
                toast(ok, successMsg, errorMsg);
            };

            if (navigator.clipboard && window.isSecureContext) {
                navigator.clipboard.writeText(text).then(
                    function () { afterCopy(true); },
                    function () { afterCopy(copyViaExecCommand(text, host)); }
                );
            } else {
                afterCopy(copyViaExecCommand(text, host));
            }
        });
    };

    /* Store About Toggle
       "Show more / show less" expander used in marketplace store-about block.
       Labels come from `data-label-more` / `data-label-less` attributes so the
       script stays translation-free.
    -------------------------------------------------------------------------*/
    var storeAboutToggle = function () {
        document.querySelectorAll('[data-bb-toggle="store-about"]').forEach(function (root) {
            var btn = root.querySelector("[data-store-about-toggle]");
            var full = root.querySelector("[data-store-about-full]");
            var short = root.querySelector("[data-store-about-short]");
            if (!btn || !full || !short) return;
            if (btn.dataset.bbInitialized === "true") return;
            btn.dataset.bbInitialized = "true";
            btn.addEventListener("click", function (e) {
                e.preventDefault();
                var expanded = full.classList.toggle("d-none") === false;
                short.classList.toggle("d-none", expanded);
                btn.textContent = expanded ? btn.dataset.labelLess : btn.dataset.labelMore;
            });
        });
    };

    /* Banner Thumbs Product — style-6 row-left layout
       The style-6 banner shortcode reuses the standard product-gallery partial
       but flips the thumbnails to the left. We tag the gallery wrapper with
       `row_left` here so the partial doesn't need a shortcode-aware variant.
    -------------------------------------------------------------------------*/
    var bannerThumbsStyle6 = function () {
        var gallery = document.querySelector(".banner-product-single.style-6 .product-thumbs-slider");
        if (gallery) {
            gallery.classList.add("row_left");
        }
    };

    // Dom Ready
    $(function () {
        autoSubmitForm();
        copyShareLink();
        storeAboutToggle();
        bannerThumbsStyle6();
        circleText();
        scrollGridProduct();
        writeReview();
        popupProductVariant();
        offcanvasQuickView();
        headerSticky();
        dropdownSelect();
        btnQuantity();
        deleteFile();
        goTop();
        variantPicker();
        sidebarMobile();
        staggerWrap();
        clickModalSecond();
        autoPopup();
        totalPriceVariant();
        handleProgress();
        handleFooter();
        infiniteSlide();
        addWishList();
        handleSidebarFilter();
        estimateShipping();
        textCopy();
        parallaxie();
        clickActive();
        handleMobileMenu();
        swatchColor();
        customDropdown();
        scrollBottomSticky();
        productTabHash();
        showPassword();
        changeImageDash();
        customSelectCate();
        hoverPin();
        rateClick();
        checkOut();
        counterOdo();
        counter();
        updateBundleTotal();
        filterIsotope();
        reveal();
        handleHoverLookBook();
        noticePop();
        beforeAfterImage();
        formSubmitLoading();

        if (document.readyState === "loading") {
            document.addEventListener("DOMContentLoaded", function () {
                preloader();
            });
        } else {
            preloader();
        }
    });
})(jQuery);
