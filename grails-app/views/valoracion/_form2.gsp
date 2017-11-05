<%@ page import="gobela.Valoracion" %>

<h3>Costes de la actividad desarrollada (max 10 pts):</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2costesActividadDe', 'error')} required">
    <label for="l2costesActividadDe">
        <g:message code="valoracion.l2costesActividadDe.label" default="Costes de actividad:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:radio name="l2costesActividadDe" value="1" onchange="sumar(2);" data="suma"
             checked="${valoracionInstance?.l2costesActividadDe == 1}"/> Inferior a 5.000€ (1 pt)

    <div class="fieldcontain">
        <label for="l2costesActividadDe"></label>
        <g:radio name="l2costesActividadDe" value="3" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2costesActividadDe == 3}"/> Entre 5.000€ y 15.000€  (3 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2costesActividadDe"></label>
        <g:radio name="l2costesActividadDe" value="6" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2costesActividadDe == 6}"/> Entre 15.000€ y 25.000€ (6 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2costesActividadDe"></label>
        <g:radio name="l2costesActividadDe" value="8" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2costesActividadDe == 8}"/> Entre 25.000€ y 55.000€ (8 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2costesActividadDe"></label>
        <g:radio name="l2costesActividadDe" value="10" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2costesActividadDe == 10}"/> Más de 55.000€ (10 pts)
    </div>
</div>
<br>

<h3>Medios económicos propios (max 10 pts):</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2mediosPropios', 'error')} required">
    <label for="l2mediosPropios">
        <g:message code="valoracion.l2mediosPropios.label" default="Medios propios:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:radio name="l2mediosPropios" value="0" onchange="sumar(2);" data="suma"
             checked="${valoracionInstance?.l2mediosPropios == 0}"/> Menos del 10% (0 pts)

    <div class="fieldcontain">
        <label for="l2mediosPropios"></label>
        <g:radio name="l2mediosPropios" value="3" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2mediosPropios == 3}"/> 10% de recursos propios (3 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2mediosPropios"></label>
        <g:radio name="l2mediosPropios" value="6" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2mediosPropios == 6}"/> 20% de recursos propios (6 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2mediosPropios"></label>
        <g:radio name="l2mediosPropios" value="10" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2mediosPropios == 10}"/> 30% o más de recursos propios (10 pts)
    </div>
</div>
<br>

<h3>Dificultad para acudir a otros medios de financiación (max 5 pts):</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2dificultadFinanciacion', 'error')} required">
    <label for="l2dificultadFinanciacion">
        <g:message code="valoracion.l2dificultadFinanciacion.label" default="Patrocinio privado:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:radio name="l2dificultadFinanciacion" value="1" onchange="sumar(2);" data="suma"
             checked="${valoracionInstance?.l2dificultadFinanciacion == 1}"/> Más de 10.000€ (1 pt)

    <div class="fieldcontain">
        <label for="l2dificultadFinanciacion"></label>
        <g:radio name="l2dificultadFinanciacion" value="3" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2dificultadFinanciacion == 3}"/> Entre 7.000€ y 10.000€ (3 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2dificultadFinanciacion"></label>
        <g:radio name="l2dificultadFinanciacion" value="4" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2dificultadFinanciacion == 4}"/> Entre 4.000€ y 7.000€ (4 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2dificultadFinanciacion"></label>
        <g:radio name="l2dificultadFinanciacion" value="5" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2dificultadFinanciacion == 5}"/> Menos de 4.000€ (5 pts)
    </div>
</div>
<br>

<h2>Entidades Deportivas</h2>
<br>

<h3>Proyecto deportivo y esfuerzo organizativo (max 5pts):</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2viabilidad', 'error')} required">
    <label for="l2viabilidad">
        <g:message code="valoracion.l2viabilidad.label" default="Viabilidad del proyecto:"/>
    </label>
    <g:checkBox class="check-box" onchange="sumar(2);" data="suma" name="l2viabilidad" value="2.5"
                checked="${valoracionInstance?.l2viabilidad == 2.5}"/> 2,5 pts
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2viabilidad', 'error')} required">
    <label for="l2objetivosGK">
        <g:message code="valoracion.l2objetivosGK.label" default="Objetivos GK:"/>
    </label>
    <g:checkBox class="check-box" onchange="sumar(2);" data="suma" name="l2objetivosGK" value="2.5"
                checked="${valoracionInstance?.l2objetivosGK == 2.5}"/> 2,5 pts
