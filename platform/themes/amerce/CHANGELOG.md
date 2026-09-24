# Changelog

All notable changes to the Amerce theme are documented here.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

---

## [1.0.2] — 2026-06-03

### Fixed

- The two-column FAQ layout (side call-to-action) is now selectable in the page builder, so it no longer reverts to the accordion style after editing and saving a page.
- Plugin content (Loyalty points, E-wallet, etc.) now renders on the product detail and cart pages again — the standard ecommerce injection hooks fire on both.
- On out-of-stock products, the Back in Stock plugin's notify form now honours its Modal / Inline display-mode setting instead of always showing the theme's own form.
- Applied coupon discounts now stay in sync with the cart and are removed automatically when they no longer apply during cart and checkout recalculation.
- The Recently Viewed Products shortcode renders correctly, and the theme no longer errors on older Ecommerce plugin versions (≤ 3.11.7).
- The Simple Slider per-slide button label is now kept when saving.
- Fixed an order-update error caused by orders with negative totals during payment-amount reconciliation.
- Prevent horizontal page drag on mobile when a section overflows the viewport, and the related "layout shifts/compresses behind the login modal" symptom, by clipping horizontal overflow on `body` (`overflow-x: clip`, sticky-safe — keeps the sticky header and add-to-cart bar working).

### Changed

- Removed the non-functional "Card hover effect" theme option — product card hover is controlled by the selected card style. Contained the style-2 product card action buttons so they no longer overflow the card.
- Updated the bundled Botble platform (marketplace, payment) with the latest upstream fixes and improvements.

---

## [1.0.1] — 2026-05-28

### Added
- Per-slide custom button label for the Simple Slider (override the default "Shop Now" on each slide).
- "Sidebar Bullets" widget for the product detail sidebar — a repeater of custom icon + text rows for shipping promises, returns, and store info.
- Mobile "Show Filters" trigger and tap-to-close backdrop so the pinned filter sidebar (Left / Right shop layouts) can be opened on phones and tablets.
- Product card style + hover-effect preview options.

### Fixed
- Social login buttons (Google, Facebook, etc.) now render inside the sign-in and register popups, not only on the dedicated login page.
- "Load More" and "Infinite scroll" pagination on the shop page now fetch and append the next page of products (previously only "Numbered" worked).
- Product image lightbox no longer stretches square or landscape images to a fixed portrait ratio.
- Newsletter popup "Don't show again" checkbox is now visible below the email field.
- Hero Sm / Hero Md thumbnail sizes now save without a "height is required" error.
- Mobile shopping cart display.
- Sticky product bar no longer clips behind the mobile bottom toolbar.
- Header style-9 now shows the mobile logo.
- Corrected `RvMedia::image()` argument order in several shortcode styles.
- Guarded marketplace vendor-info partial and ecommerce/marketplace dependencies so the theme degrades gracefully when those plugins are inactive.

### Changed
- Faster homepage hero loading via preload + responsive `srcset`.
- Reduced interaction lag (INP) on product card hover and popups.
- Eliminated body layout shift when modals open by reserving the scrollbar gutter.
- Lazy-loaded the product picker in the `ecommerce-products` shortcode admin form for large catalogs.
- Optimized image sizes across the theme.

---

## [1.0.0] — 2026-05-19

