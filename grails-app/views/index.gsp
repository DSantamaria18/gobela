<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Gobela21</title>
    %{--<title>Welcome to Grails</title>--}%

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
</head>

<body>
<content tag="nav">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
           aria-expanded="false">Application Status <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="#">Environment: ${grails.util.Environment.current.name}</a></li>
            <li><a href="#">App profile: ${grailsApplication.config.grails?.profile}</a></li>
            <li><a href="#">App version:
                <g:meta name="info.app.version"/></a>
            </li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Grails version:
                <g:meta name="info.app.grailsVersion"/></a>
            </li>
            <li><a href="#">Groovy version: ${GroovySystem.getVersion()}</a></li>
            <li><a href="#">JVM version: ${System.getProperty('java.version')}</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</a></li>
        </ul>
    </li>
    %{--<li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
           aria-expanded="false">Artefacts <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="#">Controllers: ${grailsApplication.controllerClasses.size()}</a></li>
            <li><a href="#">Domains: ${grailsApplication.domainClasses.size()}</a></li>
            <li><a href="#">Services: ${grailsApplication.serviceClasses.size()}</a></li>
            <li><a href="#">Tag Libraries: ${grailsApplication.tagLibClasses.size()}</a></li>
        </ul>
    </li>--}%
    %{--<li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
           aria-expanded="false">Installed Plugins <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                <li><a href="#">${plugin.name} - ${plugin.version}</a></li>
            </g:each>
        </ul>
    </li>--}%

    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
           aria-expanded="false">Eventos<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><g:link class="list" controller="evento" action="index"><g:message code="default.list.label"
                                                                                      args="[entityName]"/></g:link></li>
            <li><g:link class="create" controller="evento" action="create"><g:message code="default.new.label"
                                                                                         args="[entityName]"/></g:link></li>
        </ul>
    </li>

    %{--<li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
           aria-expanded="false">Solicitudes<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><g:link class="list" controller="solicitud" action="index"><g:message code="default.list.label"
                                                                                      args="[entityName]"/></g:link></li>
            <li><g:link class="create" controller="solicitud" action="create"><g:message code="default.new.label"
                                                                  args="[entityName]"/></g:link></li>
        </ul>
    </li>

    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
           aria-expanded="false">Estadísticas<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li class="controller"><g:link controller="Estadisticas" action="index">Informe Subvenciones</g:link></li>
        </ul>

    </li>--}%
</content>

<div class="svg" role="presentation">
    <div class="grails-logo-container">
        %{--<asset:image src="gobela21/various-sports-groups.jpeg" class="grails-logo"/>--}%
        %{--<asset:image src="gobela21/Fadura.jpg" class="grails-logo"/>--}%
        %{--<asset:image src="gobela21/sports2.jpg" class="grails-logo"/>--}%
        %{--<asset:image src="gobela21/sports.jpg" class="grails-logo"/>--}%
        %{--<asset:image src="gobela21/kirolak_apaisado_copiar_2.jpg" class="grails-logo"/>--}%
        <asset:image src="grails-cupsonly-logo-white.svg" class="grails-logo"/>
    </div>
</div>

