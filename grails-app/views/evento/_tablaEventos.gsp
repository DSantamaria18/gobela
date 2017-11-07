<div class="tabla-eventos">
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="nombre"
                              title="${message(code: 'evento.nombre.label', default: 'Nombre')}"/>
            <g:sortableColumn property="estado"
                              title="${message(code: 'evento.estado.label', default: 'Estado')}"/>
            <g:sortableColumn property="fecha"
                              title="${message(code: 'evento.fecha.label', default: 'Fecha Inicio')}"/>
            <g:sortableColumn property="tipoActividad"
                              title="${message(code: 'evento.tipoActividad.label', default: 'Tipo Actividad')}"/>
            <g:sortableColumn property="modalidad"
                              title="${message(code: 'evento.modalidad.label', default: 'modalidad')}"/>
        </tr>
        </thead>
        <tbody>
        <g:each in="${eventoList}" status="i" var="eventoInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link action="show"
                            id="${eventoInstance.nombre}">${fieldValue(bean: eventoInstance, field: "nombre")}</g:link></td>
                <td>${fieldValue(bean: eventoInstance, field: "estado")}</td>
                <td><g:formatDate format="dd-MM-yyyy HH:mm"
                                  date="${eventoInstance?.fecha}"/>
                </td>
                <td>${fieldValue(bean: eventoInstance, field: "tipoActividad")}</td>
                <td>${fieldValue(bean: eventoInstance, field: "modalidad")}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>