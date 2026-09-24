// Product detail gallery — Swiper sliders + Drift hover-zoom + PhotoSwipe lightbox.
// Mirrors html/assets/js/zoom.js from the reference template. Each subsystem is
// guarded so missing libs (Drift, PhotoSwipe) skip silently — only the gallery
// view registers them as assets, so list/home pages skip the work.

(function ($) {
    'use strict';

    var mainSwiper = null;
    var thumbsSwiper = null;
    var photoSwipeLightbox = null;

    function destroyGallerySliders() {
        if (mainSwiper && typeof mainSwiper.destroy === 'function') {
            try { mainSwiper.destroy(true, true); } catch (e) { /* no-op */ }
        }
        if (thumbsSwiper && typeof thumbsSwiper.destroy === 'function') {
            try { thumbsSwiper.destroy(true, true); } catch (e) { /* no-op */ }
        }
        mainSwiper = null;
        thumbsSwiper = null;
    }

    function ensureNavigationControls(mainElement) {
        if (!mainElement) return null;

        var $main = $(mainElement);
        var $next = $main.children('.tf-product-media-next');
        var $prev = $main.children('.tf-product-media-prev');

        if (!$prev.length) {
            $prev = $('<button type="button" class="tf-product-media-prev swiper-button-prev" aria-label="Previous product image"></button>');
            $main.append($prev);
        }

        if (!$next.length) {
            $next = $('<button type="button" class="tf-product-media-next swiper-button-next" aria-label="Next product image"></button>');
            $main.append($next);
        }

        return {
            next: $next[0],
            prev: $prev[0],
        };
    }

    function initGallerySliders() {
        if (typeof Swiper === 'undefined') {
            return;
        }

        var mainElement = document.querySelector('.tf-product-media-main');
        if (!mainElement) {
            return;
        }

        var thumbElement = document.querySelector('.tf-product-media-thumbs');
        var navigation = ensureNavigationControls(mainElement);

        if (thumbElement) {
            var $thumbs = $(thumbElement);
            var direction = $thumbs.data('direction') || 'horizontal';
            var preview = Number($thumbs.data('preview')) || 5;
            var xlPreview = Number($thumbs.data('xl-preview')) || preview;
            var space = Number($thumbs.data('space')) || 8;

            thumbsSwiper = new Swiper(thumbElement, {
                spaceBetween: space,
                slidesPerView: preview,
                freeMode: true,
                watchSlidesProgress: true,
                observer: true,
                observeParents: true,
                allowTouchMove: true,
                touchRatio: 1,
                breakpoints: {
                    0:    { direction: 'horizontal', slidesPerView: 4 },
                    575:  { direction: 'horizontal', slidesPerView: 5 },
                    1200: { direction: direction, slidesPerView: xlPreview },
                },
            });
        }

        mainSwiper = new Swiper(mainElement, {
            spaceBetween: 0,
            slidesPerView: 1,
            observer: true,
            observeParents: true,
            observeSlideChildren: true,
            speed: 500,
            allowTouchMove: true,
            simulateTouch: true,
            touchRatio: 1,
            threshold: 5,
            grabCursor: true,
            keyboard: {
                enabled: true,
                onlyInViewport: true,
            },
            navigation: navigation ? {
                nextEl: navigation.next,
                prevEl: navigation.prev,
            } : undefined,
            thumbs: thumbsSwiper ? { swiper: thumbsSwiper } : undefined,
            on: {
                init: function (swiper) {
                    swiper.update();
                },
            },
        });

        if (navigation) {
            var updateNavigationState = function () {
                var total = mainSwiper ? mainSwiper.slides.length : 0;
                var disabled = total <= 1;
                navigation.prev.disabled = disabled;
                navigation.next.disabled = disabled;
                $(navigation.prev).toggleClass('swiper-button-disabled', disabled);
                $(navigation.next).toggleClass('swiper-button-disabled', disabled);
            };

            mainSwiper.on('slideChange', updateNavigationState);
            mainSwiper.on('update', updateNavigationState);
            updateNavigationState();
        }
    }


    // Drift side-pane zoom — only at >=1200px (matches reference behaviour).
    // Hovering a `.tf-image-zoom` projects a magnified view into `.tf-zoom-main`.
    function initDriftZoom() {
        if (typeof Drift === 'undefined') return;

        var pane = document.querySelector('.tf-zoom-main');
        var images = document.querySelectorAll('.tf-image-zoom');
        if (! pane || ! images.length) return;

        function apply() {
            var isDesktop = window.matchMedia('(min-width: 1200px)').matches;
            images = document.querySelectorAll('.tf-image-zoom');
            images.forEach(function (el) {
                if (isDesktop && ! el._drift) {
                    el._drift = new Drift(el, {
                        zoomFactor: 2,
                        paneContainer: pane,
                        inlinePane: false,
                        handleTouch: false,
                        hoverBoundingBox: true,
                        containInline: true,
                    });
                } else if (! isDesktop && el._drift) {
                    el._drift.destroy();
                    el._drift = null;
                }
            });
        }

        apply();
        // Stash on window so swatch-rebuild can re-apply against fresh <img> nodes.
        window.__amerceDriftApply = apply;
        window.addEventListener('resize', apply);
    }

    // Delegated mouseenter/mouseleave so the .zoom-active toggle survives gallery
    // rebuilds (when the swatch handler swaps in fresh <img.tf-image-zoom> nodes).
    function initZoomActiveCue() {
        $(document)
            .off('mouseenter.amerce-zoom mouseleave.amerce-zoom', '.tf-image-zoom')
            .on('mouseenter.amerce-zoom', '.tf-image-zoom', function () {
                $(this).closest('.section-image-zoom').addClass('zoom-active');
            })
            .on('mouseleave.amerce-zoom', '.tf-image-zoom', function () {
                $(this).closest('.section-image-zoom').removeClass('zoom-active');
            });
    }

    // PhotoSwipe click-to-fullscreen lightbox bound to the main slider.
    // Keeps the slider in sync when the user navigates inside the lightbox.
    function initPhotoSwipeLightbox() {
        if (typeof PhotoSwipeLightbox === 'undefined' || typeof PhotoSwipe === 'undefined') return;
        if (! document.querySelector('#gallery-swiper-started')) return;

        // Destroy a stale instance — its internal item list won't include rebuilt slides.
        if (photoSwipeLightbox && typeof photoSwipeLightbox.destroy === 'function') {
            try { photoSwipeLightbox.destroy(); } catch (e) { /* no-op */ }
            photoSwipeLightbox = null;
        }

        try {
            photoSwipeLightbox = new PhotoSwipeLightbox({
                gallery: '#gallery-swiper-started',
                children: 'a',
                pswpModule: PhotoSwipe,
                bgOpacity: 1,
                secondaryZoomLevel: 2,
                maxZoomLevel: 3,
            });
            photoSwipeLightbox.init();

            photoSwipeLightbox.on('change', function () {
                if (mainSwiper) mainSwiper.slideTo(photoSwipeLightbox.pswp.currIndex, 0, false);
            });
        } catch (e) { /* lightbox is non-essential */ }
    }

    // Click-to-play overlay for MP4 video slides — mirrors shofy's pattern.
    // The button is absolutely positioned over the <video poster>; clicking it
    // unmutes, plays, and tags the wrapper with `.bb-product-video-playing` so
    // CSS can hide the overlay. Browser's native controls take over from there.
    function initPlayButton() {
        $(document).on('click', '.bb-button-trigger-play-video', function (e) {
            e.preventDefault();
            var $btn = $(this);
            var video = document.getElementById($btn.data('target'));
            if (! video) return;

            video.muted = false;
            video.controls = true;
            var p = video.play();
            if (p && typeof p.catch === 'function') {
                p.catch(function () { /* autoplay blocked — user must click again */ });
            }

            var $wrap = $btn.closest('.bb-product-video');
            $wrap.addClass('bb-product-video-playing');

            video.addEventListener('ended', function () {
                $wrap.removeClass('bb-product-video-playing');
                video.currentTime = 0;
                video.controls = false;
                video.pause();
            });
            video.addEventListener('pause', function () {
                if (! video.ended) {
                    $wrap.removeClass('bb-product-video-playing');
                    video.controls = false;
                }
            });
        });
    }

    // Build a single main-slide <a> wrapper for an image URL.
    // data-pswp-{width,height} start blank — normalizeZoomDimensions() fills them
    // from the image's natural dimensions once it loads. PhotoSwipe v5 reads the
    // attributes on click, so the lazy fill is safe.
    function buildMainSlide(url, alt, index) {
        var safeAlt = $('<div>').text(alt || '').html();
        return ''
            + '<div class="swiper-slide" data-image-index="' + index + '">'
            +   '<a href="' + url + '" target="_blank" class="item" data-pswp-width="0" data-pswp-height="0">'
            +     '<img loading="lazy" class="tf-image-zoom" data-zoom="' + url + '" src="' + url + '" alt="' + safeAlt + '">'
            +   '</a>'
            + '</div>';
    }

    // Read each .tf-image-zoom's natural dimensions and stamp them onto both
    // the parent <a data-pswp-width/height> AND the IMG width/height attrs.
    //
    // Why: the server-rendered gallery templates (product-gallery-*.blade.php)
    // and the JS-built variant slides historically hardcoded 576x768 (a 3:4
    // box). PhotoSwipe then opens the modal with that aspect, so square (1:1)
    // and landscape source images get squashed. Reading naturalWidth/Height
    // and writing them back makes PhotoSwipe scale to the real aspect.
    //
    // Idempotent — safe to call after every gallery rebuild. Images that
    // haven't loaded yet get a one-time `load` listener; cached images are
    // updated immediately.
    function normalizeZoomDimensions(root) {
        var scope = root || document;
        var images = scope.querySelectorAll('img.tf-image-zoom');

        images.forEach(function (img) {
            if (img._amerceZoomBound) return;
            img._amerceZoomBound = true;

            var apply = function () {
                var w = img.naturalWidth;
                var h = img.naturalHeight;
                if (! w || ! h) return;

                img.setAttribute('width', w);
                img.setAttribute('height', h);

                var link = img.closest('a');
                if (link) {
                    link.setAttribute('data-pswp-width', w);
                    link.setAttribute('data-pswp-height', h);
                }
            };

            if (img.complete && img.naturalWidth) {
                apply();
            } else {
                img.addEventListener('load', apply, { once: true });
            }
        });
    }

    function buildThumbSlide(url, alt) {
        var safeAlt = $('<div>').text(alt || '').html();
        return ''
            + '<div class="swiper-slide stagger-item">'
            +   '<div class="item">'
            +     '<img loading="lazy" width="82" height="110" src="' + url + '" alt="' + safeAlt + '">'
            +   '</div>'
            + '</div>';
    }

    // Identify slides that wrap a real video player (MP4/iframe) — we preserve these
    // so a swatch swap doesn't erase the variation's video. The legacy templates'
    // `.tf-btn-video` overlay on the first thumb is NOT a real video slide and is
    // intentionally not preserved (it's a per-image overlay, not a separate slide).
    function isVideoMainSlide($slide) {
        return $slide.is('[data-slide-type="video"]') || $slide.find('.bb-product-video').length > 0;
    }

    function isVideoThumbSlide($slide) {
        return $slide.find('.tf-video-thumb-item').length > 0;
    }

    // Escape user-controlled text before injecting into HTML strings.
    function escapeHtml(str) {
        return $('<div>').text(str == null ? '' : String(str)).html();
    }

    // Re-render the amerce-style stock badge from the AJAX response. The plugin's
    // default handler targets `.number-items-available` (shofy markup) which
    // doesn't exist here; we render the same semantic info using amerce's badge
    // styling so users see live availability when they switch variations.
    function updateAvailabilityBadge(data) {
        var $availability = $('.tf-product-availability');
        if (! $availability.length) return;

        var html = '';
        if (data.error_message) {
            html = '<span class="badge bg-danger text-danger-fg"><i class="icon icon-X2"></i>' + escapeHtml(data.error_message) + '</span>';
        } else if (data.warning_message) {
            html = '<span class="badge bg-warning text-warning-fg"><i class="icon icon-Timer"></i>' + escapeHtml(data.warning_message) + '</span>';
        } else if (data.success_message) {
            html = '<span class="badge bg-success text-success-fg"><i class="icon icon-CheckCircle1"></i>' + escapeHtml(data.success_message) + '</span>';
        } else {
            // No message — leave the SSR-rendered badge intact (e.g. plain "In stock").
            return;
        }
        $availability.html(html);
    }

    // Swap the gallery slides to match the variation's images. Called from the
    // change-product-swatches AJAX success hook with `data.image_with_sizes`.
    // Mirrors shofy/plugin pattern: destroy slider → rewrite markup → re-init.
    function rebuildGalleryFromVariation(data) {
        if (! data || ! data.image_with_sizes) return;

        var origin = Array.isArray(data.image_with_sizes.origin) ? data.image_with_sizes.origin : [];
        var thumb  = Array.isArray(data.image_with_sizes.thumb)  ? data.image_with_sizes.thumb  : [];

        if (! origin.length) return;

        var $main   = $('.tf-product-media-main .swiper-wrapper').first();
        var $thumbs = $('.tf-product-media-thumbs .swiper-wrapper').first();

        // The main gallery must always be rebuilt. A thumbnail rail is optional.
        // Previously, the function returned when the thumb rail was missing, which
        // left the selected variation image visible but killed gallery navigation.
        if (! $main.length) return;

        var alt = data.name || $('.product-infor-name').text() || '';

        // A selected variation owns its gallery. Do not carry the parent
        // product's video or previous variation slides into the new gallery.
        var uniqueOrigin = [];
        for (var i = 0; i < origin.length; i++) {
            if (origin[i] && uniqueOrigin.indexOf(origin[i]) === -1) {
                uniqueOrigin.push(origin[i]);
            }
        }

        var imageMainHtml = '';
        for (var j = 0; j < uniqueOrigin.length; j++) {
            imageMainHtml += buildMainSlide(uniqueOrigin[j], alt, j);
        }

        var thumbSource = thumb.length ? thumb : uniqueOrigin;
        var imageThumbHtml = '';
        for (var k = 0; k < thumbSource.length; k++) {
            if (thumbSource[k]) {
                imageThumbHtml += buildThumbSlide(thumbSource[k], alt);
            }
        }

        // Destroy the old instances before touching their DOM. Otherwise Swiper
        // retains stale slide references and touch events after a variant swap.
        destroyGallerySliders();

        $main.html(imageMainHtml);

        if ($thumbs.length) {
            $thumbs.html(imageThumbHtml);
        }

        initGallerySliders();

        requestAnimationFrame(function () {
            if (thumbsSwiper && typeof thumbsSwiper.update === 'function') {
                thumbsSwiper.update();
                thumbsSwiper.slideTo(0, 0, false);
            }

            if (mainSwiper && typeof mainSwiper.update === 'function') {
                mainSwiper.update();
                mainSwiper.slideTo(0, 0, false);
            }

            if (typeof window.__amerceDriftApply === 'function') {
                window.__amerceDriftApply();
            } else {
                initDriftZoom();
            }

            normalizeZoomDimensions();
            initPhotoSwipeLightbox();
        });
    }


    // The theme templates do not include navigation controls. Add the small
    // amount of positioning needed for the controls created above. This is
    // intentionally scoped to the product gallery so it cannot affect other Swipers.
    function ensureGalleryNavigationStyles() {
        if (document.getElementById('amerce-product-gallery-navigation-styles')) return;

        var style = document.createElement('style');
        style.id = 'amerce-product-gallery-navigation-styles';
        style.textContent =
            '.tf-product-media-main{position:relative;overflow:hidden;}' +
            '.tf-product-media-main .swiper-wrapper{width:100%;}' +
            '.tf-product-media-main .swiper-slide{width:100%;flex-shrink:0;}' +
            '.tf-product-media-main .swiper-slide img{display:block;width:100%;height:auto;}' +
            '.tf-product-media-thumbs{display:none!important;}' +
            '.tf-product-media-main>.tf-product-media-prev,.tf-product-media-main>.tf-product-media-next{' +
                'position:absolute;z-index:20;top:50%;transform:translateY(-50%);' +
                'width:42px;height:42px;border:0;border-radius:50%;' +
                'display:flex;align-items:center;justify-content:center;' +
                'background:rgba(255,255,255,.92);box-shadow:0 2px 10px rgba(0,0,0,.12);' +
                'cursor:pointer;}' +
            '.tf-product-media-main>.tf-product-media-prev{left:12px;}' +
            '.tf-product-media-main>.tf-product-media-next{right:12px;}' +
            '.tf-product-media-main>.tf-product-media-prev.swiper-button-disabled,.tf-product-media-main>.tf-product-media-next.swiper-button-disabled{' +
                'opacity:.35;cursor:default;}' +
            '@media(max-width:767px){' +
                '.tf-product-media-main>.tf-product-media-prev,.tf-product-media-main>.tf-product-media-next{width:36px;height:36px;}' +
            '}';
        document.head.appendChild(style);
    }

    // Additive hook honoured by ecommerce plugin's change-product-swatches.js
    // (runs AFTER EcommerceApp.defaultOnChangeSwatchesSuccess, which targets
    // `.bb-product-gallery-*` and is a no-op against this Swiper-based gallery).
    var previousOnChangeSwatchesSuccess = window.onChangeSwatchesSuccess;
    window.onChangeSwatchesSuccess = function (response, element) {
        if (typeof previousOnChangeSwatchesSuccess === 'function') {
            try { previousOnChangeSwatchesSuccess(response, element); } catch (e) { /* no-op */ }
        }

        if (! response || response.error || ! response.data) return;
        rebuildGalleryFromVariation(response.data);
        updateAvailabilityBadge(response.data);
    };

    $(function () {
        ensureGalleryNavigationStyles();
        initGallerySliders();
        initDriftZoom();
        initZoomActiveCue();
        normalizeZoomDimensions();
        initPhotoSwipeLightbox();
        initPlayButton();
    });
})(jQuery);
