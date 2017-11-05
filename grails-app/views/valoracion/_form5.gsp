<%@ page import="gobela.Valoracion" %>

<h3>Impacto de la actividad (max 60 pts):</h3>
<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l5numeroEspectadores', 'error')} required">
	<label for="l5numeroEspectadores">
		<g:message code="valoracion.l5numeroEspectadores.label" default="Impacto de la actividad:" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:field onchange="sumar();" data="suma" name="l5numeroEspectadores" type="number" value="${valoracionInstance?.l5numeroEspectadores}" required=""/>--}%
	<g:radio name="l5numeroEspectadores" value="0" onchange="sumar();" data="suma"
			 checked="${valoracionInstance?.l5numeroEspectadores == 0}"/> Menos de 100 espectadores (0 pts)

	<div class="fieldcontain">
		<label for="l5numeroEspectadores"></label>
		<g:radio name="l5numeroEspectadores" value="20" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l5numeroEspectadores == 20}"/>  Más de 100 espectadores (20 pts)
	</div>

	<div class="fieldcontain">
		<label for="l5numeroEspectadores"></label>
		<g:radio name="l5numeroEspectadores" value="40" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l5numeroEspectadores == 40}"/>  Más de 200 espectadores (40 pts)
	</div>

	<div class="fieldcontain">
		<label for="l5numeroEspectadores"></label>
		<g:radio name="l5numeroEspectadores" value="60" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l5numeroEspectadores == 60}"/>  Más de 350 espectadores (60 pts)
	</div>
</div>
<br>

<h3>Adecuación del presupuesto (max 10 pts):</h3>
<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l5recursosPropios', 'error')} required">
	<label for="l5recursosPropios">
		<g:message code="valoracion.l5recursosPropios.label" default="Recursos propios:" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:field onchange="sumar();" data="suma" name="l5recursosPropios" type="number" value="${valoracionInstance?.l5recursosPropios}" required=""/>--}%
	<g:radio name="l5recursosPropios" value="0" onchange="sumar();" data="suma"
			 checked="${valoracionInstance?.l5recursosPropios == 0}"/>  Menos del 10% (0 pts)

	<div class="fieldcontain">
		<label for="l5recursosPropios"></label>
		<g:radio name="l5recursosPropios" value="3" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l5recursosPropios == 3}"/>  10% (3 pts)
	</div>

	<div class="fieldcontain">
		<label for="l5recursosPropios"></label>
		<g:radio name="l5recursosPropios" value="6" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l5recursosPropios == 6}"/>  20% (6 pts)
	</div>

	<div class="fieldcontain">
		<label for="l5recursosPropios"></label>
		<g:radio name="l5recursosPropios" value="10" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l5recursosPropios == 10}"/>  30% ó más (10 pts)
	</div>
</div>
<br>

<h3>Calidad en el diseño de la actividad (max 10 pts): </h3>
<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l5participacionEstimada', 'error')} required">
	<label for="l5participacionEstimada">
		<g:message code="valoracion.l5participacionEstimada.label" default="Participación estimada:" />
	</label>
	<g:checkBox class="check-box" onchange="sumar();" data="suma" name="l5participacionEstimada" value="2"
				checked="${valoracionInstance?.l5participacionEstimada == 2}"/>  2 pts
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l5comunicacionAMedios', 'error')} required">
	<label for="l5comunicacionAMedios">
		<g:message code="valoracion.l5comunicacionAMedios.label" default="Comunicación a medios:" />
	</label>
	<g:checkBox class="check-box" onchange="sumar();" data="suma" name="l5comunicacionAMedios" value="4"
				checked="${valoracionInstance?.l5comunicacionAMedios == 4}"/> 4 pts
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l5usoNuevasTecnologías', 'error')} required">
	<label for="l5usoNuevasTecnologías">
		<g:message code="valoracion.l5usoNuevasTecnologías.label" default="Uso de nuevas tecnologías:" />
	</label>
	<g:checkBox class="check-box" onchange="sumar();" data="suma" name="l5usoNuevasTecnologías" value="4"
				checked="${valoracionInstance?.l5usoNuevasTecnologías == 4}"/> 4 pts
</div>
<br>

<h3>Tratamiento en la actividad de las temáticas transversales (max 10 pts):</h3>
<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l5participacionFemenina', 'error')} required">
	<label for="l5participacionFemenina">
		<g:message code="valoracion.l5participacionFemenina.label" default="Participación femenina:" />
	</label>
	<g:radio name="l5participacionFemenina" value="0" onchange="sumar();" data="suma"
			 checked="${valoracionInstance?.l5participacionFemenina == 0}"/>  Menos del 20% (0 pts)

	<div class="fieldcontain">
		<label for="l5participacionFemenina"></label>
		<g:radio name="l5participacionFemenina" value="1" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l5participacionFemenina == 1}"/>  Más del 20% (1 pt)
	</div>

	<div class="fieldcontain">
		<label for="l5participacionFemenina"></label>
		<g:radio name="l5participacionFemenina" value="3" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l5participacionFemenina == 3}"/>  Más del 40% (3 pt)
	</div>

	<div class="fieldcontain">
		<label for="l5participacionFemenina"></label>
		<g:radio name="l5participacionFemenina" value="5" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l5participacionFemenina == 5}"/>  Más del 60% (5 pt)
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l5actividadesEuskera', 'error')} required">
	<label for="l5actividadesEuskera">
		<g:message code="valoracion.l5actividadesEuskera.label" default="Actividad en Euskera para niños/as:" />
	</label>
	<g:checkBox class="check-box" onchange="sumar();" data="suma" name="l5actividadesEuskera" value="5"
				checked="${valoracionInstance?.l5actividadesEuskera == 5}"/> 5 pts
</div>
<br>

<h3>Valoración de la persona solicitante (max 8 pts):</h3>
<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l5experienciaSolicitante', 'error')} required">
	<label for="l5experienciaSolicitante">
		<g:message code="valoracion.l5experienciaSolicitante.label" default="Experiencia:" />
		<span class="required-indicator">*</span>
	</label>
	<g:radio name="l5experienciaSolicitante" value="0" onchange="sumar();" data="suma"
			 checked="${valoracionInstance?.l5experienciaSolicitante == 0}"/>  Menos de 2 años (0 pts)

	<div class="fieldcontain">
		<label for="l5experienciaSolicitante"></label>
		<g:radio name="l5experienciaSolicitante" value="4" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l5experienciaSolicitante == 4}"/>  Más de 2 años (4 pts)
	</div>

	<div class="fieldcontain">
		<label for="l5experienciaSolicitante"></label>
		<g:radio name="l5experienciaSolicitante" value="6" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l5experienciaSolicitante == 6}"/>  Más de 4 años (6 pts)
	</div>

	<div class="fieldcontain">
		<label for="l5experienciaSolicitante"></label>
		<g:radio name="l5experienciaSolicitante" value="8" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l5experienciaSolicitante == 8}"/>  Más de 6 años (8 pts)
	</div>
</div>

