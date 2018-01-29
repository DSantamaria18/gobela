<!DOCTYPE html>
<html>
<head>
    <%@ page import="gobela.TipoActividad; gobela.Actividad; gobela.Lugar; gobela.Modalidad" %>
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

                        %{--<div class="row fieldcontain">
                            <label for="fechaInicioEntre">
                                Fecha de inicio entre:
                            </label>
                            <g:datePicker name="fechaInicioDesde" precision="day" id="qFechaIniDesde"
                                          years="${2016..2030}"/> y
                            <g:datePicker name="fechaInicioHaste" precision="day" id="qFechaIniHasta"
                                          years="${2016..2030}"/>
                        </div>--}%

                        <div class="row fieldcontain">
                            <label for="fechaEntre">
                                Tiene lugar entre:
                            </label>
                            <g:datePicker name="fechaDesda" precision="day" id="qFechaDesde"
                                          years="${2016..2030}"/> y
                            <g:datePicker name="fechaHasta" precision="day" id="qFechaHasta"
                                          years="${2016..2030}"/>
                        </div>

                       %{-- <div class="row fieldcontain">
                            <label for="tipoActividad">
                                <g:message code="evento.tipoActividad.label" default="Tipo de actividad:"/>
                            </label>
                            <g:select name="tipoActividad" id="qTipoActividad"
                                      from="${['Formación', 'Regular/Competición', 'Exhibición', 'Cultural', 'Txangoa - Excursión', 'Topaketa - Encuentro Deportivo', 'Otros', 'Txapelketa/Torneo']}"
                                      noSelection="['': 'Cualquiera']"/>
                        </div>--}%

                        <div class="row fieldcontain">
                            <label for="tActividad">
                                <g:message code="evento.tActividad.label" default="Tipo de Actividad:"/>
                            </label>
                            <g:select name="tActividad"
                                      from="${gobela.TipoActividad.listOrderByNombre()}"
                                      value="''"
                                      noSelection="${['': 'Cualquiera']}"
                                      optionKey="id"
                                      optionValue="nombre"
                                      id="qTActividad"/>
                        </div>

                        <div class="row fieldcontain">
                            <label for="actividad">
                                <g:message code="evento.actividad.label" default="Actividad:"/>
                            </label>
                            <g:select name="actividad"
                                      from="${Actividad.listOrderByNombre()}"
                                      value="''"
                                      noSelection="${['': 'Cualquiera']}"
                                      optionKey="id"
                                      optionValue="nombre"
                                      id="qActividad"/>
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
                            <label for="lugar">
                                <g:message code="evento.lugar.label" default="Modalidad:"/>
                            </label>
                            <g:select name="lugar"
                                      from="${Lugar.listOrderByNombreLugar()}"
                                      value="''"
                                      noSelection="${['': 'Cualquiera']}"
                                      optionKey="id"
                                      optionValue="nombreLugar"
                                      id="qLugar"/>
                        </div>

                        <div class="row fieldcontain">
                            <label for="multikirola">
                                <g:message code="evento.multikirola.label" default="Multikirola:"/>
                            </label>
                            <g:select name="multikirola" id="qMultikirola"
                                      from="${['SI', 'NO']}"
                                      noSelection="['': 'TODOS']"/>
                        </div>

                        <div class="row fieldcontain">
                            <label for="deporteAdaptado">
                                <g:message code="evento.deporteAdaptado.label" default="Deporte Adaptado:"/>
                            </label>
                            <g:select name="deporteAdaptado" id="qAdaptado"
                                      from="${['SI', 'NO']}"
                                      noSelection="['': 'TODOS']"/>
                        </div>

                        <div class="row fieldcontain">
                            <label for="relevante">
                                <g:message code="evento.relevante.label" default="Relevante:"/>
                            </label>
                            <g:select name="relevante" id="qRelevante"
                                      from="${['SI', 'NO']}"
                                      noSelection="['': 'TODOS']"/>
                        </div>

                        <div class="row fieldcontain">
                            <label for="deporteInclusivo">
                                <g:message code="evento.deporteInclusivo.label" default="Deporte Inclusivo:"/>
                            </label>
                            <g:select name="inclusivo" id="qInclusivo"
                                      from="${['SI', 'NO']}"
                                      noSelection="['': 'TODOS']"/>
                        </div>

                       %{-- <div class="row fieldcontain">
                            <button type="button" class="row btn-block btn-primary"
                                    onclick="filtrarEventos($('#qEstado').val()
                                        , $('#qFechaIniDesde_year').val() + '-' + $('#qFechaIniDesde_month').val() + '-' + $('#qFechaIniDesde_day').val()
                                        , $('#qFechaIniHasta_year').val() + '-' + $('#qFechaIniHasta_month').val() + '-' + $('#qFechaIniHasta_day').val()
                                        , $('#qActividad option:selected').val()
                                        , $('#qModalidad option:selected').val()
                                        , $('#qLugar option:selected').val()
                                        , $('#qMultikirola option:selected').val()
                                        , $('#qAdaptado option:selected').val()
                                        , $('#qInclusivo option:selected').val()
                                        , $('#qRelevante option:selected').val());">FILTRAR EVENTOS</button>
                        </div>--}%

                        <div class="row fieldcontain">
                            <button type="button" class="row btn-block btn-primary"
                                    onclick="filtrarEventos($('#qEstado').val()
                                        , $('#qFechaDesde_year').val() + '-' + $('#qFechaDesde_month').val() + '-' + $('#qFechaDesde_day').val()
                                        , $('#qFechaHasta_year').val() + '-' + $('#qFechaHasta_month').val() + '-' + $('#qFechaHasta_day').val()
                                        //, $('#qTipoActividad option:selected').val()
                                        , $('#qTActividad option:selected').val()
                                        , $('#qActividad option:selected').val()
                                        , $('#qModalidad option:selected').val()
                                        , $('#qLugar option:selected').val()
                                        , $('#qMultikirola option:selected').val()
                                        , $('#qAdaptado option:selected').val()
                                        , $('#qInclusivo option:selected').val()
                                        , $('#qRelevante option:selected').val());">FILTRAR EVENTOS</button>
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
            <div class="tabla-eventos" id="tabla-eventos">
                <g:render template="tablaEventos" model="[eventoList: eventoList]"/>
            </div>
        </div>
    </div>
    <g:javascript>
    $(document).ready(function (){
        var date = new Date();
        // $('#qFechaIniDesde_year').val("2016")
        $('#qFechaDesde_year').val(date.getFullYear());
    })
</g:javascript>
</body>
</html>