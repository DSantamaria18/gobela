<label for="lugar">
    <g:message code="evento.lugar.label" default="Lugar:"/>
</label>
<g:select name="lugar"
          from="${listaLugares}"
          value="${evento?.lugar?.id}"
          noSelection="${['': 'Selecciona un lugar...']}"
          optionKey="id"
          optionValue="nombreLugar"/>