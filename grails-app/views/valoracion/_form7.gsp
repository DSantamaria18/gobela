<%@ page import="gobela.Valoracion" %>

<h3>Repercusión mediática (max 50 pts):</h3>
<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l7prensaLocal', 'error')} required">
	<label for="l7prensaLocal">
		<g:message code="valoracion.l7prensaLocal.label" default="Prensa local:" />
	</label>
	<g:checkBox class="check-box" onchange="sumar();" data="suma" name="l7prensaLocal" value="5"
				checked="${valoracionInstance?.l7prensaLocal == 5}"/> 5 pts

</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l7prensaComarcal', 'error')} required">
	<label for="l7prensaComarcal">
		<g:message code="valoracion.l7prensaComarcal.label" default="Prensa comarcal:" />
	</label>
	<g:checkBox class="check-box" onchange="sumar();" data="suma" name="l7prensaComarcal" value="10"
				checked="${valoracionInstance?.l7prensaComarcal == 10}"/> 10 pts
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l7prensaRegional', 'error')} required">
	<label for="l7prensaRegional">
		<g:message code="valoracion.l7prensaRegional.label" default="Prensa regional:" />
	</label>
	<g:checkBox class="check-box" onchange="sumar();" data="suma" name="l7prensaRegional" value="15"
				checked="${valoracionInstance?.l7prensaRegional == 15}"/> 15 pts
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l7prensaEstatal', 'error')} required">
	<label for="l7prensaEstatal">
		<g:message code="valoracion.l7prensaEstatal.label" default="Prensa estatal:" />
	</label>
	<g:checkBox class="check-box" onchange="sumar();" data="suma" name="l7prensaEstatal" value="20"
				checked="${valoracionInstance?.l7prensaEstatal == 20}"/> 20 pts
</div>
<br>

<h3>Costes de la actividad desarrollada (max 10 pts):</h3>
<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l7costeActividad', 'error')} required">
	<label for="l7costeActividad">
		<g:message code="valoracion.l7costeActividad.label" default="Presupuesto:" />
		<span class="required-indicator">*</span>
	</label>
	<g:radio name="l7costeActividad" value="1" onchange="sumar();" data="suma"
			 checked="${valoracionInstance?.l7costeActividad == 1}"/> Inferior a 5.000€ (1 pt)

	<div class="fieldcontain">
		<label for="l7costeActividad"></label>
		<g:radio name="l7costeActividad" value="3" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l7costeActividad == 3}"/> Entre 5.000€ y 15.000€  (3 pts)
	</div>

	<div class="fieldcontain">
		<label for="l7costeActividad"></label>
		<g:radio name="l7costeActividad" value="6" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l7costeActividad == 6}"/> Entre 15.000€ y 25.000€ (6 pts)
	</div>

	<div class="fieldcontain">
		<label for="l7costeActividad"></label>
		<g:radio name="l7costeActividad" value="8" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l7costeActividad == 8}"/> Entre 25.000€ y 55.000€ (8 pts)
	</div>

	<div class="fieldcontain">
		<label for="l7costeActividad"></label>
		<g:radio name="l7costeActividad" value="10" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l7costeActividad == 10}"/> Más de 55.000€ (10 pts)
	</div>
</div>
<br>

<h3>Medios económicos propios (max 10 pts):</h3>
<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l7mediosPropios', 'error')} required">
	<label for="l7mediosPropios">
		<g:message code="valoracion.l7mediosPropios.label" default="Medios propios:" />
		<span class="required-indicator">*</span>
	</label>
	<g:radio name="l7mediosPropios" value="0" onchange="sumar();" data="suma"
			 checked="${valoracionInstance?.l7mediosPropios == 0}"/> Menos del 10% (0 pts)

	<div class="fieldcontain">
		<label for="l7mediosPropios"></label>
		<g:radio name="l7mediosPropios" value="3" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l7mediosPropios == 3}"/> 10% de recursos propios (3 pts)
	</div>

	<div class="fieldcontain">
		<label for="l7mediosPropios"></label>
		<g:radio name="l7mediosPropios" value="6" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l7mediosPropios == 6}"/> 20% de recursos propios (6 pts)
	</div>

	<div class="fieldcontain">
		<label for="l7mediosPropios"></label>
		<g:radio name="l7mediosPropios" value="10" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l7mediosPropios == 10}"/> 30% o más de recursos propios (10 pts)
	</div>
</div>
<br>

<h3>Dificultad para acudir a otros medios de financiación (max 30 pts):</h3>
<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l7patrcinioPrivado', 'error')} required">
	<label for="l7patrcinioPrivado">
		<g:message code="valoracion.l7patrcinioPrivado.label" default="Patrcinio privado:" />
		<span class="required-indicator">*</span>
	</label>
	<g:radio name="l7patrcinioPrivado" value="10" onchange="sumar();" data="suma"
			 checked="${valoracionInstance?.l7patrcinioPrivado == 10}"/> Más de 10.000€ (10 pts)

	<div class="fieldcontain">
		<label for="l7patrcinioPrivado"></label>
		<g:radio name="l7patrcinioPrivado" value="15" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l7patrcinioPrivado == 15}"/> Entre 7.000€ y 10.000€ (15 pts)
	</div>

	<div class="fieldcontain">
		<label for="l7patrcinioPrivado"></label>
		<g:radio name="l7patrcinioPrivado" value="20" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l7patrcinioPrivado == 20}"/> Entre 4.000€ y 7.000€ (20 pts)
	</div>

	<div class="fieldcontain">
		<label for="l7patrcinioPrivado"></label>
		<g:radio name="l7patrcinioPrivado" value="30" onchange="sumar();" data="suma"
				 checked="${valoracionInstance?.l7patrcinioPrivado == 30}"/> Menos de 4.000€ (30 pts)
	</div>
</div>
%{--fin--}%

