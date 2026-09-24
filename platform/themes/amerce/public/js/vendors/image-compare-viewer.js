/**
 * Init wrapper for the [before-after-image] shortcode.
 *
 * Iterates every `.image-compare` element on the page and mounts a separate
 * ImageCompare instance per element. Reads per-element data attributes so each
 * slider can carry its own labels / orientation / start position / color.
 *
 * Companion to image-compare-viewer.min.js (the library, which exposes
 * `window.ImageCompare`).
 */
(() => {
  if (typeof window === "undefined" || typeof window.ImageCompare !== "function") return;

  const elements = document.querySelectorAll(".image-compare");
  if (!elements.length) return;

  elements.forEach((el) => initOne(el));

  function initOne(imageCompareElement) {
    // Skip if this element doesn't carry the two required <img> children — keeps
    // the helper from blowing up on partials still rendering misconfigured state
    // (admin warning blocks, lazy clones, etc.).
    if (imageCompareElement.querySelectorAll("img").length < 2) return;
    if (imageCompareElement.dataset.icvMounted === "1") return;
    imageCompareElement.dataset.icvMounted = "1";

    const dataset = imageCompareElement.dataset || {};
    const startPos = Number.parseFloat(dataset.startPosition);
    const options = {
      controlColor: dataset.controlColor || "#FFFFFF",
      controlShadow: false,
      addCircle: true,
      addCircleBlur: true,
      smoothing: false,
      showLabels: true,
      labelOptions: {
        before: dataset.labelBefore || "Before",
        after: dataset.labelAfter || "After",
      },
      maxHeight: 720,
      verticalMode: dataset.orientation === "vertical",
      startingPoint: Number.isFinite(startPos) ? startPos : 50,
    };

    new ImageCompare(imageCompareElement, options).mount();

    const getControl = () => imageCompareElement.querySelector(".icv__control");
    const getLabelBefore = () => imageCompareElement.querySelector(".icv__label-before");
    const getLabelAfter = () => imageCompareElement.querySelector(".icv__label-after");

    const isOverlapX = (a, b) => a.left < b.right && a.right > b.left;

    const adjustLabelOpacity = () => {
      const control = getControl();
      const lb = getLabelBefore();
      const la = getLabelAfter();
      if (!control || !lb || !la) return;

      const controlRect = control.getBoundingClientRect();
      const beforeRect = lb.getBoundingClientRect();
      const afterRect = la.getBoundingClientRect();

      lb.style.opacity = isOverlapX(controlRect, beforeRect) ? "0" : "1";
      la.style.opacity = isOverlapX(controlRect, afterRect) ? "0" : "1";
    };

    let rafId = 0;
    const rafAdjust = () => {
      if (rafId) cancelAnimationFrame(rafId);
      rafId = requestAnimationFrame(() => {
        rafId = 0;
        adjustLabelOpacity();
      });
    };

    imageCompareElement.addEventListener("mousemove", rafAdjust, { passive: true });
    imageCompareElement.addEventListener("touchmove", rafAdjust, { passive: true });

    let dragging = false;
    const onPointerDown = (e) => {
      const control = getControl();
      if (control && (e.target === control || control.contains(e.target))) {
        dragging = true;
        rafAdjust();
      }
    };
    const onPointerMove = () => {
      if (dragging) rafAdjust();
    };
    const onPointerUp = () => {
      if (dragging) {
        dragging = false;
        rafAdjust();
      }
    };

    document.addEventListener("pointerdown", onPointerDown, { passive: true });
    document.addEventListener("pointermove", onPointerMove, { passive: true });
    document.addEventListener("pointerup", onPointerUp, { passive: true });

    window.addEventListener("load", rafAdjust);
    window.addEventListener("resize", rafAdjust);

    // Retry — labels/control are injected after mount, may not be in the DOM
    // on the first frame.
    let tries = 0;
    const interval = setInterval(() => {
      tries++;
      rafAdjust();
      if (getControl() && getLabelBefore() && getLabelAfter()) clearInterval(interval);
      if (tries >= 30) clearInterval(interval);
    }, 50);

    setTimeout(rafAdjust, 0);
  }
})();