</div>
<br>

<h3>Atención a la diversidad (max 5pts):</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2lenguajeNoSexista', 'error')} required">
    <label for="l2lenguajeNoSexista">Lenguaje no sexista:</label>
    <g:checkBox class="check-box" onchange="sumar(2);" data="suma" name="l2lenguajeNoSexista" value="0.5"
                checked="${valoracionInstance?.l2lenguajeNoSexista == 0.5}"/> 0,5 pts
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2lenguajeDeGenero', 'error')} required">
    <label for="l2lenguajeDeGenero">Correcta utilización del lenguaje de género en las publicaciones:</label>
    <g:checkBox class="check-box" onchange="sumar(2);" data="suma" name="l2lenguajeDeGenero" value="0.5"
                checked="${valoracionInstance?.l2lenguajeDeGenero == 0.5}"/> 0,5 pts
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2representacionFemeninaJunta', 'error')} required">
    <label for="l2representacionFemeninaJunta">Más del 20% de mujeres en la junta directiva:</label>
    <g:checkBox class="check-box" onchange="sumar(2);" data="suma" name="l2representacionFemeninaJunta" value="2"
                checked="${valoracionInstance?.l2representacionFemeninaJunta == 2}"/> 2 pts
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2inmigracion', 'error')} required">
    <label for="l2inmigracion">Integración a la inmigración:</label>
    <g:checkBox class="check-box" onchange="sumar(2);" data="suma" name="l2inmigracion" value="1"
                checked="${valoracionInstance?.l2inmigracion == 1}"/> 1 pt
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2personasDiscapacidad', 'error')} required">
    <label for="l2personasDiscapacidad">Actividades para personas con discapacidad:</label>
    <g:checkBox class="check-box" onchange="sumar(2);" data="suma" name="l2personasDiscapacidad" value="1"
                checked="${valoracionInstance?.l2personasDiscapacidad == 1}"/> 1 pt
</div>
<br>

<h3>Desarrollo de la actividad con utilización de ambas lenguas oficiales de la CAV (max 10 pts):</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2proyectoDeportivoEuskera', 'error')} required">
    <label for="l2proyectoDeportivoEuskera">
        <g:message code="valoracion.l2proyectoDeportivoEuskera.label" default="Uso del Euskera:"/>
    </label>
    <g:checkBox class="check-box" onchange="sumar(2);" data="suma" name="l2proyectoDeportivoEuskera" value="10"
                checked="${valoracionInstance?.l2proyectoDeportivoEuskera == 10}"/> 10 pts
</div>
<br>

<h3>Incidencia y promoción en el deporte femenino (max 5 pts):</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2proyectoDeportivoParticipacionFemenina', 'error')} required">
    <label for="l2proyectoDeportivoParticipacionFemenina">
        <g:message code="valoracion.l2proyectoDeportivoParticipacionFemenina.label" default="Participacion femenina:"/>
    </label>
    <g:radio name="l2proyectoDeportivoParticipacionFemenina" value="1" onchange="sumar(2);" data="suma"
             checked="${valoracionInstance?.l2proyectoDeportivoParticipacionFemenina == 1}"/> Menos del 20% (1 pt)

    <div class="fieldcontain">
        <label for="l2proyectoDeportivoParticipacionFemenina"></label>
        <g:radio name="l2proyectoDeportivoParticipacionFemenina" value="2" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2proyectoDeportivoParticipacionFemenina == 2}"/> Entre el 20% y el 40% (2 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2proyectoDeportivoParticipacionFemenina"></label>
        <g:radio name="l2proyectoDeportivoParticipacionFemenina" value="3" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2proyectoDeportivoParticipacionFemenina == 3}"/> Entre el 40% y el 60% (3 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2proyectoDeportivoParticipacionFemenina"></label>
        <g:radio name="l2proyectoDeportivoParticipacionFemenina" value="4" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2proyectoDeportivoParticipacionFemenina == 4}"/> Entre el 60% y el 80% (4 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2proyectoDeportivoParticipacionFemenina"></label>
        <g:radio name="l2proyectoDeportivoParticipacionFemenina" value="5" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2proyectoDeportivoParticipacionFemenina == 5}"/> Entre el 80% y el 100% (5 pts)
    </div>
