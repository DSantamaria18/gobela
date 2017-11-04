<%@ page import="gobela.Solicitud" %>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'codigo', 'error')} required">
    <label for="codigo">
        <g:message code="solicitud.codigo.label" default="Número de registro:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="codigo" required="" value="${solicitud?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'descSolicitud', 'error')} required">
    <label for="descSolicitud">
        <g:message code="solicitud.descSolicitud.label" default="Descripción:"/>
    </label>
    <g:textField name="descSolicitud" value="${solicitud?.descSolicitud}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'nombreSolicitante', 'error')} required">
    <label for="nombreSolicitante">
        <g:message code="solicitud.nombreSolicitante.label" default="Nombre solicitante:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nombreSolicitante" required="" value="${solicitud?.nombreSolicitante}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'solicitanteId', 'error')} required">
    <label for="solicitanteId">
        <g:message code="solicitud.solicitanteId.label" default="Solicitante Id:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="solicitanteId" required="" value="${solicitud?.solicitanteId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'municipioSolicitante', 'error')} required">
    <label for="municipioSolicitante">
        <g:message code="solicitud.municipioSolicitante.label" default="Municipio solicitante:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="municipioSolicitante" required="" value="${solicitud?.municipioSolicitante}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'cpSolicitante', 'error')} required">
    <label for="cpSolicitante">
        <g:message code="solicitud.cpSolicitante.label" default="CP Solicitante:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="cpSolicitante" type="number" value="${solicitud.cpSolicitante}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'emailSolicitante', 'error')} required">
    <label for="emailSolicitante">
        <g:message code="solicitud.emailSolicitante.label" default="Email solicitante:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="email" name="emailSolicitante" required="" value="${solicitud?.emailSolicitante}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'direccionSolicitante', 'error')} required">
    <label for="direccionSolicitante">
        <g:message code="solicitud.direccionSolicitante.label" default="Direccion solicitante:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="direccionSolicitante" required="" value="${solicitud?.direccionSolicitante}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'telefonoSolicitante1', 'error')} required">
    <label for="telefonoSolicitante1">
        <g:message code="solicitud.telefonoSolicitante1.label" default="Teléfono:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="telefonoSolicitante1" required="" value="${solicitud?.telefonoSolicitante1}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'telefonoSolicitante2', 'error')} ">
    <label for="telefonoSolicitante2">
        <g:message code="solicitud.telefonoSolicitante2.label" default="Teléfono 2:"/>

    </label>
    <g:textField name="telefonoSolicitante2" value="${solicitud?.telefonoSolicitante2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'representante', 'error')} ">
    <label for="representante">
        <g:message code="solicitud.representante.label" default="Representa a una entidad:"/>

    </label>
    <g:checkBox name="representante" value="${solicitud?.representante}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'nombreEntidad', 'error')} ">
    <label for="nombreEntidad">
        <g:message code="solicitud.nombreEntidad.label" default="Nombre entidad:"/>

    </label>
    <g:textField name="nombreEntidad" value="${solicitud?.nombreEntidad}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'entidadId', 'error')} ">
    <label for="entidadId">
        <g:message code="solicitud.entidadId.label" default="Entidad Id:"/>

    </label>
    <g:textField name="entidadId" value="${solicitud?.entidadId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'direccionEntidad', 'error')} ">
    <label for="direccionEntidad">
        <g:message code="solicitud.direccionEntidad.label" default="Dirección entidad:"/>

    </label>
    <g:textField name="direccionEntidad" value="${solicitud?.direccionEntidad}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'municipioEntidad', 'error')} ">
    <label for="municipioEntidad">
        <g:message code="solicitud.municipioEntidad.label" default="Municipio entidad:"/>

    </label>
    <g:textField name="municipioEntidad" value="${solicitud?.municipioEntidad}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'cpEntidad', 'error')} ">
    <label for="cpEntidad">
        <g:message code="solicitud.cpEntidad.label" default="CP Entidad:"/>

    </label>
    <g:field name="cpEntidad" type="number" value="${solicitud.cpEntidad}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'emailEntidad', 'error')} ">
    <label for="emailEntidad">
        <g:message code="solicitud.emailEntidad.label" default="Email entidad:"/>

    </label>
    <g:field type="email" name="emailEntidad" value="${solicitud?.emailEntidad}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'telefonoEntidad1', 'error')} ">
    <label for="telefonoEntidad1">
        <g:message code="solicitud.telefonoEntidad1.label" default="Teléfono 1:"/>

    </label>
    <g:field name="telefonoEntidad1" type="number" value="${solicitud.telefonoEntidad1}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'telefonoEntidad2', 'error')} ">
    <label for="telefonoEntidad2">
        <g:message code="solicitud.telefonoEntidad2.label" default="Teléfono 2:"/>

    </label>
    <g:field name="telefonoEntidad2" type="number" value="${solicitud.telefonoEntidad2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'representanteLegal', 'error')} ">
    <label for="representanteLegal">
        <g:message code="solicitud.representanteLegal.label" default="Representante legal:"/>

    </label>
    <g:textField name="representanteLegal" value="${solicitud?.representanteLegal}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'tipoSolicitud', 'error')} required">
    <label for="tipoSolicitud">
        <g:message code="solicitud.tipoSolicitud.label" default="Tipo de solicitud:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="tipoSolicitud" from="${solicitud.constrainedProperties.tipoSolicitud.inList}" required=""
              value="${solicitud?.tipoSolicitud}" valueMessagePrefix="solicitud.tipoSolicitud"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'linea', 'error')} required">
    <label for="linea">
        <g:message code="solicitud.linea.label" default="Línea:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="linea" from="${solicitud.constrainedProperties.linea.inList}" required=""
              value="${fieldValue(bean: solicitud, field: 'linea')}" valueMessagePrefix="solicitud.linea"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'nombreEvento', 'error')} required">
    <label for="nombreEvento">
        <g:message code="solicitud.nombreEvento.label" default="Nombre Evento:"/>
    </label>
    <g:textField name="nombreEvento" value="${solicitud?.nombreEvento}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'importeSolicitado', 'error')} required">
    <label for="importeSolicitado">
        <g:message code="solicitud.importeSolicitado.label" default="Importe solicitado:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="importeSolicitado" value="${fieldValue(bean: solicitud, field: 'importeSolicitado')}"
             required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'numCuenta', 'error')} ">
    <label for="numCuenta">
        <g:message code="solicitud.numCuenta.label" default="Número de cuenta:"/>

    </label>
    <g:textField name="numCuenta" value="${solicitud?.numCuenta}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'importeSolicitadoOtros', 'error')} ">
    <label for="importeSolicitadoOtros">
        <g:message code="solicitud.importeSolicitadoOtros.label" default="Importe solicitado a otros organismos:"/>

    </label>
    <g:field name="importeSolicitadoOtros"
             value="${fieldValue(bean: solicitud, field: 'importeSolicitadoOtros')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'importeRecibidoOtros', 'error')} ">
    <label for="importeRecibidoOtros">
        <g:message code="solicitud.importeRecibidoOtros.label" default="Importe recibido de otros organismos:"/>

    </label>
    <g:field name="importeRecibidoOtros" value="${fieldValue(bean: solicitud, field: 'importeRecibidoOtros')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'fechaSolicitud', 'error')} required">
    <label for="fechaSolicitud">
        <g:message code="solicitud.fechaSolicitud.label" default="Fecha de solicitud:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="fechaSolicitud" precision="day" value="${solicitud?.fechaSolicitud}"/>

