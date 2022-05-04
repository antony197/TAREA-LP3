var cantidadproductos;
function muestra_oculta(id) {
    if (document.getElementById) { //se obtiene el id
        var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
        el.style.display = (el.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div
    }
}
window.onload = function () {/*hace que se cargue la función lo que predetermina que div estará oculto hasta llamar a la función nuevamente*/
    muestra_oculta('divControlProducto');/* "contenido_a_mostrar" es el nombre que le dimos al DIV */
    muestra_oculta('divAddProduct');
    muestra_oculta('divFacturacion');
    muestra_oculta('divPagosFacturas');
    cantidadproductos = 0;
    document.getElementById("cantidadFactura").value = 0;
}
var productos = [];
function agregarFila() {
    var esta = false;
    var table = document.getElementById("totalProductos");
    var e = document.getElementById("products");
    var producto = e.options[e.selectedIndex].text;
    var idproducto = e.options[e.selectedIndex].value;
    var precioCompra = document.getElementById("precompra").value;
    var cantidad = document.getElementById("canticompra").value;
    for (var i = 0; i < productos.length; i++) {
        if (productos[i] == idproducto) {
            esta = true;

        }
        console.log(productos[i]);
    }
    if (!esta) {
        if (precioCompra != "" && cantidad != "") {
            productos.push(idproducto);
            cantidadproductos = document.getElementById("cantidadFactura").value;
            cantidadproductos++;
            document.getElementById("cantidadFactura").value = cantidadproductos;
            var rowCount = table.rows.length;
            console.log(idproducto)
            console.log(cantidadproductos);
            table.insertRow(-1).innerHTML = '<td><input type="number" name="id'+cantidadproductos+'" value="'+idproducto+'" readonly></td><td><input type="text" name="prod' + cantidadproductos + '" value="' + producto + '" readonly ></td><td><input type="number" name="precio' + cantidadproductos + '" value="' + precioCompra + '" readonly> </td><td><input type="number" name="cantidad' + cantidadproductos + '" value="' + cantidad + '" readonly></td><td><p>' + (cantidad * precioCompra) + '</p></td>';
        } else {
            alert("Ingrese precio y cantidad");
        }
    } else {
        alert("el producto ya esta");
    }
}
function fueraFiltro(){
    document.getElementByName("fechaInicio").value=0;
    document.getElementByName("fechaFinal").value=0;
}

function idCompra(id){
    var idCompra=document.getElementById(id).name;
    document.getElementByName("idcompra").value=idCompra;
    
}

function eliminarFila() {
    var table = document.getElementById("totalProductos");
    var rowCount = table.rows.length;
    //console.log(rowCount);

    if (rowCount <= 1)
        alert('No se puede eliminar el encabezado');
    else
        table.deleteRow(rowCount - 1);
    cantidadproductos = document.getElementById("cantidadFactura").value;
    cantidadproductos--;
    document.getElementById("cantidadFactura").value = cantidadproductos;
    productos.pop();
}



function validateForm()
{
    // Aqui vas comprobando tus datos

    if (cantidadproductos > 0) {
        return true;
    } else {
        alert("No ha agregado productos");
        return false;
    }

    //


}



$(function () {
    $('#newproduct').validate({
        rules: {
            nombre: {
                required: true
            },
            foto: {
                required: true
            }


        }/*,
        submitHandler: function (form) {
            var data = $('#newproduct').serialize();
            $.post("CrearProducto", data, function (res, est, jqXHR) {
                alert(res);
                if (res == "El producto ha sido registrado correctamente") {
                    location.href = "./panel.jsp";
                }
                else {
                    location.href = "./newProduct.jsp";
                }
            });
        }*/});

});


