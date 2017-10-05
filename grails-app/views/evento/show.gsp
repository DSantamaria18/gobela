<%@ page import="gobela.Modalidad" %>
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
        <li><g:link class="create"
                    action="clone"
                    params="['nombre'               : evento?.nombre
                             , 'relevante'          : evento?.relevante
                             , 'tipoActividad'      : evento?.tipoActividad
                             , 'modalidad'          : evento?.modalidad?.id
                             , 'multikirola'        : evento?.multikirola
                             , 'deporteAdaptado'    : evento?.deporteAdaptado
                             , 'solidario'          : evento?.solidario
                             , 'entidadOrganizadora': evento?.entidadOrganizadora?.id
                             , 'contacto'           : evento?.contacto
                             , 'telefonoContacto'   : evento?.telefonoContacto
                             , 'clubOrganizador'    : evento?.clubOrganizador?.id
                             , 'ambito'             : evento?.ambito
                             , 'tipoPublico'        : evento?.tipoPublico
                             , 'lugar'              : evento?.lugar?.id
                             , 'recinto'            : evento?.recinto?.id
                             , 'entidadColaboradora': evento?.entidadColaboradora?.id]">
            <g:message code="default.clone.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
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
                        code="evento.fecha.label"
                        default="Fecha del evento:"/></span>

                <span class="property-value" aria-labelledby="fecha-label"><g:formatDate format="dd-MM-yyyy"
                                                                                         date="${evento?.fecha}"/></span>
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

        <g:if test="${evento?.tipoActividad}">
            <li class="fieldcontain">
                <span id="tipoActividad-label" class="property-label"><g:message
                        code="evento.tipoActividad.label"
                        default="Tipo de actividad:"/></span>

                <span class="property-value" aria-labelledby="tipoActividad-label"><g:fieldValue
                        bean="${evento}"
                        field="tipoActividad"/></span>
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

        <g:if test="${evento?.deporteAdaptado}">
            <li class="fieldcontain">
                <span id="deporteAdaptado-label" class="property-label"><g:message
                        code="evento.deporteAdaptado.label"
                        default="Deporte adaptado:"/></span>
                <span class="property-value" aria-labelledby="deporteAdaptado-label"><g:formatBoolean
                        boolean="${evento?.deporteAdaptado}"/></span>
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

    %{--<g:if test="${evento?.horasMant}">
        <li class="fieldcontain">
            <span id="horasMant-label" class="property-label">
                <g:message code="evento.horasMant.label"
                           default="Horas de mantenimiento:"/>
            </span>
            <span class="property-value" aria-labelledby="horasMant-label">
                <g:fieldValue bean="${evento}"
                              field="horasMant"/>
            </span>
        </li>
    </g:if>

    <g:if test="${evento?.horasDeptivo}">
        <li class="fieldcontain">
            <span id="horasDeptivo-label" class="property-label">
                <g:message code="evento.horasDeptivo.label"
                           default="Horas de uso de polideportivo:"/>
            </span>
            <span class="property-value" aria-labelledby="horasDeptivo-label">
                <g:fieldValue bean="${evento}"
                              field="horasDeptivo"/>
            </span>
        </li>
    </g:if>

    <g:if test="${evento?.horasLimpieza}">
        <li class="fieldcontain">
            <span id="horasLimpieza-label" class="property-label">
                <g:message code="evento.horasLimpieza.label"
                           default="Horas de limpieza:"/>
            </span>
            <span class="property-value" aria-labelledby="horasLimpieza-label">
                <g:fieldValue bean="${evento}"
                              field="horasLimpieza"/>
            </span>
        </li>
    </g:if>

    <g:if test="${evento?.costesPersonal}">
        <li class="fieldcontain">
            <span id="costesPersonal-label" class="property-label">
                <g:message code="evento.costesPersonal.label"
                           default="Costes de personal:"/>
            </span>
            <span class="property-value" aria-labelledby="costesPersonal-label">
                <g:fieldValue bean="${evento}"
                              field="costesPersonal"/>
            </span>
        </li>
    </g:if>

    <g:if test="${evento?.totalInversion}">
        <li class="fieldcontain">
            <span id="totalInversion-label" class="property-label">
                <g:message code="evento.totalInversion.label"
                           default="Total inversión:"/>
            </span>
            <span class="property-value" aria-labelledby="totalInversion-label">
                <g:fieldValue bean="${evento}"
                              field="totalInversion"/>
            </span>
        </li>
    </g:if>--}%

    </ol>

    <g:form resource="${this.evento}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.evento}"><g:message code="default.button.edit.label"
                                                                                    default="Edit"/></g:link>
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
