<label for="instalacion">
    <g:message code="evento.instalacion.label" default="Instalación:"/>
</label>
<g:select name="instalacion"
          from="${listaInstalaciones}"
          value="${evento?.instalacion}"
          noSelection="${['': 'Selecciona un instalacion...']}"
          optionKey="id"/>