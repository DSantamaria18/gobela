<%@ page import="gobela.Entidad" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'contacto.label', default: 'Contacto')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-contacto" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="exportContactosClubs"><g:message code="default.contactos.exportContactosClubes" default="Exportar Contactos Clubs" /></g:link></li>
        %{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
    </ul>
</div>


<div class="container">
    <br />
    <div class="row" id="filter-options">
        <div class="panel-group" id="accordion-cat-1">
            <div class="panel panel-default panel-faq">
                <div class="panel-heading">
                    <a data-toggle="collapse" data-parent="#accordion-cat-1" href="#faq-cat-1-sub-1">
                        <h4 class="panel-title">OPCIONES DE FILTRADO <span class="pull-right"></span></h4>
                    </a>
                </div>

                <div id="faq-cat-1-sub-1" class="panel-collapse collapse">
                    <div class="panel-body form-group">

                        %{--<div class="row fieldcontain">
                            <label for="clubs"><g:message code="contacto.filtro.clubes.label" default="Sólo clubs:"/></label>
                            <g:checkBox name="clubs"/>
                        </div>--}%

                        <div class="row fieldcontain">
                            <label for="entidad"><g:message code="contacto.filtro.entidad.label" default="Entidad:"/></label>
                            <g:select name="entidad"
                                      from="${Entidad.listOrderByNombreEntidad()}"
                                      value="''"
                                      noSelection="${['': 'Cualquiera']}"
                                      optionKey="id"
                                      optionValue="nombreEntidad"
                                      id="qEntidad"/>
                        </div>

                        <div class="row fieldcontain">
                            <button type="button" class="row btn-block btn-primary"
                                    onclick="filtrarContactos($('#qEntidad option:selected').val());">
                                FILTRAR CONTACTOS
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="list-contacto" class="content scaffold-list" role="main">
        <h1><g:message code="default.list.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <div id="tabla-contactos">
            <g:render template="tablaContactos" model="[contactoList: contactoList, contactoCount: contactoList.size()]"/>
        </div>
    </div>
</div>
</body>
</html>