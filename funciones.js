document.addEventListener('DOMContentLoaded', () => {
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

    function startCounting() {
        const visitorCountElement = document.getElementById('visitor-count');
        const storedVisitorCount = parseInt(localStorage.getItem('visitorCount')) || 270; 
        animateCount(visitorCountElement, 0, storedVisitorCount, 2000);

        const projectCountElement = document.getElementById('project-count');
        const projectLimit = 10;
        animateCount(projectCountElement, 0, projectLimit, 2000);
    }

    function updateTime() {
        const now = new Date();
        const hours = now.getHours().toString().padStart(2, '0');
        const minutes = now.getMinutes().toString().padStart(2, '0');
        const seconds = now.getSeconds().toString().padStart(2, '0');
        const timeString = `${hours}:${minutes}:${seconds}`;
        document.getElementById('time').textContent = timeString;
    }

    // Incrementa el contador de visitantes
    function incrementVisitorCount() {
        if (!sessionStorage.getItem('pageVisited')) {
            let visitorCount = parseInt(localStorage.getItem('visitorCount')) || 270; // Inicia en 270
            visitorCount++;
            localStorage.setItem('visitorCount', visitorCount);
            sessionStorage.setItem('pageVisited', 'true');
        }
    }

    // Mostrar el dominio del referente
    function showReferrer() {
        const referrer = document.referrer || 'Página no disponible';
        try {
            const referrerDomain = new URL(referrer).hostname;
            document.getElementById('address').textContent = referrerDomain;
        } catch (e) {
            document.getElementById('address').textContent = 'Página no disponible';
        }
    }

    startCounting();  
    setInterval(updateTime, 1000); 
    incrementVisitorCount(); 
    showReferrer(); 

    setInterval(startCounting, 3000);
});
