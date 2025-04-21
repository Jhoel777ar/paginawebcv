(() => {
  const ARK_DEV = Object.freeze({
    version: "4.0.0",
    platform: "Ark Dev | Ecommerce Page Web",
    developer: "Developed by Ark Dev System",
    website: "https://arkdev.pages.dev",
    contact: "contact@ajoeark@gmail.com",
    timestamp: new Date().toISOString(),
  });
  const STYLES = {
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
    `,
  };
  const displayDeveloperMark = () => {
    try {
      console.groupCollapsed(`%c${ARK_DEV.developer} - v${ARK_DEV.version}`, STYLES.header);
      console.log(`%c${ARK_DEV.platform}`, STYLES.info);
      console.log(`%c🌐 ${ARK_DEV.website}`, STYLES.link);
      console.log(`%c📧 ${ARK_DEV.contact}`, STYLES.info);
      console.log(`%c🕒 ${ARK_DEV.timestamp}`, STYLES.info);
      console.groupEnd();
    } catch (error) {
      console.warn("Failed to display Ark Dev mark:", error);
    }
  };
  const protectScript = () => {
    const scriptElement = document.querySelector('script[src*="arkdev.js"]');
    if (!scriptElement) {
      console.error("Ark Dev script not detected!");
      displayDeveloperMark();
      return false;
    }
    return true;
  };
  const monitorScript = () => {
    const observer = new MutationObserver((mutations, obs) => {
      if (!document.querySelector('script[src*="arkdev.js"]')) {
        console.error("Ark Dev script was removed!");
        displayDeveloperMark();
        obs.disconnect();
      }
    });
    observer.observe(document.documentElement, { childList: true, subtree: true });
    return observer;
  };
  const initialize = () => {
    if (window._arkDevLoaded) return; 
    window._arkDevLoaded = true;
    Object.defineProperty(window, "getArkDevInfo", {
      value: () => ({ ...ARK_DEV }),
      writable: false,
      configurable: false,
      enumerable: false,
    });
    setTimeout(() => {
      if (protectScript()) {
        displayDeveloperMark();
        monitorScript();
      }
    }, 1000);
  };
  initialize();
})();