</div>

%{--<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'balance', 'error')} ">
    <label for="balance">
        <g:message code="solicitud.balance.label" default="Balance"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${solicitud?.balance ?}" var="b">
            <li><g:link controller="balance" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="balance" action="create"
                    params="['solicitud.id': solicitud?.id]">${message(code: 'default.add.label', args: [message(code: 'balance.label', default: 'Balance')])}</g:link>
        </li>
    </ul>

</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'justificacion', 'error')} ">
    <label for="justificacion">
        <g:message code="solicitud.justificacion.label" default="Justificacion"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${solicitud?.justificacion ?}" var="j">
            <li><g:link controller="justificacion" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="justificacion" action="create"
                    params="['solicitud.id': solicitud?.id]">${message(code: 'default.add.label', args: [message(code: 'justificacion.label', default: 'Justificacion')])}</g:link>
        </li>
    </ul>

</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'memoria', 'error')} ">
    <label for="memoria">
        <g:message code="solicitud.memoria.label" default="Memoria"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${solicitud?.memoria ?}" var="m">
            <li><g:link controller="memoria" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="memoria" action="create"
                    params="['solicitud.id': solicitud?.id]">${message(code: 'default.add.label', args: [message(code: 'memoria.label', default: 'Memoria')])}</g:link>
        </li>
    </ul>

</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: solicitud, field: 'valoracion', 'error')} ">
    <label for="valoracion">
        <g:message code="solicitud.valoracion.label" default="Valoracion"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${solicitud?.valoracion ?}" var="v">
            <li><g:link controller="valoracion" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="valoracion" action="create"
                    params="['solicitud.id': solicitud?.id]">${message(code: 'default.add.label', args: [message(code: 'valoracion.label', default: 'Valoracion')])}</g:link>
        </li>
    </ul>

</div>--}%