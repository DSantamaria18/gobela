<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'sesion.label', default: 'Sesion')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>

</head>

<body>
<a href="#list-sesion" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        %{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
    </ul>
</div>

<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-3"><!-- sidebar -->
            <div class="panel-group" id="accordion">
                <g:each in="${recintosList}" var="recinto" status="i">
                    <div class="panel panel-default nav nav-pills nav-stacked admin-menu">

                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-target-id="2" data-parent="#accordion"
                                   href="#collapse-${i}">${recinto[0].recinto}</a>
                            </h4>
                        </div>

                        <div id="collapse-${i}" class="panel-collapse collapse">
                            <div class="panel-body">
                                <ul class="list-group">
                                    <g:each in="${recinto}" var="instalacion">
                                        <a class="list-group-item lista-instalaciones-item" href="#"
                                           id="${instalacion.id}" data-id="${instalacion.id}"
                                           data-target-id="2"
                                           onclick="filtraSesiones(${instalacion.id});">${instalacion}
                                        </a>
                                    </g:each>
                                </ul>
                            </div>
                        </div>
                    </div>
                </g:each>
            </div> <!-- accordion -->
        </div> <!-- sidebar -->

        <div class="col-sm-9 col-md-9 ">
            <div class="row">
                <g:if test="${sesionesList.isEmpty()}">
                    <h1>Sesiones de Entrenamiento</h1>

                    <p><small>Selecciona una instalación para ver las sesiones de entrenamiento programadas...</small>
                    </p>
                </g:if>
                <g:else>
                    <h1>Sesiones de Entrenamiento ${sesionesList[0].recinto} ${sesionesList[0].instalacion}</h1>
                </g:else>
            </div>

            <br/>
            <hr/>
            <br/>

            <div class="row">
                <div class="form-group"><!-- Botones día de la semana -->
                    <input type="hidden" id="instalacion-seleccionada">
                    <input type="hidden" id="dia-seleccionado">

                    <div class="input-group">
                        <div id="radioBtn" class="btn-group">
                            <span class="btn btn-default btn-sm btn-dia" data-toggle="estado"
                                  data-value="LUNES">LUNES</span>
                            <span class="btn btn-default btn-sm btn-dia" data-toggle="estado"
                                  data-value="MARTES">MARTES</span>
                            <span class="btn btn-default btn-sm btn-dia" data-toggle="estado"
                                  data-value="MIERCOLES">MIERCOLES</span>
                            <span class="btn btn-default btn-sm btn-dia" data-toggle="estado"
                                  data-value="JUEVES">JUEVES</span>
                            <span class="btn btn-default btn-sm btn-dia" data-toggle="estado"
                                  data-value="VIERNES">VIERNES</span>
                            <span class="btn btn-default btn-sm btn-dia" data-toggle="estado"
                                  data-value="SABADO">SABADO</span>
                            <span class="btn btn-default btn-sm btn-dia" data-toggle="estado"
                                  data-value="DOMINGO">DOMINGO</span>
                        </div>
                    </div>
                </div> <!-- Botones día de la semana -->

                <div class="table-responsive" id="tabla-sesiones">

                </div>
            </div>
        </div> <!-- Listado de sesiones -->

    </div>

</div> <!-- row -->

</div> <!-- container -->

<g:javascript>
    var hoy = new Date();

    $('#radioBtn span').on('click', function () {
        var sel = $(this).data('value');
        $('#dia-seleccionado').val(sel);
        $('span').not('[data-value="' + sel + '"]').removeClass('active btn-primary').addClass('notActive btn-default');
        $('span[data-value="' + sel + '"]').removeClass('notActive btn-default').addClass('active btn-primary');
    });

    function filtraSesiones(instalacionId, diaSemana) {
        $('#spinner').show();
        $.ajax({
            url: "/gobela/sesion/filtraSesiones",
            type: "get",
            data: {
                instalacionId: instalacionId,
                diaSemana: diaSemana
            }, success: function (data, status) {
                $('#spinner').hide();
                console.log(status);
                $('#tabla-sesiones').html(data);
            }, error: function (error) {
                $('#spinner').hide();
                console.debug(error);
            }
        })
    }

    $('.btn-dia').on('click', function () {
        var diaSemana = $(this).data('value');
        $('#dia-seleccionado').val(diaSemana);
        var instalacionId = $('#instalacion-seleccionada').val();
        if (instalacionId === "" || instalacionId === undefined) {
            alert("No has seleccionado una instalación...")
        } else {
            filtraSesiones(instalacionId, diaSemana);
        }
    });

    $('.lista-instalaciones-item').on('click', function () {
        var diaSemana = $('#dia-seleccionado').val();
        var instalacionId = $(this).data('id');
        $('#instalacion-seleccionada').val(instalacionId);
        filtraSesiones(instalacionId, diaSemana)
    });


    $(document).ready(function () {

        $("#spinner").bind("ajaxSend", function () {
            $(this).fadeIn();
        }).bind("ajaxComplete", function () {
            $(this).fadeOut();
        });

        var diaSemana = hoy.toString().split(" ")[0];
        var dia = "";

        switch (diaSemana) {
            case "Mon":
                dia = "LUNES";
                break;
            case "Tue":
                dia = "MARTES";
                break;
            case "Wed":
                dia = "MIERCOLES";
                break;
            case "Thu":
                dia = "JUEVES";
                break;
            case "Fri":
                dia = "VIERNES";
                break;
            case "Sat":
                dia = "SABADO";
                break;
            case "Sun":
                dia = "DOMINGO";
                break;
        }

        var sel = dia;
        $('#dia-seleccionado').val(sel);
        $('span').not('[data-value="' + sel + '"]').removeClass('active btn-primary').addClass('notActive btn-default');
        $('span[data-value="' + sel + '"]').removeClass('notActive btn-default').addClass('active btn-primary');
    });
</g:javascript>
</body>
</html>