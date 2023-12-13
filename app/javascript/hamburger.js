document.addEventListener('DOMContentLoaded', () => {
    const hamburger = document.querySelector('.hamburger');
    const navMenu = document.querySelector('.right-menu');

    hamburger.addEventListener('click', () => {
    hamburger.classList.add('active');
    navMenu.classList.add('active');
    });

    document.querySelectorAll('.bottom-nav-link').forEach((n) => n.addEventListener('click', () => {
    hamburger.classList.remove('active');
    navMenu.classList.remove('active');
    }));
});
  