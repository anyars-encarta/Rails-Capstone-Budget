$(document).ready(function() {
    $("#searchIcon").click(function() {
      $("#searchField").toggle();
    });
  
    $("#closeSearch").click(function() {
      $("#searchField").hide();
    });

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