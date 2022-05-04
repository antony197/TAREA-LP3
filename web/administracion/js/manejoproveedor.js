$(function () {
    $('#newproveedor').validate({
        rules: {
            nombre: {
                required: true
            },
            id: {
                required: true
            }


        },
         submitHandler: function (form) {
            var data = $('#newproveedor').serialize();
            $.post("CrearProveedor", data, function (res, est, jqXHR) {
                alert(res);
                if (res == "El proveedor ha sido registrado correctamente") {
                    location.href = "./infoProductos.jsp";
                }
                else {
                    location.href = "./newProveedor.jsp";
                }
            });
        }
    });

});


