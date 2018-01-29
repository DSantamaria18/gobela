<table>
    <thead>
    <tr>
        <th>${message(code: 'evento.nombre.label', default: 'Nombre')}</th>
        <th>${message(code: 'evento.estado.label', default: 'Estado')}</th>
        <th>${message(code: 'evento.fecha.label', default: 'Fecha Inicio')}</th>
        <th>${message(code: 'evento.tipoActividad.label', default: 'Tipo Actividad')}</th>
        <th>${message(code: 'evento.tActividad.label', default: 'TActividad')}</th>
        <th>${message(code: 'evento.actividad.label', default: 'Actividad')}</th>
        <th>${message(code: 'evento.modalidad.label', default: 'Modalidad')}</th>

    </tr>
    </thead>
    <tbody>
    <g:each in="${eventoList}" status="i" var="eventoInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td><g:link action="show" id="${eventoInstance.id}">${eventoInstance.nombre.toUpperCase()}</g:link></td>
            <td>${eventoInstance.estado}</td>
            <td><g:formatDate format="dd-MM-yyyy"
                              date="${eventoInstance?.fecha}"/>
            </td>
            <td>${eventoInstance.tipoActividad}</td>
            <td>${eventoInstance.tActividad}</td>
            <td>${eventoInstance.actividad}</td>
            <td>${eventoInstance.modalidad}</td>
        </tr>
    </g:each>
    </tbody>
</table>
