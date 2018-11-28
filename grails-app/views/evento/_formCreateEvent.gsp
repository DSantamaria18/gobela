<%@ page import="gobela.Actividad; gobela.Modalidad; gobela.Evento" %>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'nombre', 'error')} required">
    <label for="nombre">
        <g:message code="evento.nombre.label" default="Nombre:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nombre" value="${this.evento?.nombre}" required=""/>

    <label for="estado">
        <g:message code="evento.estado.label" default="Estado:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="estado" from="${this.evento.constrainedProperties.estado.inList}" required=""
              value="${fieldValue(bean: evento, field: 'estado')}" valueMessagePrefix="evento.estado"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'relevante', 'error')}">
    <label for="relevante">
        <g:message code="evento.relevante.label" default="Evento importante:"/>
    </label>
    <g:checkBox name="relevante" value="${evento?.relevante}"/>
</div>

%{--<div class="fieldcontain ${hasErrors(bean: evento, field: 'fecha', 'error')} required">
    <label for="fecha">
        <g:message code="evento.fecha.label" default="Fecha del evento:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="fecha" precision="day" value="${this.evento?.fecha}"/>
</div>--}%

<div class="fieldcontain ${hasErrors(bean: evento, field: 'fecha', 'error')} required">
    <label for="fecha">
        <g:message code="evento.fechaInicio.label" default="Fecha del evento:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="fecha" precision="day" value="${this.evento?.fecha}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'fechaFin', 'error')} required">
    <label for="fechaFin">
        <g:message code="evento.fechaFin.label" default="Fecha Fin:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="fechaFin" precision="day" value="${this.evento?.fechaFin}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'horario', 'error')}">
    <label for="horario">
        <g:message code="evento.horario.label" default="Horario:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="horario" value="${this.evento?.horario}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'tActividad', 'error')} required">
    <label for="tActividad">
        <g:message code="evento.tActividad.label" default="Tipo de Actividad:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="tActividad"
              from="${gobela.TipoActividad.listOrderByNombre()}"
              value="${evento?.tActividad?.id}"
              noSelection="${['': 'Selecciona un tipo de actividad...']}"
              optionKey="id"
              optionValue="nombre"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'actividad', 'error')} required">
    <label for="actividad">
        <g:message code="evento.actividad.label" default="Actividad:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="actividad"
              from="${gobela.Actividad.listOrderByNombre()}"
              value="${evento?.actividad?.id}"
              noSelection="${['': 'Selecciona una actividad...']}"
              optionKey="id"
              optionValue="nombre"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'modalidad', 'error')} required">
    <label for="modalidad">
        <g:message code="evento.modalidad.label" default="Modalidad:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="modalidad"
              from="${Modalidad.listOrderByNombre()}"
              value="${evento?.modalidad?.id}"
              noSelection="${['': 'Selecciona una modalidad...']}"
              optionKey="id"
              optionValue="nombre"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'multikirola', 'error')}">
    <label for="multikirola">
        <g:message code="evento.multikirola.label" default="Multikirola:"/>
    </label>
    <g:checkBox name="multikirola" value="${evento?.multikirola}"/>

    <label for="edadMinima">Edad Mínima </label>
    <g:textField name="edadMinima" type="number" id="edadMinima" value="${this.evento?.edadMinima}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'deporteAdaptado', 'error')}">
    <label for="deporteAdaptado">
        <g:message code="evento.deporteAdaptado.label" default="Deporte Adaptado:"/>
    </label>
    <g:checkBox name="deporteAdaptado" value="${evento?.deporteAdaptado}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'deporteInclusivo', 'error')}">
    <label for="deporteInclusivo">
        <g:message code="evento.deporteInclusivo.label" default="Deporte Inclusivo:"/>
    </label>
    <g:checkBox name="deporteInclusivo" value="${evento?.deporteInclusivo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'solidario', 'error')}">
    <label for="solidario">
        <g:message code="evento.solidario.label" default="Evento solidario:"/>
    </label>
    <g:checkBox name="solidario" value="${evento?.solidario}"/>
</div>

<br/>
<hr/>
<br/>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'entidadOrganizadora', 'error')} required">
    <label for="entidadOrganizadora">
        <g:message code="evento.entidadOrganizadora.label" default="Entidad organizadora:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:set var="contactoId" value="${evento?.contacto?.id}"/>

    <g:select name="entidadOrganizadora"
              from="${gobela.Entidad.listOrderByNombreEntidad()}"
              value="${evento?.entidadOrganizadora?.id}"
              noSelection="${['': 'Selecciona la entidad organizadora...']}"
              optionKey="id"
              onchange="fillContactoByEntidad(this.value, ${contactoId}, 'true')" />
