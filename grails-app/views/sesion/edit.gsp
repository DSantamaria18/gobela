<%@ page import="gobela.DiaSemana" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'sesion.label', default: 'Sesion')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<a href="#edit-sesion" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="edit-sesion" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.sesion}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.sesion}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form resource="${this.sesion}" method="PUT">
        <g:hiddenField name="version" value="${this.sesion?.version}"/>
        <fieldset class="form">
            <f:all bean="sesion"/>

            <br/>
            <hr>
            <br/>

            <div class="fieldcontain">
                <label for="categoria">Categoría</label>
                <span><label id="categoria" name="categoria">${this.sesion?.categoria.toString()}</label></span>
            </div>

            <div class="fieldcontain">
                <label for="diaSemana" class="required-indicator">Día Semana</label>
                <span class="required-indicator">*</span>
                <g:select from="${gobela.DiaSemana}" id="diaSemana" name="diaSemana"
                          value="${sesion?.diaSemana}"/>
            </div>

            <div class="fieldcontain">
                <label for="horaInicio" class="required-indicator">Hora Inicio</label>
                <span class="required-indicator">*</span>
                <input id="horaInicio" name="horaInicio" type="text" value="${sesion?.horaInicio}"/>
            </div>

            <div class="fieldcontain">
                <label for="horaFin" class="required-indicator">Hora Fin</label>
                <span class="required-indicator">*</span>
                <input id="horaFin" name="horaFin" type="text" value="${this.sesion?.horaFin}"/>
            </div>

            <div class="fieldcontain">
                <label for="recinto" class="required-indicator">Recinto</label>
                <span class="required-indicator">*</span>
                <g:select name="recinto"
                          from="${gobela.Recinto.listOrderByNombre()}"
                          value="${sesion?.recinto}"
                          optionKey="id"
                          optionValue="nombre"
                          id="recinto"
                          onchange="getInstalacionByRecinto(this.value)"/>
            </div>

            <div class="fieldcontain" id="combo-instalacion">
                <g:render template="comboInstalacionesEdit"/>
            </div>

            <div class="fieldcontain">
                <label for="ocupacion">Ocupacion</label>
                <span class="required-indicator">*</span>
                <input id="ocupacion" name="ocupacion" type="number" value="${this.sesion?.ocupacion}"/>
            </div>

            <div class="fieldcontain">
                <label for="activa">Activa</label>
                <g:checkBox id="activa" name="activa" value="${this.sesion?.activa}"/>
            </div>

        </fieldset>
        <fieldset class="buttons">
            <input class="save" type="submit"
                   value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        </fieldset>
    </g:form>
</div>

<g:javascript>
    function getInstalacionByRecinto(recintoId) {
        const url = "/gobela/sesion/getInstalacionByRecinto/" + recintoId.toString();
        $.ajax({
            url: url,
            type: 'get'
        }).done(function (data) {
            $('div#combo-instalacion').html(data);
        })
    };

    $(document).ready(function(){
        const recintoId = $('select#recinto').val();
        getInstalacionByRecinto(recintoId);
        $('select#instalacion').val(${this.sesion?.instalacion});
    });
</g:javascript>

</body>


</html>
