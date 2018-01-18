<table>
    <thead>
    <tr>
        <th>Solicitud</th>
        <th>Evento</th>
        <th>Fecha Evento</th>
        <th>Material</th>
        <th>Cantidad</th>
        <th>Fecha Entrega</th>
        <th>Lugar Entrega</th>
        <th>Fecha Devolución</th>
        <th>Lugar Devolución</th>
        <th>Comentarios</th>
        <th>Observaciones</th>

    </tr>
    </thead>
    <tbody>
    <g:each in="${solicitudesMaterialList}" status="i" var="solicitudMaterial">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td><g:link action="show" id="${solicitudMaterial.id}">${solicitudMaterial.id}</g:link></td>
            <td><g:link controller="evento" action="show" id="${solicitudMaterial.evento}">${solicitudMaterial.evento}</g:link></td>
            <td><g:formatDate format="dd-MM-yyyy"
                              date="${solicitudMaterial?.fecha_evento}"/>
            %{--<td>${solicitudMaterial?.nombre}</td>--}%
            <td>${solicitudMaterial?.material}</td>
            <td>${solicitudMaterial?.cantidad}</td>
            <td><g:formatDate format="dd-MM-yyyy"
                              date="${solicitudMaterial?.fecha_entrega}"/>
            <td>${solicitudMaterial?.lugar_entrega}</td>
            <td><g:formatDate format="dd-MM-yyyy"
                              date="${solicitudMaterial?.fecha_devolucion}"/>
            <td>${solicitudMaterial?.lugar_devolucion}</td>
            <td>${solicitudMaterial?.comentarios}</td>
            <td>${solicitudMaterial?.observaciones}</td>
        </tr>
    </g:each>
    </tbody>
</table>