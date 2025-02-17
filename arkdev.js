(function () {
    const ArkDev = {
        version: "4.0.0",
        platform: "Ark Dev | Ecommerce Page Web",
        website: "https://arkdev.pages.dev",
    };

    Object.defineProperty(window, "ArkDev", {
        get() {
            return ArkDev;
        },
        configurable: false,
        enumerable: false,
    });

    setTimeout(() => {
        console.log(
            "%c Ark Dev | Ecommerce Page Web 4.0 %c🌐 https://arkdev.pages.dev ",
            "color: #fff; background: #000; padding: 8px; font-size: 14px; font-weight: bold; border-radius: 5px;",
            "color: blue; text-decoration: underline; font-size: 14px;"
        );
    }, 1000);
})();
