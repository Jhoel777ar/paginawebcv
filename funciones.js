document.addEventListener('DOMContentLoaded', () => {
    const VISITOR_COUNT_URL = 'https://raw.githubusercontent.com/Jhoel777ar/paginawebcv/main/visitorCount.json';  // URL del archivo JSON en GitHub

    async function fetchVisitorCount() {
        try {
            const response = await fetch(VISITOR_COUNT_URL);
            const data = await response.json();
            return data.visitorCount;
        } catch (error) {
            console.error('Error al obtener el contador de visitantes:', error);
            return 724; // Valor por defecto si hay un error
        }
    }

    async function startCounting() {
        const visitorCountElement = document.getElementById('visitor-count');
        let visitorCount = await fetchVisitorCount();  // Obtener el contador actual
        visitorCount++;

        animateCount(visitorCountElement, 0, visitorCount, 2000);  // Mostrar el contador con animación

        // Nota: GitHub Pages no soporta PUT, por lo que no se puede actualizar el JSON desde aquí
    }

    function animateCount(element, start, end, duration) {
        let startTimestamp = null;
        const step = (timestamp) => {
            if (!startTimestamp) startTimestamp = timestamp;
            const progress = Math.min((timestamp - startTimestamp) / duration, 1);
            const currentValue = Math.floor(progress * (end - start) + start);
            element.textContent = `+${currentValue}`;
            if (progress < 1) {
                window.requestAnimationFrame(step);
            } else {
                element.textContent = `+${end}`;
            }
        };
        window.requestAnimationFrame(step);
    }

    function updateTime() {
        const now = new Date();
        const hours = now.getHours().toString().padStart(2, '0');
        const minutes = now.getMinutes().toString().padStart(2, '0');
        const seconds = now.getSeconds().toString().padStart(2, '0');
        const timeString = `${hours}:${minutes}:${seconds}`;
        document.getElementById('time').textContent = timeString;
    }

    setInterval(updateTime, 1000);

    const referrer = document.referrer || 'Página no disponible';
    const referrerDomain = new URL(referrer).hostname;
    document.getElementById('address').textContent = referrerDomain;

    startCounting();  // Iniciar la cuenta de visitantes
});