</div>
<br>

<h3>Incidencia de la actividad entre los residentes en Getxo (max 15 pts):</h3>
<h5>(max 7 pts para clubes de fútbol)</h5>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2residentes', 'error')} required">
    <label for="l2esClubFutbol">
        <g:message code="valoracion.l2esClubFutbol.label" default="Es club de fútbol:"/>
    </label>
    <g:checkBox class="check-box" onchange="actualizaL2Values();" name="l2esClubFutbol"
                checked="${valoracionInstance?.l2esClubFutbol}"/>
</div>

<div id="residentes-no-futbol"
     class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2residentes', 'error')} required">
    <label for="l2residentes">
        <g:message code="valoracion.l2residentes.label" default="Residentes en Getxo:"/>
    </label>
    <g:radio name="l2residentes" value="15" onchange="sumar(2);" data="suma"
             checked="${valoracionInstance?.l2residentes == 15}"/> Más del 80% (15 pts)

    <div class="fieldcontain">
        <label for="l2residentes"></label>
        <g:radio name="l2residentes" value="10" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2residentes == 10}"/> Más del 60% (10 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2residentes"></label>
        <g:radio name="l2residentes" value="5" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2residentes == 5}"/> Más del 40% (5 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2residentes"></label>
        <g:radio name="l2residentes" value="0" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2residentes == 0}"/> Menos del 40% (0 pts)
    </div>
</div>

<div id="residentes-futbol"
     class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2residentes', 'error')} required">
    <label for="l2residentes">
        <g:message code="valoracion.l2residentes.label" default="Residentes en Getxo:"/>
    </label>
    <g:radio name="l2residentes" value="7" onchange="sumar(2);" data="suma"
             checked="${valoracionInstance?.l2residentes == 7}"/> Más del 80% (7 pts)

    <div class="fieldcontain">
        <label for="l2residentes"></label>
        <g:radio name="l2residentes" value="5" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2residentes == 5}"/> Más del 60% (5 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2residentes"></label>
        <g:radio name="l2residentes" value="4" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2residentes == 4}"/> Más del 40% (4 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2residentes"></label>
        <g:radio name="l2residentes" value="0" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2residentes == 0}"/> Menos del 40% (0 pts)
    </div>
</div>

<br>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2jugadoresEquipoSenior', 'error')}">
    <h6>* Sólo clubes de fútbol senior que militen por debajo de la 2ª B</h6>
    <label for="l2jugadoresEquipoSenior">
        <g:message code="valoracion.l2jugadoresEquipoSenior.label"
                   default="Jugadores entre los 18 y 23 años en equipo Senior:"/>
    </label>
    <g:radio name="l2jugadoresEquipoSenior" value="8" onchange="sumar(2);" data="suma"
             checked="${valoracionInstance?.l2jugadoresEquipoSenior == 8}"/> Más de 8 jugadores (8 pts)

    <div class="fieldcontain">
        <label for="l2jugadoresEquipoSenior"></label>
        <g:radio name="l2jugadoresEquipoSenior" value="6" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2jugadoresEquipoSenior == 6}"/> Entre 5 y 7 jugadores (6 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2jugadoresEquipoSenior"></label>
        <g:radio name="l2jugadoresEquipoSenior" value="4" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2jugadoresEquipoSenior == 4}"/> Entre 3 y 4 jugadores (4 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2jugadoresEquipoSenior"></label>
        <g:radio name="l2jugadoresEquipoSenior" value="0" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2jugadoresEquipoSenior == 0}"/> Menos de 3 jugadores (0 pts)
    </div>
