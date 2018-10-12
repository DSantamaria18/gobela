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
        <li><g:link class="list" controller="historicoSesiones" action="index">Histórico</g:link></li>
    </ul>
</div>

<div class="container">
    <div class="row">
        <h1>Sesiones de Entrenamiento</h1>
    </div>

    <hr/>
    <br/>
    <label id="diaSemana">${diaSemana}</label>
    <label id="fecha-actual" for="hoy"></label>


    <!-- Filtro -->
    <div id="filtroSesiones">
        <div class="row filtro-sesiones">

            <div id="combo-recintos" style="display: block">
                <g:select from="${gobela.Recinto.list()}"
                          name="comboRecintos"
                          optionKey="id"
                          noSelection="['null': 'Recinto...']"/>
            </div>
            <br>

            <div id="combo-instalaciones" style="display: block">
                <g:render template="comboInstalaciones"/>
            </div>

            <br>
            <button id="botonFiltrado" type="button" class="btn btn-info bt">Mostrar Sesiones</button>
        </div>
    </div>
    <!-- Fin filtro -->
    <br>
    <hr>
    <br>
    <!-- tabla de resultados de búsqueda -->
    <div id="lista-sesiones">
        <g:render template="listaSesiones2" model="[listaSesiones: listaSesiones]"/>
        %{--<table id="tabla-sesiones" class="table-responsive" style="display: table">
            <thead>
            <tr>
                <th>HORA</th>
                <th>CATEGORIA</th>
                <th>INFO</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${listaSesiones}" var="sesion" status="i">
                <tr style="font-size: 80%; border: 1px solid"
                    id="item-sesion"
                    href="#modal-verificacion" data-toggle="modal"
                    data-index="${i}"
                    data-sesionid="${sesion[1].id}"
                    data-clubid="${sesion[1]?.categoria?.club?.id}"
                    data-club="${sesion[1]?.categoria?.club}"
                    data-categoriaid="${sesion[1]?.categoria?.id}"
                    data-categoria="${sesion[1]?.categoria}"
                    data-horainicio="${sesion[1]?.horaInicio}"
                    data-horafin="${sesion[1]?.horaFin}"
                    data-recintoid="${sesion[1]?.recinto?.id}"
                    data-recinto="${sesion[1]?.recinto}"
                    data-instalacionid="${sesion[1]?.instalacion?.id}"
                    data-instalacion="${sesion[1]?.instalacion}"
                    data-participantes="${sesion[1]?.categoria?.numDeportistas}"
                    data-ocupacion="${sesion[0]?.ocupacion}"
                    data-hsid="${sesion[0]?.id}"
                    data-hsfecha="${sesion[0]?.fecha}"
                    data-hsparticipantes="${sesion[0]?.participantes}"
                    data-hsocupacion="${sesion[0]?.ocupacion}"
                    data-hsobservaciones="${sesion[0]?.observaciones}"
                    data-hsresultadook="${sesion[0]?.resultadoOk}">
                    <td>
                        <span id="horario-sesion">
                            <span>${sesion[1].horaInicio}</span>
                            <span>${sesion[1].horaFin}</span>
                        </span>
                        <br>
                        <span id="lugar-sesion">
                            <span>${sesion[1].recinto}</span>
                            <span>${sesion[1].instalacion}</span>
                        </span>

                    </td>
                    <td>
                        <span id="sesion-club" style="font-weight: bold">${sesion[1].categoria.club}</span>
                        <br>
                        <span id="sesion-categoria">${sesion[1].categoria}</span>
                    </td>
                    <td>
                        <span id="info-participantes">
                            <i class="glyphicon glyphicon-user"></i>
                            ${sesion[1].categoria.numDeportistas}
                        </span>
                        <br>
                        <span id="info-ocupacion">
                            <i class="glyphicon glyphicon-stats"></i>
                            ${sesion[1].ocupacion}
                        </span>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>--}%
    </div>
    <!-- fin tabla -->

    <!-- Modal de verificación -->
    <div class="modal" id="modal-verificacion" role="dialog" aria-labelledby="modal-verificacion" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

                    <h1>Verificación de Sesión</h1>
                </div>

                <div class="modal-body">
                    <input type="date" name="fecha-sesion" id="fecha-sesion" hidden/>
                    <input type="hidden" name="sesion-id" id="sesion-id"/>
                    <input type="hidden" name="hsesion-id" id="hsesion-id"/>

                    <div class="form-group">
                        <label for="fecha">Fecha</label>
                        <input type="date" class="form-control" name="fecha" id="fecha" readonly>
                    </div>

                    <div class="form-group">
                        <label for="horario">Horario</label>
                        <input type="text" class="form-control" name="horario" id="horario" readonly>
                    </div>

                    <div class="form-group">
                        <label for="club">Club</label>
                        <input type="text" class="form-control" name="club" id="club" readonly>
                    </div>

                    <div class="form-group">
                        <label for="categoria">Categoria</label>
                        <input type="text" class="form-control" name="categoria" id="categoria" readonly>
                    </div>

                    <div class="form-group">
                        <label for="participantes">Participantes</label>
                        <input type="number"
                               class="form-control"
                               name="participantes"
                               id="participantes"
                               min="0"
                               step="1"
                               required>
                    </div>

                    <div class="form-group">
                        <label for="ocupacion">Ocupación</label>
                        <input type="number"
                               class="form-control"
                               name="ocupacion"
                               id="ocupacion"
                               max="100"
                               min="0"
                               required>
                    </div>

                    <div class="form-group">
                        <label for="observaciones">Observaciones</label>
                        <textarea row="25" class="form-control" name="observaciones" id="observaciones"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="resultadoOk">Resultado</label>

                        <div class="input-group">
                            <div id="radioBtnV2" class="btn-group">
                                <span class="btn btn-default btn-sm"
                                      data-value="true"
                                      id="verificacionok">
                                    <i class="glyphicon glyphicon-ok"></i>
                                </span>
                                <span class="btn btn-default btn-sm"
                                      data-value="false"
                                      id="verificacionfail">
                                    <i class="glyphicon glyphicon-remove"></i>
                                </span>
                            </div>
                            <input type="hidden" name="resultadoOk" id="resultadoOk">
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="enviarBtn" data-dismiss="modal">ENVIAR</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal de verificación -->