</div>

<div class="fieldcontain" ${hasErrors(bean: evento, field: 'contacto', 'error')} id="contacto-container">
    <g:render template="contacto"/>
</div>

<div class="fieldcontain" id="contactoInfo-container">
    <g:render template="contactoInfo"/>
</div>

<br/>
<hr/>
<br/>

%{--<div class="fieldcontain ${hasErrors(bean: evento, field: 'clubOrganizador', 'error')}">
    <label for="clubOrganizador">
        <g:message code="evento.clubOrganizador.label" default="Club organizador:"/>
    </label>
    --}%%{--<g:textField name="clubOrganizador" value="${this.evento?.clubOrganizador}"/>--}%%{--
    <g:select name="clubOrganizador"
              from="${gobela.Entidad.listOrderByNombreEntidad()}"
              value="${evento?.clubOrganizador}"
              noSelection="${['':'Selecciona al menos un club organozador...']}"
              multiple="true"
              optionKey="id"
              optionValue="nombreEntidad"/>
</div>--}%

<div class="fieldcontain ${hasErrors(bean: evento, field: 'ambito', 'error')} required">
    <label for="ambito">
        <g:message code="evento.ambito.label" default="Ambito:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="ambito"
              from="${this.evento.constrainedProperties.ambito.inList}"
              required=""
              value="${fieldValue(bean: evento, field: 'ambito')}"
              valueMessagePrefix="evento.ambito"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'tipoPublico', 'error')} required">
    <label for="tipoPublico">
        <g:message code="evento.tipoPublico.label" default="Tipo de público:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="tipoPublico"
              from="${this.evento.constrainedProperties.tipoPublico.inList}"
              required=""
              value="${fieldValue(bean: evento, field: 'tipoPublico')}"
              valueMessagePrefix="evento.tipoPublico"/>

    <label for="publicoDest">
        <g:message code="evento.publicoDest.label" default="Público destinatario:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="publicoDest"
              from="${this.evento.constrainedProperties.publicoDest.inList}"
              required=""
              value="${fieldValue(bean: evento, field: 'publicoDest')}"
              valueMessagePrefix="evento.publicoDest"/>
</div>

<br/>
<hr/>
<br/>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'euskeraComGK', 'error')} required">
    <label for="euskeraComGK">
        <g:message code="evento.euskeraComGK.label" default="Comunicación con GK:"/>
    </label>
    <g:select name="euskeraComGK"
              from="${this.evento.constrainedProperties.euskeraComGK.inList}"
              required=""
              value="${fieldValue(bean: evento, field: 'euskeraComGK')}"
              valueMessagePrefix="evento.euskeraComGK"/>

    <label for="euskeraDesarrollo">
        <g:message code="evento.euskeraDesarrollo.label" default="Desarrollo del Evento:"/>
    </label>
    <g:select name="euskeraDesarrollo"
              from="${this.evento.constrainedProperties.euskeraDesarrollo.inList}"
              required=""
              value="${fieldValue(bean: evento, field: 'euskeraDesarrollo')}"
              valueMessagePrefix="evento.euskeraDesarrollo"/>

    <label for="euskeraSpeaker">
        <g:message code="evento.euskeraSpeaker.label" default="Speaker:"/>
    </label>
    <g:select name="euskeraSpeaker"
              from="${this.evento.constrainedProperties.euskeraSpeaker.inList}"
              required=""
              value="${fieldValue(bean: evento, field: 'euskeraSpeaker')}"
              valueMessagePrefix="evento.euskeraSpeaker"/>
</div>


<br/>
<hr/>
<br/>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'zona', 'error')} required">
    <label for="zona">
        <g:message code="evento.zona.label" default="Zona:"/>
    </label>
    <g:set var="lugarId" value="${evento?.lugar?.id}"/>
    <g:select name="zona"
              from="${gobela.Zona.listOrderByNombre()}"
              value="${evento?.zona?.id}"
              noSelection="${['': 'Selecciona una Zona...']}"
              optionKey="id"
              optionValue="nombre"
              onchange="fillLugarByZona(this.value, ${lugarId})"/>
</div>


