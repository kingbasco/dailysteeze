// Build descriptor consumed by the root vite-build.mjs pipeline.
// Format: { js: [...], sass: [...] } — the root pipeline maps each entry to
// public/themes/amerce/{js|css}/<name>.{js|css} and (in production) also to
// platform/themes/amerce/public/{js|css}/<name>.{js|css}.
export default {
    js: [
        { src: 'assets/js/script.js', out: 'script.js' },
    ],
    sass: [
        { src: 'assets/sass/theme.scss', out: 'theme.css' },
        { src: 'assets/sass/ecommerce.scss', out: 'ecommerce.css' },
        { src: 'assets/sass/marketplace.scss', out: 'marketplace.css' },
        { src: 'assets/sass/rtl.scss', out: 'rtl.css' },
    ],
};
