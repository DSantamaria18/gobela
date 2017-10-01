<%@ page import="gobela.Modalidad; gobela.Evento" %>

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

<div class="fieldcontain ${hasErrors(bean: evento, field: 'fecha', 'error')} required">
    <label for="fecha">
        <g:message code="evento.fecha.label" default="Fecha del evento:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="fecha" precision="day" value="${this.evento?.fecha}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'tipoActividad', 'error')} required">
    <label for="tipoActividad">
        <g:message code="evento.tipoActividad.label" default="Tipo de actividad:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="tipoActividad"
              from="${this.evento.constrainedProperties.tipoActividad.inList}"
              required=""
              value="${fieldValue(bean: evento, field: 'tipoActividad')}"
              valueMessagePrefix="evento.tipoActividad"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'modalidad', 'error')} required">
    <label for="modalidad">
        <g:message code="evento.modalidad.label" default="Modalidad:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="modalidad"
              from="${Modalidad.listOrderByNombre()}"
              value="${evento?.modalidad}"
              noSelection="${['':'Selecciona una modalidad...']}"
              optionKey="id"
              optionValue="nombre"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'multikirola', 'error')}">
    <label for="multikirola">
        <g:message code="evento.multikirola.label" default="Multikirola:"/>
    </label>
    <g:checkBox name="multikirola" value="${evento?.multikirola}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'deporteAdaptado', 'error')}">
    <label for="deporteAdaptado">
        <g:message code="evento.deporteAdaptado.label" default="Deporte Adaptado:"/>
    </label>
    <g:checkBox name="deporteAdaptado" value="${evento?.deporteAdaptado}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: evento, field: 'entidadOrganizadora', 'error')} required">
    <label for="entidadOrganizadora">
        <g:message code="evento.entidadOrganizadora.label" default="Entidad organizadora:"/>
        <span class="required-indicator">*</span>
    </label>

    <g:select name="entidadOrganizadora"
              from="${gobela.Entidad.listOrderByNombreEntidad()}"
              value="${evento?.entidadOrganizadora}"
              noSelection="${['':'Selecciona la entidad organizadora...']}"
              optionKey="id"
              optionValue="nombreEntidad"/>
</div>

<div class="fieldcontain" ${hasErrors(bean: evento, field: 'contacto', 'error')}>
    <label for="contacto">
        <g:message code="evento.contacto.label" default="Contacto:"/>
    </label>
    <g:textField name="contacto" value="${this.evento?.contacto}"/>
</div>

<div class="fieldcontain" ${hasErrors(bean: evento, field: 'telefonoContacto', 'error')}>
    <label for="telefonoContacto">
        <g:message code="evento.telefonoContacto.label" default="Teléfono Contacto:"/>
    </label>
    <g:textField name="telefonoContacto" value="${this.evento?.telefonoContacto}"/>
</div>

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

<div class="fieldcontain ${hasErrors(bean: evento, field: 'lugar', 'error')} required">
<label for="lugar">
    <g:message code="evento.lugar.label" default="Lugar:"/>
</label>

<g:select name="lugar"
          from="${gobela.Lugar.listOrderByNombreLugar()}"
          value="${evento?.lugar}"
          noSelection="${['':'Selecciona un lugar...']}"
          optionKey="id"
          optionValue="nombreLugar"/>
</div>


%{--<div class="fieldcontain ${hasErrors(bean: evento, field: 'recinto', 'error')} required">
    <label for="recinto">
        <g:message code="evento.recinto.label" default="Recinto:"/>
    </label>

    <g:select name="recinto"
              from="${gobela.Recinto.listOrderByNombre()}"
              value="${evento?.recinto}"
              noSelection="${['':'Selecciona un recinto...']}"
              optionKey="id"
              optionValue="nombre"/>
</div>--}%

<div class="fieldcontain ${hasErrors(bean: evento, field: 'entidadColaboradora', 'error')} required">
    <label for="entidadColaboradora">
        <g:message code="evento.entidadColaboradora.label" default="Entidad colaboradora:"/>
        <span class="required-indicator">*</span>
    </label>

    <g:select name="entidadColaboradora"
              from="${gobela.Entidad.listOrderByNombreEntidad()}"
              value="${evento?.entidadColaboradora}"
              noSelection="${['':'Selecciona una entidad colaboradora...']}"
              optionKey="id"
              optionValue="nombreEntidad"/>
</div>

<div class="fieldcontain" ${hasErrors(bean: evento, field: 'numParticipantes', 'error')}>
    <label for="numParticipantes">
        <g:message code="evento.numParticipantesM.label" default="Número de participantes:"/>
    </label>
    <g:textField name="numParticipantes" value="${this.evento?.numParticipantes}"/>
    %{--</div>--}%

    %{--<div class="fieldcontain" ${hasErrors(bean: evento, field: 'numParticipantesM', 'error')}>--}%
    <label for="numParticipantesM">
        <g:message code="evento.numParticipantesM.label" default="Mujeres:"/>
    </label>
    <g:textField name="numParticipantesM" value="${this.evento?.numParticipantesM}"/>
    %{--</div>--}%

    %{--<div class="fieldcontain" ${hasErrors(bean: evento, field: 'numParticipantesH', 'error')}>--}%
    <label for="numParticipantesH">
        <g:message code="evento.numParticipantesH.label" default="Hombres:"/>
    </label>
    <g:textField name="numParticipantesH" value="${this.evento?.numParticipantesH}"/>
</div>

<div class="fieldcontain" ${hasErrors(bean: evento, field: 'numAsistentes', 'error')}>
    <label for="numAsistentes">
        <g:message code="evento.numAsistentesM.label" default="Número de asistentes:"/>
    </label>
    <g:textField name="numAsistentes" value="${this.evento?.numParticipantes}"/>
</div>

<div class="fieldcontain" ${hasErrors(bean: evento, field: 'numVoluntarios', 'error')}>
    <label for="numVoluntarios">
        <g:message code="evento.numVoluntariosM.label" default="Número de voluntarios:"/>
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
    <g:textArea name="observaciones" cols="60" rows="15" maxlength="2000"
                value="${this.evento?.observaciones}"/>

</div>
