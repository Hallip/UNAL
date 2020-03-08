document.querySelector("html").classList.add('js');

window.onload = function() {
		var fileInput = document.getElementById('fileInput');
		var fileDisplayArea = document.getElementById('fileDisplayArea');
		var the_return = document.querySelector(".file-return");

		fileInput.addEventListener('change', function(e) {
			var file = fileInput.files[0];
			var textType = /text.*/;

			if (true) {
				var reader = new FileReader();

				reader.onload = function(e) {
					fileDisplayArea.innerText = reader.result;
				}

				reader.readAsText(file);
			} else {
				fileDisplayArea.innerText = "File not supported!"
			}
		});
		fileInput.addEventListener( "change", function( event ) {
    the_return.innerHTML = this.value.replace("C:\\fakepath\\", "");
	  });
}