</div>
<br>

<h3>Contribución a la difusión y mejora de la imagen de Getxo (max 5 pts):</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2prensaLocal', 'error')} required">
    <label for="l2prensaLocal">
        <g:message code="valoracion.l2prensaLocal.label" default="Prensa local:"/>
    </label>
    <g:checkBox class="check-box" onchange="sumar(2);" data="suma" name="l2prensaLocal" value="1"
                checked="${valoracionInstance?.l2prensaLocal == 1}"/> 1 pt
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2prensaComarcal', 'error')} required">
    <label for="l2prensaComarcal">
        <g:message code="valoracion.l2prensaComarcal.label" default="Prensa comarcal:"/>
    </label>
    <g:checkBox class="check-box" onchange="sumar(2);" data="suma" name="l2prensaComarcal" value="1"
                checked="${valoracionInstance?.l2prensaComarcal == 1}"/> 1 pt
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2prensaRegional', 'error')} required">
    <label for="l2prensaRegional">
        <g:message code="valoracion.l2prensaRegional.label" default="Prensa regional:"/>
    </label>
    <g:checkBox class="check-box" onchange="sumar(2);" data="suma" name="l2prensaRegional" value="1"
                checked="${valoracionInstance?.l2prensaRegional == 1}"/> 1 pt
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2prensaEstatalInternacional', 'error')} required">
    <label for="l2prensaEstatalInternacional">
        <g:message code="valoracion.l2prensaEstatalInternacional.label" default="Prensa estatal o internacional:"/>
    </label>
    <g:checkBox class="check-box" onchange="sumar(2);" data="suma" name="l2prensaEstatalInternacional" value="2"
                checked="${valoracionInstance?.l2prensaEstatalInternacional == 2}"/> 2 pts
</div>
<br>

<h3>Participación en la política deportiva municipal (max 15 pts):</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2deporteEscolar', 'error')} required">
    <label for="l2deporteEscolar">
        <g:message code="valoracion.l2deporteEscolar.label" default="Deporte escolar:"/>
    </label>
    <g:checkBox class="check-box" onchange="sumar(2);" data="suma" name="l2deporteEscolar" value="8"
                checked="${valoracionInstance?.l2deporteEscolar == 8}"/> 8 pts
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2marcaGetxo', 'error')} required">
    <label for="l2marcaGetxo">
        <g:message code="valoracion.l2marcaGetxo.label" default="Clubes marca Getxo:"/>
    </label>
    <g:checkBox class="check-box" onchange="sumar(2);" data="suma" name="l2marcaGetxo" value="7"
                checked="${valoracionInstance?.l2marcaGetxo == 7}"/> 7 pts
</div>
<br>

<h3>Participación y colaboración con otras asociaciones (max 5 pts):</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2getxoKirolak', 'error')} required">
    <label for="l2getxoKirolak">
        <g:message code="valoracion.l2getxoKirolak.label" default="Getxo Kirolak:"/>
    </label>
    <g:checkBox class="check-box" onchange="sumar(2);" data="suma" name="l2getxoKirolak" value="3"
                checked="${valoracionInstance?.l2getxoKirolak == 3}"/> 3 pts
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2centrosEscolares', 'error')} required">
    <label for="l2centrosEscolares">
        <g:message code="valoracion.l2centrosEscolares.label" default="Centros escolares:"/>
    </label>
    <g:checkBox class="check-box" onchange="sumar(2);" data="suma" name="l2centrosEscolares" value="1"
                checked="${valoracionInstance?.l2centrosEscolares == 1}"/> 1 pt
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2otrosClubes', 'error')} required">
    <label for="l2otrosClubes">
        <g:message code="valoracion.l2otrosClubes.label" default="Colabora con otros clubes:"/>
    </label>
    <g:checkBox class="check-box" onchange="sumar(2);" data="suma" name="l2otrosClubes" value="1"
                checked="${valoracionInstance?.l2otrosClubes == 1}"/> 1 pt
</div>
<br>

