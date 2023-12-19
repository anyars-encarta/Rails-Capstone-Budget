document.addEventListener('DOMContentLoaded', () => {
  const recent = document.querySelector(".recent");
  const ancient = document.querySelector(".ancient");
  const categoriesList = document.querySelector(".exp-group ul");

  // Function to sort categories by most recent
  const sortByRecent = () => {
    const categories = Array.from(categoriesList.children);
    categories.sort((a, b) => {
      const dateA = new Date(a.querySelector(".cdate").textContent);
      const dateB = new Date(b.querySelector(".cdate").textContent);
      return dateB - dateA;
    });
    categories.forEach(category => categoriesList.appendChild(category));
  };

  // Function to sort categories by most ancient
  const sortByAncient = () => {
    const categories = Array.from(categoriesList.children);
    categories.sort((a, b) => {
      const dateA = new Date(a.querySelector(".cdate").textContent);
      const dateB = new Date(b.querySelector(".cdate").textContent);
      return dateA - dateB;
    });
    categories.forEach(category => categoriesList.appendChild(category));
  };



    recent.addEventListener('click', () => {
    recent.classList.remove('inactive');
    recent.classList.add('active');
    ancient.classList.remove('active');
    ancient.classList.add('inactive');
    sortByRecent();
    });

    ancient.addEventListener('click', () => {
      ancient.classList.remove('inactive');
      ancient.classList.add('active');
      recent.classList.remove('active');
      recent.classList.add('inactive');
      sortByAncient();
    });
});
