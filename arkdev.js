(function () {
    'use strict';
    const ArkDev = Object.freeze({
        version: "4.0.0",
        platform: "Ark Dev | Ecommerce Page Web",
        website: "https://arkdev.pages.dev",
        timestamp: new Date().toISOString(),
    });
    Object.defineProperty(window, 'ArkDev', {
        value: ArkDev,
        writable: false, 
        configurable: false, 
        enumerable: false  
    });
    const styles = {
        main: `
            color: #ffffff;
            background: linear-gradient(90deg, #000000, #1a1a1a);
            padding: 8px 12px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 4px 0 0 4px;
            font-family: monospace;
        `,
        link: `
            color: #00b7ff;
            background: #1a1a1a;
            padding: 8px 12px;
            font-size: 14px;
            text-decoration: none;
            border-radius: 0 4px 4px 0;
            font-family: monospace;
        `
    };
    function displayBanner() {
        try {
            console.log(
                `%cArk Dev v${ArkDev.version} | Ecommerce Solution%c${ArkDev.website}`,
                styles.main,
                styles.link
            );
            console.log(`%cInitialized: ${ArkDev.timestamp}`, 'color: #666; font-size: 12px;');
        } catch (error) {
            console.warn('ArkDev banner failed to load:', error);
        }
    }
    setTimeout(displayBanner, 1000);
    if (window._arkDevLoaded) return;
    window._arkDevLoaded = true;

})();
