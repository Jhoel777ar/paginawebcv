(function () {
    'use strict';

    /**
     * ArkDev configuration object
     * @typedef {Object} ArkDevConfig
     * @property {string} version - Version of the script
     * @property {string} platform - Platform description
     * @property {string} developer - Developer name
     * @property {string} website - Developer website
     * @property {string} contact - Contact email
     * @property {string} timestamp - ISO timestamp
     * @property {string} hash - Script integrity hash
     */
    const ArkDev = Object.freeze({
        version: '5.0.0',
        platform: 'ArkDev | Advanced Ecommerce Solutions',
        developer: 'Developed by ArkDev System',
        website: 'https://arkdev.pages.dev',
        contact: 'contact@ajoeark@gmail.com',
        timestamp: new Date().toISOString(),
        hash: 'sha256-arkdev-5.0.0' 
    });

    Object.defineProperty(window, 'Ark Dev', {
        value: ArkDev,
        writable: false,
        configurable: false,
        enumerable: false
    });

    const consoleStyles = {
        header: `
            color: #ffffff;
            background: linear-gradient(135deg, #1e3a8a 0%, #3b82f6 100%);
            padding: 14px 20px;
            font-size: 16px;
            font-weight: 700;
            border-radius: 8px 8px 0 0;
            font-family: 'Inter', monospace;
            text-shadow: 0 1px 4px rgba(255,255,255,0.3);
            box-shadow: 0 3px 6px rgba(0,0,0,0.4);
        `,
        info: `
            color: #a5f3fc;
            background: #1e1e1e;
            padding: 10px 20px;
            font-size: 14px;
            font-family: 'Inter', monospace;
        `,
        link: `
            color: #3b82f6;
            background: #1e1e1e;
            padding: 10px 20px;
            font-size: 14px;
            text-decoration: underline;
            font-family: 'Inter', monospace;
            border-radius: 0 0 8px 8px;
        `,
        warning: `
            color: #f87171;
            background: #1e1e1e;
            padding: 10px 20px;
            font-size: 14px;
            font-family: 'Inter', monospace;
        `
    };

    /**
     * Displays the developer watermark in the console
     */
    function displayConsoleWatermark() {
        try {
            console.groupCollapsed(
                `%c${ArkDev.developer} - v${ArkDev.version}`,
                consoleStyles.header
            );
            console.log(`%c${ArkDev.platform}`, consoleStyles.info);
            console.log(`%c🌐 ${ArkDev.website}`, consoleStyles.link);
            console.log(`%c📧 ${ArkDev.contact}`, consoleStyles.info);
            console.log(`%c🕒 ${ArkDev.timestamp}`, consoleStyles.info);
            console.groupEnd();
        } catch (error) {
            console.warn('ArkDev watermark failed to display:', error);
        }
    }

    /**
     * Injects a UI watermark badge into the DOM with modern crystal glass effect
     */
    function injectUIWatermark() {
        if (document.getElementById('arkdev-watermark')) return;

        // Create watermark element
        const watermark = document.createElement('a');
        watermark.id = 'arkdev-watermark';
        watermark.href = ArkDev.website;
        watermark.target = '_blank';
        watermark.textContent = 'Ark Dev';
        watermark.title = `ArkDev v${ArkDev.version}`;

        // Apply Tailwind CSS classes for styling and animations
        watermark.className = `
            fixed bottom-4 right-4 z-50
            text-white text-sm font-bold font-['Orbitron']
            px-4 py-1.5 rounded-lg
            bg-white/10 backdrop-blur-md
            border border-white/20
            shadow-[0_2px_10px_rgba(255,255,255,0.05)]
            animate-slide-in
            sm:text-xs sm:px-3 sm:py-1
            md:text-sm md:px-4 md:py-1.5
        `;

        // Append to body
        document.body.appendChild(watermark);

        // Slide out and remove after 2 seconds
        setTimeout(() => {
            watermark.classList.remove('animate-slide-in');
            watermark.classList.add('animate-slide-out');
            setTimeout(() => {
                watermark.remove();
            }, 400); // Match slide-out duration
        }, 2000);

        // Add keyframes for animations
        const style = document.createElement('style');
        style.textContent = `
            @keyframes slideIn {
                from { opacity: 0; transform: translateX(20px); }
                to { opacity: 1; transform: translateX(0); }
            }
            @keyframes slideOut {
                from { opacity: 1; transform: translateX(0); }
                to { opacity: 0; transform: translateX(20px); }
            }
            .animate-slide-in {
                animation: slideIn 0.4s ease-out forwards;
            }
            .animate-slide-out {
                animation: slideOut 0.4s ease-out forwards;
            }
        `;
        document.head.appendChild(style);
    }

    /**
     * Verifies script integrity
     * @returns {boolean} True if script is intact
     */
    function verifyScriptIntegrity() {
        const scriptElement = document.querySelector('script[src*="arkdev.js"]');
        if (!scriptElement) {
            console.error('%cArkDev script not detected!', consoleStyles.warning);
            displayConsoleWatermark();
            injectUIWatermark();
            return false;
        }
        return true;
    }

    /**
     * Detects developer tools usage
     */
    function detectDevTools() {
        let devToolsOpen = false;
        const threshold = 160;

        const checkDevTools = () => {
            if (
                window.outerWidth - window.innerWidth > threshold ||
                window.outerHeight - window.innerHeight > threshold
            ) {
                if (!devToolsOpen) {
                    devToolsOpen = true;
                    console.warn(
                        '%cArkDev: Developer tools detected. Respect the watermark!',
                        consoleStyles.warning
                    );
                    injectUIWatermark();
                }
            } else {
                devToolsOpen = false;
            }
        };

        window.addEventListener('resize', checkDevTools);
        checkDevTools();
    }

    /**
     * Tracks usage analytics (in-memory, no file I/O)
     */
    const analytics = {
        pageLoads: 0,
        tamperAttempts: 0,
        lastLoad: Date.now(),
        incrementPageLoad() {
            this.pageLoads++;
            this.lastLoad = Date.now();
        },
        incrementTamperAttempt() {
            this.tamperAttempts++;
            console.warn(
                `%cArkDev: Tamper attempt detected (${this.tamperAttempts})`,
                consoleStyles.warning
            );
        },
        getStats() {
            return {
                pageLoads: this.pageLoads,
                tamperAttempts: this.tamperAttempts,
                lastLoad: new Date(this.lastLoad).toISOString()
            };
        }
    };

    /**
     * Debounced mutation observer to detect script removal
     */
    function setupTamperProtection() {
        let timeout;
        const observer = new MutationObserver((mutations) => {
            clearTimeout(timeout);
            timeout = setTimeout(() => {
                if (!document.querySelector('script[src*="arkdev.js"]')) {
                    analytics.incrementTamperAttempt();
                    console.error('%cArkDev script was removed!', consoleStyles.warning);
                    displayConsoleWatermark();
                    injectUIWatermark();
                }
            }, 500);
        });

        observer.observe(document.documentElement, {
            childList: true,
            subtree: true
        });

        return observer;
    }

    /**
     * Initializes the ArkDev script
     */
    function initialize() {
        if (window._arkDevLoaded) return;
        window._arkDevLoaded = true;

        analytics.incrementPageLoad();
        setTimeout(() => {
            if (verifyScriptIntegrity()) {
                displayConsoleWatermark();
                injectUIWatermark();
                detectDevTools();
                setupTamperProtection();
            }
        }, 1000);
    }

    Object.defineProperty(window, 'getArkDevInfo', {
        value: () => ({
            ...ArkDev,
            analytics: analytics.getStats(),
            customizeWatermark: (options) => {
                const watermark = document.getElementById('arkdev-watermark');
                if (watermark && options) {
                    if (options.text) watermark.textContent = options.text;
                    if (options.classes) watermark.className = options.classes;
                }
            }
        }),
        writable: false,
        configurable: false,
        enumerable: false
    });

    initialize();
})();
