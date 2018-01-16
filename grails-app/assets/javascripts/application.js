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
    if (total > 100.00) {
        $('[name="puntuacion"]').css('border', '1px solid rgb(255, 15, 15)');
        alert('La puntuación total supera el 100%');
        $('.save').hide();
    } else {
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

function addMaterial(eventoId) {
    var diaEntrega = $('[name="entrega_day"]').val();
    var mesEntrega = $('[name="entrega_month"]').val();
    var anoEntrega = $('[name="entrega_year"]').val();
    var fechaEntrega = new Date(anoEntrega + "-" + mesEntrega + "-" + diaEntrega);
    var fechaEntregaSQL = new Date(anoEntrega, mesEntrega, diaEntrega).toISOString();
    // var fechaEntregaSQL = new Date(anoEntrega, mesEntrega, diaEntrega).toISOString().slice(0, 19).replace('T', ' ');
    var lugarEntrega = $('[name="lugarEntrega"]').val();

    var diaDevolucion = $('[name="recogida_day"]').val();
    var mesDevolucion = $('[name="recogida_month"]').val();
    var anoDevolucion = $('[name="recogida_year"]').val();
    var fechaDevolucion = new Date(anoDevolucion + "-" + mesDevolucion + "-" + diaDevolucion);
    var fechaDevolucionSQL = new Date(anoDevolucion, mesDevolucion, diaDevolucion).toISOString();
    // var fechaDevolucionSQL = new Date(anoDevolucion, mesDevolucion, diaDevolucion).toISOString().slice(0, 19).replace('T', ' ');
    var lugarDevolucion = $('[name="lugarDevolucion"]').val();

    var material = $('[name="material"]').find(':selected').text();
    var materialId =parseInt($('[name="material"]').find(':selected').val());
    var cantidad = $('#cantidadMat').val();

    var observaciones = $('[name="observaciones"]').val();
    var comentarios = $('[name="comentarios"]').val();

    // var lastIndex = parseInt($('#lista-material tr:last').attr("index"));
    var lastIndex = parseInt($('[name="newIndex"]'));
    console.log("INDEX: " + lastIndex.toString());
    var newIndex = 1;
    if (!isNaN(lastIndex)) {
        newIndex = lastIndex + 1;
    }
    var params = {
        evento: eventoId,
        material: materialId,
        cantidad: cantidad,
        fechaEntrega: fechaEntregaSQL,
        lugarEntrega: lugarEntrega,
        fechaDevolucion: fechaDevolucionSQL,
        lugarDevolucion: lugarDevolucion,
        comentarios: comentarios,
        observaciones: observaciones
    };

    console.log(params);
    $.post("/gobela/solicitudMaterial/save"
        , params
        , function(data, status, newId){
            // console.log(newId);
            console.log("Data: " + data + "\nStatus: " + status);

            var tdMaterial = '<td>' + material + '<input type="hidden" name="solicitudMaterial[' + newIndex + '].material" id="solicitudMaterial[' + newIndex + '].material" value="' + materialId + '"/></td>';
            var tdCantidad = '<td>' + cantidad + '<input type="hidden" name="solicitudMaterial[' + newIndex + '].cantidad" id="solicitudMaterial[' + newIndex + '].cantidad" value="' + cantidad + '"/></td>';
            var tdFechaEntrega = '<td>' + fechaEntrega.toLocaleDateString() + '<input type="hidden" name="solicitudMaterial[' + newIndex + '].fechaEntrega" id="solicitudMaterial[' + newIndex + '].fechaEntrega" value="' + fechaEntregaSQL + '"/></td>';
            var tdLugarEntrega = '<td>' + lugarEntrega + '<input type="hidden" name="solicitudMaterial[' + newIndex + '].lugarEntrega" id="solicitudMaterial[' + newIndex + '].lugarEntrega" value="' + lugarEntrega + '"/></td>';
            var tdFechaDevolucion = '<td>' + fechaDevolucion.toLocaleDateString() + '<input type="hidden" name="solicitudMaterial[' + newIndex + '].fechaDevolucion" id="solicitudMaterial[' + newIndex + '].fechaDevolucion" value="' + fechaDevolucionSQL + '"/></td>';
            var tdLugarDevolucion = '<td>' + lugarDevolucion + '<input type="hidden" name="solicitudMaterial[' + newIndex + '].lugarDevolucion" id="solicitudMaterial[' + newIndex + '].lugarDevolucion" value="' + lugarDevolucion + '"/></td>';
            var tdObservaciones = '<td>' + observaciones + '<input type="hidden" name="solicitudMaterial[' + newIndex + '].observaciones" id="solicitudMaterial[' + newIndex + '].observaciones" value="' + observaciones + '"/></td>';
            var tdComentarios = '<td>' + comentarios + '<input type="hidden" name="solicitudMaterial[' + newIndex + '].comentarios" id="solicitudMaterial[' + newIndex + '].comentarios" value="' + comentarios + '"/></td>';
            var botonDelete = '<td><input type="button" value="Borrar" onclick="deleteMaterial(this)"/></td>';
            var row = '<tr index="' + newId + '">' + tdMaterial + tdCantidad + tdFechaEntrega + tdLugarEntrega + tdFechaDevolucion + tdLugarDevolucion + tdComentarios + tdObservaciones + botonDelete + '</tr>';
            // var row = '<tr index="' + newIndex.toString() + '">' + tdMaterial + tdCantidad + tdFechaEntrega + tdLugarEntrega + tdFechaDevolucion + tdLugarDevolucion + tdComentarios + tdObservaciones + botonDelete + '</tr>';
            $('#lista-material').append(row);

            $('[name="material"]').val('');
            $('#cantidadMat').val('');
            $('[name="comentarios"]').val('');
        });


    // if (parseInt(cantidad) === 0 || isNaN(parseInt(cantidad))) {
    //     alert("Error: La cantidad no es correcta");
    // } else {
    //     var row = '<tr id="' + newIndex.toString() + '"><td>' + material + '</td><td>' + cantidad + '</td><td>' + fechaEntrega.toLocaleDateString() + '</td><td>' + lugarEntrega + '</td><td>' + fechaDevolucion.toLocaleDateString() + '</td><td>' + lugarDevolucion + '</td><td>' + observaciones + '</td><td>' + botonDelete + '</td></tr>';
    //     $('#lista-material').append(row);
    // }
    // var row = '<tr index="' + newIndex.toString() + '"><td>' + material + '</td><td>' + cantidad + '</td><td>' + fechaEntrega.toLocaleDateString() + '</td><td>' + lugarEntrega + '</td><td>' + fechaDevolucion.toLocaleDateString() + '</td><td>' + lugarDevolucion + '</td><td>' + comentarios + '</td><td>' + observaciones + '</td><td>' + botonDelete + '</td></tr>';

}

function deleteMaterial(elem) {
    elem.closest('tr').remove();
}

/*function fillAvailableStock(id) {
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
}*/

function buscar(tipo) {
    if (tipo === "info") {
        console.log("buscando info");
        $('#infoFileUpload').click();
    } else if (tipo === "permisos") {
        console.log("buscando permisos");
        $('#permFileUpload').click();
    } else if (tipo === "postEvento") {
        console.log("buscando post-evento");
        $('#postEventFileUpload').click();
    } else if (tipo === 'balance') {
        $('#balanceFileUpload').click();
    } else if (tipo === 'justificacion') {
        $('#justificacionFileUpload').click();
    } else {
        console.log("TIPO NO VALIDO: " + tipo);
    }

}

function copyFileName(tipo) {
    var filename = "";
    if (tipo === "info") {
        filename = $('#infoFileUpload').val().split('\\').pop();
        $('#infoFileNameInput').val(filename);
    } else if (tipo === "permisos") {
        filename = $('#permFileUpload').val().split('\\').pop();
        $('#permFileNameInput').val(filename);
    } else if (tipo === "postEvento") {
        filename = $('#postEventFileUpload').val().split('\\').pop();
        $('#postEventFileNameInput').val(filename);
    } else if (tipo === "balance") {
        filename = $('#balanceFileUpload').val().split('\\').pop();
        $('#balanceFileNameInput').val(filename);
    }else if (tipo === "justificacion") {
        filename = $('#justificacionFileUpload').val().split('\\').pop();
        $('#justificacionFileNameInput').val(filename);
    } else {
        console.log("TIPO NO VALIDO" + tipo);
    }
}

function fillLugarByZona(zonaId, lugarId) {
    var url = "/gobela/evento/getLugarByZona/" + zonaId.toString();
    $.ajax({
        url: url,
        type: 'get'
    }).done(function (data) {
        $('#lugar-container').html(data);
        $('[name="lugar"]').val(lugarId);
    })
}

function fillInstalacionByRecinto(recintoId, instalacionId) {
    var url = "/gobela/evento/getInstalacionByRecinto/" + recintoId.toString();
    $.ajax({
        url: url,
        type: 'get'
    }).done(function (data) {
        $('#instalacion-container').html(data);
        $('[name="instalacion"]').val(instalacionId);
        $('[name="ocupacion"]').val(100);
    })
}

function fillContactoByEntidad(entidadId, contactoId) {
    var url = "/gobela/evento/getContactoByEntidad/" + entidadId.toString();
    console.log("URL: " + url);
    $.ajax({
        url: url,
        type: 'get'
    }).done(function (data) {
        $('#contacto-container').html(data);
        $('[name="contacto"]').val(contactoId);
    })
}

function fillContactoInfo(contactoId) {
    var url = "/gobela/evento/getContactoInfo/" + contactoId.toString();
    console.log("URL: " + url);
    $.ajax({
        url: url,
        type: 'get'
    }).done(function (data) {
        $('#contactoInfo-container').html(data);
    })
}

function filtrarEventos(estado, fechaIniDesde, fechaIniHasta, actividad, modalidad, multikirola, adaptado){
    var url = "/gobela/evento/filtrarEventos/";
    console.log("URL: " + url);
    $.ajax({
        url: url,
        type: 'get',
        data: {
            'estado': estado,
            'fechaIniDesde': fechaIniDesde,
            'fechaIniHasta': fechaIniHasta,
            'actividad': actividad,
            'modalidad': modalidad,
            'multikirola': multikirola,
            'adaptado': adaptado
        }
    }).done(function (data) {
        console.log("data: " + data);
        $('#tabla-eventos').html(data);
    })
}