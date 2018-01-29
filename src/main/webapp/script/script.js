(function() {
    'use strict';
    $(document).ready(function(){
        var form =  document.querySelector('.needs-validation');
        form.addEventListener('submit', function(event) {
            event.preventDefault();
            if (form.checkValidity() === false) {
                location.search = "?errors";
            } else {
                $("#adding").modal();
            }
        });
        if (location.search === "?errors") {
            $('input').addClass('is-invalid');
            $('textarea').addClass('is-invalid');
        }     
    });
})();