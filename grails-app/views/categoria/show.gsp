<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-categoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
        <li><g:link class="create" controller="sesion" action="create"
                    params="['categoria': this.categoria.id]">Añadir Sesión</g:link></li>
    </ul>
</div>

<div id="show-categoria" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <ol class="property-list categoria">
        <li class="fieldcontain">
            <span id="club-label" class="property-label"><g:message code="categoria.club.label"
                                                                    default="Club:"/></span>
            <span class="property-value" aria-labelledby="club-label"><g:fieldValue bean="${categoria}"
                                                                                    field="club"/></span>
        </li>

        <li class="fieldcontain">
            <span id="modalidad-label" class="property-label"><g:message code="categoria.modalidad.label"
                                                                         default="Modalidad:"/></span>
            <span class="property-value" aria-labelledby="modalidad-label"><g:fieldValue bean="${categoria}"
                                                                                         field="modalidad"/></span>
        </li>

        <li class="fieldcontain">
            <span id="nombre-label" class="property-label"><g:message code="categoria.nombre.label"
                                                                      default="Nombre:"/></span>
            <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${categoria}"
                                                                                      field="nombre"/></span>
        </li>

        <li class="fieldcontain">
            <span id="sexo-label" class="property-label"><g:message code="categoria.sexo.label"
                                                                    default="Sexo:"/></span>
            <span class="property-value" aria-labelledby="sexo-label"><g:fieldValue bean="${categoria}"
                                                                                    field="sexo"/></span>
        </li>

        <li class="fieldcontain">
            <span id="edadMin-label" class="property-label"><g:message code="categoria.edadMin.label"
                                                                       default="Edad Mínima:"/></span>
            <span class="property-value" aria-labelledby="edadMin-label"><g:fieldValue bean="${categoria}"
                                                                                       field="edadMin"/></span>
        </li>

        <li class="fieldcontain">
            <span id="edadMax-label" class="property-label"><g:message code="categoria.edadMax.label"
                                                                       default="Edad Máxima:"/></span>
            <span class="property-value" aria-labelledby="edadMax-label"><g:fieldValue bean="${categoria}"
                                                                                       field="edadMax"/></span>
        </li>

        <li class="fieldcontain">
            <span id="numDeportistas-label" class="property-label"><g:message code="categoria.numDeportistas.label"
                                                                              default="Nº Deportistas:"/></span>
            <span class="property-value" aria-labelledby="numDeportistas-label"><g:fieldValue bean="${categoria}"
                                                                                              field="numDeportistas"/></span>
        </li>

        <g:if test="${categoria?.sesiones}">
            <li class="fieldcontain">
                <span id="sesiones-label" class="property-label"><g:message code="categoria.sesiones.label"
                                                                            default="Sesiones:"/></span>

                <div class="property-value" aria-labelledby="sesiones-label">
                    <ul>
                        <g:each in="${categoria.sesiones}" var="sesion" status="i">
                            <li>
                                <g:link controller="sesion" action="show" params="[id: sesion.id]">${sesion}</g:link>
                            </li>
                        </g:each>
                    </ul>
                </div>
            </li>
        </g:if>

        <g:if test="${categoria?.tecnicosCategorias}">
            <li class="fieldcontain">
                <span id="tecnicos-label" class="property-label"><g:message code="categoria.tecnicos.label"
                                                                            default="Técnicos:"/></span>

                <div class="property-value" aria-labelledby="tecnicos-label">
                    <ul>
                        <g:each in="${categoria.tecnicosCategorias}" var="tecnico" status="i">
                            <li>
                                <g:link controller="tecnico" action="show" params="[id: tecnico.tecnico.id]">${tecnico}</g:link>
                            </li>
                        </g:each>
                    </ul>
                </div>
            </li>
        </g:if>
    </ol>

    <g:form resource="${this.categoria}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.categoria}"><g:message code="default.button.edit.label"
                                                                                       default="Edit"/></g:link>
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
