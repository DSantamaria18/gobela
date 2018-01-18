<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'solicitudMaterial.label', default: 'SolicitudMaterial')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-solicitudesMaterial" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                          default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        %{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
    </ul>
</div>
%{--<div id="list-solicitudMaterial" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:table collection="${solicitudMaterialList}" />
    --}%%{--<f:table collection="${solicitudMaterialList}" />--}%%{--

    <div class="pagination">
        <g:paginate total="${solicitudMaterialCount ?: 0}" />
        --}%%{--<g:paginate total="${solicitudMaterialCount ?: 0}" />--}%%{--
    </div>
</div>--}%


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
    <g:form resource="${this.query}" method="POST" action="exportarListadoSolicitudesMaterial">
        <fieldset class="form">
            <div class="row fieldcontain">
                <label>
                    Fechas:
                </label>
                <g:datePicker name="fechaDesde" precision="day" id="qFechaDesde"
                              years="${2016..2030}"/> y
                <g:datePicker name="fechaHasta" precision="day" id="qFechaHasta"
                              years="${2016..2030}"/>
            </div>

            <div class="row fieldcontain">
                <label>
                    Lugar de Entrega:
                </label>
                <g:textField name="lugarEntrega" id="qLugarEntrega"/>
            </div>

            <div class="row fieldcontain">
                <label>
                    Lugar de Devolución:
                </label>
                <g:textField name="lugarDevolucion" id="qLugarDevolucion"/>
            </div>
        </fieldset>

        <div class="row fieldcontain">
            <button type="button" class="row btn-block btn-primary"
                    onclick="filtrarSolicitudesMaterial(
                        $('#qFechaDesde_year').val() + '-' + $('#qFechaDesde_month').val() + '-' + $('#qFechaDesde_day').val()
                        , $('#qFechaHasta_year').val() + '-' + $('#qFechaHasta_month').val() + '-' + $('#qFechaHasta_day').val()
                        , $('#qLugarEntrega').val()
                        , $('#qLugarDevolucion').val()
                    );">FILTRAR</button>
        </div>
        </div>
    </div>
</div>
</div>

        <br/>
        <hr/>
        <br/>

        <div id="list-solicitudes-material" class="content scaffold-list" role="main">
            <h1>Lista de Solicitudes de Material</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="tabla-solicitudes-material" id="tabla-solicitudes-material">
                <g:render template="tablaSolicitudesMaterial"
                          model="[solicitudesMaterialList: solicitudesMaterialList]"/>
            </div>
        </div>
        </div>
        <div class="row fieldcontain">
            <fieldset class="buttons">
                <g:submitButton name="exportarSolicitudesMat" class="edit"
                                value="Descargar en Excel" type="submit"/>
            </fieldset>
        </div>
    </g:form>

    <g:javascript>
        $(document).ready(function () {
            var today = new Date();
            var fDesde = today.getFullYear() + '-' + today.getMonth() + '-' + today.getDay();

            // var dateHasta = new Date(2199, today.getMonth(), today.getDay());
            var fHasta = today.getFullYear() + "-12-31";
            console.log("fHasta: " + fHasta);

            filtrarSolicitudesMaterial(fDesde, fHasta, null, null);
            $('#qFechaDesde_year').val(today.getFullYear());
            $('#qFechaHasta_month').val(12);
            $('#qFechaHasta_day').val(31);
        })
    </g:javascript>

</body>
</html>