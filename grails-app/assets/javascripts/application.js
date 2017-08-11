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
    (function($) {
        $(document).ajaxStart(function() {
            $('#spinner').fadeIn();
        }).ajaxStop(function() {
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
    calcularImporteConcedido(total);
}

function calcularImporteConcedido(puntuacion){
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

function actualizaL2Values(){
    if($('[name="l2esClubFutbol"]').prop('checked')){
        $('#residentes-no-futbol').hide();
        $('#residentes-futbol').show();
    }else{
        $('#residentes-no-futbol').show();
        $('#residentes-futbol').hide();
    }
}