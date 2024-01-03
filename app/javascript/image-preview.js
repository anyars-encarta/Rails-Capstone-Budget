    function redirectToIndex() {
      window.location.href = "/categories";
    }

    function previewImage(input) {
      var preview = document.getElementById('image-preview');
      if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
              var img = new Image();
              img.src = e.target.result;
              img.style.maxWidth = '100px';
              preview.innerHTML = '';
              preview.appendChild(img);

              document.getElementById('icon-path').value = e.target.result;
          };

          reader.readAsDataURL(input.files[0]);
      }
    }