<table>
    <thead>
    <tr>
        <th>${message(code: 'evento.nombre.label', default: 'Nombre')}</th>
        <th>${message(code: 'evento.estado.label', default: 'Estado')}</th>
        <th>${message(code: 'evento.fecha.label', default: 'Fecha Inicio')}</th>
        <th>${message(code: 'evento.tipoActividad.label', default: 'Tipo Actividad')}</th>
        <th>${message(code: 'evento.modalidad.label', default: 'modalidad')}</th>

       %{-- <g:sortableColumn property="e.nombre"
                          title="${message(code: 'evento.nombre.label', default: 'Nombre')}"/>
        <g:sortableColumn property="e.estado"
                          title="${message(code: 'evento.estado.label', default: 'Estado')}"/>
        <g:sortableColumn property="e.fecha"
                          title="${message(code: 'evento.fecha.label', default: 'Fecha Inicio')}"/>
        <g:sortableColumn property="tipoActividad"
                          title="${message(code: 'evento.tipoActividad.label', default: 'Tipo Actividad')}"/>
        <g:sortableColumn property="modalidad"
                          title="${message(code: 'evento.modalidad.label', default: 'modalidad')}"/>--}%
    </tr>
    </thead>
    <tbody>
    <g:each in="${eventoList}" status="i" var="eventoInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td><g:link action="show" id="${eventoInstance.nombre}">${eventoInstance.nombre}</g:link></td>
            <td>${eventoInstance.estado}</td>
            <td><g:formatDate format="dd-MM-yyyy HH:mm"
                              date="${eventoInstance?.fecha}"/>
            </td>
            <td>${eventoInstance.tipoActividad}</td>
            <td>${eventoInstance.modalidad}</td>
        </tr>
    </g:each>
    </tbody>
</table>
%{--
<div class="pagination">
    <g:paginate total="${eventoCount ?: 0}"/>
</div>--}%
