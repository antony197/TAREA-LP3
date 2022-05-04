



$(function () {
    $('#compra').validate({
        
        submitHandler: function (form) {
            var data = $('#compra').serialize();
            $.post("CrearCompra", data, function (res, est, jqXHR) {
                alert(res);
                
            });
        }});

});


