# Amerce — Multipurpose Botble Ecommerce Theme

Multi-purpose ecommerce theme for Botble CMS. Ships with **20 niche-ready home presets** (fashion, electronics, furniture, cosmetics, organic, jewelry, sport, sneakers, audio, podcast, baby, pet care, automotive, construction, bags, decor, garden, wellness, office, fashion-modern).

**Live demo:** https://amerce.botble.com

---

## Requirements

- Botble CMS **7.x or later** (sold separately at https://botble.com)
- PHP **8.3+** (8.4 supported) with extensions: BCMath, Ctype, JSON, Mbstring, OpenSSL, PDO, Tokenizer, XML, Fileinfo, GD
- MySQL **5.7+** / MariaDB **10.3+**
- Composer (for Botble core install)
- Node.js **18+** (only if recompiling assets — built assets ship with the theme)

## Quick Start

1. **Install Botble CMS core** following https://docs.botble.com
2. **Unzip** this package into `platform/themes/amerce/` of your Botble install
3. **Activate** the theme: log into Botble admin → **Appearance → Themes** → click **Activate** on Amerce
4. **Pick a preset:** **Appearance → Theme Options → Preset** → select one of the 20 home presets
5. **Seed demo data** (optional but recommended for first-time setup):
   ```
   php artisan theme:assets:publish amerce
   php artisan db:seed --class="Theme\\Amerce\\Seeders\\AmerceSeeder"
   ```
   (Replace `AmerceSeeder` with the preset-specific seeder class if you want a single niche only.)
6. **Configure** menus, payment gateways, shipping methods in Botble admin.

Full documentation (installation, Theme Options reference, developer customization guide): see **https://docs.botble.com/amerce/**

## What's Included

- 20 home presets (each with bespoke layouts + demo data)
- 4 single-product page layouts
- 9 footer styles
- Multiple header styles + topbar variants
- 30+ ecommerce shortcodes
- Blog (list + single)
- Contact, About, FAQ pages
- 404 + Maintenance pages
- SCSS source files
- Demo data seeders

## Support

- **6 months free support** included with every license (see `LICENSE.md` §4).
- **Response SLA:** 48 business hours (Asia/Saigon, GMT+7).
- **Contact:** email address on your purchase receipt.

## License

Single-site license — see `LICENSE.md` for full terms.

## Changelog

See `CHANGELOG.md`.

---

**Botble Technologies** — https://botble.com
