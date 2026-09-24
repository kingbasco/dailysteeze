/**
 * Dark Mode Toggle Handler
 * 
 * Toggles between light and dark themes via the [data-action="toggle-theme-mode"] button.
 * Persists the user's choice in localStorage (wrapped in try/catch for Safari private mode).
 * Uses jQuery .on() for event delegation (Envato Botble standard).
 */

$(document).on('click', '[data-action="toggle-theme-mode"]', function () {
    var current = document.documentElement.getAttribute('data-bs-theme') || 'light';
    var next = current === 'dark' ? 'light' : 'dark';
    
    // Update the data-bs-theme attribute
    document.documentElement.setAttribute('data-bs-theme', next);
    
    // Update body class for CSS hooks
    document.documentElement.classList.toggle('is_dark', next === 'dark');
    document.documentElement.classList.toggle('is_light', next === 'light');
    
    // Persist user choice to localStorage (safe in private mode via try/catch)
    try {
        localStorage.setItem('amerce-theme-mode', next);
    } catch (e) {
        // Silent fail in Safari private mode or when localStorage is unavailable
    }
});
