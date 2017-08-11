<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'valoracion.label', default: 'Valoracion')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-valoracion" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" controller="solicitud" action="index"><g:message code="default.list.label"
                                                                                  args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-valoracion" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list valoracion">
        <g:if test="${this.valoracionInstance?.solicitud}">
            <li class="fieldcontain">
                <span id="solicitud-label" class="property-label"><g:message code="valoracion.solicitud.label"
                                                                             default="Número de solicitud:"/></span>

                <span class="property-value" aria-labelledby="solicitud-label"><g:link controller="solicitud"
                                                                                       action="show"
                                                                                       id="${this.valoracionInstance?.solicitud}">${this.valoracionInstance?.solicitud.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1antiguedad}">
            <li class="fieldcontain">
                <span id="l1antiguedad-label" class="property-label"><g:message code="valoracion.l1antiguedad.label"
                                                                                default="Antiguedad del Club:"/></span>

                <span class="property-value" aria-labelledby="l1antiguedad-label"><g:fieldValue
                        bean="${this.valoracionInstance}" field="l1antiguedad"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1centrosEscolares}">
            <li class="fieldcontain">
                <span id="l1centrosEscolares-label" class="property-label"><g:message
                        code="valoracion.l1centrosEscolares.label"
                        default="Colaboración con Centros Escolares:"/></span>

                <span class="property-value" aria-labelledby="l1centrosEscolares-label"><g:fieldValue
                        bean="${this.valoracionInstance}" field="l1centrosEscolares"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1costesActividad}">
            <li class="fieldcontain">
                <span id="l1costesActividad-label" class="property-label"><g:message
                        code="valoracion.l1costesActividadDe.label" default="L1costes Actividad"/></span>

                <span class="property-value" aria-labelledby="l1costesActividad-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1costesActividad"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1deporteEscolar}">
            <li class="fieldcontain">
                <span id="l1deporteEscolar-label" class="property-label"><g:message
                        code="valoracion.l1deporteEscolar.label" default="L1deporte Escolar"/></span>

                <span class="property-value" aria-labelledby="l1deporteEscolar-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1deporteEscolar"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1dificultadFinanciacion}">
            <li class="fieldcontain">
                <span id="l1dificultadFinanciacion-label" class="property-label"><g:message
                        code="valoracion.l1dificultadFinanciacion.label" default="L1dificultad Financiacion"/></span>

                <span class="property-value" aria-labelledby="l1dificultadFinanciacion-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1dificultadFinanciacion"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1getxoKirolak}">
            <li class="fieldcontain">
                <span id="l1getxoKirolak-label" class="property-label"><g:message code="valoracion.l1getxoKirolak.label"
                                                                                  default="L1getxo Kirolak"/></span>

                <span class="property-value" aria-labelledby="l1getxoKirolak-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1getxoKirolak"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1marcaGetxo}">
            <li class="fieldcontain">
                <span id="l1marcaGetxo-label" class="property-label"><g:message code="valoracion.l1marcaGetxo.label"
                                                                                default="L1marca Getxo"/></span>

                <span class="property-value" aria-labelledby="l1marcaGetxo-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1marcaGetxo"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1mediosPropios}">
            <li class="fieldcontain">
                <span id="l1mediosPropios-label" class="property-label"><g:message
                        code="valoracion.l1mediosPropios.label" default="L1medios Propios"/></span>

                <span class="property-value" aria-labelledby="l1mediosPropios-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1mediosPropios"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1otrosClubes}">
            <li class="fieldcontain">
                <span id="l1otrosClubes-label" class="property-label"><g:message code="valoracion.l1otrosClubes.label"
                                                                                 default="L1otros Clubes"/></span>

                <span class="property-value" aria-labelledby="l1otrosClubes-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1otrosClubes"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1prensaComarcal}">
            <li class="fieldcontain">
                <span id="l1prensaComarcal-label" class="property-label"><g:message
                        code="valoracion.l1prensaComarcal.label" default="L1prensa Comarcal"/></span>

                <span class="property-value" aria-labelledby="l1prensaComarcal-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1prensaComarcal"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1prensaEstatalInternacional}">
            <li class="fieldcontain">
                <span id="l1prensaEstatalInternacional-label" class="property-label"><g:message
                        code="valoracion.l1prensaEstatalInternacional.label"
                        default="L1prensa Estatal Internacional"/></span>

                <span class="property-value" aria-labelledby="l1prensaEstatalInternacional-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1prensaEstatalInternacional"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1prensaLocal}">
            <li class="fieldcontain">
                <span id="l1prensaLocal-label" class="property-label"><g:message code="valoracion.l1prensaLocal.label"
                                                                                 default="L1prensa Local"/></span>

                <span class="property-value" aria-labelledby="l1prensaLocal-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1prensaLocal"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1prensaRegional}">
            <li class="fieldcontain">
                <span id="l1prensaRegional-label" class="property-label"><g:message
                        code="valoracion.l1prensaRegional.label" default="L1prensa Regional"/></span>

                <span class="property-value" aria-labelledby="l1prensaRegional-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1prensaRegional"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1viabilidad}">
            <li class="fieldcontain">
                <span id="l1viabilidad-label" class="property-label"><g:message code="valoracion.l1viabilidad.label"
                                                                                default="Viabilidad proyecto:"/></span>

                <span class="property-value" aria-labelledby="l1viabilidad-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1viabilidad"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1objetivosGK}">
            <li class="fieldcontain">
                <span id="l1objetivosGK-label" class="property-label"><g:message code="valoracion.l1objetivosGK.label"
                                                                                 default="Objetivos GK:"/></span>

                <span class="property-value" aria-labelledby="l1objetivosGK-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1objetivosGK"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1lenguajeNoSexista}">
            <li class="fieldcontain">
                <span id="l1lenguajeNoSexista-label" class="property-label"><g:message
                        code="valoracion.l1lenguajeNoSexista.label" default="Lenguaje no sexista"/></span>

                <span class="property-value" aria-labelledby="l1lenguajeNoSexista-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1lenguajeNoSexista"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1lenguajeDeGenero}">
            <li class="fieldcontain">
                <span id="l1lenguajeDeGenero-label" class="property-label"><g:message
                        code="valoracion.l1lenguajeDeGenero.label"
                        default="Lenguaje de género en publicaciones"/></span>

                <span class="property-value" aria-labelledby="l1lenguajeDeGenero-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1lenguajeDeGenero"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1representacionFemeninaJunta}">
            <li class="fieldcontain">
                <span id="l1representacionFemeninaJunta-label" class="property-label"><g:message
                        code="valoracion.l1representacionFemeninaJunta.label"
                        default="Presencia femenina en la junta:"/></span>

                <span class="property-value" aria-labelledby="l1representacionFemeninaJunta-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1representacionFemeninaJunta"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1inmigracion}">
            <li class="fieldcontain">
                <span id="l1inmigracion-label" class="property-label"><g:message code="valoracion.l1inmigracion.label"
                                                                                 default="Integración inmigrantes:"/></span>

                <span class="property-value" aria-labelledby="l1inmigracion-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1inmigracion"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1personasDiscapacidad}">
            <li class="fieldcontain">
                <span id="l1personasDiscapacidad-label" class="property-label"><g:message
                        code="valoracion.l1personasDiscapacidad.label"
                        default="Actividades para discapacitados:"/></span>

                <span class="property-value" aria-labelledby="l1personasDiscapacidad-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1personasDiscapacidad"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1proyectoDeportivoEuskera}">
            <li class="fieldcontain">
                <span id="l1proyectoDeportivoEuskera-label" class="property-label"><g:message
                        code="valoracion.l1proyectoDeportivoEuskera.label"
                        default="L1proyecto Deportivo Euskera"/></span>

                <span class="property-value" aria-labelledby="l1proyectoDeportivoEuskera-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1proyectoDeportivoEuskera"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1proyectoDeportivoParticipacionFemenina}">
            <li class="fieldcontain">
                <span id="l1proyectoDeportivoParticipacionFemenina-label" class="property-label"><g:message
                        code="valoracion.l1proyectoDeportivoParticipacionFemenina.label"
                        default="L1proyecto Deportivo Participacion Femenina"/></span>

                <span class="property-value"
                      aria-labelledby="l1proyectoDeportivoParticipacionFemenina-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1proyectoDeportivoParticipacionFemenina"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l1residentes}">
            <li class="fieldcontain">
                <span id="l1residentes-label" class="property-label"><g:message code="valoracion.l1residentes.label"
                                                                                default="L1residentes"/></span>

                <span class="property-value" aria-labelledby="l1residentes-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l1residentes"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2PrimerPuestoEnTorneosAutonomicos}">
            <li class="fieldcontain">
                <span id="l2PrimerPuestoEnTorneosAutonomicos-label" class="property-label"><g:message
                        code="valoracion.l2PrimerPuestoEnTorneosAutonomicos.label"
                        default="L2 Primer Puesto En Torneos Autonomicos"/></span>

                <span class="property-value" aria-labelledby="l2PrimerPuestoEnTorneosAutonomicos-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2PrimerPuestoEnTorneosAutonomicos"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2antiguedad}">
            <li class="fieldcontain">
                <span id="l2antiguedad-label" class="property-label"><g:message code="valoracion.l2antiguedad.label"
                                                                                default="L2antiguedad"/></span>

                <span class="property-value" aria-labelledby="l2antiguedad-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2antiguedad"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2campeonatosEspaña}">
            <li class="fieldcontain">
                <span id="l2campeonatosEspaña-label" class="property-label"><g:message
                        code="valoracion.l2campeonatosEspaña.label" default="L2campeonatos España"/></span>

                <span class="property-value" aria-labelledby="l2campeonatosEspaña-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2campeonatosEspaña"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2campeonatosEuropa}">
            <li class="fieldcontain">
                <span id="l2campeonatosEuropa-label" class="property-label"><g:message
                        code="valoracion.l2campeonatosEuropa.label" default="L2campeonatos Europa"/></span>

                <span class="property-value" aria-labelledby="l2campeonatosEuropa-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2campeonatosEuropa"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2campeonatosEuskadi}">
            <li class="fieldcontain">
                <span id="l2campeonatosEuskadi-label" class="property-label"><g:message
                        code="valoracion.l2campeonatosEuskadi.label" default="L2campeonatos Euskadi"/></span>

                <span class="property-value" aria-labelledby="l2campeonatosEuskadi-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2campeonatosEuskadi"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2campeonatosMundo}">
            <li class="fieldcontain">
                <span id="l2campeonatosMundo-label" class="property-label"><g:message
                        code="valoracion.l2campeonatosMundo.label" default="L2campeonatos Mundo"/></span>

                <span class="property-value" aria-labelledby="l2campeonatosMundo-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2campeonatosMundo"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2centrosEscolares}">
            <li class="fieldcontain">
                <span id="l2centrosEscolares-label" class="property-label"><g:message
                        code="valoracion.l2centrosEscolares.label" default="L2centros Escolares"/></span>

                <span class="property-value" aria-labelledby="l2centrosEscolares-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2centrosEscolares"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2costesActividadDe}">
            <li class="fieldcontain">
                <span id="l2costesActividadDe-label" class="property-label"><g:message
                        code="valoracion.l2costesActividadDe.label" default="L2costes Actividad De"/></span>

                <span class="property-value" aria-labelledby="l2costesActividadDe-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2costesActividadDe"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2deporteEscolar}">
            <li class="fieldcontain">
                <span id="l2deporteEscolar-label" class="property-label"><g:message
                        code="valoracion.l2deporteEscolar.label" default="L2deporte Escolar"/></span>

                <span class="property-value" aria-labelledby="l2deporteEscolar-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2deporteEscolar"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2dificultadFinanciacion}">
            <li class="fieldcontain">
                <span id="l2dificultadFinanciacion-label" class="property-label"><g:message
                        code="valoracion.l2dificultadFinanciacion.label" default="L2dificultad Financiacion"/></span>

                <span class="property-value" aria-labelledby="l2dificultadFinanciacion-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2dificultadFinanciacion"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2getxoKirolak}">
            <li class="fieldcontain">
                <span id="l2getxoKirolak-label" class="property-label"><g:message code="valoracion.l2getxoKirolak.label"
                                                                                  default="L2getxo Kirolak"/></span>

                <span class="property-value" aria-labelledby="l2getxoKirolak-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2getxoKirolak"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2indiceCorreccion}">
            <li class="fieldcontain">
                <span id="l2indiceCorreccion-label" class="property-label"><g:message
                        code="valoracion.l2indiceCorreccion.label" default="L2indice Correccion"/></span>

                <span class="property-value" aria-labelledby="l2indiceCorreccion-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2indiceCorreccion"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2indiceParticipacion}">
            <li class="fieldcontain">
                <span id="l2indiceParticipacion-label" class="property-label"><g:message
                        code="valoracion.l2indiceParticipacion.label" default="L2indice Participacion"/></span>

                <span class="property-value" aria-labelledby="l2indiceParticipacion-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2indiceParticipacion"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2marcaGetxo}">
            <li class="fieldcontain">
                <span id="l2marcaGetxo-label" class="property-label"><g:message code="valoracion.l2marcaGetxo.label"
                                                                                default="L2marca Getxo"/></span>

                <span class="property-value" aria-labelledby="l2marcaGetxo-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2marcaGetxo"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2mediosPropios}">
            <li class="fieldcontain">
                <span id="l2mediosPropios-label" class="property-label"><g:message
                        code="valoracion.l2mediosPropios.label" default="L2medios Propios"/></span>

                <span class="property-value" aria-labelledby="l2mediosPropios-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2mediosPropios"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2otrosClubes}">
            <li class="fieldcontain">
                <span id="l2otrosClubes-label" class="property-label"><g:message code="valoracion.l2otrosClubes.label"
                                                                                 default="L2otros Clubes"/></span>

                <span class="property-value" aria-labelledby="l2otrosClubes-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2otrosClubes"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2prensaComarcal}">
            <li class="fieldcontain">
                <span id="l2prensaComarcal-label" class="property-label"><g:message
                        code="valoracion.l2prensaComarcal.label" default="L2prensa Comarcal"/></span>

                <span class="property-value" aria-labelledby="l2prensaComarcal-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2prensaComarcal"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2prensaEstatalInternacional}">
            <li class="fieldcontain">
                <span id="l2prensaEstatalInternacional-label" class="property-label"><g:message
                        code="valoracion.l2prensaEstatalInternacional.label"
                        default="L2prensa Estatal Internacional"/></span>

                <span class="property-value" aria-labelledby="l2prensaEstatalInternacional-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2prensaEstatalInternacional"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2prensaLocal}">
            <li class="fieldcontain">
                <span id="l2prensaLocal-label" class="property-label"><g:message code="valoracion.l2prensaLocal.label"
                                                                                 default="L2prensa Local"/></span>

                <span class="property-value" aria-labelledby="l2prensaLocal-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2prensaLocal"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2prensaRegional}">
            <li class="fieldcontain">
                <span id="l2prensaRegional-label" class="property-label"><g:message
                        code="valoracion.l2prensaRegional.label" default="L2prensa Regional"/></span>

                <span class="property-value" aria-labelledby="l2prensaRegional-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2prensaRegional"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2viabilidad}">
            <li class="fieldcontain">
                <span id="l2viabilidad-label" class="property-label"><g:message code="valoracion.l2viabilidad.label"
                                                                                default="Viabilidad proyecto:"/></span>

                <span class="property-value" aria-labelledby="l2viabilidad-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2viabilidad"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2objetivosGK}">
            <li class="fieldcontain">
                <span id="l2objetivosGK-label" class="property-label"><g:message code="valoracion.l2objetivosGK.label"
                                                                                 default="Objetivos GK:"/></span>

                <span class="property-value" aria-labelledby="l2objetivosGK-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2objetivosGK"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2lenguajeNoSexista}">
            <li class="fieldcontain">
                <span id="l2lenguajeNoSexista-label" class="property-label"><g:message
                        code="valoracion.l2lenguajeNoSexista.label" default="Lenguaje no sexista"/></span>

                <span class="property-value" aria-labelledby="l2lenguajeNoSexista-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2lenguajeNoSexista"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2lenguajeDeGenero}">
            <li class="fieldcontain">
                <span id="l2lenguajeDeGenero-label" class="property-label"><g:message
                        code="valoracion.l2lenguajeDeGenero.label"
                        default="Lenguaje de género en publicaciones"/></span>

                <span class="property-value" aria-labelledby="l2lenguajeDeGenero-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2lenguajeDeGenero"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2representacionFemeninaJunta}">
            <li class="fieldcontain">
                <span id="l2representacionFemeninaJunta-label" class="property-label"><g:message
                        code="valoracion.l2representacionFemeninaJunta.label"
                        default="Presencia femenina en la junta:"/></span>

                <span class="property-value" aria-labelledby="l2representacionFemeninaJunta-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2representacionFemeninaJunta"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2inmigracion}">
            <li class="fieldcontain">
                <span id="l2inmigracion-label" class="property-label"><g:message code="valoracion.l2inmigracion.label"
                                                                                 default="Integración inmigrantes:"/></span>

                <span class="property-value" aria-labelledby="l2inmigracion-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2inmigracion"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2personasDiscapacidad}">
            <li class="fieldcontain">
                <span id="l2personasDiscapacidad-label" class="property-label"><g:message
                        code="valoracion.l2personasDiscapacidad.label"
                        default="Actividades para discapacitados:"/></span>

                <span class="property-value" aria-labelledby="l2personasDiscapacidad-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2personasDiscapacidad"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2proyectoDeportivoEuskera}">
            <li class="fieldcontain">
                <span id="l2proyectoDeportivoEuskera-label" class="property-label"><g:message
                        code="valoracion.l2proyectoDeportivoEuskera.label"
                        default="L2proyecto Deportivo Euskera"/></span>

                <span class="property-value" aria-labelledby="l2proyectoDeportivoEuskera-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2proyectoDeportivoEuskera"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2proyectoDeportivoParticipacionFemenina}">
            <li class="fieldcontain">
                <span id="l2proyectoDeportivoParticipacionFemenina-label" class="property-label"><g:message
                        code="valoracion.l2proyectoDeportivoParticipacionFemenina.label"
                        default="L2proyecto Deportivo Participacion Femenina"/></span>

                <span class="property-value"
                      aria-labelledby="l2proyectoDeportivoParticipacionFemenina-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2proyectoDeportivoParticipacionFemenina"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2residentes}">
            <li class="fieldcontain">
                <span id="l2residentes-label" class="property-label"><g:message code="valoracion.l2residentes.label"
                                                                                default="Residentes en Getxo"/></span>

                <span class="property-value" aria-labelledby="l2residentes-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2residentes"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2jugadoresEquipoSenior}">
            <li class="fieldcontain">
                <span id="l2jugadoresEquipoSenior-label" class="property-label"><g:message
                        code="valoracion.l2jugadoresEquipoSenior.label"
                        default="Jugadores jóvenes en equipo Senior:"/></span>

                <span class="property-value" aria-labelledby="l2jugadoresEquipoSenior-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2jugadoresEquipoSenior"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2puestoEnCircuitosInternacionales}">
            <li class="fieldcontain">
                <span id="l2puestoEnCircuitosInternacionales-label" class="property-label"><g:message
                        code="valoracion.l2puestoEnCircuitosInternacionales.label"
                        default="L2puesto En Circuitos Internacionales"/></span>

                <span class="property-value" aria-labelledby="l2puestoEnCircuitosInternacionales-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2puestoEnCircuitosInternacionales"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2puestoEnCircuitosNacionales}">
            <li class="fieldcontain">
                <span id="l2puestoEnCircuitosNacionales-label" class="property-label"><g:message
                        code="valoracion.l2puestoEnCircuitosNacionales.label"
                        default="L2puesto En Circuitos Nacionales"/></span>

                <span class="property-value" aria-labelledby="l2puestoEnCircuitosNacionales-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2puestoEnCircuitosNacionales"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2puestoEnTorneosInternacionales}">
            <li class="fieldcontain">
                <span id="l2puestoEnTorneosInternacionales-label" class="property-label"><g:message
                        code="valoracion.l2puestoEnTorneosInternacionales.label"
                        default="L2puesto En Torneos Internacionales"/></span>

                <span class="property-value" aria-labelledby="l2puestoEnTorneosInternacionales-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2puestoEnTorneosInternacionales"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2puestoEnTorneosNacionales}">
            <li class="fieldcontain">
                <span id="l2puestoEnTorneosNacionales-label" class="property-label"><g:message
                        code="valoracion.l2puestoEnTorneosNacionales.label"
                        default="L2puesto En Torneos Nacionales"/></span>

                <span class="property-value" aria-labelledby="l2puestoEnTorneosNacionales-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2puestoEnTorneosNacionales"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2residentes}">
            <li class="fieldcontain">
                <span id="l2residentes-label" class="property-label"><g:message code="valoracion.l2residentes.label"
                                                                                default="L2residentes"/></span>

                <span class="property-value" aria-labelledby="l2residentes-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2residentes"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l2jugadoresEquipoSenior}">
            <li class="fieldcontain">
                <span id="l2jugadoresEquipoSenior-label" class="property-label"><g:message
                        code="valoracion.l2jugadoresEquipoSenior.label" default="l2jugadoresEquipoSenior"/></span>

                <span class="property-value" aria-labelledby="l2jugadoresEquipoSenior-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l2jugadoresEquipoSenior"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l3categoriaFaseFinal}">
            <li class="fieldcontain">
                <span id="l3categoriaFaseFinal-label" class="property-label"><g:message
                        code="valoracion.l3categoriaFaseFinal.label" default="L3categoria Fase Final"/></span>

                <span class="property-value" aria-labelledby="l3categoriaFaseFinal-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l3categoriaFaseFinal"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l3resultadoObtenido}">
            <li class="fieldcontain">
                <span id="l3resultadoObtenido-label" class="property-label"><g:message
                        code="valoracion.l3resultadoObtenido.label" default="L3resultado Obtenido"/></span>

                <span class="property-value" aria-labelledby="l3resultadoObtenido-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l3resultadoObtenido"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l4ampas}">
            <li class="fieldcontain">
                <span id="l4ampas-label" class="property-label"><g:message code="valoracion.l4ampas.label"
                                                                           default="L4ampas"/></span>

                <span class="property-value" aria-labelledby="l4ampas-label"><g:fieldValue bean="${valoracionInstance}"
                                                                                           field="l4ampas"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l4categoriasEscolares}">
            <li class="fieldcontain">
                <span id="l4categoriasEscolares-label" class="property-label"><g:message
                        code="valoracion.l4categoriasEscolares.label" default="L4categorias Escolares"/></span>

                <span class="property-value" aria-labelledby="l4categoriasEscolares-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l4categoriasEscolares"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l4categoriasFederadas}">
            <li class="fieldcontain">
                <span id="l4categoriasFederadas-label" class="property-label"><g:message
                        code="valoracion.l4categoriasFederadas.label" default="L4categorias Federadas"/></span>

                <span class="property-value" aria-labelledby="l4categoriasFederadas-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l4categoriasFederadas"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l4comunicacionAMedios}">
            <li class="fieldcontain">
                <span id="l4comunicacionAMedios-label" class="property-label"><g:message
                        code="valoracion.l4comunicacionAMedios.label" default="L4comunicacion AM edios"/></span>

                <span class="property-value" aria-labelledby="l4comunicacionAMedios-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l4comunicacionAMedios"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l4desviacion}">
            <li class="fieldcontain">
                <span id="l4desviacion-label" class="property-label"><g:message code="valoracion.l4desviacion.label"
                                                                                default="L4desviacion"/></span>

                <span class="property-value" aria-labelledby="l4desviacion-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l4desviacion"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l4experienciaSolicitante}">
            <li class="fieldcontain">
                <span id="l4experienciaSolicitante-label" class="property-label"><g:message
                        code="valoracion.l4experienciaSolicitante.label" default="L4experiencia Solicitante"/></span>

                <span class="property-value" aria-labelledby="l4experienciaSolicitante-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l4experienciaSolicitante"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l4otrosClubes}">
            <li class="fieldcontain">
                <span id="l4otrosClubes-label" class="property-label"><g:message code="valoracion.l4otrosClubes.label"
                                                                                 default="L4otros Clubes"/></span>

                <span class="property-value" aria-labelledby="l4otrosClubes-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l4otrosClubes"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l4participacionEstimada}">
            <li class="fieldcontain">
                <span id="l4participacionEstimada-label" class="property-label"><g:message
                        code="valoracion.l4participacionEstimada.label" default="L4participacion Estimada"/></span>

                <span class="property-value" aria-labelledby="l4participacionEstimada-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l4participacionEstimada"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l4participacionFemeninaEvento}">
            <li class="fieldcontain">
                <span id="l4participacionFemeninaEvento-label" class="property-label"><g:message
                        code="valoracion.l4participacionFemeninaEvento.label"
                        default="L4participacion Femenina Evento"/></span>

                <span class="property-value" aria-labelledby="l4participacionFemeninaEvento-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l4participacionFemeninaEvento"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l4propioClub}">
            <li class="fieldcontain">
                <span id="l4propioClub-label" class="property-label"><g:message code="valoracion.l4propioClub.label"
                                                                                default="L4propio Club"/></span>

                <span class="property-value" aria-labelledby="l4propioClub-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l4propioClub"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l4usoNuevasTecnologías}">
            <li class="fieldcontain">
                <span id="l4usoNuevasTecnologías-label" class="property-label"><g:message
                        code="valoracion.l4usoNuevasTecnologías.label" default="L4uso Nuevas Tecnologías"/></span>

                <span class="property-value" aria-labelledby="l4usoNuevasTecnologías-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l4usoNuevasTecnologías"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l4veteranos}">
            <li class="fieldcontain">
                <span id="l4veteranos-label" class="property-label"><g:message code="valoracion.l4veteranos.label"
                                                                               default="L4veteranos"/></span>

                <span class="property-value" aria-labelledby="l4veteranos-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l4veteranos"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l5comunicacionAMedios}">
            <li class="fieldcontain">
                <span id="l5comunicacionAMedios-label" class="property-label"><g:message
                        code="valoracion.l5comunicacionAMedios.label" default="L5comunicacion AM edios"/></span>

                <span class="property-value" aria-labelledby="l5comunicacionAMedios-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l5comunicacionAMedios"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l5experienciaSolicitante}">
            <li class="fieldcontain">
                <span id="l5experienciaSolicitante-label" class="property-label"><g:message
                        code="valoracion.l5experienciaSolicitante.label" default="L5experiencia Solicitante"/></span>

                <span class="property-value" aria-labelledby="l5experienciaSolicitante-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l5experienciaSolicitante"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l5numeroEspectadores}">
            <li class="fieldcontain">
                <span id="l5numeroEspectadores-label" class="property-label"><g:message
                        code="valoracion.l5numeroEspectadores.label" default="L5numero Espectadores"/></span>

                <span class="property-value" aria-labelledby="l5numeroEspectadores-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l5numeroEspectadores"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l5participacionEstimada}">
            <li class="fieldcontain">
                <span id="l5participacionEstimada-label" class="property-label"><g:message
                        code="valoracion.l5participacionEstimada.label" default="L5participacion Estimada"/></span>

                <span class="property-value" aria-labelledby="l5participacionEstimada-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l5participacionEstimada"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l5participacionFemenina}">
            <li class="fieldcontain">
                <span id="l5participacionFemenina-label" class="property-label"><g:message
                        code="valoracion.l5participacionFemenina.label" default="L5participacion Femenina"/></span>

                <span class="property-value" aria-labelledby="l5participacionFemenina-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l5participacionFemenina"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l5actividadesEuskera}">
            <li class="fieldcontain">
                <span id="l5actividadesEuskera-label" class="property-label"><g:message
                        code="valoracion.l5actividadesEuskera.label"
                        default="Actividad en Euskera para niños/as"/></span>
                <span class="property-value" aria-labelledby="l5actividadesEuskera-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l5actividadesEuskera"/></span>
            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l5recursosPropios}">
            <li class="fieldcontain">
                <span id="l5recursosPropios-label" class="property-label"><g:message
                        code="valoracion.l5recursosPropios.label" default="L5recursos Propios"/></span>

                <span class="property-value" aria-labelledby="l5recursosPropios-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l5recursosPropios"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l5usoNuevasTecnologías}">
            <li class="fieldcontain">
                <span id="l5usoNuevasTecnologías-label" class="property-label"><g:message
                        code="valoracion.l5usoNuevasTecnologías.label" default="L5uso Nuevas Tecnologías"/></span>

                <span class="property-value" aria-labelledby="l5usoNuevasTecnologías-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l5usoNuevasTecnologías"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l6costeActividad}">
            <li class="fieldcontain">
                <span id="l6costeActividad-label" class="property-label"><g:message
                        code="valoracion.l6costeActividad.label" default="L6coste Actividad"/></span>

                <span class="property-value" aria-labelledby="l6costeActividad-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l6costeActividad"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l6mediosPropios}">
            <li class="fieldcontain">
                <span id="l6mediosPropios-label" class="property-label"><g:message
                        code="valoracion.l6mediosPropios.label" default="L6medios Propios"/></span>

                <span class="property-value" aria-labelledby="l6mediosPropios-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l6mediosPropios"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l6patrcinioPrivado}">
            <li class="fieldcontain">
                <span id="l6patrcinioPrivado-label" class="property-label"><g:message
                        code="valoracion.l6patrcinioPrivado.label" default="L6patrcinio Privado"/></span>

                <span class="property-value" aria-labelledby="l6patrcinioPrivado-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l6patrcinioPrivado"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l6prensaComarcal}">
            <li class="fieldcontain">
                <span id="l6prensaComarcal-label" class="property-label"><g:message
                        code="valoracion.l6prensaComarcal.label" default="L6prensa Comarcal"/></span>

                <span class="property-value" aria-labelledby="l6prensaComarcal-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l6prensaComarcal"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l6prensaEstatal}">
            <li class="fieldcontain">
                <span id="l6prensaEstatal-label" class="property-label"><g:message
                        code="valoracion.l6prensaEstatal.label" default="L6prensa Estatal"/></span>

                <span class="property-value" aria-labelledby="l6prensaEstatal-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l6prensaEstatal"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l6prensaLocal}">
            <li class="fieldcontain">
                <span id="l6prensaLocal-label" class="property-label"><g:message code="valoracion.l6prensaLocal.label"
                                                                                 default="L6prensa Local"/></span>

                <span class="property-value" aria-labelledby="l6prensaLocal-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l6prensaLocal"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l6prensaRegional}">
            <li class="fieldcontain">
                <span id="l6prensaRegional-label" class="property-label"><g:message
                        code="valoracion.l6prensaRegional.label" default="L6prensa Regional"/></span>

                <span class="property-value" aria-labelledby="l6prensaRegional-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l6prensaRegional"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l7costeActividad}">
            <li class="fieldcontain">
                <span id="l7costeActividad-label" class="property-label"><g:message
                        code="valoracion.l7costeActividad.label" default="L7coste Actividad"/></span>

                <span class="property-value" aria-labelledby="l7costeActividad-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l7costeActividad"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l7mediosPropios}">
            <li class="fieldcontain">
                <span id="l7mediosPropios-label" class="property-label"><g:message
                        code="valoracion.l7mediosPropios.label" default="L7medios Propios"/></span>

                <span class="property-value" aria-labelledby="l7mediosPropios-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l7mediosPropios"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l7patrcinioPrivado}">
            <li class="fieldcontain">
                <span id="l7patrcinioPrivado-label" class="property-label"><g:message
                        code="valoracion.l7patrcinioPrivado.label" default="L7patrcinio Privado"/></span>

                <span class="property-value" aria-labelledby="l7patrcinioPrivado-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l7patrcinioPrivado"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l7prensaComarcal}">
            <li class="fieldcontain">
                <span id="l7prensaComarcal-label" class="property-label"><g:message
                        code="valoracion.l7prensaComarcal.label" default="L7prensa Comarcal"/></span>

                <span class="property-value" aria-labelledby="l7prensaComarcal-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l7prensaComarcal"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l7prensaEstatal}">
            <li class="fieldcontain">
                <span id="l7prensaEstatal-label" class="property-label"><g:message
                        code="valoracion.l7prensaEstatal.label" default="L7prensa Estatal"/></span>

                <span class="property-value" aria-labelledby="l7prensaEstatal-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l7prensaEstatal"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l7prensaLocal}">
            <li class="fieldcontain">
                <span id="l7prensaLocal-label" class="property-label"><g:message code="valoracion.l7prensaLocal.label"
                                                                                 default="L7prensa Local"/></span>

                <span class="property-value" aria-labelledby="l7prensaLocal-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l7prensaLocal"/></span>

            </li>
        </g:if>

        <g:if test="${this.valoracionInstance?.l7prensaRegional}">
            <li class="fieldcontain">
                <span id="l7prensaRegional-label" class="property-label"><g:message
                        code="valoracion.l7prensaRegional.label" default="L7prensa Regional"/></span>

                <span class="property-value" aria-labelledby="l7prensaRegional-label"><g:fieldValue
                        bean="${valoracionInstance}" field="l7prensaRegional"/></span>

            </li>
        </g:if>

        <li class="fieldcontain">
            <span id="puntuacion-label" class="property-label"><g:message code="valoracion.puntuacion.label"
                                                                          default="Puntuación total:"/></span>
            <span class="property-value" aria-labelledby="puntuacion-label">
                ${this.valoracionInstance?.puntuacion}
            </span>
        </li>

        <g:if test="${this.valoracionInstance?.importeConcedido}">
            <li class="fieldcontain">
                <span id="importeConcedido-label" class="property-label"><g:message
                        code="valoracion.importeConcedido.label" default="Importe concedido:"/></span>
                <span class="property-value" aria-labelledby="importeConcedido-label">
                    <g:formatNumber number="${this.valoracionInstance.importeConcedido}" type="currency"
                                    currencyCode="EUR" locale="es_ES"/></span>
            </li>
        </g:if>

    </ol>


    <g:form resource="${this.valoracionInstance}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.valoracionInstance}"><g:message
                    code="default.button.edit.label"
                    default="Edit"/></g:link>
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
