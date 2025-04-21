(function () {
    'use strict';

    /**
     * ArkDev configuration object
     * @typedef {Object} ArkDevConfig
     * @property {string} version - Version of the script
     * @property {string} platform - Platform description
     * @property {string} developer -16 - Developer name
     * @property {string} website - Developer website
     * @property {string} about - About page
     * @property {string} contact - Contact email
     * @property {string} timestamp - ISO timestamp
     * @property {string} hash - Script integrity hash
     */
    const ArkDev = Object.freeze({
        version: '5.1.0',
        platform: 'ArkDev | Advanced Ecommerce Solutions',
        developer: 'Developed by ArkDev System',
        website: 'https://arkdev.pages.dev',
        about: 'https://arkdev.pages.dev/nosotros',
        contact: 'contact@ajoeark@gmail.com',
        timestamp: new Date().toISOString(),
        hash: 'sha256-arkdev-5.1.0'
    });
    Object.defineProperty(window, 'ArkDev', {
        value: ArkDev,
        writable: false,
        configurable: false,
        enumerable: false
    });
    const consoleStyles = {
        header: `
            color: #ffffff;
            background: linear-gradient(135deg, #1e1b4b 0%, #4c1d95 100%);
            padding: 14px 20px;
            font-size: 16px;
            font-weight: 700;
            border-radius: 8px 8px 0 0;
            font-family: 'Inter', monospace;
            text-shadow: 0 1px 4px rgba(255,255,255,0.3);
            box-shadow: 0 3px 6px rgba(0,0,0,0.5);
        `,
        info: `
            color: #c4b5fd;
            background: #1e1e1e;
            padding: 10px 20px;
            font-size: 14px;
            font-family: 'Inter', monospace;
        `,
        link: `
            color: #7dd3fc;
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
    const uiWatermarkStyles = `
        fixed bottom-4 right-4 bg-gradient-to-r from-indigo-950 to-purple-950 text-white
        px-4 py-2 rounded-lg shadow-lg text-sm font-semibold
        transition-opacity duration-1000 ease-in-out z-50
        border border-indigo-900/50 glow-effect
    `;
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
            console.log(`%cℹ️ ${ArkDev.about}`, consoleStyles.link);
            console.log(`%c📧 ${ArkDev.contact}`, consoleStyles.info);
            console.log(`%c🕒 ${ArkDev.timestamp}`, consoleStyles.info);
            console.groupEnd();
        } catch (error) {
            console.warn('ArkDev watermark failed to display:', error);
        }
    }
    /**
     * Injects a temporary UI watermark with fade effect
     */
    function injectUIWatermark() {
        if (document.getElementById('arkdev-watermark')) return;
        const watermark = document.createElement('a');
        watermark.id = 'arkdev-watermark';
        watermark.href = ArkDev.about;
        watermark.target = '_blank';
        watermark.className = uiWatermarkStyles;
        watermark.textContent = `Built by ${ArkDev.developer}`;
        watermark.title = `ArkDev v${ArkDev.version}`;
        watermark.style.opacity = '0';
        watermark.style.animation = 'glow 2s ease-in-out infinite';
        const styleSheet = document.createElement('style');
        styleSheet.textContent = `
            .glow-effect {
                box-shadow: 0 0 10px rgba(139, 92, 246, 0.5), 0 0 20px rgba(139, 92, 246, 0.3);
            }
            @keyframes glow {
                0%, 100% { box-shadow: 0 0 10px rgba(139, 92, 246, 0.5), 0 0 20px rgba(139, 92, 246, 0.3); }
                50% { box-shadow: 0 0 15px rgba(139, 92, 246, 0.7), 0 0 25px rgba(139, 92, 246, 0.5); }
            }
        `;
        document.head.appendChild(styleSheet);
        document.body.appendChild(watermark);
        setTimeout(() => {
            watermark.style.opacity = '1';
        }, 100);
        setTimeout(() => {
            watermark.style.opacity = '0';
            setTimeout(() => watermark.remove(), 1000);
        }, 3000);
    }
    /**
     * Verifies script integrity with encoded selector
     * @returns {boolean} True if script is intact
     */
    function verifyScriptIntegrity() {
        const encodedSelector = atob('c2NyaXB0W3NyYz0iYXJrZGV2LmpzIl0=');
        const scriptElement = document.querySelector(encodedSelector);
        if (!scriptElement) {
            console.error('%cArkDev script not detected!', consoleStyles.warning);
            analytics.incrementTamperAttempt();
            displayConsoleWatermark();
            return false;
        }
        return true;
    }
    /**
     * Detects developer tools and console tampering
     */
    function detectDevToolsAndTampering() {
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
                    analytics.incrementTamperAttempt();
                }
            } else {
                devToolsOpen = false;
            }
        };
        const originalConsoleClear = console.clear;
        console.clear = function () {
            analytics.incrementTamperAttempt();
            console.warn(
                '%cArkDev: Console clearing detected. Watermark re-injected.',
                consoleStyles.warning
            );
            displayConsoleWatermark();
            originalConsoleClear.apply(console);
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
     * Throttled mutation observer to detect script removal
     */
    function setupTamperProtection() {
        let lastCheck = 0;
        const throttleMs = 500;

        const observer = new MutationObserver(() => {
            const now = Date.now();
            if (now - lastCheck < throttleMs) return;
            lastCheck = now;

            if (!verifyScriptIntegrity()) {
                analytics.incrementTamperAttempt();
                displayConsoleWatermark();
                injectUIWatermark();
            }
        });

        observer.observe(document.documentElement, {
            childList: true,
            subtree: true
        });

        return observer;
    }
    /**
     * Periodic integrity check with randomized interval
     */
    function setupPeriodicCheck() {
        const checkIntegrity = () => {
            if (!verifyScriptIntegrity()) {
                displayConsoleWatermark();
                injectUIWatermark();
            }
            const randomDelay = 5000 + Math.random() * 3000; 
            setTimeout(checkIntegrity, randomDelay);
        };
        setTimeout(checkIntegrity, 5000);
    }
    /**
     * Injects a fake script to confuse tamperers
     */
    function injectFakeScript() {
        const fakeScript = document.createElement('script');
        fakeScript.src = 'https://arkdev.pages.dev/decoy.js';
        fakeScript.setAttribute('data-arkdev', 'decoy');
        fakeScript.textContent = '// ArkDev decoy script';
        document.head.appendChild(fakeScript);
        const fakeObserver = new MutationObserver(() => {
            if (!document.querySelector('script[data-arkdev="decoy"]')) {
                analytics.incrementTamperAttempt();
                console.warn(
                    '%cArkDev: Decoy script tampered!',
                    consoleStyles.warning
                );
                displayConsoleWatermark();
            }
        });
        fakeObserver.observe(document.head, { childList: true });
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
                detectDevToolsAndTampering();
                setupTamperProtection();
                setupPeriodicCheck();
                injectFakeScript();
            }
        }, 1000);
    }
    Object.defineProperty(window, 'getArkDevInfo', {
        value: () => ({
            ...ArkDev,
            analytics: analytics.getStats()
        }),
        writable: false,
        configurable: false,
        enumerable: false
    });
    initialize();
})();