<div id="content" role="main">
    <section class="row colset-2-its">
        <div id="controllers" role="navigation">
            <h2>Available Controllers:</h2>
            <ul>
                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                    <li class="controller">
                        <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                    </li>
                </g:each>
            </ul>
        </div>
        <h2>Modificaciones 30/09/2017:</h2>
        <ul>
            <li>Subida a producción de apartado de Eventos</li>
            <li>Añadido menú de Eventos en página de inicio</li>
        </ul>
        <h2>Modificaciones 02/09/2017:</h2>
        <ul>
            <li>Añadido campo "teléfono contacto" a Evento</li>
            <li>Modificados tipos de público</li>
            <li>Quitado campo "Club Organizador" de evento hasta tener información válida de los clubes</li>
            <li>Importados datos de Entidades desde excel de eventos</li>
            <li>Importados datos de eventos desde excel de eventos</li>
        </ul>

        <h2>Modificaciones 11/08/2017:</h2>
        <ul>
            <li>Adaptado nuevo versionado</li>
            <li>Adaptaciones para control de acceso</li>
            <li>Nuevos menús en Home</li>
            <li>Adaptadas estadísticas a nueva versión</li>
            <li>Añadidos ficheros de cadenas para multiidioma</li>
            <li>Adaptados formularios para multiidioma</li>
            <li>Adaptados entidades a nueva versión</li>
            <li>Adaptados formularios a nueva versión</li>
            <li>Adaptado javascript a nueva versión</li>
            <li>Preparado entorno para nuevo diseño</li>
            <li>Añadidos nuevos ficheros para nuevo diseño</li>
            <li>Adaptados apartados de solicitudes a nueva versión</li>
            <li>Upgrade a Grails 3.3.4</li>
        </ul>

        <h2>Modificaciones 06/07/2017:</h2>
        <ul>
            <li>Añadido campo para búsqueda de solicitudes por número o descripción en página de solicitudes</li>
        </ul>

        <h2>Modificaciones 07/05/2017 (2):</h2>
        <ul>
            <li>Corregida puntuación para apartado "Dificultades de financiación" para líneas 1 y 2</li>
            <li>Corregida puntuación para "Atención a la diversidad" para Líneas 1 y 2</li>
            <li>Añadido campo "Uso del Euskera" a valoración L1</li>
            <li>Añadido campo "Participación Femenina" a valoración L1</li>
            <li>Corregida puntuación para "Antigüedad" para L1</li>
        </ul>

        <h2>Modificaciones 07/05/2017:</h2>
        <ul>
            <li>Habilitado el cálculo automático de puntuaciones para valoraciones L2</li>
            <li>Modificados los formularios de valoración para todas las líneas</li>
        </ul>

        <h2>Modificaciones 09/04/2017:</h2>
        <ul>
            <li>Arreglado límite de campos de MEMORIA</li>
            <li>Añadido campo a VALORACION para la Línea 2 (jugadores entre 18 y 23 años en equipo Senior)</li>
        </ul>

        <h2>Modificaciones 07/04/2017:</h2>
        <ul>
            <li>Añadido botón "Cancelar" a pantallas de edición</li>
            <li>Añadido campo en valoraciones L5 para "Actividades en Euskera para niños"</li>
            <li>Corregidos los nombres de los campos de MEMORIA</li>
            <li>La descripción de las solicitudes ahora son un campo único y accesible a través de él</li>
            <li>Añadido campo para el nombre del evento de las solicitudes de la Línea 4</li>
            <li>Exportación a Excel de los datos de la solicitud (individual)</li>
        </ul>

        <h2>Modificaciones 03/04/2017:</h2>
        <ul>
            <li>Ampliado el tamaño de los campos de texto de MEMORIA (2000 caracteres para ACCIONES y SITUACION, 1000 para el resto)</li>
            <li>Corregido el cálculo de totales en el Excel de subvenciones por línea cuando se genera desde el servidor</li>
        </ul>

        <h2>Modificaciones 02/04/2017 (2):</h2>
        <ul>
            <li>Ahora el dominio .EUS es válido</li>
        </ul>

        <h2>Modificaciones 02/04/2017:</h2>
        <ul>
            <li>paginación de vistas</li>
            <li>Vista de estadísticas</li>
            <li>Descarga en Excel de informe de subvenciones</li>
        </ul>

        <h2>Modificaciones 26/03/2017:</h2>
        <ul>
            <li>Añadido resumen de cambios en página de inicio</li>
            <li>Añadida la suma automática de puntos en las valoraciones (Excepto Línea 2)</li>
            <li>Añadido el cálculo automático del importe concedido (Excepto Línea 2)</li>
        </ul>
    </section>
</div>

</body>
</html>
