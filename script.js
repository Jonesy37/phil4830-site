document.addEventListener('DOMContentLoaded', () => {
  const hero = document.getElementById('hero');

  if (hero) {
    window.addEventListener('scroll', () => {
      const scrollY = window.scrollY;
      const threshold = 100; // Pixels scrolled before sliding up

      if (scrollY > threshold) {
        hero.classList.add('exited');
      } else {
        hero.classList.remove('exited');
      }
    });
  }
});
