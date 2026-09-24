// Theme JS bundle entry — Vite concatenates these in order.
// jQuery is loaded as a separate <script> tag (registered in config.php) BEFORE this bundle,
// so the IIFE in main.js sees `jQuery` on window when it runs.
import './main.js';
import './dark-mode-toggle.js';
import './carousel.js';
import './featured-tabs.js';
import './shop.js';
import './product-gallery.js';
import './newsletter.js';
