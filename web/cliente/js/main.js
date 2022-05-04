
window.onload = function () {/*hace que se cargue la función lo que predetermina que div estará oculto hasta llamar a la función nuevamente*/
    muestra_oculta('divControlProducto');/* "contenido_a_mostrar" es el nombre que le dimos al DIV */
    muestra_oculta('divFacturacion');
     muestra_oculta('divPagosFacturas');
    
}

function muestra_oculta(id) {
    if (document.getElementById) { //se obtiene el id
        var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
        el.style.display = (el.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div
    }
}

$(function () {
    $('#formregistro').validate({
        rules: {
            nombre:{
                required: true
            },
            apellido:{
                required:true
                
            },
            id:{
                required:true
            },
            username: {
                required: true
            },
            password: {
                required: true,
                minlength: 8,
                maxlength: 20
            },
            password2: {
                required: true,
                equalTo: "#password"
            },
            email:{
                required:true,
                email:true
                
            }
        },
        messages: {
            nombre:{
                required:"requerido"
            },
            apellido:{
                required:"requerido"
                
            },
            id:{
                required:"requerido"
            },
            username: {
                required: "Usuario requerido"
            },
            password: {
                required: "La contraseña es obligatoria",
                minlength: "Contraseña de minimo 8 caracteres",
                maxlength: "La contraseña no puede tener mas de 20 caracteres"
            },
            password2: {
                required: "Verificar la contraseña es obligatorio",
                equalTo: "Las contraseñas no son iguales"
            }
        },
        submitHandler: function(form){
            var data = $('#formregistro').serialize();
            $.post("registrar",data,function(res,est,jqXHR){
                alert(res)
                $("#username").val("");
                $("#password").val("");
                $("#password2").val("");
                $("#email").val("");
            });
        }
    });
    
    $("#formlogin").validate({
        rules: {
            username: {
                required: true
            },
            password: {
                required: true,
                minlength: 8,
                maxlength: 20
            }
        },
        messages: {
            username: {
                required: "Usuario requerido"
            },
            password: {
                required: "La contraseña es obligatoria",
                minlength: "Contraseña de minimo 8 caracteres",
                maxlength: "La contraseña no puede tener mas de 20 caracteres"
            },
            
        }
    })
});