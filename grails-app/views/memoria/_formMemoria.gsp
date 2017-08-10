<%@ page import="gobela.Memoria" %>

<div class="fieldcontain ${hasErrors(bean: memoria, field: 'situacion', 'error')} ">
    <label for="situacion">
        <g:message code="memoria.situacion.label" default="Situación actual:"/>

    </label>
    <g:textArea name="situacion" cols="60" rows="15" maxlength="2000" value="${this.memoria?.situacion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: memoria, field: 'retos', 'error')} ">
    <label for="retos">
        <g:message code="memoria.retos.label" default="Retos planteados:"/>

    </label>
    <g:textArea name="retos" cols="60" rows="15" maxlength="2000" value="${this.memoria?.retos}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: memoria, field: 'acciones', 'error')} ">
    <label for="acciones">
        <g:message code="memoria.acciones.label" default="Acciones y actividades a desarrollar:"/>

    </label>
    <g:textArea name="acciones" cols="60" rows="15" maxlength="2000" value="${this.memoria?.acciones}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: memoria, field: 'mejoras', 'error')} ">
    <label for="mejoras">
        <g:message code="memoria.mejoras.label" default="Propuestas de mejora:"/>

    </label>
    <g:textArea name="mejoras" cols="60" rows="15" maxlength="2000" value="${this.memoria?.mejoras}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: memoria, field: 'sistemas', 'error')} ">
    <label for="sistemas">
        <g:message code="memoria.sistemas.label" default="Sistemas de evaluación y seguimiento:"/>

    </label>
    <g:textArea name="sistemas" cols="60" rows="15" maxlength="2000" value="${this.memoria?.sistemas}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: memoria, field: 'tecnicos', 'error')} ">
    <label for="tecnicos">
        <g:message code="memoria.tecnicos.label" default="Personal técnico:"/>

    </label>
    <g:textArea name="tecnicos" cols="60" rows="15" maxlength="2000" value="${this.memoria?.tecnicos}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: memoria, field: 'numDeportistas', 'error')} required">
    <label for="numDeportistas">
        <g:message code="memoria.numDeportistas.label" default="Número de deportistas:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="numDeportistas" type="number" value="${this.memoria?.numDeportistas}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: memoria, field: 'numMujeres', 'error')} required">
    <label for="numMujeres">
        <g:message code="memoria.numMujeres.label" default="Número de mujeres:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="numMujeres" type="number" value="${this.memoria?.numMujeres}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: memoria, field: 'numHombres', 'error')} required">
    <label for="numHombres">
        <g:message code="memoria.numHombres.label" default="Número de hombres:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="numHombres" type="number" value="${this.memoria?.numHombres}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: memoria, field: 'numResidentes', 'error')} required">
    <label for="numResidentes">
        <g:message code="memoria.numResidentes.label" default="Número de residentes:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="numResidentes" type="number" value="${this.memoria?.numResidentes}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: memoria, field: 'politicaDeportiva', 'error')} ">
    <label for="politicaDeportiva">
        <g:message code="memoria.politicaDeportiva.label" default="Participación en la política deportiva local:"/>

    </label>
    <g:textArea name="politicaDeportiva" cols="60" rows="15" maxlength="2000"
                value="${this.memoria?.politicaDeportiva}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: memoria, field: 'colaboraciones', 'error')} ">
    <label for="colaboraciones">
        <g:message code="memoria.colaboraciones.label" default="Otras colaboraciones:"/>

    </label>
    <g:textArea name="colaboraciones" cols="60" rows="15" maxlength="2000" value="${this.memoria?.colaboraciones}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: memoria, field: 'contribuciones', 'error')} ">
    <label for="contribuciones">
        <g:message code="memoria.contribuciones.label"
                   default="Contribuciones a la difusión de una imagen positiva de Getxo:"/>

    </label>
    <g:textArea name="contribuciones" cols="60" rows="15" maxlength="2000" value="${this.memoria?.contribuciones}"/>

</div>
