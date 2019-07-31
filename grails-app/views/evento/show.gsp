<%@ page import="gobela.Modalidad" %>
<%@ page import="gobela.SolicitudMaterial" %>
<%@ page import="gobela.Material" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-evento" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MANAGER, ROLE_USER'>
            <li><g:link class="create"
                        action="clone"
                        params="['nombre'               : evento?.nombre
                                 , 'horario'            : evento?.horario
                                 , 'relevante'          : evento?.relevante
                                 , 'tActividad'         : evento?.tActividad?.id
                                 , 'actividad'          : evento?.actividad?.id
                                 , 'modalidad'          : evento?.modalidad?.id
                                 , 'multikirola'        : evento?.multikirola
                                 , 'deporteAdaptado'    : evento?.deporteAdaptado
                                 , 'deporteInclusivo'   : evento?.deporteInclusivo
                                 , 'solidario'          : evento?.solidario
                                 , 'entidadOrganizadora': evento?.entidadOrganizadora?.id
                                 , 'contacto'           : evento?.contacto?.id
                                 , 'emailContacto'      : evento?.emailContacto
                                 , 'telefonoContacto'   : evento?.telefonoContacto
                                 , 'clubOrganizador'    : evento?.clubOrganizador?.id
                                 , 'ambito'             : evento?.ambito
                                 , 'tipoPublico'        : evento?.tipoPublico
                                 , 'publicoDest'        : evento?.publicoDest
                                 , 'euskeraComGK'       : evento?.euskeraComGK
                                 , 'euskeraDesarrollo'  : evento?.euskeraDesarrollo
                                 , 'euskeraSpeaker'     : evento?.euskeraSpeaker
                                 , 'lugar'              : evento?.lugar?.id
                                 , 'zona'               : evento?.zona?.id
                                 , 'recinto'            : evento?.recinto?.id
                                 , 'instalacion'        : evento?.instalacion?.id
                                 , 'ocupacion'          : evento?.ocupacion
                                 , 'entidadColaboradora': evento?.entidadColaboradora?.id]">
                <g:message code="default.clone.label" args="[entityName]"/></g:link></li>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MANAGER, ROLE_USER'>
            <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                                  args="[entityName]"/></g:link></li>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MANAGER, ROLE_USER'>
            <li><g:link class="create" controller="solicitudMaterial" action="create"
                        params="['eventoId'  : evento.id
                                 , 'fecha'   : evento?.fecha
                                 , 'fechaFin': evento?.fechaFin]">Solicitar Material</g:link></li>
        </sec:ifAnyGranted>
        <li><g:link class="create" action="listFiles"
                    params="['eventoId': evento.id]">Ficheros</g:link></li>
    </ul>
</div>

