document.addEventListener('DOMContentLoaded', () => {
    const recent = document.querySelector('.recent');
    const ancient = document.querySelector('.ancient');

    recent.addEventListener('click', () => {
    recent.classList.remove('inactive');
    recent.classList.add('active');
    ancient.classList.remove('active');
    ancient.classList.add('inactive');
    });

    ancient.addEventListener('click', () => {
      ancient.classList.remove('inactive');
      ancient.classList.add('active');
      recent.classList.remove('active');
      recent.classList.add('inactive');
    });
});