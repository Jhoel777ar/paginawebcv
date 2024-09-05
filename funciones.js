document.addEventListener('DOMContentLoaded', () => {
    // Función para animar los contadores
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

    // Función para obtener el número de visitas desde el servidor
    async function getVisitorCount() {
        try {
            const response = await fetch('/api/visitorCount');
            if (response.ok) {
                const { visitorCount } = await response.json();
                return visitorCount;
            } else {
                console.error('Error fetching visitor count:', response.statusText);
            }
        } catch (error) {
            console.error('Error fetching visitor count:', error);
        }
        return 0; // Valor por defecto en caso de error
    }

    // Función para iniciar el conteo
    async function startCounting() {
        const visitorCountElement = document.getElementById('visitor-count');
        const storedVisitorCount = await getVisitorCount();
        animateCount(visitorCountElement, 0, storedVisitorCount, 2000);

        const projectCountElement = document.getElementById('project-count');
        const projectLimit = 10; // Aquí podrías hacer dinámico este número
        animateCount(projectCountElement, 0, projectLimit, 2000);
    }

    startCounting();

    // Actualización del tiempo cada segundo
    function updateTime() {
        const now = new Date();
        const timeString = now.toLocaleTimeString();
        document.getElementById('time').textContent = timeString;
    }
    setInterval(updateTime, 1000);

    // Actualizar la dirección del referrer
    const referrer = document.referrer || 'La Paz, Bolivia';
    let referrerDomain = 'La Paz, Bolivia'; // Valor por defecto
    try {
        referrerDomain = new URL(referrer).hostname || 'La Paz, Bolivia';
    } catch (e) {
        console.error('Invalid referrer URL:', e);
    }
    document.getElementById('address').textContent = referrerDomain;

    // Incrementar el contador de visitantes si la página no ha sido visitada en esta sesión
    if (!sessionStorage.getItem('pageVisited')) {
        fetch('/api/incrementVisitorCount', { method: 'POST' }) // Supone que tienes un endpoint en tu servidor
            .then(response => response.json())
            .then(data => {
                console.log('Visitor count incremented:', data);
            })
            .catch(error => {
                console.error('Error incrementing visitor count:', error);
            });
        sessionStorage.setItem('pageVisited', 'true');
    }
});
