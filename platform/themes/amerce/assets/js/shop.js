(function ($) {
    "use strict";

    /* Range Two Price
  -------------------------------------------------------------------------------------*/
    var rangeTwoPrice = function () {
        if ($("#price-value-range").length > 0 && typeof noUiSlider !== "undefined") {
            var skipSlider = document.getElementById("price-value-range");
            var skipValues = [document.getElementById("price-min-value"), document.getElementById("price-max-value")];

            var min = parseInt(skipSlider.getAttribute("data-min"), 10) || 0;
            var max = parseInt(skipSlider.getAttribute("data-max"), 10) || 500;

            noUiSlider.create(skipSlider, {
                start: [min, max],
                connect: true,
                step: 1,
                range: {
                    min: min,
                    max: max,
                },
                format: {
                    from: function (value) {
                        return parseInt(value, 10);
                    },
                    to: function (value) {
                        return parseInt(value, 10);
                    },
                },
            });

            skipSlider.noUiSlider.on("update", function (val, e) {
                skipValues[e].innerText = val[e];
            });
        }
    };

    /* Filter Products
  -------------------------------------------------------------------------------------*/
    var filterProducts = function () {
        const priceSlider = document.getElementById("price-value-range");
        if (!priceSlider || !priceSlider.noUiSlider) return;

        const minPrice = parseInt(priceSlider.dataset.min, 10) || 0;
        const maxPrice = parseInt(priceSlider.dataset.max, 10) || 500;

        const filters = {
            minPrice: minPrice,
            maxPrice: maxPrice,
            category: [],
            size: [],
            color: null,
            availability: null,
            brand: null,
        };

        priceSlider.noUiSlider.on("update", function (values) {
            filters.minPrice = parseInt(values[0], 10);
            filters.maxPrice = parseInt(values[1], 10);

            $("#price-min-value").text(filters.minPrice);
            $("#price-max-value").text(filters.maxPrice);

            applyFilters();
            updateMetaFilter();
            updatePagination();
        });
        $('input[name="category"]').on("change", function () {
            const categoryId = $(this).attr("id");
            const label = $(`label[for="${categoryId}"]`);
            const categoryLabel = label.find(".cate-text").text().trim();

            if ($(this).is(":checked")) {
                filters.category.push({ id: categoryId, label: categoryLabel });
            } else {
                filters.category = filters.category.filter((cate) => cate.id !== categoryId);
            }
            applyFilters();
            updateMetaFilter();
            updatePagination();
        });
        $('input[name="size"]').on("change", function () {
            const sizeId = $(this).attr("id");
            const label = $(`label[for="${sizeId}"]`);
            const sizeLabel = label.find(".size-text").text().trim();

            if ($(this).is(":checked")) {
                filters.size.push({ id: sizeId, label: sizeLabel });
            } else {
                filters.size = filters.size.filter((cate) => cate.id !== sizeId);
            }
            applyFilters();
            updateMetaFilter();
            updatePagination();
        });
        $('input[name="color"]').on("change", function () {
            const colorId = $(this).attr("id");
            const label = $(`label[for="${colorId}"]`);
            filters.color = label.find(".color-text").text().trim();
            applyFilters();
            updateMetaFilter();
            updatePagination();
        });
        $('input[name="availability"]').on("change", function () {
            var i18n = window.amerceI18n || {};
            filters.availability = $(this).attr("id") === "inStock"
                ? (i18n.in_stock || "In Stock")
                : (i18n.out_of_stock || "Out of stock");
            applyFilters();
            updateMetaFilter();
            updatePagination();
        });
        $('input[name="brand"]').on("change", function () {
            const brandId = $(this).attr("id");
            const label = $(`label[for="${brandId}"]`);
            filters.brand = label.find(".brand-text").text().trim();
            applyFilters();
            updateMetaFilter();
            updatePagination();
        });

        function updatePagination() {
            if ($(".meta-filter-shop").hasClass("active") == true) {
                $("#listLayout .wd-full").css("display", "none");
                $("#gridLayout .wd-full").css("display", "none");
            }
        }
        function updateMetaFilter() {
            const appliedFilters = $("#applied-filters");
            const metaFilterShop = $(".meta-filter-shop");
            appliedFilters.empty();
            if (filters.minPrice > minPrice || filters.maxPrice < maxPrice) {
                appliedFilters.append(
                    `<span class="filter-tag remove-tag" data-filter="price"><span class="icon icon-X2"></span>$${filters.minPrice} - $${filters.maxPrice}</span>`
                );
            }
            if (filters.category.length > 0) {
                filters.category.forEach((cate) => {
                    appliedFilters.append(
                        `<span class="filter-tag remove-tag" data-filter="category" data-value="${cate.id}"><span class="icon icon-X2"></span> ${cate.label}</span>`
                    );
                });
            }
            if (filters.size.length > 0) {
                filters.size.forEach((siz) => {
                    appliedFilters.append(
                        `<span class="filter-tag remove-tag" data-filter="size" data-value="${siz.id}"><span class="icon icon-X2"></span> ${siz.label}</span>`
                    );
                });
            }
            if (filters.color) {
                appliedFilters.append(
                    `<span class="filter-tag remove-tag " data-filter="color"><span class="icon icon-X2"></span>${filters.color}</span>`
                );
            }
            if (filters.availability) {
                appliedFilters.append(
                    `<span class="filter-tag remove-tag" data-filter="availability"><span class="icon icon-X2"></span>${filters.availability} </span>`
                );
            }
            if (filters.brand) {
                appliedFilters.append(
                    `<span class="filter-tag remove-tag " data-filter="brand"><span class="icon icon-X2"></span>${filters.brand}</span>`
                );
            }

            const hasFiltersApplied = appliedFilters.children().length > 0;
            metaFilterShop.toggleClass("d-none", !hasFiltersApplied);
            metaFilterShop.toggleClass("active", hasFiltersApplied);
            $("#remove-all").toggleClass("d-none", !hasFiltersApplied);
        }

        $("#applied-filters").on("click", ".remove-tag", function () {
            const filterType = $(this).data("filter");
            const filterValue = $(this).data("value");

            if (filterType === "price") {
                filters.minPrice = minPrice;
                filters.maxPrice = maxPrice;
                priceSlider.noUiSlider.set([minPrice, maxPrice]);
            }
            if (filterType === "category") {
                filters.category = filters.category.filter((cate) => cate.id !== filterValue);
                $(`input[name="category"][id="${filterValue}"]`).prop("checked", false);
            }
            if (filterType === "size") {
                filters.size = filters.size.filter((siz) => siz.id !== filterValue);
                $(`input[name="size"][id="${filterValue}"]`).prop("checked", false);
            }
            if (filterType === "color") {
                filters.color = null;
                $('input[name="color"]').prop("checked", false);
            }
            if (filterType === "availability") {
                filters.availability = null;
                $('input[name="availability"]').prop("checked", false);
            }
            if (filterType === "brand") {
                filters.brand = null;
                $('input[name="brand"]').prop("checked", false);
            }



            applyFilters();
            updateMetaFilter();
        });

        function resetAllFilters() {
            filters.availability = null;
            filters.minPrice = minPrice;
            filters.maxPrice = maxPrice;
            filters.category = [];
            filters.size = [];
            filters.color = null;
            filters.brand = null;

            priceSlider.noUiSlider.set([minPrice, maxPrice]);
            $('input[name="category"]').prop("checked", false);
            $('input[name="size"]').prop("checked", false);
            $('input[name="color"]').prop("checked", false);
            $('input[name="availability"]').prop("checked", false);
            $('input[name="brand"]').prop("checked", false);


            applyFilters();
            updateMetaFilter();
        }

        $("#remove-all,#reset-filter,.remove-all-filters").on("click", function () {
            resetAllFilters();
        });

        $(".reset-price").on("click", function () {
            filters.minPrice = minPrice;
            filters.maxPrice = maxPrice;
            priceSlider.noUiSlider.set([minPrice, maxPrice]);
            applyFilters();
            updateMetaFilter();
        });

        function applyFilters() {
            let visibleProductCountGrid = 0;
            let visibleProductCountList = 0;

            $(".wrapper-shop .card-product").each(function () {
                const product = $(this);
                let showProduct = true;

                const priceText = product.find(".price-new").text().replace("$", "");
                const price = parseFloat(priceText);

                if (price < filters.minPrice || price > filters.maxPrice) {
                    showProduct = false;
                }
                if (filters.category.length > 0) {
                    const cateId = product.data("category");
                    if (!filters.category.some(c => c.id === cateId)) {
                        showProduct = false;
                    }
                }
                if (filters.size.length > 0) {
                    const productSizes = product.find(".product-size_list .size-item")
                        .map(function () {
                            return $(this).text().trim();
                        })
                        .get();

                    const selectedSizes = filters.size.map(s => s.label.trim());
                    const hasMatch = selectedSizes.some(size => productSizes.includes(size));
                    if (!hasMatch) showProduct = false;
                }

                if (filters.color && !product.find(`.color-swatch:contains('${filters.color}')`).length) {
                    showProduct = false;
                }
                if (filters.availability) {
                    const availabilityStatus = product.data("availability");
                    if (filters.availability !== availabilityStatus) {
                        showProduct = false;
                    }
                }
                if (filters.brand) {
                    const brand = product.data("brand");
                    if (brand !== filters.brand) {
                        showProduct = false;
                    }
                }

                product.toggle(showProduct);

                if (showProduct) {
                    if (product.hasClass("grid")) {
                        visibleProductCountGrid++;
                    } else if (product.hasClass("product-style_list")) {
                        visibleProductCountList++;
                    }
                }
            });

            var i18n = window.amerceI18n || {};
            var singular = i18n.product_singular || "Product";
            var plural = i18n.product_plural || "Products";
            var foundLabel = i18n.products_found_label || "found";

            $("#product-count-grid").html(
                `<span class="count">${visibleProductCountGrid}</span> ${visibleProductCountGrid === 1 ? singular : plural} ${foundLabel}`
            );

            $("#product-count-list").html(
                `<span class="count">${visibleProductCountList}</span> ${visibleProductCountList === 1 ? singular : plural} ${foundLabel}`
            );
        }
    };

    /* Filter Sort
    -------------------------------------------------------------------------------------*/
    var filterSort = function () {
        let isListActive = $(".sw-layout-list").hasClass("active");
        let originalProductsList = $("#listLayout .card-product").clone();
        let originalProductsGrid = $("#gridLayout .card-product").clone();
        let paginationList = $("#listLayout .wd-full").clone();
        let paginationGrid = $("#gridLayout .wd-full").clone();

        $(".select-item").on("click", function () {
            const sortValue = $(this).data("sort-value");
            $(".select-item").removeClass("active");
            $(this).addClass("active");
            $(".text-sort-value").text($(this).find(".text-value-item").text());

            applyFilter(sortValue, isListActive);
            $("#listLayout .wd-full").remove();
            $("#gridLayout .wd-full").remove();

            if ($(".meta-filter-shop").hasClass("active")) {
                $("#listLayout").append(paginationList.clone().css("display", "none"));
                $("#gridLayout").append(paginationGrid.clone().css("display", "none"));
            } else {
                $("#listLayout").append(paginationList.clone().css("display", "flex"));
                $("#gridLayout").append(paginationGrid.clone().css("display", "flex"));
            }
        });

        $(".tf-view-layout-switch").on("click", function () {
            const layout = $(this).data("value-layout");

            if (layout === "list") {
                isListActive = true;
                $("#gridLayout").hide();
                $("#listLayout").show();
            } else {
                isListActive = false;
                $("#listLayout").hide();
                setGridLayout(layout);
            }
        });

        function applyFilter(sortValue, isListActive) {
            let products;

            if (isListActive) {
                products = $("#listLayout .card-product");
            } else {
                products = $("#gridLayout .card-product");
            }

            if (sortValue === "best-selling") {
                if (isListActive) {
                    $("#listLayout").empty().append(originalProductsList.clone());
                } else {
                    $("#gridLayout").empty().append(originalProductsGrid.clone());
                }
                bindProductEvents();
                return;
            }

            if (sortValue === "price-low-high") {
                products.sort(
                    (a, b) =>
                        parseFloat($(a).find(".price-new").text().replace("$", "")) - parseFloat($(b).find(".price-new").text().replace("$", ""))
                );
            } else if (sortValue === "price-high-low") {
                products.sort(
                    (a, b) =>
                        parseFloat($(b).find(".price-new").text().replace("$", "")) - parseFloat($(a).find(".price-new").text().replace("$", ""))
                );
            } else if (sortValue === "a-z") {
                products.sort((a, b) => $(a).find(".name-product").text().localeCompare($(b).find(".name-product").text()));
            } else if (sortValue === "z-a") {
                products.sort((a, b) => $(b).find(".name-product").text().localeCompare($(a).find(".name-product").text()));
            }

            if (isListActive) {
                $("#listLayout").empty().append(products);
            } else {
                $("#gridLayout").empty().append(products);
            }

            bindProductEvents();
        }

        function setGridLayout(layoutClass) {
            $("#gridLayout").show().removeClass().addClass(`wrapper-shop tf-grid-layout ${layoutClass}`);
            $(".tf-view-layout-switch").removeClass("active");
            $(`.tf-view-layout-switch[data-value-layout="${layoutClass}"]`).addClass("active");
        }
        function bindProductEvents() {
            if ($(".card-product").length > 0) {
                $(".color-swatch").on("click mouseover", function () {
                    var swatchColor = $(this).find("img").attr("src");
                    var imgProduct = $(this).closest(".card-product").find(".img-product");
                    imgProduct.attr("src", swatchColor);
                    $(this).closest(".card-product").find(".color-swatch.active").removeClass("active");
                    $(this).addClass("active");
                });
            }
            $(".size-box")
                .off("click", ".size-item")
                .on("click", ".size-item", function () {
                    $(this).closest(".size-box").find(".size-item").removeClass("active");
                    $(this).addClass("active");
                });
        }
        bindProductEvents();
    };

    /* Switch Layout 
    -------------------------------------------------------------------------------------*/
    var swLayoutShop = function () {
        let isListActive = $(".sw-layout-list").hasClass("active");
        let userSelectedLayout = null;

        function hasValidLayout() {
            return (
                $("#gridLayout").hasClass("tf-col-1") ||
                $("#gridLayout").hasClass("tf-col-2") ||
                $("#gridLayout").hasClass("tf-col-3") ||
                $("#gridLayout").hasClass("tf-col-4") ||
                $("#gridLayout").hasClass("tf-col-5") ||
                $("#gridLayout").hasClass("tf-col-6") ||
                $("#gridLayout").hasClass("tf-col-7")
            );
        }

        function updateLayoutDisplay() {
            const windowWidth = $(window).width();
            const currentLayout = $("#gridLayout").attr("class");

            if (!hasValidLayout()) {
                // Page does not contain a valid layout (2-7 columns), skipping layout adjustments.
                return;
                return;
            }

            if (isListActive) {
                $("#gridLayout").hide();
                $("#listLayout").show();
                $(".wrapper-control-shop").addClass("listLayout-wrapper").removeClass("gridLayout-wrapper");
                return;
            }

            if (userSelectedLayout) {
                if (windowWidth <= 767) {
                    setGridLayout("tf-col-2");
                } else if (windowWidth <= 1200 && userSelectedLayout !== "tf-col-2") {
                    setGridLayout("tf-col-3");
                } else if (
                    windowWidth <= 1400 &&
                    (userSelectedLayout === "tf-col-5" || userSelectedLayout === "tf-col-6" || userSelectedLayout === "tf-col-7")
                ) {
                    setGridLayout("tf-col-4");
                } else {
                    setGridLayout(userSelectedLayout);
                }
                return;
            }
            if (windowWidth <= 767) {
                if (!currentLayout.includes("tf-col-2")) {
                    setGridLayout("tf-col-2");
                }
            } else if (windowWidth <= 1200) {
                if (!currentLayout.includes("tf-col-3")) {
                    setGridLayout("tf-col-3");
                }
            } else if (windowWidth <= 1401) {
                if (currentLayout.includes("tf-col-5") || currentLayout.includes("tf-col-6") || currentLayout.includes("tf-col-7")) {
                    setGridLayout("tf-col-4");
                }
            } else {
                $("#listLayout").hide();
                $("#gridLayout").show();
                $(".wrapper-control-shop").addClass("gridLayout-wrapper").removeClass("listLayout-wrapper");
            }
        }

        function setGridLayout(layoutClass) {
            $("#listLayout").hide();
            $("#gridLayout").show().removeClass().addClass(`wrapper-shop tf-grid-layout ${layoutClass}`);
            $(".tf-view-layout-switch").removeClass("active");
            $(`.tf-view-layout-switch[data-value-layout="${layoutClass}"]`).addClass("active");
            $(".wrapper-control-shop").addClass("gridLayout-wrapper").removeClass("listLayout-wrapper");
            isListActive = false;
        }

        $(document).ready(function () {
            if (isListActive) {
                $("#gridLayout").hide();
                $("#listLayout").show();
                $(".wrapper-control-shop").addClass("listLayout-wrapper").removeClass("gridLayout-wrapper");
            } else {
                $("#listLayout").hide();
                $("#gridLayout").show();
                updateLayoutDisplay();
            }
        });

        $(window).on("resize", () => {
            updateLayoutDisplay();
        });

        $(".tf-view-layout-switch").on("click", function () {
            const layout = $(this).data("value-layout");
            $(".tf-view-layout-switch").removeClass("active");
            $(this).addClass("active");
            $(".wrapper-control-shop").addClass("loading-shop");
            setTimeout(() => {
                $(".wrapper-control-shop").removeClass("loading-shop");
                if (isListActive) {
                    $("#gridLayout").css("display", "none");
                    $("#listLayout").css("display", "");
                } else {
                    $("#listLayout").css("display", "none");
                    $("#gridLayout").css("display", "");
                }
            }, 500);

            if (layout === "list") {
                isListActive = true;
                userSelectedLayout = null;
                $("#gridLayout").hide();
                $("#listLayout").show();
                $(".wrapper-control-shop").addClass("listLayout-wrapper").removeClass("gridLayout-wrapper");
            } else {
                userSelectedLayout = layout;
                setGridLayout(layout);
            }
        });
    };

    /* Loading product 
    -------------------------------------------------------------------------------------*/
    var loadProduct = function () {
        const gridInitialItems = 8;
        const listInitialItems = 4;
        const gridItemsPerPage = 4;
        const listItemsPerPage = 2;

        let listItemsDisplayed = listInitialItems;
        let gridItemsDisplayed = gridInitialItems;
        let scrollTimeout;

        function hideExtraItems(layout, itemsDisplayed) {
            layout.find(".loadItem").each(function (index) {
                if (index >= itemsDisplayed) {
                    $(this).addClass("hidden");
                }
            });
            if (layout.is("#listLayout")) updateLastVisible(layout);
        }

        function showMoreItems(layout, itemsPerPage, itemsDisplayed) {
            const hiddenItems = layout.find(".loadItem.hidden");

            setTimeout(function () {
                hiddenItems.slice(0, itemsPerPage).removeClass("hidden");
                if (layout.is("#listLayout")) updateLastVisible(layout);
                checkLoadMoreButton(layout);
            }, 600);

            return itemsDisplayed + itemsPerPage;
        }

        function updateLastVisible(layout) {
            layout.find(".loadItem").removeClass("last-visible");
            layout.find(".loadItem").not(".hidden").last().addClass("last-visible");
        }
        function checkLoadMoreButton(layout) {
            if (layout.find(".loadItem.hidden").length === 0) {
                if (layout.is("#listLayout")) {
                    $("#loadMoreListBtn").hide();
                    $("#infiniteScrollList").hide();
                } else if (layout.is("#gridLayout")) {
                    $("#loadMoreGridBtn").hide();
                    $("#infiniteScrollGrid").hide();
                }
            }
        }

        hideExtraItems($("#listLayout"), listItemsDisplayed);
        hideExtraItems($("#gridLayout"), gridItemsDisplayed);

        $("#loadMoreListBtn").on("click", function () {
            listItemsDisplayed = showMoreItems($("#listLayout"), listItemsPerPage, listItemsDisplayed);
        });

        $("#loadMoreGridBtn").on("click", function () {
            gridItemsDisplayed = showMoreItems($("#gridLayout"), gridItemsPerPage, gridItemsDisplayed);
        });

        function onScroll() {
            clearTimeout(scrollTimeout);
            scrollTimeout = setTimeout(function () {
                const infiniteScrollList = $("#infiniteScrollList");
                const infiniteScrollGrid = $("#infiniteScrollGrid");

                if (infiniteScrollList.is(":visible") && isElementInViewport(infiniteScrollList)) {
                    listItemsDisplayed = showMoreItems($("#listLayout"), listItemsPerPage, listItemsDisplayed);
                }

                if (infiniteScrollGrid.is(":visible") && isElementInViewport(infiniteScrollGrid)) {
                    gridItemsDisplayed = showMoreItems($("#gridLayout"), gridItemsPerPage, gridItemsDisplayed);
                }
            }, 300);
        }
        function isElementInViewport(el) {
            const rect = el[0].getBoundingClientRect();
            return (
                rect.top >= 0 &&
                rect.left >= 0 &&
                rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
                rect.right <= (window.innerWidth || document.documentElement.clientWidth)
            );
        }
        $(window).on("scroll", onScroll);
    };

    /* Handle Dropdown Filter 
    -------------------------------------------------------------------------------------*/
    var handleDropdownFilter = function () {
        if ($(".wrapper-filter-dropdown").length > 0) {
            $(".btn-filterDropdown").on("click", function (event) {
                event.stopPropagation();
                $(".filter-drawer-wrap").toggleClass("show");
                $(this).toggleClass("active");
                var icon = $(this).find(".icon");
                if ($(this).hasClass("active")) {
                    icon.removeClass("icon-filter").addClass("icon-X2");
                } else {
                    icon.removeClass("icon-X2").addClass("icon-filter");
                }
                if ($(window).width() <= 1199) {
                    $(".overlay-filter").addClass("show");
                }
            });
            $(document).on("click", function (event) {
                if (!$(event.target).closest(".wrapper-filter-dropdown").length) {
                    $(".filter-drawer-wrap").removeClass("show");
                    $(".btn-filterDropdown").removeClass("active");
                    $(".btn-filterDropdown .icon").removeClass("icon-X2").addClass("icon-filter");
                }
            });
            $(".close-filter ,.overlay-filter").on("click", function () {
                $(".filter-drawer-wrap").removeClass("show");
                $(".btn-filterDropdown").removeClass("active");
                $(".btn-filterDropdown .icon").removeClass("icon-X2").addClass("icon-filter");
                $(".overlay-filter").removeClass("show");
            });
        }
    };

    /* Load More / Infinite Scroll — AJAX pagination for the shop archive grid.
       Templates pagination-load-more.blade.php and pagination-infinite.blade.php
       emit #loadMoreBtn with data-url pointing at the next page. On click (or
       scroll-near-bottom for infinite mode) we fetch that URL, parse out the
       new .card-product nodes from the response's #productsLayout, append them
       to the local grid, then rotate the data-url to the next page or hide the
       button when last page reached.

       Replaces the legacy limitLayout() that targeted stale #gridLayout /
       #listLayout selectors and was a client-side-only show/hide of items
       already in the DOM — incompatible with server-side pagination, where
       only the first page is ever in the DOM.
    -------------------------------------------------------------------------------------*/
    function paginationLoadMore() {
        const $productsLayout = $("#productsLayout");
        const $btn = $("#loadMoreBtn");

        if (! $productsLayout.length || ! $btn.length) return;

        const $wrapper = $btn.closest('[data-bb-toggle="load-more-wrapper"], [data-bb-toggle="infinite-scroll-wrapper"]');
        const isInfinite = $btn.hasClass("infinite-scroll");

        let isLoading = false;
        let pendingRequest = null;

        function nextUrl() {
            return $btn.attr("data-url") || $wrapper.attr("data-url") || "";
        }

        function setNextUrl(url) {
            if (url) {
                $btn.attr("data-url", url);
                $wrapper.attr("data-url", url);
            }
        }

        function hideWrapper() {
            $wrapper.hide();
        }

        function isNearViewport() {
            if (! $btn.length || ! $btn.is(":visible")) return false;
            const rect = $btn[0].getBoundingClientRect();
            const vh = window.innerHeight || document.documentElement.clientHeight;
            return rect.top <= vh * 1.1;
        }

        function loadMore() {
            const url = nextUrl();

            if (isLoading || ! url) return;

            isLoading = true;
            $btn.addClass("loading").prop("disabled", true);

            pendingRequest = $.get(url);

            pendingRequest
                .done(function (html) {
                    const $doc = $("<div>").append($.parseHTML(html));
                    const $newCards = $doc.find("#productsLayout .card-product");

                    if ($newCards.length) {
                        $productsLayout.append($newCards);
                    }

                    // Rotate to the next page's URL from the response. Both
                    // pagination partials emit data-url on the wrapper AND
                    // the button; either tells us if more pages remain.
                    const $newWrapper = $doc.find('[data-bb-toggle="load-more-wrapper"], [data-bb-toggle="infinite-scroll-wrapper"]');
                    const $newBtn = $doc.find("#loadMoreBtn");
                    const newUrl = $newBtn.attr("data-url") || $newWrapper.attr("data-url") || "";

                    if (newUrl && $newWrapper.length) {
                        setNextUrl(newUrl);
                    } else {
                        // Last page reached — hasMorePages() is false in the
                        // response so the wrapper wasn't rendered at all.
                        hideWrapper();
                    }

                    // Refresh lazy-load tracking on new <img data-src> nodes.
                    // Theme.lazyLoadInstance is set up by Botble's lazyload.min.js
                    // when theme_option('lazy_load_images') is on — same code path
                    // ecommerce filter AJAX uses (EcommerceApp.updateLazyLoad).
                    if (typeof Theme !== "undefined" && Theme.lazyLoadInstance) {
                        Theme.lazyLoadInstance.update();
                    }

                    // Notify any other modules that want to rebind on new cards
                    // (wishlist hearts, quick-view, swatches, etc.).
                    $(document).trigger("amerce:cards-appended", [$newCards]);
                })
                .always(function () {
                    isLoading = false;
                    pendingRequest = null;
                    $btn.removeClass("loading").prop("disabled", false);

                    // Infinite mode: if button is still in/near viewport after
                    // appending, keep going. Capped by the !url early-return.
                    if (isInfinite && isNearViewport() && nextUrl()) {
                        loadMore();
                    }
                });
        }

        $btn.off("click.amercePagination").on("click.amercePagination", function (event) {
            event.preventDefault();
            loadMore();
        });

        if (isInfinite) {
            $(window).off("scroll.amercePagination").on("scroll.amercePagination", function () {
                if (! $btn.is(":visible") || isLoading) return;
                if (isNearViewport()) loadMore();
            });
            // Trigger once on init in case the page is short enough that the
            // button is already in view without scrolling.
            if (isNearViewport()) loadMore();
        }

        // Filter integration: the ecommerce plugin's filter AJAX replaces
        // #productsLayout content with filtered first-page cards but doesn't
        // touch the sibling pagination wrapper, so its data-url still points
        // at page 2 of the UNfiltered result. Rather than render a broken
        // load-more button, hide the wrapper on filter success — visitors can
        // still narrow further with filters, and numbered pagination remains
        // available via the URL ?page= param. Abort any in-flight pagination
        // fetch so its cards don't land in the now-filtered grid.
        document.addEventListener("ecommerce.product-filter.success", function () {
            if (pendingRequest && pendingRequest.abort) {
                pendingRequest.abort();
                pendingRequest = null;
                isLoading = false;
            }
            hideWrapper();
        });
    }


    /* Product Filters Top — wires the data-action controls in
       views/ecommerce/includes/product-filters-top.blade.php against the live
       #productsLayout grid. The legacy filterSort/swLayoutShop helpers above
       target #gridLayout/#listLayout IDs that the current template no longer
       emits, so those click handlers no-op. This one is the live wiring.
    -------------------------------------------------------------------------*/
    var productFiltersTop = function () {
        var $form = $('form[data-bb-toggle="product-filters-top"]');
        if (! $form.length) return;

        var $layoutInput = $form.find('input[name="layout"]');
        var $sortHidden = $form.find('select[data-bb-toggle="sort-select"]');

        // Grid ↔ List always requires a server re-render — the card markup
        // itself differs (product/style-X/list.blade.php vs grid.blade.php).
        // Density (columns per row) is now an admin Theme Option; no
        // client-side class-swap shortcuts to maintain.
        $form.on('click', '[data-action="set-layout"]', function () {
            var $btn = $(this);
            var layout = ($btn.data('layout') || '').toString().toLowerCase();
            if (layout !== 'grid' && layout !== 'list') return;

            if ($layoutInput.length) {
                $layoutInput.val(layout);
            }
            $form.trigger('submit');
        });

        // Sort dropdown items → write hidden select, update label, submit.
        $form.on('click', '[data-action="set-sort"]', function () {
            var $item = $(this);
            var value = $item.data('sort-value');
            if (value === undefined || value === null) return;

            $item.closest('.dropdown-menu').find('.select-item').removeClass('active');
            $item.addClass('active');
            $form.find('.text-sort-value').text($item.find('.text-value-item').text());

            if ($sortHidden.length) {
                $sortHidden.val(String(value));
            }

            $form.trigger('submit');
        });

        // Per-page select → submit on change.
        $form.on('change', '[data-action="set-per-page"]', function () {
            $form.trigger('submit');
        });
    };

    $(function () {
        rangeTwoPrice();
        filterProducts();
        filterSort();
        loadProduct();
        handleDropdownFilter();
        swLayoutShop();
        paginationLoadMore();
        productFiltersTop();
    });
})(jQuery);
