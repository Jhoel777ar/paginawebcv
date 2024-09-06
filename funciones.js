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
        let visitorCount = 170; 
        const visitorLimit = 20220; 
        const visitorDuration = 2000; 
        const visitorInterval = 7000; 

        function incrementVisitorCount() {
            if (visitorCount < visitorLimit) {
                const incrementValue = Math.min(visitorCount + 5, visitorLimit);
                animateCount(visitorCountElement, visitorCount, incrementValue, visitorDuration);
                visitorCount = incrementValue;
            }
        }

        incrementVisitorCount();
        setInterval(incrementVisitorCount, visitorInterval);

        const projectCountElement = document.getElementById('project-count');
        const projectLimit = 10;
        animateCount(projectCountElement, 0, projectLimit, 2000);
    }

    startCounting();

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
    if (!sessionStorage.getItem('pageVisited')) {
        sessionStorage.setItem('pageVisited', 'true');
    }
});
