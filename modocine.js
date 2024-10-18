(function() {
    const video = document.getElementById('video');
    const canvas = document.getElementById('canvas');
    const ctx = canvas.getContext('2d');
    const modal = document.getElementById('modal');
    const backgroundMusic = document.getElementById('background-music');
    const openModalButton = document.getElementById('openModal');
    const closeModalButton = document.getElementById('closeModal');
    let intervalId;

    function updateBackground() {
        canvas.width = video.videoWidth;
        canvas.height = video.videoHeight;
        ctx.drawImage(video, 0, 0, canvas.width, canvas.height);
        const frame = ctx.getImageData(0, 0, canvas.width, canvas.height);
        const data = frame.data;
        let r = 0, g = 0, b = 0;
        const pixelCount = data.length / 4;
        for (let i = 0; i < data.length; i += 40) { 
            r += data[i];
            g += data[i + 1];
            b += data[i + 2];
        }

        r = Math.floor(r / (pixelCount / 10));
        g = Math.floor(g / (pixelCount / 10));
        b = Math.floor(b / (pixelCount / 10));

        const color1 = `rgb(${r}, ${g}, ${b})`;
        const color2 = `rgb(${Math.min(r + 50, 255)}, ${Math.min(g + 50, 255)}, ${Math.min(b + 50, 255)})`;
        document.body.style.background = `linear-gradient(135deg, ${color1}, ${color2})`;
    }

    function startBackgroundUpdate() {
        if (!intervalId) {
            intervalId = setInterval(updateBackground, 100);
        }
    }

    function stopBackgroundUpdate() {
        clearInterval(intervalId);
        intervalId = null;
    }

    function openModal() {
        modal.style.display = 'block';
        modal.classList.remove('fade-out');
        backgroundMusic.play();
        startBackgroundUpdate();
    }

    function closeModal() {
        modal.classList.add('fade-out');
        backgroundMusic.pause();
        backgroundMusic.currentTime = 0;
        setTimeout(() => {
            modal.style.display = 'none';
            stopBackgroundUpdate();
        }, 400);
    }
    video.addEventListener('play', startBackgroundUpdate);
    openModalButton.onclick = openModal;
    closeModalButton.onclick = closeModal;

    window.onclick = function(event) {
        if (event.target === modal) {
            closeModal();
        }
    };
})();
