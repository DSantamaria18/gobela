//= require jquery-2.2.0.min
//= require bootstrap
//= require_tree .
//= require_self

function cambiaEstadoSesion(sesionId, activa) {
    const nuevoEstado = (activa) ? 'INACTIVA' : 'ACTIVA';
    const msg = 'Se va a cambiar el estado de la sesión a ' + nuevoEstado + '. ¿Estás seguro/a?';

    const res = confirm(msg);
    if (res) {
        const estado = !activa;
        const data = {
            sesionId: sesionId,
            nuevoEstado: estado
        };

        $.ajax({
            type: "POST",
            url: "/gobela/sesion/actualizaEstadoById",
            data: data
        }).done(function (data, status) {
            console.log(status);
            window.location.href = '/gobela/sesion/show/' + sesionId;
        }).fail(function (error) {
            console.log(error);
            alert('No se ha podido actualizar la sesión');
        });
    }
};

function getInstalacionByRecinto(recintoId, instalacionId) {
    const url = "/gobela/sesion/getInstalacionByRecinto/" + recintoId.toString();
    $.ajax({
        url: url,
        type: 'get'
    }).done(function (data) {
        $('div#combo-instalacion').html(data);
        $('[name="instalacion"]').val(instalacionId);
        // $('[name="ocupacion"]').val(100);
    })
};