<div id="show-evento" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <ol class="property-list evento">
        <g:if test="${evento?.id}">
            <li class="fieldcontain">
                <span id="codigo-label" class="property-label"><g:message code="evento.codigo.label"
                                                                          default="Número de evento:"/></span>
                <span class="property-value" aria-labelledby="codigo-label"><g:fieldValue
                        bean="${evento}"
                        field="id"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.nombre}">
            <li class="fieldcontain">

                <span id="nombre-label" class="property-label"><g:message code="evento.nombre.label"
                                                                          default="Nombre del evento:"/></span>
                <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue
                        bean="${evento}"
                        field="nombre"/></span>

                <span id="estado-label" class="property-label"><g:message code="evento.estado.label"
                                                                          default="Estado:"/></span>
                <span class="property-value" aria-labelledby="estado-label"><g:fieldValue
                        bean="${evento}"
                        field="estado"/></span>

            </li>
        </g:if>

        <g:if test="${evento?.fecha}">
            <li class="fieldcontain">
                <span id="fecha-label" class="property-label"><g:message
                        code="evento.fechaInicio.label"
                        default="Fecha del evento:"/></span>

                <span class="property-value" aria-labelledby="fecha-label"><g:formatDate format="dd-MM-yyyy"
                                                                                         date="${evento?.fecha}"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.fechaFin}">
            <li class="fieldcontain">
                <span id="fechaFin-label" class="property-label"><g:message
                        code="evento.fechaFin.label"
                        default="Fecha Fin:"/></span>

                <span class="property-value" aria-labelledby="fecha-label"><g:formatDate format="dd-MM-yyyy"
                                                                                         date="${evento?.fechaFin}"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.horario}">
            <li class="fieldcontain">

                <span id="horario-label" class="property-label"><g:message code="evento.horario.label"
                                                                           default="Horario:"/></span>
                <span class="property-value" aria-labelledby="horario-label"><g:fieldValue
                        bean="${evento}"
                        field="horario"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.relevante}">
            <li class="fieldcontain">
                <span id="relevante-label" class="property-label"><g:message
                        code="evento.relevante.label"
                        default="Evento importante:"/></span>
                <span class="property-value" aria-labelledby="relevante-label"><g:formatBoolean
                        boolean="${evento?.relevante}"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.tActividad}">
            <li class="fieldcontain">
                <span id="tActividad-label" class="property-label">
                    <g:message code="evento.tActividad.label"
                               default="Tipo de Actividad:"/>
                </span>
                <span class="property-value" aria-labelledby="tActividad-label">
                    <g:fieldValue bean="${evento?.tActividad}"
                                  field="nombre"/>
                </span>
            </li>
        </g:if>

        <g:if test="${evento?.actividad}">
            <li class="fieldcontain">
                <span id="actividad-label" class="property-label">
                    <g:message code="evento.actividad.label"
                               default="Actividad:"/>
                </span>
                <span class="property-value" aria-labelledby="actividad-label">
                    <g:fieldValue bean="${evento.actividad}"
                                  field="nombre"/>
                </span>
            </li>
        </g:if>

        <g:if test="${evento?.modalidad}">
            <li class="fieldcontain">
                <span id="modalidad-label" class="property-label">
                    <g:message code="evento.modalidad.label"
                               default="Modalidad:"/>
                </span>
                <span class="property-value" aria-labelledby="modalidad-label">
                    <g:fieldValue bean="${evento.modalidad}"
                                  field="nombre"/>
                </span>
            </li>
        </g:if>

        <g:if test="${evento?.multikirola}">
            <li class="fieldcontain">
                <span id="multikirola-label" class="property-label"><g:message
                        code="evento.multikirola.label"
                        default="Multikirola:"/></span>
                <span class="property-value" aria-labelledby="multikirola-label"><g:formatBoolean
                        boolean="${evento?.multikirola}"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.edadMinima}">
            <li class="fieldcontain">
                <span id="edadMinima-label" class="property-label"><g:message
                        code="evento.edadMinima.label"
                        default="Edad Mínima:"/></span>
                <span class="property-value" aria-labelledby="edadMinima-label"><g:fieldValue
                        bean="${evento}"
                        field="edadMinima"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.deporteAdaptado}">
            <li class="fieldcontain">
                <span id="deporteAdaptado-label" class="property-label"><g:message
                        code="evento.deporteAdaptado.label"
                        default="Deporte adaptado:"/></span>
                <span class="property-value" aria-labelledby="deporteAdaptado-label"><g:formatBoolean
                        boolean="${evento?.deporteAdaptado}"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.deporteInclusivo}">
            <li class="fieldcontain">
                <span id="deporteInclusivo-label" class="property-label"><g:message
                        code="evento.deporteInclusivo.label"
                        default="Deporte Inclusivo:"/></span>
                <span class="property-value" aria-labelledby="deporteInclusivo-label"><g:formatBoolean
                        boolean="${evento?.deporteInclusivo}"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.solidario}">
            <li class="fieldcontain">
                <span id="solidario-label" class="property-label"><g:message
                        code="evento.solidario.label"
                        default="Evento Solidario:"/></span>
                <span class="property-value" aria-labelledby="solidario-label"><g:formatBoolean
                        boolean="${evento?.solidario}"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.entidadOrganizadora}">
            <li class="fieldcontain">
                <span id="entidadOrganizadora-label" class="property-label"><g:message
                        code="evento.entidadOrganizadora.label"
                        default="Entidad organizadora:"/></span>

                <span class="property-value" aria-labelledby="entidadOrganizadora-label">
                    <g:fieldValue bean="${evento.entidadOrganizadora}"
                                  field="nombreEntidad"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.contacto}">
            <li class="fieldcontain">
                <span id="contacto-label" class="property-label"><g:message code="evento.contacto.label"
                                                                            default="Contacto:"/></span>
                <span class="property-value" aria-labelledby="contacto-label"><g:fieldValue
                        bean="${evento}"
                        field="contacto"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.emailContacto}">
            <li class="fieldcontain">
                <span id="emailContacto-label" class="property-label"><g:message code="evento.emailContacto.label"
                                                                                 default="Email Contacto:"/></span>
                <span class="property-value" aria-labelledby="emailContacto-label"><g:fieldValue
                        bean="${evento}"
                        field="emailContacto"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.telefonoContacto}">
            <li class="fieldcontain">
                <span id="telefonoContacto-label" class="property-label"><g:message code="evento.telefonoContacto.label"
                                                                                    default="Teléfono Contacto:"/></span>
                <span class="property-value" aria-labelledby="telefonoContacto-label"><g:fieldValue
                        bean="${evento}"
                        field="telefonoContacto"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.clubOrganizador}">
            <li class="fieldcontain">
                <span id="clubOrganizador-label" class="property-label">
                    <g:message code="evento.clubOrganizador.label"
                               default="Club organizador:"/>
                </span>
                <span class="property-value" aria-labelledby="clubOrganizador-label">
                    <g:fieldValue bean="${evento.clubOrganizador}"
                                  field="nombreEntidad"/>
                </span>
            </li>
        </g:if>

        <g:if test="${evento?.ambito}">
            <li class="fieldcontain">
                <span id="Ambito-label" class="property-label"><g:message
                        code="evento.ambito.label"
                        default="Ambito:"/></span>

                <span class="property-value" aria-labelledby="Ambito-label"><g:fieldValue
                        bean="${evento}"
                        field="ambito"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.tipoPublico}">
            <li class="fieldcontain">
                <span id="Ambito-label" class="property-label"><g:message
                        code="evento.tipoPublico.label"
                        default="Tipo de público:"/></span>

                <span class="property-value" aria-labelledby="Ambito-label"><g:fieldValue
                        bean="${evento}"
                        field="tipoPublico"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.publicoDest}">
            <li class="fieldcontain">
                <span id="Ambito-label" class="property-label"><g:message
                        code="evento.publicoDest.label"
                        default="Público Destinatario:"/></span>

                <span class="property-value" aria-labelledby="Ambito-label"><g:fieldValue
                        bean="${evento}"
                        field="publicoDest"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.euskeraComGK}">
            <li class="fieldcontain">
                <span id="euskeraComGK-label" class="property-label"><g:message
                        code="evento.euskeraComGK.label"
                        default="Comunicación con GK:"/></span>

                <span class="property-value" aria-labelledby="euskeraComGK-label"><g:fieldValue
                        bean="${evento}"
                        field="euskeraComGK"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.euskeraDesarrollo}">
            <li class="fieldcontain">
                <span id="euskeraDesarrollo-label" class="property-label"><g:message
                        code="evento.euskeraDesarrollo.label"
                        default="Desarrollo del Evento:"/></span>

                <span class="property-value" aria-labelledby="euskeraDesarrollo-label"><g:fieldValue
                        bean="${evento}"
                        field="euskeraDesarrollo"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.euskeraSpeaker}">
            <li class="fieldcontain">
                <span id="euskeraSpeaker-label" class="property-label"><g:message
                        code="evento.euskeraSpeaker.label"
                        default="Speaker:"/></span>

                <span class="property-value" aria-labelledby="euskeraSpeaker-label"><g:fieldValue
                        bean="${evento}"
                        field="euskeraSpeaker"/></span>
            </li>
        </g:if>

        <g:if test="${evento?.zona}">
            <li class="fieldcontain">
                <span id="zona-label" class="property-label">
                    <g:message code="evento.zona.label"
                               default="Zona:"/>
                </span>
                <span class="property-value" aria-labelledby="zona-label">
                    <g:fieldValue bean="${evento.zona}"
                                  field="nombre"/>
                </span>
            </li>
        </g:if>

        <g:if test="${evento?.lugar}">
            <li class="fieldcontain">
                <span id="lugar-label" class="property-label">
                    <g:message code="evento.lugar.label"
                               default="Lugar:"/>
                </span>
                <span class="property-value" aria-labelledby="lugar-label">
                    <g:fieldValue bean="${evento.lugar}"
                                  field="nombreLugar"/>
                </span>
            </li>
        </g:if>

        <g:if test="${evento?.recinto}">
            <li class="fieldcontain">
                <span id="recinto-label" class="property-label">
                    <g:message code="evento.recinto.label"
                               default="Recinto:"/>
                </span>
                <span class="property-value" aria-labelledby="recinto-label">
                    <g:fieldValue bean="${evento.recinto}"
                                  field="nombre"/>
                </span>
            </li>
        </g:if>

        <g:if test="${evento?.instalacion}">
            <li class="fieldcontain">
                <span id="instalacion-label" class="property-label">
                    <g:message code="evento.instalacion.label"
                               default="Instalación:"/>
                </span>
                <span class="property-value" aria-labelledby="instalacion-label">
                    <g:fieldValue bean="${evento.instalacion}"
                                  field="nombreInstalacion"/>
                </span>
            </li>
        </g:if>

        <g:if test="${evento?.entidadColaboradora}">
            <li class="fieldcontain">
                <span id="entidadColaboradora-label" class="property-label">
                    <g:message code="evento.entidadColaboradora.label"
                               default="Entidad colaboradora:"/>
                </span>
                <span class="property-value" aria-labelledby="entidadColaboradora-label">
                    <g:fieldValue bean="${evento.entidadColaboradora}"
                                  field="nombreEntidad"/>
                </span>
            </li>
        </g:if>

        <g:if test="${evento?.numParticipantes}">
            <li class="fieldcontain">
                <span id="numParticipantes-label" class="property-label">
                    <g:message code="evento.numParticipantes.label"
                               default="Número de participantes:"/>
                </span>
                <span class="property-value" aria-labelledby="numParticipantes-label">
                    <g:fieldValue bean="${evento}"
                                  field="numParticipantes"/>
                </span>
            </li>
        </g:if>

        <g:if test="${evento?.numParticipantesM}">
            <li class="fieldcontain">
                <span id="numParticipantesM-label" class="property-label">
                    <g:message code="evento.numParticipantesM.label"
                               default="Número de mujeres participantes:"/>
                </span>
                <span class="property-value" aria-labelledby="numParticipantesM-label">
                    <g:fieldValue bean="${evento}"
                                  field="numParticipantesM"/>
                </span>
            </li>
        </g:if>

        <g:if test="${evento?.numParticipantesH}">
            <li class="fieldcontain">
                <span id="numParticipantesH-label" class="property-label">
                    <g:message code="evento.numParticipantesH.label"
                               default="Número de hombres participantes:"/>
                </span>
                <span class="property-value" aria-labelledby="numParticipantesH-label">
                    <g:fieldValue bean="${evento}"
                                  field="numParticipantesH"/>
                </span>
            </li>
        </g:if>

        <g:if test="${evento?.numAsistentes}">
            <li class="fieldcontain">
                <span id="numAsistentes-label" class="property-label">
                    <g:message code="evento.numAsistentes.label"
                               default="Número de asistentes:"/>
                </span>
                <span class="property-value" aria-labelledby="numAsistentes-label">
                    <g:fieldValue bean="${evento}"
                                  field="numAsistentes"/>
                </span>
            </li>
        </g:if>

        <g:if test="${evento?.numVoluntarios}">
            <li class="fieldcontain">
                <span id="numVoluntarios-label" class="property-label">
                    <g:message code="evento.numVoluntarios.label"
                               default="Número de voluntarios:"/>
                </span>
                <span class="property-value" aria-labelledby="numVoluntarios-label">
                    <g:fieldValue bean="${evento}"
                                  field="numVoluntarios"/>
                </span>
            </li>
        </g:if>

        <g:if test="${evento?.observaciones}">
            <li class="fieldcontain">
                <span id="observaciones-label" class="property-label">
                    <g:message code="evento.observaciones.label"
                               default="Observaciones:"/>
                </span>
                <span class="property-value" aria-labelledby="observaciones-label">
                    <g:fieldValue bean="${evento}"
                                  field="observaciones"/>
                </span>
            </li>
        </g:if>

        <g:if test="${evento?.solicitudesMaterial}">
            <li class="fieldcontain">
                <div class="table-responsive tabla-material">
                    <table>
                        <thead>
                        <tr>
                            <g:sortableColumn property="Solicitud"
                                              title="${message(code: 'solicitudMaterial.solicitud.label', default: 'Solicitud')}"/>
                            <g:sortableColumn property="material"
                                              title="${message(code: 'solicitudMaterial.material.label', default: 'Material')}"/>
                            <g:sortableColumn property="Cantidad"
                                              title="${message(code: 'solicitudMaterial.cantidad.label', default: 'Cantidad')}"/>
                            <g:sortableColumn property="fechaEntrega"
                                              title="${message(code: 'solicitudMaterial.entrega.label', default: 'F. Entrega')}"/>
                            <g:sortableColumn property="lugarEntrega"
                                              title="${message(code: 'solicitudMaterial.lugarEntrega.label', default: 'Lugar Entrega')}"/>
                            <g:sortableColumn property="fechaDevolucion"
                                              title="${message(code: 'solicitudMaterial.recogida.label', default: 'F.Recogida')}"/>
                            <g:sortableColumn property="lugarDevolucion"
                                              title="${message(code: 'solicitudMaterial.lugarDevolucion.label', default: 'Lugar Recogida')}"/>
                            <g:sortableColumn property="comentarios"
                                              title="${message(code: 'solicitudMaterial.comentarios.label', default: 'Comentarios')}"/>
                            <g:sortableColumn property="observaciones"
                                              title="${message(code: 'solicitudMaterial.observaciones.label', default: 'Observaciones')}"/>
                        </tr>
                        </thead>
                        <tbody id="lista-material">
                        <g:each in="${SolicitudMaterial.findAllByEvento(this.evento)}" var="solicitudMaterial"
                                status="i">
                            <tr rowId="${i}">
                                <td>
                                    <g:link controller="solicitudMaterial" action="show" id="${solicitudMaterial.id}">
                                        ${fieldValue(bean: solicitudMaterial, field: "id")}
                                    </g:link>
                                </td>
                                <td>${fieldValue(bean: solicitudMaterial, field: "material")}</td>
                                <td>${fieldValue(bean: solicitudMaterial, field: "cantidad")}</td>
                                <td><g:formatDate date="${solicitudMaterial.fechaEntrega}" format="dd-MM-yyyy"/></td>
                                <td>${fieldValue(bean: solicitudMaterial, field: "lugarEntrega")}</td>
                                <td><g:formatDate date="${solicitudMaterial.fechaDevolucion}" format="dd-MM-yyyy"/></td>
                                <td>${fieldValue(bean: solicitudMaterial, field: "lugarDevolucion")}</td>
                                <td>${fieldValue(bean: solicitudMaterial, field: "comentarios")}</td>
                                <td>${fieldValue(bean: solicitudMaterial, field: "observaciones")}</td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </li>
        </g:if>

    </ol>

    <g:form resource="${this.evento}" method="DELETE">
        <fieldset class="buttons">
            <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MANAGER, ROLE_USER'>
            <g:link class="edit" action="edit" resource="${this.evento}"><g:message code="default.button.edit.label"
                                                                                    default="Edit"/></g:link>
            </sec:ifAnyGranted>
            <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MANAGER, ROLE_USER'>
                <input class="delete" type="submit"
                       value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                       onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </sec:ifAnyGranted>
        </fieldset>
    </g:form>
</div>
</body>
</html>
