<g:if test="${!sesionesList.isEmpty()}">
    <h1>Entrenamientos <span>${sesionesList[0].recinto}</span> <span>${sesionesList[0].instalacion}</span></h1>

    <g:each in="${sesionesList}" var="sesion">
        <div class="list-group">
            <div class="list-group-item">
                <div class="item-div hour-box center-block">
                    <div class="desde text-center">${sesion.horaInicio}</div>
                    <div class="hasta text-center">${sesion.horaFin}</div>
                </div>

                <div class="item-div cat-box">
                    <div class="club text-center">${sesion.categoria.club}</div>
                    <div class="categoria text-center">${sesion.categoria}</div>
                </div>

                <div class="item-div data-box">
                    <div class="participantes text-center"><i class="glyphicon glyphicon-user"></i> ${sesion.categoria.numDeportistas}</div>
                    <div class="ocupacion text-center"><i class="glyphicon glyphicon-stats"></i> ${sesion.ocupacion}</div>
                </div>

                <div class="item-div verify-box text-center">
                    <a class="check" id="boton-verificar" data-toggle="modal" data-sesion="${sesion.id}" data-categoria="${sesion.categoria}"
                       data-participantes="${sesion.categoria.numDeportistas}"
                       data-club="${sesion.categoria.club}" data-horario="${sesion.horaInicio}-${sesion.horaFin}"
                       id="boton-verificar" href="#modal-verificacion" data-ocupacion="${sesion.ocupacion}">
                        <i class="glyphicon glyphicon-ok-circle verify-btn"></i>
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
                    <input type="number" class="form-control" name="ocupacion" id="ocupacion" required>
                </div>

                <div class="form-group">
                    <label for="observaciones">Observaciones</label>
                    <textarea row="25" class="form-control" name="observaciones" id="observaciones"/>
                </div>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-success" id="verificacion-ok"><i
                        class="glyphicon glyphicon-ok"></i></button>
                <button type="button" class="btn btn-danger" id="verificacion-fail"><i
                        class="glyphicon glyphicon-remove"></i></button>
            </div>
        </div>
    </div>
</div>
<!-- Modal de verificación -->

<g:javascript>
    $('#boton-verificar').on('click', function () {
        $('#sesion-id').val($(this).data('sesion'));
        $('#fecha').val(hoy.toISOString().substring(0, 10));
        $('#horario').val($(this).data('horario'));
        $('#club').val($(this).data('club'));
        $('#categoria').val($(this).data('categoria'));
        $('#participantes').val($(this).data('participantes'));
        $('#ocupacion').val($(this).data('ocupacion'));
    })

    $('#verificacion-ok').on('click', function () {

    })

    $('#verificacion-fail').on('click', function () {

    })
</g:javascript>