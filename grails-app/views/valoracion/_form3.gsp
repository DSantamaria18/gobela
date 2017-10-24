<%@ page import="gobela.Valoracion" %>


<h3>Categoría de la fase de la fase final o descenso (max 50 pts):</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l3categoriaFaseFinal', 'error')} required">
    <label for="l3categoriaFaseFinal">
        <g:message code="valoracion.l3categoriaFaseFinal.label" default="Fase final:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:checkBox class="check-box" name="l3categoriaFaseFinal" value="50" onchange="sumar();" data="suma"
             checked="${valoracionInstance.l3categoriaFaseFinal == 50}"/> Fase final de categoría nacional (50 pts)


    <div class="fieldcontain">
        <label for="l3categoriaFaseFinal"></label>
        <g:checkBox class="check-box" name="l3categoriaFaseFinal" value="40" onchange="sumar();" data="suma"
                 checked="${valoracionInstance.l3categoriaFaseFinal == 40}"/> Fase final de categoría autonómica (40 pts)
    </div>

    <div class="fieldcontain">
        <label for="l3categoriaFaseFinal"></label>
        <g:checkBox class="check-box" name="l3categoriaFaseFinal" value="30" onchange="sumar();" data="suma"
                 checked="${valoracionInstance.l3categoriaFaseFinal == 30}"/> Fase final de zona Norte (30 pts)
    </div>

    <div class="fieldcontain">
        <label for="l3categoriaFaseFinal"></label>
        <g:checkBox class="check-box" name="l3categoriaFaseFinal" value="12" onchange="sumar();" data="suma"
                 checked="${valoracionInstance.l3categoriaFaseFinal == 12}"/> Fase final de categoría provincial (12 pts)
    </div>

    <div class="fieldcontain">
        <label for="l3categoriaFaseFinal"></label>
        <g:checkBox class="check-box" name="l3categoriaFaseFinal" value="7" onchange="sumar();" data="suma"
                 checked="${valoracionInstance.l3categoriaFaseFinal == 7}"/> Fase final de categoría comarcal (7 pts)
    </div>
</div>

<br>

<h3>Resultado Obtenido (max 50 pts):</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l3resultadoObtenido', 'error')} required">
    <label for="l3resultadoObtenido">
        <g:message code="valoracion.l3resultadoObtenido.label" default="Resultado obtenido:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:checkBox class="check-box" name="l3resultadoObtenido" value="50" onchange="sumar();" data="suma"
             checked="${valoracionInstance.l3resultadoObtenido == 50}"/> Ascender a categoría nacional (50 pts)

    <div class="fieldcontain">
        <label for="l3resultadoObtenido"></label>
        <g:checkBox class="check-box" name="l3resultadoObtenido" value="40" onchange="sumar();" data="suma"
                 checked="${valoracionInstance.l3resultadoObtenido == 40}"/> Quedar entre el 6 y el 1 en categoría nacional (40 pts)
    </div>

    <div class="fieldcontain">
        <label for="l3resultadoObtenido"></label>
        <g:checkBox class="check-box" name="l3resultadoObtenido" value="35" onchange="sumar();" data="suma"
                 checked="${valoracionInstance.l3resultadoObtenido == 35}"/> Quedar entre el 6 y el 12 en categoría nacional (35 pts)
    </div>

    <div class="fieldcontain">
        <label for="l3resultadoObtenido"></label>
        <g:checkBox class="check-box" name="l3resultadoObtenido" value="30" onchange="sumar();" data="suma"
                 checked="${valoracionInstance.l3resultadoObtenido == 30}"/> Quedar 1º en categoría autonómica (30 pts)
    </div>

    <div class="fieldcontain">
        <label for="l3resultadoObtenido"></label>
        <g:checkBox class="check-box" name="l3resultadoObtenido" value="25" onchange="sumar();" data="suma"
                 checked="${valoracionInstance.l3resultadoObtenido == 25}"/> Quedar entre el 2 y el 6 en categoría autonómica (25 pts)
    </div>

    <div class="fieldcontain">
        <label for="l3resultadoObtenido"></label>
        <g:checkBox class="check-box" name="l3resultadoObtenido" value="20" onchange="sumar();" data="suma"
                 checked="${valoracionInstance.l3resultadoObtenido == 20}"/> Quedar entre el 6 y el 12 en categoría autonómica (20 pts)
    </div>

    <div class="fieldcontain">
        <label for="l3resultadoObtenido"></label>
        <g:checkBox class="check-box" name="l3resultadoObtenido" value="15" onchange="sumar();" data="suma"
                 checked="${valoracionInstance.l3resultadoObtenido == 15}"/> Quedar 1º en categoría zona Norte (15 pts)
    </div>

    <div class="fieldcontain">
        <label for="l3resultadoObtenido"></label>
        <g:checkBox class="check-box" name="l3resultadoObtenido" value="10" onchange="sumar();" data="suma"
                 checked="${valoracionInstance.l3resultadoObtenido == 10}"/> Quedar entre el 2 y el 6 en categoría zona Norte ó 1º en categoría provincial (10 pts)
    </div>

    <div class="fieldcontain">
        <label for="l3resultadoObtenido"></label>
        <g:checkBox class="check-box" name="l3resultadoObtenido" value="5" onchange="sumar();" data="suma"
                 checked="${valoracionInstance.l3resultadoObtenido == 5}"/> Quedar 1º en categoría comarcal (5 pts)
    </div>

</div>

