<%@ page import="gobela.Valoracion" %>

<h3>Repercusión mediática (max 50 pts):</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l6prensaLocal', 'error')} required">
    <label for="l6prensaLocal">
        <g:message code="valoracion.l6prensaLocal.label" default="Prensa local:"/>
    </label>
    <g:checkBox class="check-box" onchange="sumar();" data="suma" name="l6prensaLocal" value="5"
                checked="${valoracionInstance?.l6prensaLocal == 5}"/> 5 pts
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l6prensaComarcal', 'error')} required">
    <label for="l6prensaComarcal">
        <g:message code="valoracion.l6prensaComarcal.label" default="Prensa comarcal:"/>
    </label>
    <g:checkBox class="check-box" onchange="sumar();" data="suma" name="l6prensaComarcal" value="10"
                checked="${valoracionInstance?.l6prensaComarcal == 10}"/> 10 pts
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l6prensaRegional', 'error')} required">
    <label for="l6prensaComarcal">
        <g:message code="valoracion.l6prensaRegional.label" default="Prensa regional:"/>
    </label>
    <g:checkBox class="check-box" onchange="sumar();" data="suma" name="l6prensaRegional" value="15"
                checked="${valoracionInstance?.l6prensaRegional == 15}"/> 15 pts
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l6prensaEstatal', 'error')} required">
    <label for="l6prensaEstatal">
        <g:message code="valoracion.l6prensaEstatal.label" default="Prensa estatal:"/>
    </label>
    <g:checkBox class="check-box" onchange="sumar();" data="suma" name="l6prensaEstatal" value="20"
                checked="${valoracionInstance?.l6prensaEstatal == 20}"/> 20 pts
</div>
<br>

<h3>Costes de la actividad desarrollada (max 10 pts):</h3>
<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l6costeActividad', 'error')} required">
    <label for="l6costeActividad">
        <g:message code="valoracion.l6costeActividad.label" default="Si el presupuesto es:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:radio name="l6costeActividad" value="1" onchange="sumar();" data="suma"
             checked="${valoracionInstance?.l6costeActividad == 1}"/> Inferior a 5.000€ (1 pt)

    <div class="fieldcontain">
        <label for="l6costeActividad"></label>
        <g:radio name="l6costeActividad" value="3" onchange="sumar();" data="suma"
                 checked="${valoracionInstance?.l6costeActividad == 3}"/> Entre 5.000€ y 15.000€  (3 pts)
    </div>

    <div class="fieldcontain">
        <label for="l6costeActividad"></label>
        <g:radio name="l6costeActividad" value="6" onchange="sumar();" data="suma"
                 checked="${valoracionInstance?.l6costeActividad == 6}"/> Entre 15.000€ y 25.000€ (6 pts)
    </div>

    <div class="fieldcontain">
        <label for="l6costeActividad"></label>
        <g:radio name="l6costeActividad" value="8" onchange="sumar();" data="suma"
                 checked="${valoracionInstance?.l6costeActividad == 8}"/> Entre 25.000€ y 55.000€ (8 pts)
    </div>

    <div class="fieldcontain">
        <label for="l6costeActividad"></label>
        <g:radio name="l6costeActividad" value="10" onchange="sumar();" data="suma"
                 checked="${valoracionInstance?.l6costeActividad == 10}"/> Más de 55.000€ (10 pts)
    </div>
</div>
<br>

<h3>Medios económicos propios (max 10 pts):</h3>
<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l6mediosPropios', 'error')} required">
    <label for="l6mediosPropios">
        <g:message code="valoracion.l6mediosPropios.label" default="Medios económicos propios:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:radio name="l6mediosPropios" value="0" onchange="sumar();" data="suma"
             checked="${valoracionInstance?.l6mediosPropios == 0}"/> Menos del 10% (0 pts)

    <div class="fieldcontain">
        <label for="l6mediosPropios"></label>
        <g:radio name="l6mediosPropios" value="3" onchange="sumar();" data="suma"
                 checked="${valoracionInstance?.l6mediosPropios == 3}"/> 10% de recursos propios (3 pts)
    </div>

    <div class="fieldcontain">
        <label for="l6mediosPropios"></label>
        <g:radio name="l6mediosPropios" value="6" onchange="sumar();" data="suma"
                 checked="${valoracionInstance?.l6mediosPropios == 6}"/> 20% de recursos propios (6 pts)
    </div>

    <div class="fieldcontain">
        <label for="l6mediosPropios"></label>
        <g:radio name="l6mediosPropios" value="10" onchange="sumar();" data="suma"
                 checked="${valoracionInstance?.l6mediosPropios == 10}"/> 30% o más de recursos propios (10 pts)
    </div>
</div>
<br>

<h3>Dificultad para acudir a otros medios de financiación (max 30 pts):</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l6patrcinioPrivado', 'error')} required">
    <label for="l6patrcinioPrivado">
        <g:message code="valoracion.l6patrcinioPrivado.label" default="Patrocinio Privado:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:radio name="l6patrcinioPrivado" value="10" onchange="sumar();" data="suma"
             checked="${valoracionInstance?.l6patrcinioPrivado == 10}"/> Más de 10.000€ (10 pts)

    <div class="fieldcontain">
        <label for="l6mediosPropios"></label>
        <g:radio name="l6patrcinioPrivado" value="15" onchange="sumar();" data="suma"
                 checked="${valoracionInstance?.l6patrcinioPrivado == 15}"/> Entre 7.000€ y 10.000€ (15 pts)
    </div>

    <div class="fieldcontain">
        <label for="l6mediosPropios"></label>
        <g:radio name="l6patrcinioPrivado" value="20" onchange="sumar();" data="suma"
                 checked="${valoracionInstance?.l6patrcinioPrivado == 20}"/> Entre 4.000€ y 7.000€ (20 pts)
    </div>

    <div class="fieldcontain">
        <label for="l6mediosPropios"></label>
        <g:radio name="l6patrcinioPrivado" value="30" onchange="sumar();" data="suma"
                 checked="${valoracionInstance?.l6patrcinioPrivado == 30}"/> Menos de 4.000€ (30 pts)
    </div>
</div>