<h3>Continuidad y estabilidad del programa</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2antiguedad', 'error')} required">
    <label for="l2antiguedad">
        <g:message code="valoracion.l2antiguedad.label" default="Antiguedad:"/>
    </label>
    <g:radio name="l2antiguedad" value="0" onchange="sumar(2);" data="suma"
             checked="${valoracionInstance?.l2antiguedad == 0}"/> Menos de 1 año (0 pts)

    <div class="fieldcontain">
        <label for="l2antiguedad"></label>
        <g:radio name="l2antiguedad" value="6" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2antiguedad == 6}"/> 1 año (1 pt)
    </div>

    <div class="fieldcontain">
        <label for="l2antiguedad"></label>
        <g:radio name="l2antiguedad" value="2" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2antiguedad == 2}"/> 2 años (2 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2antiguedad"></label>
        <g:radio name="l2antiguedad" value="3" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2antiguedad == 3}"/> 3 años (3 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2antiguedad"></label>
        <g:radio name="l2antiguedad" value="5" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2antiguedad == 5}"/> 4 años (5 pts)
    </div>
</div>
<br>

<h3>Actividades realizadas y el volumen de participantes (max 5 pts):</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2participantes', 'error')} required">
    <label for="l2participantes">
        <g:message code="valoracion.l2participantes.label" default="Participantes:"/>
    </label>
    <g:radio name="l2participantes" value="1" onchange="sumar(2);" data="suma"
             checked="${valoracionInstance?.l2participantes == 1}"/> Hasta 20 participantes (1 pt)

    <div class="fieldcontain">
        <label for="l2participantes"></label>
        <g:radio name="l2participantes" value="2" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2participantes == 2}"/> Hasta 40 participantes (2 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2participantes"></label>
        <g:radio name="l2participantes" value="3" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2participantes == 3}"/> Hasta 60 participantes (3 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2participantes"></label>
        <g:radio name="l2participantes" value="4" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2participantes == 4}"/> Hasta 80 participantes (4 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2participantes"></label>
        <g:radio name="l2participantes" value="5" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2participantes == 5}"/> Más de 100 participantes (5 pts)
    </div>
</div>
<br>

<h2>Deportistas de alto rendimiento</h2>
<br>

<h3>TORNEOS / OPEN INTERNACIONALES:</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2puestoEnTorneosInternacionales', 'error')} required">
    <label for="l2puestoEnTorneosInternacionales">
        <g:message code="valoracion.l2puestoEnTorneosInternacionales.label"
                   default="Resultado:"/>
    </label>
    <g:radio name="l2puestoEnTorneosInternacionales" value="12" onchange="sumar(2);" data="suma"
             checked="${valoracionInstance?.l2puestoEnTorneosInternacionales == 12}"/> Primer puesto (12 pts)

    <div class="fieldcontain">
        <label for="l2puestoEnTorneosInternacionales"></label>
        <g:radio name="l2puestoEnTorneosInternacionales" value="6" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnTorneosInternacionales == 6}"/> Segundo puesto (6 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2puestoEnTorneosInternacionales"></label>
        <g:radio name="l2puestoEnTorneosInternacionales" value="3" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnTorneosInternacionales == 3}"/> Tercer puesto (3 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2puestoEnTorneosInternacionales"></label>
        <g:radio name="l2puestoEnTorneosInternacionales" value="0" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnTorneosInternacionales == 0}"/> Otro (0 pts)
    </div>
</div>
<br>

