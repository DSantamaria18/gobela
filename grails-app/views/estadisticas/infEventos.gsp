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
        %{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>--}%
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
                OPCIONES DE INFORME
                <span class="pull-right"></span>
            </h4>
        </a>
    </div>

<div id="faq-cat-1-sub-1" class="panel-collapse collapse">
<div class="panel-body form-group">
    <g:form resource="${this.query}" method="POST" action="exportarInformeEventos">
        <div class="row fieldcontain">
            <label for="fechaDesde">
                Fecha Desde:
            </label>
            <g:datePicker name="fechaDesde" precision="day" id="qFechaDesde"
                          years="${2016..2030}"/>
            <label for="fechaHasta">
                Fecha Hasta:
            </label>
            <g:datePicker name="fechaHasta" precision="day" id="qFechaHasta"
                          years="${2016..2030}"/>
        </div>

        <div class="row fieldcontain">
            <button type="button" class="row btn-block btn-primary"
                    onclick="infEventosPorFechas(
                        $('#qFechaDesde_year').val() + '-' + $('#qFechaDesde_month').val() + '-' + $('#qFechaDesde_day').val()
                        , $('#qFechaHasta_year').val() + '-' + $('#qFechaHasta_month').val() + '-' + $('#qFechaHasta_day').val()
                    );">GENERAR INFORME</button>
        </div>
        </div>
    </div>
</div>
</div>

        <br/>
        <hr/>
        <br/>

        <div id="list-evento" class="content scaffold-list" role="main">
            <div class="tabla-informe-eventos" id="tabla-informe-eventos">
                %{--<g:render template="tablasInfEventos" model="[total: ${resultList[0].Eventos}]"/>--}%
            </div>
        </div>
        </div>

        <div class="row fieldcontain">
            <fieldset class="buttons">
                <g:submitButton name="exportarInformeEventos" class="edit"
                                value="Descargar en Excel" type="submit"/>
            </fieldset>
        </div>
    </g:form>

    <g:javascript>
        $(document).ready(function () {
            $('.collapse').eq(1).collapse("show");
            var date = new Date();
            $('#qFechaDesde_day').val(1);
            $('#qFechaDesde_month').val(date.getMonth());
            $('#qFechaDesde_year').val(date.getFullYear());
        })
    </g:javascript>
</body>
</html>