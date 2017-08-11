<%@ page import="gobela.Valoracion" %>

<input type="hidden" name="solicitud" value="${params.solicitudId}"/>
<input type="hidden" name="linea" value="${params.linea}"/>

<fieldset class="form">
    <div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'codigo', 'error')} required">
        <span id="solicitud-label" class="property-label" for="solicitud">
            <g:message code="valoracion.solicitud.label" default="Solicitud:"/>
        </span>
        <span class="property-value" aria-labelledby="solicitud-label">
            ${params.token}
        </span>
    </div>

    <div class="fieldcontain required">
        <span id="importeSolicitado-label" class="property-label" for="importeSolicitado">
            <g:message code="solicitud.importeSolicitado.label" default="Importe solicitado:"/>
        </span>
        <span class="property-value" aria-labelledby="importeSolicitado-label" id="importeSolicitado">
            ${formatNumber(number: params.importeSolicitado, type: "currency", currencyCode: "EUR", locale: "es_ES")}
        </span>
    </div>
</fieldset>

<fieldset class="form">
    <g:if test="${params.linea == '1'}">
        <g:render template="form1"/>
    </g:if>
    <g:if test="${params.linea == '2'}">
        <h4>AVISO:</h4>
        <h5>Debido a las particularidades del cálculo de la línea 2, los coeficientes de corrección no serán aplicados a la puntuación</h5>
        <br>
        <g:render template="form2"/>
    </g:if>
    <g:if test="${params.linea == '3'}">
        <g:render template="form3"/>
    </g:if>
    <g:if test="${params.linea == '4'}">
        <g:render template="form4"/>
    </g:if>
    <g:if test="${params.linea == '5'}">
        <g:render template="form5"/>
    </g:if>
    <g:if test="${params.linea == '6'}">
        <g:render template="form6"/>
    </g:if>
    <g:if test="${params.linea == '7'}">
        <g:render template="form7"/>
    </g:if>
</fieldset>

<fieldset class="form">
    <div class="fieldcontain" ${hasErrors(bean: valoracionInstance, field: 'puntuacion', 'error')}>
    <span id="puntuacion-label" class="property-label">
        <g:message code="valoracion.puntuacion.label" default="Puntuación total:"/>
    </span>
    <span class="property-value" aria-labelledby="puntuacion-label" id="puntuacion-value">
        <g:field name="puntuacion" type="text" value="${fieldValue(bean: valoracionInstance, field: 'puntuacion')}"
                 required=""/>
    </span>
</div>

    <div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'importeConcedido', 'error')} required">
        <span id="importeConcedido-label" class="property-label">
            <g:message code="valoracion.importeConcedido.label" default="Importe concedido:"/>
        </span>
        <span class="property-value" aria-labelledby="importeConcedido-label" id="importeConcedido-value">
        <g:field name="importeConcedido" value="${fieldValue(bean: valoracionInstance, field: 'importeConcedido')}"/> €</span>
    </div>
</fieldset>

<g:javascript>
    $(document).ready(function () {
        console.log("LINEA: " + ${params.linea});
        // sumar(${params.linea == '2'})
        sumar()
    });
</g:javascript>




















