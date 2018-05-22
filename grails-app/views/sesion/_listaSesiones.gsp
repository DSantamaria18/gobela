<g:if test="${!sesionesList.isEmpty()}">
    <h1>Entrenamientos <span>${sesionesList[0].recinto}</span> <span>${sesionesList[0].instalacion}</span></h1>


    <table class="table table-condensed">
        <thead>
        <tr>
            <th class="text-center">DIA</th>
            <th class="text-center">HORA</th>
            <th class="text-center">CLUB</th>
            <th class="text-center">CATEGORIA</th>
            <th class="text-center">OCUPACION</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${sesionesList}" var="sesion">
            <tr>
                <a href="#" onclick="alert('click!!');">
                    <td class="text-center">${sesion.diaSemana}</td>
                    <td class="text-center">${sesion.horaInicio}-${sesion.horaFin}</td>
                    <td class="text-center">${sesion.categoria.club}</td>
                    <td class="text-center">${sesion.categoria}</td>
                    <td class="text-center">${sesion.ocupacion}%</td>
                    <td class="text-center">
                        <a type="button" data-sesion="${sesion.id}" id="boton-verificar" href="#modal-verificacion"
                           class="btn btn-sm btn-info" data-toggle="modal" style="text-decoration: none">VERIFICAR</a>
                    </td>
                </a>
            </tr>
        </g:each>
        </tbody>
    </table>
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
                    <label for="participantes">Participantes</label>
                    <input type="number" class="form-control" name="participantes" id="participantes" required>
                </div>

                <div class="form-group">
                    <label for="observaciones">Observaciones</label>
                    <textarea row="25" class="form-control" name="observaciones" id="observaciones"/>
                </div>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-success" id="verificacion-ok"><i class="glyphicon glyphicon-ok"></i></button>
                <button type="button" class="btn btn-danger" id="verificacion-fail"><i class="glyphicon glyphicon-remove"></i></button>
            </div>
        </div>
    </div>
</div>
<!-- Modal de verificación -->

<g:javascript>
    $('#boton-verificar').on('click', function () {
        $('#sesion-id').val($(this).data('sesion'));
        $('#fecha').val(hoy.toISOString().substring(0, 10));
    })

    $('#verificacion-ok').on('click', function () {

    })

    $('#verificacion-fail').on('click', function () {

    })
</g:javascript>