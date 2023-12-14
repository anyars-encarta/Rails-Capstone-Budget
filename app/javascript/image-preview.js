    function redirectToIndex() {
      // Redirect to the categories index page
      window.location.href = "/categories";
    }

    function previewImage(input) {
      var preview = document.getElementById('image-preview');
      if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
              var img = new Image();
              img.src = e.target.result;
              img.style.maxWidth = '100px'; // Adjust the image preview size
              preview.innerHTML = ''; // Clear previous preview
              preview.appendChild(img);

              // Set the icon path to the hidden field
              document.getElementById('icon-path').value = e.target.result;
          };

          reader.readAsDataURL(input.files[0]);
      }
    }