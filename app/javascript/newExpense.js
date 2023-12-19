    var form = document.getElementById("expense-form");
    var categorySelect = document.getElementById("category-select");
    var hiddenCategoryId = document.querySelector("#expense-form input[name='expense[category_id]']");

    // Check if the form exists before adding the event listener
    if (form) {
      // Check if the event listener hasn't already been added
      if (!form.hasAttribute("data-submit-listener")) {
        form.setAttribute("data-submit-listener", "true");
  
        form.addEventListener("submit", function(event) {
          var categorySelect = document.getElementById("category-select");
          if (categorySelect.value === "") {
            event.preventDefault();
            alert("Please select a category.");
          }
        });
      }
    }

    if (categorySelect && hiddenCategoryId) {
      categorySelect.addEventListener("change", function() {
        hiddenCategoryId.value = this.value;
      });
    }
