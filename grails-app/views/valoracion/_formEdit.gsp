<%@ page import="gobela.Valoracion" %>

<div id="campos">
    <fieldset class="form">
        <div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'solicitud', 'error')} required">
            <span id="solicitud-label" class="property-label">
                <g:message code="valoracion.solicitud.label" default="Número de solicitud:"/>
            </span>
            <span class="property-value" aria-labelledby="solicitud-label">
                <g:fieldValue bean="${valoracionInstance}" field="solicitud"/>
            </span>
        </div>

        <div class="fieldcontain required">
            <span id="importeSolicitado-label" class="property-label" for="importeSolicitado">
                <g:message code="solicitud.importeSolicitado.label" default="Importe solicitado:"/>
            </span>
            <span class="property-value" aria-labelledby="importeSolicitado-label" id="importeSolicitado">
                ${formatNumber(number: importeSolicitado, type: "currency", currencyCode: "EUR", locale: "es_ES")}
            </span>
        </div>

        <g:hiddenField name="version" value="${valoracionInstance?.version}"/>
        <g:hiddenField name="id" value="${valoracionInstance?.id}"/>
        <g:hiddenField name="linea" value="${valoracionInstance?.linea}"/>
    </fieldset>

    <fieldset class="form">
        <g:if test="${valoracionInstance.linea == 1}">
            <g:render template="form1"/>
        </g:if>
        <g:if test="${valoracionInstance.linea == 2}">
            <g:render template="form2"/>
        </g:if>
        <g:if test="${valoracionInstance.linea == 3}">
            <g:render template="form3"/>
        </g:if>
        <g:if test="${valoracionInstance.linea == 4}">
            <g:render template="form4"/>
        </g:if>
        <g:if test="${valoracionInstance.linea == 5}">
            <g:render template="form5"/>
        </g:if>
        <g:if test="${valoracionInstance.linea == 6}">
            <g:render template="form6"/>
        </g:if>
        <g:if test="${valoracionInstance.linea == 7}">
            <g:render template="form7"/>
        </g:if>

    </fieldset>

    <fieldset>
        <div class="fieldcontain" ${hasErrors(bean: valoracionInstance, field: 'puntuacion', 'error')}>
            <span id="puntuacion-label" class="property-label">
                <g:message code="valoracion.puntuacion.label" default="Puntuación total:"/>
            </span>
            <span class="property-value" aria-labelledby="puntuacion-label" id="puntuacion-value">
                <g:field id="puntuacion-value" name="puntuacion" type="text" value="${fieldValue(bean: valoracionInstance, field: 'puntuacion')}"
                         required=""/>
            </span>
        </div>

        <div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: '', 'error')} required">
            <span id="importeConcedido-label" class="property-label" for="importeConcedido">
                <g:message code="valoracion.importeConcedido.label" default="Importe concedido:"/>
            </span>
            <span class="property-value" aria-labelledby="importeConcedido-label">
                <g:field name="importeConcedido"
                         value="${fieldValue(bean: valoracionInstance, field: 'importeConcedido')}"/> €
            </span>
        </div>
    </fieldset>
</div>

<g:javascript>
    $(document).ready(function () {
        console.log("LINEA: " + ${valoracionInstance.linea});
        actualizaL2Values();
        sumar();
    });
</g:javascript>


