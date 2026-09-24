/**
 * Amerce theme-side ecommerce JS bridge.
 * Add-to-cart, wishlist, compare, quick-shop are handled by the Botble plugin's
 * front-ecommerce.js via [data-bb-toggle="..."] selectors. This file only adds
 * theme-specific behaviour: mini-cart drawer, swatches, countdown, coupon copy,
 * and the show.bs.modal AJAX loader for #product-quick-view-modal.
 *
 * Envato hard rules respected: jQuery `.on()` only, no inline event handlers,
 * no CDN URLs.
 */
(function ($) {
    'use strict';

    if (typeof window.amerceEcommerce !== 'undefined') {
        return;
    }

    var countdownTimers = [];

    var Amerce = {

        config: {
            miniCartUrl:    '/cart/fragment',
            countdownSel:   '[data-countdown]',
            miniCartElId:   'shoppingCart',
            miniCartContId: 'mini-cart-content',
        },

        init: function () {
            this.bindMiniCartToggle();
            this.bindQuickViewModal();
            this.bindSwatches();
            this.bindCouponCopy();
            this.initCountdown(this.config.countdownSel);
        },

        // ---------- Quick view modal (Bootstrap show.bs.modal — fetches trigger's data-url) ----------
        // NOTE: Bootstrap 5 dispatches show.bs.modal as a native CustomEvent;
        // jQuery's $(document).on('show.bs.modal', ...) does NOT catch it.
        // Use native addEventListener once on the modal element directly.
        bindQuickViewModal: function () {
            var self = this;
            var modalEl = document.getElementById('product-quick-view-modal');
            if (! modalEl || modalEl.dataset.bbBound === '1') return;
            modalEl.dataset.bbBound = '1';

            modalEl.addEventListener('show.bs.modal', function (event) {
                var $modal = $(modalEl);
                var $trigger = $(event.relatedTarget);
                var url = $trigger.data('url') || $trigger.attr('href');

                if (!url || url === '#') {
                    return;
                }

                var $content = $modal.find('.modal-content');

                $.ajax({
                    url: url,
                    type: 'GET',
                    beforeSend: function () {
                        $trigger.addClass('btn-loading');
                        $content.css('min-height', '40rem').html('<div class="text-center py-5"><div class="spinner-border" role="status"></div></div>');
                    },
                    success: function (response) {
                        if (response && response.error) {
                            return;
                        }

                        var html = response && response.data ? response.data : response;
                        $content.css('min-height', '0').html(html);

                        $(document).trigger('shortcode.loaded');
                        $(document).trigger('ecommerce.quick-view.initialized');
                        self.initCountdown(self.config.countdownSel);
                    },
                    error: function () {
                        self.toast('Quick view unavailable', 'error');
                    },
                    complete: function () {
                        $trigger.removeClass('btn-loading');
                    },
                });
            });

            // Quick-view thumbnail click → swap the main image (delegated; markup is AJAX-injected).
            modalEl.addEventListener('click', function (event) {
                var thumb = event.target.closest('[data-quick-view-thumb]');
                if (! thumb) return;
                var mainImg = modalEl.querySelector('[data-quick-view-main]');
                if (mainImg) mainImg.src = thumb.getAttribute('data-quick-view-thumb');
                modalEl.querySelectorAll('.quick-view-gallery__thumb.is-active').forEach(function (t) { t.classList.remove('is-active'); });
                thumb.classList.add('is-active');
            });
        },

        // ---------- Mini-cart drawer ----------
        // The drawer (#shoppingCart) is opened via Bootstrap's native
        // [data-bs-toggle="offcanvas"] in the header — we hook into its show
        // event to lazy-refresh the cart contents.
        bindMiniCartToggle: function () {
            var self = this;
            var el = document.getElementById(this.config.miniCartElId);
            if (! el || el.dataset.miniCartBound === '1') return;
            el.dataset.miniCartBound = '1';

            el.addEventListener('show.bs.offcanvas', function () {
                self.loadAjaxCart(false);
            });
        },

        loadAjaxCart: function (force) {
            var self = this;
            var $container = $('#' + this.config.miniCartContId);
            if (!$container.length) return;
            if (!force && $container.data('loaded')) return;

            $container.html('<div class="text-center py-4"><div class="spinner-border" role="status"></div></div>');

            $.ajax({
                url: this.config.miniCartUrl,
                type: 'GET',
                dataType: 'json',
            }).done(function (response) {
                if (response && typeof response.data === 'string') {
                    $container.html(response.data).data('loaded', true);
                    self.updateMiniCartTotals(response);
                } else {
                    $container.html('<div class="text-center text-muted py-4">Cart unavailable.</div>');
                }
            }).fail(function () {
                $container.html('<div class="text-center text-muted py-4">Cart unavailable.</div>');
            });
        },

        updateMiniCartTotals: function (response) {
            if (response.subtotal !== undefined) {
                $('[data-cart-subtotal]').text(response.subtotal);
            }

            var count = parseInt(response.count, 10);
            if (! isNaN(count)) {
                // Header / toolbar badges hide themselves when count is 0 via
                // the `hidden` attr, so we must toggle it explicitly here.
                $('[data-cart-count]').text(count).prop('hidden', count === 0);
                $('[data-cart-bottom]').prop('hidden', count === 0);
            }
        },

        // ---------- Swatches (radio change → image + price refresh) ----------
        bindSwatches: function () {
            this.initSwatches('.product-swatch, .tf-product-attrs');

            $(document).on('change', '.product-swatch input[type="radio"], .tf-product-attrs input[type="radio"]', function () {
                var $root  = $(this).closest('[data-product-id]');
                var $img   = $root.find('[data-swatch-image]');
                var newSrc = $(this).data('image');

                if (newSrc && $img.length) {
                    $img.attr('src', newSrc);
                }

                $(document).trigger('amerce.swatch.changed', [$(this).val(), $root.data('product-id')]);
            });
        },

        initSwatches: function (selector) {
            $(selector).each(function () {
                var $checked = $(this).find('input[type="radio"]:checked').first();

                if ($checked.length) {
                    $checked.trigger('change');
                }
            });
        },

        // ---------- Coupon copy ----------
        bindCouponCopy: function () {
            $(document).on('click', '[data-action="copy-coupon"]', function (event) {
                event.preventDefault();

                var code = $(this).data('coupon');

                if (!code) {
                    return;
                }

                if (navigator.clipboard && typeof navigator.clipboard.writeText === 'function') {
                    navigator.clipboard.writeText(String(code));
                    Amerce.toast('Coupon code copied', 'success');

                    return;
                }

                var $temp = $('<textarea>').val(String(code)).appendTo('body').select();

                try {
                    document.execCommand('copy');
                    Amerce.toast('Coupon code copied', 'success');
                } catch (err) {
                    /* noop */
                }

                $temp.remove();
            });
        },

        // ---------- Countdown timers (data-target-date) ----------
        initCountdown: function (selector) {
            $(selector).each(function () {
                var $el = $(this);

                if ($el.data('countdown-init')) {
                    return;
                }

                $el.data('countdown-init', true);

                var targetDate = new Date($el.data('target-date') || $el.data('date'));

                if (isNaN(targetDate.getTime())) {
                    return;
                }

                var pad = function (value) {
                    return String(value).padStart(2, '0');
                };

                var timerId;

                var tick = function () {
                    var now = new Date();
                    var distance = targetDate.getTime() - now.getTime();

                    if (distance <= 0) {
                        $el.find('[data-days],[data-hours],[data-minutes],[data-seconds],[data-countdown-days],[data-countdown-hours],[data-countdown-minutes],[data-countdown-seconds]').text('00');

                        if (timerId) {
                            window.clearInterval(timerId);
                        }

                        return;
                    }

                    var days = Math.floor(distance / 86400000);
                    var hours = Math.floor((distance % 86400000) / 3600000);
                    var minutes = Math.floor((distance % 3600000) / 60000);
                    var seconds = Math.floor((distance % 60000) / 1000);

                    $el.find('[data-days],[data-countdown-days]').text(pad(days));
                    $el.find('[data-hours],[data-countdown-hours]').text(pad(hours));
                    $el.find('[data-minutes],[data-countdown-minutes]').text(pad(minutes));
                    $el.find('[data-seconds],[data-countdown-seconds]').text(pad(seconds));
                };

                tick();
                timerId = window.setInterval(tick, 1000);
                countdownTimers.push(timerId);
            });

            $(document).trigger('shortcode.countdown.initialized');
        },

        // ---------- Toast ----------
        toast: function (message, type) {
            type = type || 'info';
            var $stack = $('#amerce-toast-stack');
            if (!$stack.length) {
                $stack = $('<div id="amerce-toast-stack" class="toast-container position-fixed top-0 end-0 p-3" style="z-index:1080"></div>').appendTo('body');
            }
            var bgClass = type === 'success' ? 'bg-success text-success-fg'
                        : type === 'error'   ? 'bg-danger text-danger-fg'
                        : 'bg-secondary text-secondary-fg';
            var $toast = $('<div class="toast ' + bgClass + '" role="alert"><div class="toast-body"></div></div>').appendTo($stack);
            $toast.find('.toast-body').text(message);
            if (typeof bootstrap !== 'undefined' && bootstrap.Toast) {
                var t = bootstrap.Toast.getOrCreateInstance($toast[0], { delay: 3000 });
                t.show();
                $toast.on('hidden.bs.toast', function () { $toast.remove(); });
            } else {
                setTimeout(function () { $toast.remove(); }, 3000);
            }
        },
    };

    window.amerceEcommerce = Amerce;

    $(document).ready(function () {
        Amerce.init();
    });

    // Re-init when shortcodes inject new DOM
    $(document).on('shortcode.loaded', function () {
        Amerce.init();
    });

    // Refresh mini-cart drawer when Botble's add-to-cart fires.
    document.addEventListener('ecommerce.cart.added', function () {
        Amerce.loadAjaxCart(true);
    });

    // Clear countdown intervals on navigation away to prevent leaks
    $(window).on('beforeunload', function () {
        countdownTimers.forEach(function (id) {
            window.clearInterval(id);
        });

        countdownTimers = [];
    });

})(jQuery);
