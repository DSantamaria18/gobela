// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-2.2.0.min
//= require bootstrap
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
    (function ($) {
        $(document).ajaxStart(function () {
            $('#spinner').fadeIn();
        }).ajaxStop(function () {
            $('#spinner').fadeOut();
        });
    })(jQuery);
}

function sumar() {
    var total = 0.0;
    total = (total == null || total == undefined || total == "") ? 0.0 : total;
    $('[data="suma"]').each(function () {
        var valor = 0;
        var type = $(this).attr('type');
        if (type === "checkbox" || type === "radio") {
            if (this.checked) {
                valor = parseFloat($(this).val());
            }
        } else {
            valor = parseFloat($(this).val());
        }
        total = (parseFloat(total) + parseFloat(valor));
    });
    $('[name="puntuacion"]').val(total.toFixed(2).toString().replace(/\./, ','));
    if(total > 100.00){
        $('[name="puntuacion"]').css('border', '1px solid rgb(255, 15, 15)');
        alert('La puntuación total supera el 100%');
        $('.save').hide();
    }else{
        $('[name="puntuacion"]').css('border', '1px solid #cccccc');
        $('.save').show();
    }

    calcularImporteConcedido(total);
}

function calcularImporteConcedido(puntuacion) {
    var solicitado = parseFloat($('#importeSolicitado').text().replace(/\./, '').replace(/,/, '.')).toFixed(2);
    var concedido = solicitado * puntuacion / 100;
    $('[name="importeConcedido"]').val(concedido.toFixed(2).toString().replace(/\./, ','));
}

function recalcularImporteConcedido() {
    var solicitado = parseFloat($('#importeSolicitado').text().replace(/\./, '').replace(/,/, '.')).toFixed(2);
    var puntuacion = parseFloat($('#puntuacion').val().toString().replace(',', '.')).toFixed(2);
    var concedido = solicitado * puntuacion / 100;
    $('[name="importeConcedido"]').val(concedido.toFixed(2).toString().replace(/\./, ','));
}

function actualizaL2Values() {
    if ($('[name="l2esClubFutbol"]').prop('checked')) {
        $('#residentes-no-futbol').hide();
        $('#residentes-futbol').show();
    } else {
        $('#residentes-no-futbol').show();
        $('#residentes-futbol').hide();
    }
}

function addMaterial() {
    var material = $('[name="material"]').find(':selected').text();
    var cantidad = $('#cantidad').val();
    var diaEntrega = $('#fentrega_day').val();
    var mesEntrega = $('#fentrega_month').val()-1;
    var anoEntrega = $('#fentrega_year').val();
    var fechaEntrega = new Date(anoEntrega + "-" + mesEntrega + "-" + diaEntrega);
    var lugarEntrega = $('[name="lugar-entrega"]').val();
    var diaDevolucion = $('#frecogida_day').val();
    var mesDevolucion = $('#frecogida_month').val();
    var anoDevolucion = $('#frecogida_year').val();
    var fechaDevolucion = new Date(anoDevolucion + "-" +  mesDevolucion + "-" + diaDevolucion);
    var lugarDevolucion = $('[name="lugar-devolucion"]').val();
    var observaciones =  $('[name="observaciones"]').val();
    var botonDelete = ('<input type="button" value="Borrar" onclick="deleteMaterial(this)"/>')
    var lastId = parseInt($('#lista-material tr:last').attr("id"));
    var newId = 1;
    if (!isNaN(lastId)) {
        newId = lastId + 1;
    }
    //var id = $('[name="material"]').find(':selected').val();
    //alert("Id: " + id + " Nombre: " + material);
    if (parseInt(cantidad) === 0 || isNaN(parseInt(cantidad))) {
        alert("Error: La cantidad no es correcta");
    } else {
        var row = '<tr id="' + newId.toString() + '"><td>' + material + '</td><td>' + cantidad + '</td><td>' + fechaEntrega.toLocaleDateString() + '</td><td>' + lugarEntrega + '</td><td>' + fechaDevolucion.toLocaleDateString() + '</td><td>' + lugarDevolucion + '</td><td>' + observaciones +'</td><td>' + botonDelete + '</td></tr>';
        $('#lista-material').append(row);
    }
}

function deleteMaterial(elem) {
    elem.closest('tr').remove();
}

function fillAvailableStock(id) {
    console.log(id);
    var url = "/gobela/solicitudMaterial/checkStock/" + id.toString();
    console.log("URL: " + url);
    $.ajax({
        url: url,
        type: 'get'
    }).done(function (data) {
        console.log("data: " + data);
        $('#stock-container').html(data);
    })
}

function buscar(){
    // alert("HOLA!!!!");
    $('#fileUpload').click()
}

function copyFileName(){
    var filename = $('#fileUpload').val().split('\\').pop();
    $('#fileNameInput').val(filename);
}