</div> <!-- container -->

<g:javascript>

    $('#botonFiltrado').on('click', function () {
        alert('filtrando...');
    });

    function filtraSesiones(instalacionId, diaSemana) {
        $.ajax({
            url: "/gobela/sesion/filtraSesiones",
            type: "get",
            data: {
                instalacionId: instalacionId,
                diaSemana: diaSemana
            }, success: function (data, status) {
                // $('#spinner').hide();
                $('#tabla-sesiones').html(data);
                formateaSesiones();
            }, error: function (error) {
                console.debug(error);
            }
        })
    }


    $('#comboRecintos').on('change', function () {
        var recinto = $('#comboRecintos').val();
        console.log("RECINTO: " + recinto);
        var url = "/gobela/sesion/filtraInstalacionesPorRecinto/?recinto=" + recinto;
        console.log("URL: " + url);
        $.ajax({
            url: url,
            type: 'get'
        }).done(function (data) {
            console.log(data);
            $('#combo-instalaciones').html(data);
        }).error(function (error) {
            console.log(error);
        })
    });



    function formateaTablaSesiones() {
        $('tr#item-sesion').each(function () {
            console.log($(this).data('hsresultadook'));
            if ($(this).data('hsresultadook') === true) {
                $(this).css('background-color', '#abe2ac'); //verde
                $(this).prop('disabled', true);
            } else if ($(this).data('hsresultadook') === false) {
                $(this).css('background-color', '#e0b4b4'); //rojo
                $(this).prop('disabled', true);
            }
        });
    }

    $('tr').on('click', function () {
        //alimentamos el modal

        // $('#fecha').val(hoy.toISOString().substring(0, 10));
        $('#fecha').val($('#fecha-sesion').val());
        $('#horario').val($(this).data('horainicio') + " - " + $(this).data('horafin'));
        $('#club').val($(this).data('club'));
        $('#categoria').val($(this).data('categoria'));

        $('#observaciones').val($(this).data('hsobservaciones'));
        $('#sesion-id').val($(this).data('sesionid'));
        $('#hsesion-id').val($(this).data('hsid'));
    });

    $('#verificacionok').on('click', function () {
        $('#verificacionok').removeClass('btn-default').addClass('btn-success');
        $('#verificacionfail').removeClass('btn-danger').addClass('btn-default');
        $('#resultadoOk').val("true");
    });

    $('#verificacionfail').on('click', function () {
        $('#verificacionok').removeClass('btn-success').addClass('btn-default');
        $('#verificacionfail').removeClass('btn-default').addClass('btn-danger');
        $('#resultadoOk').val("false");
    });

    $('#enviarBtn').on('click', function () {
        var hs = $('#hsesion-id').val();
        var res = $('#resultadoOk').val();
        var participantes = $('input#participantes').val();
        var ocupacion = $('input#ocupacion').val();
        if (res === "" || participantes === "" || ocupacion === "") {
            // alert("No has marcado un resultado para esta sesión...");
            alert("Por favor, rellena todos los campos obligatorios...");
        } else {
            if (hs === "") {
                console.log("CREANDO!");
                createHistoricoSesion();
            } else {
                console.log("ACTUALIZANDO!");
                updateHistoricoSesion(hs);
            }
        }
    });

    /*function updateHistoricoSesion(hs) {
        var data = {
            participantes: $('#participantes').val(),
            ocupacion: $('#ocupacion').val(),
            observaciones: $('#observaciones').val(),
            resultadoOk: $('#resultadoOk').val()
        };

        $.post("/gobela/historicoSesiones/edit/" + hs, data)
                .done(function (data, status) {
            $('#tabla-sesiones').html(data);
            formateaTablaSesiones();

        }).error(function (error) {
            $('#tabla-sesiones').html(data);
        });
    }*/

    function createHistoricoSesion() {
        var data = {
            sesionId: $('#sesion-id').val(),
            fecha: $('#fecha').val(),
            participantes: $('#participantes').val(),
            ocupacion: $('#ocupacion').val(),
            observaciones: $('#observaciones').val(),
            resultadoOk: $('#resultadoOk').val()
        };

        $.post("/gobela/historicoSesiones/create", data)
                .done(function (data, status) {
            $('#tabla-sesiones').html(data);
            formateaTablaSesiones();
        }).error(function (error) {
            $('#tabla-sesiones').html(data);
        });
    }

    $(document).ready(function () {
        var fecha = new Date();
        var hoy = fecha.toISOString().substring(0, 10);
        $('#fecha-actual').html(fecha.getDate() + "-" + (fecha.getMonth() + 1) + "-" + fecha.getFullYear());
        $('input#fecha-sesion').val(hoy);
        formateaTablaSesiones();
    });

</g:javascript>
</body>
</html>