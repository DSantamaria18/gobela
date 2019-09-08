<table id="tabla-sesiones" class="table-responsive" style="display: table">
    <thead>
    <tr>
        %{--<th>INDEX</th>--}%
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
            data-diasemana="${sesion.diaSemana}"
            data-sesionid="${sesion.id}"
            data-clubid="${sesion?.categoria?.club?.id}"
            data-club="${sesion?.categoria?.club}"
            data-categoriaid="${sesion?.categoria?.id}"
            data-categoria="${sesion?.categoria}"
            data-horainicio="${sesion?.horaInicio}"
            data-horafin="${sesion?.horaFin}"
            data-recintoid="${sesion?.recinto?.id}"
            data-recinto="${sesion?.recinto}"
            data-instalacionid="${sesion?.instalacion?.id}"
            data-instalacion="${sesion?.instalacion}"
            data-participantes="${sesion?.categoria?.numDeportistas}"
            data-ocupacion="${sesion?.ocupacion}"
            data-hsid="${sesion?.sesionDeHoy?.id}"
            data-hsfecha="${sesion?.sesionDeHoy?.fecha}"
            data-hsparticipantes="${sesion?.sesionDeHoy?.participantes}"
            data-hsocupacion="${sesion?.sesionDeHoy?.ocupacion}"
            data-hsobservaciones="${sesion?.sesionDeHoy?.observaciones}"
            data-hsresultadook="${sesion?.sesionDeHoy?.resultadoOk}"
            onclick="rellenaModal(this)">
            %{--<td>${i}</td>--}%
            <td>
                <span id="horario-sesion">
                    <span>${sesion.horaInicio}</span> -
                    <span>${sesion.horaFin}</span>
                </span>
                <br>
                <span id="lugar-sesion">
                    <span>${sesion.recinto}</span>
                    <span>${sesion.instalacion}</span>
                </span>

            </td>
            <td>
                <span id="sesion-club" style="font-weight: bold">${sesion?.club}</span>
%{--                <span id="sesion-club" style="font-weight: bold">${sesion?.categoria?.club}</span>--}%
                <br>
                <span id="sesion-categoria">${sesion?.categoria}</span>
            </td>
            <td>
                <span id="info-participantes">
                    <i class="glyphicon glyphicon-user"></i>
                    ${sesion?.participantes}
%{--                    ${sesion?.categoria?.numDeportistas}--}%
                </span>
                <br>
                <span id="info-ocupacion">
                    <i class="glyphicon glyphicon-stats"></i>
                    ${sesion?.ocupacion}
                </span>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>