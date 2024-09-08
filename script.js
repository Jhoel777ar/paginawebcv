document.addEventListener('DOMContentLoaded', function() {
  setTimeout(function() {
      document.getElementById('welcome-section').classList.add('hidden');
      document.getElementById('main-content').classList.remove('hidden');
  }, 3000);
});

let starCount = 0;
let increasing = true;

function createStar() {
  const star = document.createElement('div');
  star.classList.add('star');
  star.style.setProperty('--top-offset', `${Math.random() * 100}vh`);
  star.style.setProperty('--fall-delay', `${Math.random() * 10}s`);
  star.style.setProperty('--fall-duration', `${6 + Math.random() * 4}s`);
  document.querySelector('.stars').appendChild(star);
}

function createStarsGroup() {
  let numberOfStars = Math.floor(Math.random() * 2) + 1; 
  if (starCount + numberOfStars > 7) {
      numberOfStars = 7 - starCount;
  }
  for (let i = 0; i < numberOfStars; i++) {
      createStar();
  }
  starCount += numberOfStars;
  if (increasing) {
      starCount++;
      if (starCount >= 7) {
          increasing = false;
      }
  } else {
      starCount--;
      if (starCount <= 1) {
          increasing = true;
      }
  }
}

setInterval(createStarsGroup, 3000);