<h3>CIRCUITOS DE COMPETICIÓN INTERNACIONAL:</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2puestoEnCircuitosInternacionales', 'error')} required">
    <label for="l2puestoEnCircuitosInternacionales">
        <g:message code="valoracion.l2puestoEnCircuitosInternacionales.label"
                   default="Resultado:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:radio name="l2puestoEnCircuitosInternacionales" value="40" onchange="sumar(2);" data="suma"
             checked="${valoracionInstance?.l2puestoEnCircuitosInternacionales == 40}"/> Primer puesto (40 pts)

    <div class="fieldcontain">
        <label for="l2puestoEnCircuitosInternacionales"></label>
        <g:radio name="l2puestoEnCircuitosInternacionales" value="30" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnCircuitosInternacionales == 30}"/> Segundo puesto (30 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2puestoEnCircuitosInternacionales"></label>
        <g:radio name="l2puestoEnCircuitosInternacionales" value="25" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnCircuitosInternacionales == 25}"/> Tercer puesto (25 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2puestoEnCircuitosInternacionales"></label>
        <g:radio name="l2puestoEnCircuitosInternacionales" value="20" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnCircuitosInternacionales == 20}"/> Cuarto puesto (20 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2puestoEnCircuitosInternacionales"></label>
        <g:radio name="l2puestoEnCircuitosInternacionales" value="15" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnCircuitosInternacionales == 15}"/> Quinto puesto (15 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2puestoEnCircuitosInternacionales"></label>
        <g:radio name="l2puestoEnCircuitosInternacionales" value="10" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnCircuitosInternacionales == 10}"/> Sexto puesto (10 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2puestoEnCircuitosInternacionales"></label>
        <g:radio name="l2puestoEnCircuitosInternacionales" value="5" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnCircuitosInternacionales == 5}"/> Séptimo puesto (5 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2puestoEnCircuitosInternacionales"></label>
        <g:radio name="l2puestoEnCircuitosInternacionales" value="3" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnCircuitosInternacionales == 3}"/> Octavo puesto (3 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2puestoEnCircuitosInternacionales"></label>
        <g:radio name="l2puestoEnCircuitosInternacionales" value="2" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnCircuitosInternacionales == 2}"/> Noveno puesto (2 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2puestoEnCircuitosInternacionales"></label>
        <g:radio name="l2puestoEnCircuitosInternacionales" value="0" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnCircuitosInternacionales == 0}"/> Otro (0 pts)
    </div>
</div>
<br>

<h3>TORNEOS / OPEN ESTATALES:</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2puestoEnTorneosNacionales', 'error')} required">
    <label for="l2puestoEnTorneosNacionales">
        <g:message code="valoracion.l2puestoEnTorneosNacionales.label" default="Resultado:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:radio name="l2puestoEnTorneosNacionales" value="4" onchange="sumar(2);" data="suma"
             checked="${valoracionInstance?.l2puestoEnTorneosNacionales == 4}"/> Primer puesto (4 pts)

    <div class="fieldcontain">
        <label for="l2puestoEnTorneosNacionales"></label>
        <g:radio name="l2puestoEnTorneosNacionales" value="2" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnTorneosNacionales == 2}"/> Segundo puesto (2 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2puestoEnTorneosNacionales"></label>
        <g:radio name="l2puestoEnTorneosNacionales" value="1" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnTorneosNacionales == 1}"/> Tercer puesto (1 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2puestoEnTorneosNacionales"></label>
        <g:radio name="l2puestoEnTorneosNacionales" value="0" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnTorneosNacionales == 0}"/> Otro (0 pts)
    </div>
</div>
<br>

<h3>CIRCUITOS DE COMPETICIÓN ESTATAL:</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2puestoEnCircuitosNacionales', 'error')} required">
    <label for="l2puestoEnCircuitosNacionales">
        <g:message code="valoracion.l2puestoEnCircuitosNacionales.label" default="Resultado:"/>
    </label>
    <g:radio name="l2puestoEnCircuitosNacionales" value="20" onchange="sumar(2);" data="suma"
             checked="${valoracionInstance?.l2puestoEnCircuitosNacionales == 20}"/> Primer puesto (20 pts)

    <div class="fieldcontain">
        <label for="l2puestoEnCircuitosNacionales"></label>
        <g:radio name="l2puestoEnCircuitosNacionales" value="15" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnCircuitosNacionales == 15}"/> Segundo puesto (15 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2puestoEnCircuitosNacionales"></label>
        <g:radio name="l2puestoEnCircuitosNacionales" value="12" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnCircuitosNacionales == 12}"/> Tercer puesto (12 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2puestoEnCircuitosNacionales"></label>
        <g:radio name="l2puestoEnCircuitosNacionales" value="7" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnCircuitosNacionales == 7}"/> Cuarto puesto (7 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2puestoEnCircuitosNacionales"></label>
        <g:radio name="l2puestoEnCircuitosNacionales" value="5" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnCircuitosNacionales == 5}"/> Quinto puesto (5 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2puestoEnCircuitosNacionales"></label>
        <g:radio name="l2puestoEnCircuitosNacionales" value="10" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnCircuitosNacionales == 10}"/> Sexto puesto (10 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2puestoEnCircuitosNacionales"></label>
        <g:radio name="l2puestoEnCircuitosNacionales" value="0" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2puestoEnCircuitosNacionales == 0}"/> Otro (0 pts)
    </div>
