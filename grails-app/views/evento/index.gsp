<!DOCTYPE html>
<html>
<head>
    <%@ page import="gobela.Modalidad" %>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-evento" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<br/>
<hr/>
<br/>

<div class="container">
    <div class="row" id="filter-options">
        <div class="panel-group" id="accordion-cat-1">
            <div class="panel panel-default panel-faq">
                <div class="panel-heading">
                    <a data-toggle="collapse" data-parent="#accordion-cat-1" href="#faq-cat-1-sub-1">
                        <h4 class="panel-title">
                            OPCIONES DE FILTRADO
                            <span class="pull-right"></span>
                        </h4>
                    </a>
                </div>

                <div id="faq-cat-1-sub-1" class="panel-collapse collapse">
                    <div class="panel-body form-group">
                        <div class="row  fieldcontain">
                            <label for="estado">
                                <g:message code="evento.estado.label" default="Estado:"/>
                            </label>
                            <g:select name="estado"
                                      from="${['Cualquiera', 'Pendiente', 'Confirmado', 'Rechazado', 'Finalizado', 'Cancelado']}"
                                      value=""
                                      id="qEstado"/>
                        </div>

                        <div class="row fieldcontain">
                            <label for="fechaInicioEntre">
                                Fecha de inicio entre:
                            </label>
                            <g:datePicker name="fechaInicioDesde" precision="day" id="qFechaIniDesde"
                                          years="${2016..2030}"/> y
                            <g:datePicker name="fechaInicioHaste" precision="day" id="qFechaIniHasta"
                                          years="${2016..2030}"/>
                        </div>

                        <div class="row fieldcontain">
                            <label for="tipoActividad">
                                <g:message code="evento.tipoActividad.label" default="Tipo de actividad:"/>
                            </label>
                            <g:select name="tipoActividad" id="qActividad"
                                      from="${['Formación', 'Regular/Competición', 'Exhibición', 'Cultural', 'Txangoa - Excursión', 'Topaketa - Encuentro Deportivo', 'Otros', 'Txapelketa/Torneo']}"
                                      noSelection="['': 'Cualquiera']"/>
                        </div>

                        <div class="row fieldcontain">
                            <label for="modalidad">
                                <g:message code="evento.modalidad.label" default="Modalidad:"/>
                            </label>
                            <g:select name="modalidad"
                                      from="${Modalidad.listOrderByNombre()}"
                                      value="''"
                                      noSelection="${['': 'Cualquiera']}"
                                      optionKey="id"
                                      optionValue="nombre"
                                      id="qModalidad"/>
                        </div>

                        <div class="row fieldcontain">
                            <label for="multikirola">
                                <g:message code="evento.multikirola.label" default="Multikirola:"/>
                            </label>
                            <g:checkBox name="multikirola" id="qMultikirola"/>
                        </div>

                        <div class="row fieldcontain">
                            <label for="deporteAdaptado">
                                <g:message code="evento.deporteAdaptado.label" default="Deporte Adaptado:"/>
                            </label>
                            <g:checkBox name="deporteAdaptado" id="qAdaptado"/>
                        </div>

                        <div class="row fieldcontain">
                            <button type="button" class="row btn-block btn-primary"
                                    onclick="filtrarEventos($('#qEstado').val()
                                        , $('#qFechaIniDesde_year').val() + '-' + $('#qFechaIniDesde_month').val() + '-' + $('#qFechaIniDesde_day').val()
                                        , $('#qFechaIniHasta_year').val() + '-' + $('#qFechaIniHasta_month').val() + '-' + $('#qFechaIniHasta_day').val()
                                        , $('#qActividad option:selected').val()
                                        , $('#qModalidad option:selected').val()
                                        , $('#qMultikirola').prop('checked')
                                        , $('#qAdaptado').prop('checked'));">FILTRAR EVENTOS</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <br/>
        <hr/>
        <br/>

        <div id="list-evento" class="content scaffold-list" role="main">
            <h1>Lista de Eventos</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
        %{--<table>
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
                <td><g:link action="show" id="${eventoInstance.nombre}">${fieldValue(bean: eventoInstance, field: "nombre")}</g:link></td>
                <td>${fieldValue(bean: eventoInstance, field: "estado")}</td>
                <td><g:formatDate format="dd-MM-yyyy HH:mm"
                                  date="${eventoInstance?.fecha}"/>
                </td>
                --}%%{--<td>${fieldValue(bean: eventoInstance, field: "fecha")}</td>--}%%{--
                <td>${fieldValue(bean: eventoInstance, field: "tipoActividad")}</td>
                <td>${fieldValue(bean: eventoInstance, field: "modalidad")}</td>
            </tr>
            </g:each>
            </tbody>
        </table>--}%
            <div class="tabla-eventos" id="tabla-eventos">
                <g:render template="tablaEventos" model="[eventoList: eventoList]"/>
            </div>
        </div>
    </div>
    <g:javascript>
    $(document).ready(function (){
        $('#qFechaIniDesde_year').val("2016")
    })
</g:javascript>
</body>
</html>