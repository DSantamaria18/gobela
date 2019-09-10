<label for="instalacion">Instalacion</label>
<span class="required-indicator">*</span>
<g:select name="instalacion"
          from="${listaInstalaciones}"
          value="${sesion?.instalacion}"
          noSelection="${['': 'Selecciona un instalación...']}"
          optionKey="id"/>