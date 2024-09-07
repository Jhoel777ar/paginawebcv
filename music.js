(function () {
    const musicButton = document.querySelector('.music-button');
    const musicPopup = document.getElementById('music-popup');
    const closePopup = document.querySelector('.close-popup');
    const overlay = document.getElementById('overlay1');
    const audioPlayer = document.getElementById('audio-player');
    const canvas = document.getElementById('audio-spectrum');
    const ctx = canvas.getContext('2d');

    let audioContext = null;
    let analyser = null;
    let bufferLength = 0;
    let dataArray = null;
    let source = null;
    let animationId;

    // Inicializar el contexto de audio y el analizador
    function initAudioContext() {
        audioContext = new (window.AudioContext || window.webkitAudioContext)();
        analyser = audioContext.createAnalyser();
        source = audioContext.createMediaElementSource(audioPlayer);
        source.connect(analyser);
        analyser.connect(audioContext.destination);

        analyser.fftSize = 256;
        bufferLength = analyser.frequencyBinCount;
        dataArray = new Uint8Array(bufferLength);
        audioPlayer.play();
        drawSpectrum();
    }

    // Dibujar el espectro de audio en el canvas
    function drawSpectrum() {
        animationId = requestAnimationFrame(drawSpectrum);
        analyser.getByteFrequencyData(dataArray);

        ctx.clearRect(0, 0, canvas.width, canvas.height);

        const barWidth = (canvas.width / bufferLength) * 1;
        let x = 0;

        for (let i = 0; i < bufferLength; i++) {
            const barHeight = dataArray[i];
            const gradient = ctx.createLinearGradient(0, 0, 0, canvas.height);
            gradient.addColorStop(0, 'lightblue');
            gradient.addColorStop(1, 'darkblue');
            ctx.fillStyle = gradient;
            ctx.fillRect(x, canvas.height - barHeight / 2, barWidth, barHeight / 2);
            x += barWidth + 1;
        }
    }

    // Mostrar el popup y comenzar la reproducción de audio
    function showMusicPopup() {
        musicPopup.classList.remove('hidden');
        overlay.classList.remove('hidden');

        if (!audioContext) {
            initAudioContext();
        } else {
            if (audioPlayer.paused) {
                audioPlayer.play();
            }
            if (!animationId) {
                drawSpectrum();
            }
        }
    }

    // Cerrar el popup y detener la reproducción
    function closeMusicPopup() {
        musicPopup.classList.add('hidden');
        overlay.classList.add('hidden');
        audioPlayer.pause();
        audioPlayer.currentTime = 0;
        cancelAnimationFrame(animationId);
        animationId = null;
    }

    // Cerrar el popup cuando la música termina
    function onAudioEnded() {
        closeMusicPopup();
    }

    // Eventos para los botones
    musicButton.addEventListener('click', showMusicPopup);
    closePopup.addEventListener('click', closeMusicPopup);
    overlay.addEventListener('click', closeMusicPopup);

    // Añadir el manejador para el evento 'ended'
    audioPlayer.addEventListener('ended', onAudioEnded);
})();


document.addEventListener('DOMContentLoaded', () => {
    const musicButton = document.querySelector('.music-button');

    musicButton.addEventListener('click', () => {
        musicButton.classList.add('active:dirty-effect');
        setTimeout(() => {
            musicButton.classList.remove('active:dirty-effect');
        }, 300);
    });
});
