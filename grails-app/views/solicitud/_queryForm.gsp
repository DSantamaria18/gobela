<div class="fieldcontain>
	<label for="entidad">Entidad: </label>
<g:checkBox name="solicitud" value="Solicitud" checked="false"/><label for="solicitud">Solicitud</label>
<g:checkBox name="balance" value="Balance" checked="false"/><label for="balance">Balance</label>
<g:checkBox name="memoria" value="Memoria" checked="false"/><label for="memoria">Memoria</label>
<g:checkBox name="valoracion" value="Valoración" checked="false"/><label for="valoracion">Valoración</label>
<g:checkBox name="justificacion" value="Justificación" checked="false"/><label for="justificacion">Justificación</label>
</div><br>
<div class="fieldcontain>
    <label for="codigoSolicitante">Código Solicitante: </label>
<g:textField name="codigoSolicitante" value="${params.codigoSolicitanteQ}"></g:textField>
</div><br>
<div class="fieldcontain>
    <label for="nombreSolicitante">Nombre Solicitante: </label>
<g:textField name="nombreSolicitante" value="${params.nombreSolicitante}"></g:textField>
</div><br>
<div class="fieldcontain>
    <label for="municipioSolicitante">Municipio Solicitante: </label>
<g:textField name="municipioSolicitante" value="${params.municipioSolicitante}"></g:textField>
</div><br>
<div class="fieldcontain>
    <label for="cpSolicitante">Nombre Solicitante: </label>
<g:textField name="cpSolicitante"></g:textField>
</div><br>
<div class="fieldcontain>
    <label for="tipoSolicitud">Tipo Solicitud: </label>
<g:select name="tipoSolicitud" from="${["*", "Club", "Deportista", "Otros"]}" value="${tipoSolicitud}"/>
</div><br>