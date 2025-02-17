(function () {
    const ArkDev = {
        version: "4.0.0",
        platform: "Ark Dev | Ecommerce Page Web",
        website: "https://arkdev.com",
    };
    Object.defineProperty(window, "ArkDev", {
        get() {
            return ArkDev;
        },
        configurable: false,
        enumerable: false,
    });
    console.log(
        "%c Ark Dev | Ecommerce Page Web 4.0 %c https://arkdev.com ",
        "color: white; background: #000; padding: 5px; font-size: 14px; font-weight: bold;",
        "color: blue; text-decoration: underline; font-size: 14px;"
    );
})();
