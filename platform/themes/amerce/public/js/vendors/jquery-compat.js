/*!
 * jQuery 4 compatibility shim — restores removed APIs for legacy third-party
 * libraries (jQuery UI sliders, jvectormap, jquery.validate, jquery-jvectormap,
 * Botble core ACL/js-validation, Botble ecommerce range-slider, etc.).
 *
 * Load order: jquery.min.js -> THIS FILE -> everything else that uses jQuery.
 *
 * Why a shim instead of editing each library: those files are third-party
 * (often minified) and shipped by Botble plugins. Patching them in place
 * means re-patching after every `composer update`. The shim is one file
 * we own; new jQuery 4 upgrades just keep working.
 */
(function (root) {
    var $ = root.jQuery || root.$;
    if (!$) {
        // jQuery not on window yet; bail. Loader misordered — fix the include order.
        return;
    }

    // ---- Removed in jQuery 4.0 ----
    if (!$.isArray)         $.isArray         = Array.isArray;
    if (!$.isFunction)      $.isFunction      = function (o) { return typeof o === 'function'; };
    if (!$.isNumeric)       $.isNumeric       = function (n) {
        return n != null && n !== '' && !isNaN(parseFloat(n)) && isFinite(n);
    };
    if (!$.isWindow)        $.isWindow        = function (o) { return o != null && o === o.window; };
    if (!$.trim)            $.trim            = function (s) { return s == null ? '' : String(s).replace(/^[\s﻿\xA0]+|[\s﻿\xA0]+$/g, ''); };
    if (!$.now)             $.now             = Date.now;
    if (!$.parseJSON)       $.parseJSON       = JSON.parse;
    if (!$.proxy)           $.proxy           = function (fn, context) {
        if (typeof fn === 'string') { var s = fn; fn = context[s]; }
        if (typeof fn !== 'function') return undefined;
        var args = Array.prototype.slice.call(arguments, 2);
        return function () { return fn.apply(context, args.concat(Array.prototype.slice.call(arguments))); };
    };
    if (!$.type)            $.type            = function (o) {
        if (o == null) return o + '';
        return typeof o === 'object' || typeof o === 'function'
            ? (Object.prototype.toString.call(o).slice(8, -1).toLowerCase() || 'object')
            : typeof o;
    };

    // ---- Removed instance methods ----
    if ($.fn && !$.fn.size)     $.fn.size     = function () { return this.length; };
    if ($.fn && !$.fn.andSelf)  $.fn.andSelf  = function () { return this.addBack ? this.addBack() : this; };
})(typeof window !== 'undefined' ? window : this);