### Added
- 20 niche-ready home presets (Fashion, Electronics, Furniture, Cosmetics, Organic, Jewelry, Sport, Sneakers, Audio, Podcast, Baby, Pet care, Automotive, Construction, Bags, Decor, Garden, Wellness, Office, Fashion Modern).
- 4 single-product page layouts.
- 9 footer styles.
- 14 header styles + topbar variants.
- 45+ ecommerce-focused shortcodes (hero banners, product grids, lookbooks, brand marquees, category grids, blog post grids, newsletter, testimonials, FAQ, recently viewed, countdowns).
- Full ecommerce flow integration with Botble core (cart, checkout, customer account, wishlist, compare).
- Demo data seeders for every preset.
- SCSS source files.
- 23-language translation pack in `lang/`.
- `subscription_success` / `subscription_failed` translation keys in `layouts/base.blade.php` for newsletter toasts.
- `window.bbEscapeAttr` helper for attribute-context escaping in template literals.
- `support_url`, `demo_url`, and `supported_browsers` fields in `theme.json`.
- `LICENSE.md` — single-site EULA bundled with the theme package.
- `README.md` — quick-start guide for end users.
- `CHANGELOG.md` — this file.
- `cmd_refresh_backup_with_translations_amerce` deploy helper to seed all 20 demo sites at once.
- Lookbook hotspot `style-v2` variant for 2-up banner+products layout.
- `square` wrapper-modifier for product cards.
- `subtitle_position='above'` eyebrow support in `ecommerce-products` shortcode.
- `text-v02` variant for `infinity-marquee`.
- `product-feature-zoom` `style-2-detail` knob suite (wrapper_style, container_class, badge_text, show_thumb_slider, show_buy_it_now, show_action_boxes).
- `style-cards-3` `card_image_size` knob for landscape demo art.
- `style-insights-split` `list_count` knob (default 2, HomeJewelry uses 3).
- `countdown-banner-quad` `outer_spacing_class` knob.

### Fixed
- Mobile quick-view modal froze with no scrollable inner panel — `.tf-product-modal-content` now uses `max-height: calc(100dvh - 3.5rem)` + `overflow-y: auto` under 768px so the modal scrolls natively (with `100vh` fallback for pre-iOS-15.4 Safari).
- Quick-view close button moved out of the scrollable inner panel so it stays pinned to the top-right of `.modal-content` regardless of scroll position.
- Mobile quick-shop modal (Select options) extended past the viewport on variable products with many options — `.modal-body` now caps to `calc(100dvh - 7rem)` with `overflow-y: auto` so the Add-to-Cart button is always reachable.
- Product card action buttons (wishlist / compare / quick-view / remove) stayed inverted (black-on-white) after a mobile tap — `:hover` color flips are now gated behind `@media (hover: hover) and (pointer: fine)`.
- Bottom toolbar (`tf-toolbar-bottom`) no longer overlaps modal footers — hidden whenever `body.modal-open` is active.
- `style-banner-grid-quad` — pass `false` to RvMedia to avoid center-cropping non-square art (HomePod consumer).
- `style-banner-1plus2` — switch from non-square crops to full-bleed image sizing (HomeBag consumer).
- `blog-posts` style-slider — restore `data_preview ?? 3` fallback (was silently outputting 0 for 6 presets).
- `banner-step-feature` (HomeBag) — keep verbatim `syle-3` typo from demo source for brand strip.
- Accessibility + LCP improvements for Lighthouse.
- XSS hardening in cart stock badge and `banner-thumbs` price node.
- Dropped external CDN scripts from product gallery (self-hosted).
- Various seeder + asset pipeline fixes (variant basePath bug, RvMedia 'medium' square-crop trap, count_overrides separator mismatch, slugable relation in seeders).
- Theme.json typos.
- Footer style-1 through style-9 polish.
- Header style-7 polish.
- Lookbook v2 section-wrapper conflict resolved.
- `getLogoImage` baseline-gap regression.

### Changed
- `assets/js/newsletter.js` — toast messages now read from `window.amerceI18n` with safe fallbacks (no more hardcoded English).
- `assets/js/main.js` — sub-menu `href` interpolation now escapes via `bbEscapeAttr` for defense-in-depth.
- `partials/shortcodes/banner-step-feature/index.blade.php` — `Sale` badge string is now translatable via `__()`.
- Scrubbed 3rd-party `themesflat` authorship strings from theme.
- Moved inline `<style>` blocks to SCSS partials.
- Replaced deprecated `.toggle(bool)` jQuery calls in shop.js.
- Replaced `window.alert()` in newsletter.js with toast.
- Added `rel="noreferrer noopener"` on all `target="_blank"` anchors.
- Added accessible name to previously empty anchors.
- Centralized AJAX HTML injection through `window.bbSanitizeHtml`.

---

[Unreleased]: https://github.com/botble/amerce/compare/v1.0.1...HEAD
[1.0.1]: https://github.com/botble/amerce/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/botble/amerce/releases/tag/v1.0.0
