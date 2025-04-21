(function () {
    'use strict';

    const ArkDev = Object.freeze({
        version: "4.0.0",
        platform: "Ark Dev | Ecommerce Page Web",
        developer: "Developed by ArkDev System",
        website: "https://arkdev.pages.dev",
        contact: "contact@ajoeark@gmail.com",
        timestamp: new Date().toISOString()
    });

    Object.defineProperty(window, 'ArkDev', {
        value: ArkDev,
        writable: false,
        configurable: false,
        enumerable: false
    });

    const styles = {
        header: `
            color: #ffffff;
            background: linear-gradient(135deg, #1a1a1a 0%, #2d2d2d 100%);
            padding: 12px 18px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 6px 6px 0 0;
            font-family: monospace;
            text-shadow: 0 1px 3px rgba(255,255,255,0.2);
            box-shadow: 0 2px 4px rgba(0,0,0,0.3);
        `,
        info: `
            color: #00ffcc;
            background: #1a1a1a;
            padding: 8px 18px;
            font-size: 14px;
            font-family: monospace;
        `,
        link: `
            color: #00b7ff;
            background: #1a1a1a;
            padding: 8px 18px;
            font-size: 14px;
            text-decoration: underline;
            font-family: monospace;
            border-radius: 0 0 6px 6px;
        `
    };

    function displayDeveloperMark() {
        try {
            console.groupCollapsed(
                `%c${ArkDev.developer} - v${ArkDev.version}`,
                styles.header
            );
            console.log(
                `%c${ArkDev.platform}`,
                styles.info
            );
            console.log(
                `%c🌐 ${ArkDev.website}`,
                styles.link
            );
            console.log(
                `%c📧 ${ArkDev.contact}`,
                styles.info
            );
            console.log(
                `%c🕒 ${ArkDev.timestamp}`,
                styles.info
            );
            console.groupEnd();
        } catch (error) {
            console.warn('ArkDev mark failed to display:', error);
        }
    }

    function protectScript() {
        const scriptElement = document.querySelector('script[src*="arkdev.js"]');
        if (!scriptElement) {
            console.error('ArkDev script not detected!');
            displayDeveloperMark();
            return false;
        }
        return true;
    }

    function loadTailwindCSS() {
        // Check if Tailwind is already loaded
        if (document.querySelector('script[src="https://cdn.tailwindcss.com"]')) {
            return;
        }

        // Check if the page requires Tailwind (e.g., by looking for Tailwind classes)
        const tailwindClasses = [
            'flex', 'grid', 'bg-', 'text-', 'p-', 'm-', 'w-', 'h-', 'justify-', 'items-', 'space-'
        ];
        const requiresTailwind = Array.from(document.getElementsByTagName('*')).some(element =>
            tailwindClasses.some(cls => element.className.includes(cls))
        );

        if (requiresTailwind) {
            const script = document.createElement('script');
            script.src = 'https://cdn.tailwindcss.com';
            script.async = true;
            document.head.appendChild(script);
            console.log('%cArkDev: Tailwind CSS loaded via CDN', styles.info);
        } else {
            console.log('%cArkDev: Tailwind CSS not required by this page', styles.info);
        }
    }

    if (!window._arkDevLoaded) {
        window._arkDevLoaded = true;
        setTimeout(() => {
            if (protectScript()) {
                displayDeveloperMark();
                loadTailwindCSS();
            }
        }, 1000);

        const observer = new MutationObserver((mutations) => {
            if (!document.querySelector('script[src*="arkdev.js"]')) {
                console.error('ArkDev script was removed!');
                displayDeveloperMark();
            }
        });
        observer.observe(document.documentElement, { childList: true, subtree: true });
    }

    Object.defineProperty(window, 'getArkDevInfo', {
        value: () => ({ ...ArkDev }),
        writable: false,
        configurable: false,
        enumerable: false
    });
})();
