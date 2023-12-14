$(document).ready(function() {
    $("#searchIcon").click(function() {
      $("#searchField").toggle(); // Toggle the visibility of the search field
    });
  
    $("#closeSearch").click(function() {
      $("#searchField").hide(); // Hide the search field when the close button is clicked
    });
});