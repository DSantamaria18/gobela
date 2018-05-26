<g:if test="${!sesionesList.isEmpty()}">
    <h1>Entrenamientos <span>${sesionesList[0][1].recinto}</span> <span>${sesionesList[0][1].instalacion}</span>
    </h1><br/>

    <g:each in="${sesionesList}" var="sesion">
        <div class="list-group" id="lista-sesiones">
            <div class="list-group-item">
                <div class="item-div hour-box center-block">
                    <div class="desde text-center">${sesion[1].horaInicio}</div>

                    <div class="hasta text-center">${sesion[1].horaFin}</div>
                </div>

                <div class="item-div cat-box">
                    <div class="club text-center">${sesion[1].categoria.club}</div>

                    <div class="categoria text-center">${sesion[1].categoria}</div>
                </div>

                <div class="item-div data-box">
                    <div class="participantes text-center"><i
                            class="glyphicon glyphicon-user"></i> ${sesion[1].categoria.numDeportistas}</div>

                    <div class="ocupacion text-center"><i class="glyphicon glyphicon-stats"></i> ${sesion[1].ocupacion}
                    </div>
                </div>

                <div class="item-div verify-box text-center">
                    <a class="check" id="boton-verificar" id="boton-verificar" href="#modal-verificacion"
                       data-toggle="modal" data-sesion="${sesion[1].id}" data-categoria="${sesion[1].categoria}"
                       data-participantes="${sesion[1].categoria.numDeportistas}"
                       data-club="${sesion[1].categoria.club}" data-horario="${sesion[1].horaInicio}-${sesion[1].horaFin}"
                       data-ocupacion="${sesion[1].ocupacion}" data-hsid="${sesion[0]?.id}"
                       data-hsparticipantes="${sesion[0]?.participantes}" data-hsocupacion="${sesion[0]?.ocupacion}"
                       data-hsobservaciones="${sesion[0]?.observaciones}" data-hsresult="${sesion[0]?.resultadoOk}">
                        <g:if test="${sesion[0]}">
                            <i class="glyphicon glyphicon-pencil verify-btn"></i>
                        </g:if>
                        <g:else>
                            <i class="glyphicon glyphicon-ok-circle verify-btn"></i>
                        </g:else>
                    </a>
                </div>
            </div>
        </div>
    </g:each>

</g:if>
<g:else>
    <h1>No hay entrenamientos planificados para el ${dia} en ${instalacion.recinto} ${instalacion}...</h1>
</g:else>


<!-- Modal de verificación -->
<div class="modal fade" id="modal-verificacion" role="dialog" aria-labelledby="modal-verificacion" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

                <h1>Verificación de Sesión</h1>
            </div>

            <div class="modal-body">
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
                    <input type="number" class="form-control" name="participantes" id="participantes" value="" required>
                </div>

                <div class="form-group">
                    <label for="ocupacion">Ocupación</label>
                    <input type="number" class="form-control" name="ocupacion" id="ocupacion" step="25" max="100" min="0" required>
                </div>

                <div class="form-group">
                    <label for="observaciones">Observaciones</label>
                    <textarea row="25" class="form-control" name="observaciones" id="observaciones"/>
                </div>

                <div class="form-group">
                    <label for="resultadoOk">Resultado</label>

                    <div class="input-group">
                        <div id="radioBtnV2" class="btn-group">
                            <span class="btn btn-success btn-sm active" data-toggle="resultadoOk" data-value="true"
                                  data-active="btn-success" data-notactive="btn-default" id="verificacion-ok">
                                <i class="glyphicon glyphicon-ok"></i>
                            </span>
                            <span class="btn btn-default btn-sm notActive" data-toggle="resultadoOk" data-value="false"
                                  data-active="btn-danger" data-notactive="btn-default" id="verificacion-fail">
                                <i class="glyphicon glyphicon-remove"></i>
                            </span>
                        </div>
                        <input type="hidden" name="resultadoOk" id="resultadoOk">
                    </div>
                </div>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="enviarBtn" data-dismiss="modal" disabled>ENVIAR</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal de verificación -->

<g:javascript>
    $('#radioBtnV2 span').on('click', function(){
        var sel = $(this).data('value');
        var tog = $(this).data('toggle');
        var active = $(this).data('active');
        var classes = "btn-default btn-primary btn-success btn-info btn-warning btn-danger btn-link";
        var notactive = $(this).data('notactive');
        $('#'+tog).val(sel);
        $('span[data-toggle="'+tog+'"]').not('[data-value="'+sel+'"]').removeClass('active '+classes).addClass('notActive '+notactive);
        $('span[data-toggle="'+tog+'"][data-value="'+sel+'"]').removeClass('notActive '+classes).addClass('active '+active);


    });

    $('.check').on('click', function () {
        var hoy = new Date();

        $('#fecha').val(hoy.toISOString().substring(0, 10));
        $('#horario').val($(this).data('horario'));
        $('#club').val($(this).data('club'));
        $('#categoria').val($(this).data('categoria'));
        $('#sesion-id').val($(this).data('sesion'));
        $('#hsesion-id').val($(this).data('hsid'));
        $('#observaciones').val($(this).data('hsobservaciones'));

        if ($(this).data('hsid') === "") {
            $('#participantes').val($(this).data('participantes'));
            $('#ocupacion').val($(this).data('ocupacion'));
        } else {
            $('#participantes').val($(this).data('hsparticipantes'));
            $('#ocupacion').val($(this).data('hsocupacion'));
            $('#resultadoOk').val($(this).data('hsresult'));

            var classes = "btn-default btn-primary btn-success btn-info btn-warning btn-danger btn-link";
            var notactive = "btn-default";
            var tog = "resultadoOk";
            var sel = $(this).data('hsresult') === true;

            if(sel === true){
                var active = "btn-success";
            }else {
                var active = "btn-danger";
            }
            $('#'+tog).val(sel);
            $('span[data-toggle="'+tog+'"]').not('[data-value="'+sel+'"]').removeClass('active '+classes).addClass('notActive '+notactive);
            $('span[data-toggle="'+tog+'"][data-value="'+sel+'"]').removeClass('notActive '+classes).addClass('active '+active);
        }
    });

    $('#verificacion-ok').on('click', function () {
        $('#resultadoOk').val("true");
        $('#enviarBtn').removeAttr('disabled');
    });

    $('#verificacion-fail').on('click', function () {
        $('#resultadoOk').val("false");
        $('#enviarBtn').removeAttr('disabled');
    });

    $('#enviarBtn').on('click', function () {
        var hs = $('#hsesion-id').val();
        if(hs === ""){
            createHistoricoSesion();
        } else {
            updateHistoricoSesion(hs);
        }
    });

    function updateHistoricoSesion(hs) {
        $('#spinner').show();
        var data = {
            participantes: $('#participantes').val(),
            ocupacion: $('#ocupacion').val(),
            observaciones: $('#observaciones').val(),
            resultadoOk: $('#resultadoOk').val()
        };

        $.post("/gobela/historicoSesiones/edit/" + hs, data)
                .done(function (data, status) {
            $('#tabla-sesiones').html(data);
            $('#spinner').hide();

        }).error(function (error) {
            $('#tabla-sesiones').html(data);
            $('#spinner').hide();
        });
    }

    function createHistoricoSesion() {
        $('#spinner').show();
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
            $('#spinner').hide();

        }).error(function (error) {
            $('#tabla-sesiones').html(data);
            $('#spinner').hide();
        });
    }
</g:javascript>