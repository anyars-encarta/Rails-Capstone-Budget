$(document).ready(function() {
    $("#searchIcon").click(function() {
      $("#searchField").toggle(); // Toggle the visibility of the search field
    });
  
    $("#closeSearch").click(function() {
      $("#searchField").hide(); // Hide the search field when the close button is clicked
    });
});

document.addEventListener('DOMContentLoaded', () => {
  $("#searchInput").on('input', function() {
    var searchText = $(this).val().toLowerCase();
    $(".exp-group li").each(function() {
      var categoryText = $(this).find('.cname').text().toLowerCase();
      if (categoryText.includes(searchText)) {
        $(this).show();
      } else {
        $(this).hide();
      }
    });
  });

  $("#closeSearch").click(function() {
    $("#searchInput").val('');
    $(".exp-group li").show();
  });
});