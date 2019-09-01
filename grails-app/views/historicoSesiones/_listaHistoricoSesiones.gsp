<%@ page import="gobela.HistoricoSesiones" %>
<div class="table-responsive">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Fecha</th>
            <th>Club</th>
            <th>Categoria</th>
            <th>Sesión</th>
            <th>Participantes</th>
            <th>Ocupación</th>
            <th>Resultado</th>
            <th>Observaciones</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${historicoSesionesList}" var="hs">
            <tr>
                <td><g:link controller="historicoSesiones" action="show"
                            id="${hs.id}">${formatDate(format: "dd-MM-yyyy", date: hs.fecha)}
                </g:link></td>
                <td><g:link uri="/club/show?entidadId=${hs.entidad}">${hs.club}</g:link></td>
                <td><g:link uri="/categoria/show/${hs.categoriaId}">${gobela.HistoricoSesiones.categoriaString(hs)}</g:link></td>
                <td><g:link uri="/sesion/show/${hs.sesionId}">${gobela.HistoricoSesiones.sesionString(hs)}</g:link></td>
                <td>${hs.participantes}</td>
                <td>${hs.ocupacion}</td>
                <td>
                    <g:if test="${hs.resultadoOk}">OK</g:if>
                    <g:else>NO OK</g:else>
                </td>
                <td>${hs.observaciones}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</div>

<div class="pagination">
    <g:paginate total="${historicoSesionesCount ?: 0}"/>
</div>