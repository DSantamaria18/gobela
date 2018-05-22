<g:if test="${!sesionesList.isEmpty()}">
    <h1>Entrenamientos ${sesionesList[0].recinto} ${sesionesList[0].instalacion}</h1>


    <table class="table table-condensed">
        <thead>
        <tr>
            <th class="text-center">DIA</th>
            <th class="text-center">HORA</th>
            <th class="text-center">CLUB</th>
            <th class="text-center">CATEGORIA</th>
            <th class="text-center">OCUPACION</th>
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
                </a>
            </tr>
        </g:each>
        </tbody>
    </table>
</g:if>
<g:else>
    <h1>No hay entrenamientos planificados para el ${dia} en ${instalacion.recinto} ${instalacion}...</h1>
</g:else>