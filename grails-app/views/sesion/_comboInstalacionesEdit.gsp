<label for="instalacion">Instalacion</label>
<span class="required-indicator">*</span>
<g:select name="instalacion"
          id="instalacion"
          from="${listaInstalaciones}"
          value="${this.sesion?.instalacion}"
          optionKey="id"/>