<div class="fieldcontain ${hasErrors(bean: evento, field: 'lugar', 'error')} required" id="lugar-container">
    <g:render template="lugar"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'recinto', 'error')} required">
    <label for="recinto">
        <g:message code="evento.recinto.label" default="Recinto:"/>
    </label>
    <g:set var="instalacionId" value="${evento?.instalacion?.id}"/>
    <g:select name="recinto"
              from="${gobela.Recinto.listOrderByNombre()}"
              value="${evento?.recinto?.id}"
              noSelection="${['': 'Selecciona un recinto...']}"
              optionKey="id"
              optionValue="nombre"
              onchange="fillInstalacionByRecinto(this.value, ${instalacionId})"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'instalacion', 'error')}" id="instalacion-container">
    <g:render template="instalacion"/>
</div>

<br/>
<hr/>
<br/>

<div class="fieldcontain" ${hasErrors(bean: evento, field: 'numParticipantes', 'error')}>
    <label for="numParticipantes">
        <g:message code="evento.numParticipantes.label" default="Número de participantes:"/>
    </label>
    <g:textField name="numParticipantes" value="${this.evento?.numParticipantes}"/>
</div>

<div class="fieldcontain" ${hasErrors(bean: evento, field: 'numParticipantesM', 'error')}>
    <label for="numParticipantesM">
        <g:message code="evento.numParticipantesM.label" default="Mujeres:"/>
    </label>
    <g:textField name="numParticipantesM" value="${this.evento?.numParticipantesM}"/>
</div>

<div class="fieldcontain" ${hasErrors(bean: evento, field: 'numParticipantesH', 'error')}>
    <label for="numParticipantesH">
        <g:message code="evento.numParticipantesH.label" default="Hombres:"/>
    </label>
    <g:textField name="numParticipantesH" value="${this.evento?.numParticipantesH}"/>
</div>

<br/>
<hr/>
<br/>

<div class="fieldcontain" ${hasErrors(bean: evento, field: 'numAsistentes', 'error')}>
    <label for="numAsistentes">
        <g:message code="evento.numAsistentes.label" default="Número de asistentes:"/>
    </label>
    <g:textField name="numAsistentes" value="${this.evento?.numParticipantes}"/>
</div>

<div class="fieldcontain" ${hasErrors(bean: evento, field: 'numVoluntarios', 'error')}>
    <label for="numVoluntarios">
        <g:message code="evento.numVoluntarios.label" default="Número de voluntarios:"/>
    </label>
    <g:textField name="numVoluntarios" value="${this.evento?.numVoluntarios}"/>
</div>

%{--
<div class="fieldcontain" ${hasErrors(bean: evento, field: 'horasMant', 'error')}>
    <label for="horasMant">
        <g:message code="evento.horasMantM.label" default="Número de mantenimiento:"/>
    </label>
    <g:textField name="horasMant" value="${this.evento?.horasMant}"/>
</div>

<div class="fieldcontain" ${hasErrors(bean: evento, field: 'horasDeptivo', 'error')}>
    <label for="horasDeptivo">
        <g:message code="evento.horasDeptivoM.label" default="Número de polideportivo:"/>
    </label>
    <g:textField name="horasDeptivo" value="${this.evento?.horasDeptivo}"/>
</div>

<div class="fieldcontain" ${hasErrors(bean: evento, field: 'horasLimpieza', 'error')}>
    <label for="horasLimpieza">
        <g:message code="evento.horasLimpiezaM.label" default="Número de limpieza:"/>
    </label>
    <g:textField name="horasLimpieza" value="${this.evento?.horasLimpieza}"/>
</div>

<div class="fieldcontain" ${hasErrors(bean: evento, field: 'costesPersonal', 'error')}>
    <label for="costesPersonal">
        <g:message code="evento.costesPersonalM.label" default="Costes de personal:"/>
    </label>
    <g:textField name="costesPersonal" value="${this.evento?.costesPersonal}"/>
</div>

<div class="fieldcontain" ${hasErrors(bean: evento, field: 'totalInversion', 'error')}>
    <label for="totalInversion">
        <g:message code="evento.totalInversionM.label" default="Total inversión:"/>
    </label>
    <g:textField name="totalInversion" value="${this.evento?.totalInversion}"/>
</div>--}%

<div class="fieldcontain ${hasErrors(bean: evento, field: 'observaciones', 'error')} ">
    <label for="observaciones">
        <g:message code="evento.observaciones.label" default="Observaciones:"/>

    </label>
    <g:textArea name="observaciones" cols="60" rows="15" maxlength="5000"
                value="${this.evento?.observaciones}"/>

</div>

<g:javascript>
        $(document).ready(function () {
            $('#ocupacion').val('100');
            $('#edadMinima').val(0);
        })
</g:javascript>