</div>
<br>

<h3>PARTICIPACION EN TORNEOS / OPEN AUTONÓMICOS:</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2PrimerPuestoEnTorneosAutonomicos', 'error')} required">
    <label for="l2PrimerPuestoEnTorneosAutonomicos">
        <g:message code="valoracion.l2PrimerPuestoEnTorneosAutonomicos.label"
                   default="Resultado:"/>
    </label>
    <g:radio name="l2PrimerPuestoEnTorneosAutonomicos" value="3" onchange="sumar(2);" data="suma"
             checked="${valoracionInstance?.l2PrimerPuestoEnTorneosAutonomicos == 3}"/> Primer puesto (3 pts)

    <div class="fieldcontain">
        <label for="l2PrimerPuestoEnTorneosAutonomicos"></label>
        <g:radio name="l2PrimerPuestoEnTorneosAutonomicos" value="0" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2PrimerPuestoEnTorneosAutonomicos == 0}"/> Otro (0 pts)
    </div>
</div>
<br>

<h3>CAMPEONATOS DE EUSKADI:</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2campeonatosEuskadi', 'error')} required">
    <label for="l2campeonatosEuskadi">
        <g:message code="valoracion.l2campeonatosEuskadi.label" default="Resultado:"/>
    </label>
    <g:radio name="l2campeonatosEuskadi" value="10" onchange="sumar(2);" data="suma"
             checked="${valoracionInstance?.l2campeonatosEuskadi == 10}"/> Primer puesto (10 pts)

    <div class="fieldcontain">
        <label for="l2campeonatosEuskadi"></label>
        <g:radio name="l2campeonatosEuskadi" value="5" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosEuskadi == 5}"/> Segundo puesto (5 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2campeonatosEuskadi"></label>
        <g:radio name="l2campeonatosEuskadi" value="2" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosEuskadi == 2}"/> Tercer puesto (2 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2campeonatosEuskadi"></label>
        <g:radio name="l2campeonatosEuskadi" value="0" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosEuskadi == 0}"/> Otro (0 pts)
    </div>
</div>
<br>

<h3>CAMPEONATOS DE ESPAÑA:</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2campeonatosEspaña', 'error')} required">
    <label for="l2campeonatosEspaña">
        <g:message code="valoracion.l2campeonatosEspaña.label" default="Resultado:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:radio name="l2campeonatosEspaña" value="15" onchange="sumar(2);" data="suma"
             checked="${valoracionInstance?.l2campeonatosEspaña == 15}"/> Primer puesto (15 pts)

    <div class="fieldcontain">
        <label for="l2campeonatosEspaña"></label>
        <g:radio name="l2campeonatosEspaña" value="8" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosEspaña == 8}"/> Segundo puesto (8 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2campeonatosEspaña"></label>
        <g:radio name="l2campeonatosEspaña" value="5" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosEspaña == 5}"/> Tercer puesto (5 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2campeonatosEspaña"></label>
        <g:radio name="l2campeonatosEspaña" value="0" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosEspaña == 0}"/> Otro (0 pts)
    </div>
</div>
<br>

