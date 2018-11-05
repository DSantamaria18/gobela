<table id="tabla-sesiones" class="table-responsive" style="display: table">
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
            data-diasemana="${sesion[1].diaSemana}"
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
            data-hsresultadook="${sesion[0]?.resultadoOk}"
            onclick="rellenaModal(this)">
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
</table>