<h3>CAMPEONATOS DE EUROPA:</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2campeonatosEuropa', 'error')} required">
    <label for="l2campeonatosEuropa">
        <g:message code="valoracion.l2campeonatosEuropa.label" default="Resultado:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:radio name="l2campeonatosEuropa" value="30" onchange="sumar(2);" data="suma"
             checked="${valoracionInstance?.l2campeonatosEuropa == 30}"/> Primer puesto (30 pts)

    <div class="fieldcontain">
        <label for="l2campeonatosEuropa"></label>
        <g:radio name="l2campeonatosEuropa" value="20" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosEuropa == 20}"/> Segundo puesto (20 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2campeonatosEuropa"></label>
        <g:radio name="l2campeonatosEuropa" value="15" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosEuropa == 15}"/> Tercer puesto (15 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2campeonatosEuropa"></label>
        <g:radio name="l2campeonatosEuropa" value="10" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosEuropa == 10}"/> Cuarto puesto (10 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2campeonatosEuropa"></label>
        <g:radio name="l2campeonatosEuropa" value="5" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosEuropa == 5}"/> Quinto puesto (5 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2campeonatosEuropa"></label>
        <g:radio name="l2campeonatosEuropa" value="2" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosEuropa == 2}"/> Sexto puesto (2 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2campeonatosEuropa"></label>
        <g:radio name="l2campeonatosEuropa" value="0" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosEuropa == 0}"/> Otro (0 pts)
    </div>
</div>
<br>

<h3>CAMPEONATOS DEL MUNDO:</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2campeonatosMundo', 'error')} required">
    <label for="l2campeonatosMundo">
        <g:message code="valoracion.l2campeonatosMundo.label" default="Resultado:"/>
    </label>
    <g:radio name="l2campeonatosMundo" value="50" onchange="sumar(2);" data="suma"
             checked="${valoracionInstance?.l2campeonatosMundo == 50}"/> Primer puesto (50 pts)

    <div class="fieldcontain">
        <label for="l2campeonatosMundo"></label>
        <g:radio name="l2campeonatosMundo" value="40" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosMundo == 40}"/> Segundo puesto (40 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2campeonatosMundo"></label>
        <g:radio name="l2campeonatosMundo" value="30" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosMundo == 30}"/> Tercer puesto (30 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2campeonatosMundo"></label>
        <g:radio name="l2campeonatosMundo" value="25" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosMundo == 25}"/> Cuarto puesto (25 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2campeonatosMundo"></label>
        <g:radio name="l2campeonatosMundo" value="20" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosMundo == 20}"/> Quinto puesto (20 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2campeonatosMundo"></label>
        <g:radio name="l2campeonatosMundo" value="15" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosMundo == 15}"/> Sexto puesto (15 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2campeonatosMundo"></label>
        <g:radio name="l2campeonatosMundo" value="10" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosMundo == 10}"/> Séptimo puesto (10 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2campeonatosMundo"></label>
        <g:radio name="l2campeonatosMundo" value="7" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosMundo == 7}"/> Octavo puesto (7 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2campeonatosMundo"></label>
        <g:radio name="l2campeonatosMundo" value="5" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosMundo == 5}"/> Noveno puesto (5 pts)
    </div>

    <div class="fieldcontain">
        <label for="l2campeonatosMundo"></label>
        <g:radio name="l2campeonatosMundo" value="0" onchange="sumar(2);" data="suma"
                 checked="${valoracionInstance?.l2campeonatosMundo == 0}"/> Otro (0 pts)
    </div>
</div>
<br>

<h3>Factores de corrección:</h3>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2indiceParticipacion', 'error')} required">
    <h6>Sólo individuales</h6>
    <label for="l2indiceParticipacion">
        <g:message code="valoracion.l2indiceParticipacion.label" default="Indice de participacion:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field onchange="sumar(2);" name="l2indiceParticipacion"
             value="${fieldValue(bean: valoracionInstance, field: 'l2indiceParticipacion')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'l2indiceCorreccion', 'error')} required">
    <label for="l2indiceCorreccion">
        <g:message code="valoracion.l2indiceCorreccion.label" default="Indice de corrección:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field onchange="sumar(2);" name="l2indiceCorreccion"
             value="${fieldValue(bean: valoracionInstance, field: 'l2indiceCorreccion')}" required=""/>

</div>
%{--fin--}%
