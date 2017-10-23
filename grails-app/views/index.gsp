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
            <li><g:link class="list" controller="evento" action="index">Eventos</g:link></li>
            %{--<li><g:link class="create" controller="evento" action="create">Nuevo Evento</g:link></li>--}%
            <li><g:link class="list" controller="lugar" action="index">Lugares</g:link></li>
            <li><g:link class="list" controller="recinto" action="index">Recintos</g:link></li>
            <li><g:link class="list" controller="modalidad" action="index">Modalidades</g:link></li>
            <li><g:link class="list" controller="material" action="index">Material</g:link></li>
            <li><g:link class="list" controller="solicitudMaterial" action="index">Solicitudes Material</g:link></li>
        </ul>
    </li>

    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
           aria-expanded="false">Entidades<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><g:link class="list" controller="entidad" action="index">Entidades</g:link></li>
            <li><g:link class="list" controller="club" action="index">Clubes</g:link></li>
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
        <asset:image src="gobela21/kirolak_apaisado_copiar_2.jpg" class="grails-logo"/>
        %{--<asset:image src="grails-cupsonly-logo-white.svg" class="grails-logo"/>--}%
    </div>
</div>

<div id="content" role="main">
    <section class="row colset-2-its">
        %{--<div id="controllers" role="navigation">
            <h2>Available Controllers:</h2>
            <ul>
                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                    <li class="controller">
                        <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                    </li>
                </g:each>
            </ul>
        </div>--}%
        <h1>ULTIMOS CAMBIOS</h1>
        <h2>Modificaciones :</h2>
        <ul>
            <li>Creadas vistas para acceso de usuarios</li>
            <li>Activado plugin de seguridad</li>
            <li>Creados roles principales</li>
            <li>Creado mapeo de acceso por rol</li>
            <li>Upgrade de módulo de subvenciones a Grails 3</li>
            <li>Creado formulario de acceso de usuarios</li>
            <li>creadas vistas de gestión de usuarios</li>
            <li>creadas vistas de gestion de roles</li>
            <li>creadas vistas de asignación de roles a usuarios</li>
        </ul>
        <h2>Modificaciones 22/10/2017:</h2>
        <ul>
            <li>Arregada etiqueta para "número de participantes" en creación de eventos</li>
            <li>Arregada etiqueta para "número de asistentes" en edición de eventos</li>
            <li>Arregada etiqueta para "número de voluntarios" en edición de eventos</li>
            <li>Limitados los valores para los años en los selectores de fecha de solicitud de material</li>
            <li>Añadidos más campos al desglose de meterial en vista "solicitud de material"</li>
            <li>Añadida tabla con las solicitudes de material del evento en vista de Evento</li>
            <li>Cambiado label del botón "Material" por "Solicitar Material"</li>
            <li>Quitado el botón "Crear solicitud de Material" del índice de solicitudes de material</li>
            <li>Añadido enlace a solicitudes de material en menu despleglable</li>
            <li>Creado formulario para editar solicitudes de material</li>
            <li>Habilitada persistencia en BDD para solicitudes de material</li>
            <li>Mejorada la visualización de "modalidad" en listados</li>
            <li>Mejorada la visualización de "recinto" en listados</li>
            <li>Mejorada la visualización de "material" en listados</li>
        </ul>
        <h2>Modificaciones 10/10/2017:</h2>
        <ul>
            <li>añadida entidad y vistas para "Material"</li>
            <li>Añadidos campos "lugar de entrega" y "lugar de recogida" a solicitud de material</li>
            <li>Añadida tabla de materiales a formulario de solicitud de material</li>
        </ul>
        <h2>Modificaciones 05/10/2017:</h2>
        <ul>
            <li>Añadido "Torneo-Txapelketa a tipos de actividad</li>
        </ul>
        <h2>Modificaciones 03/10/2017:</h2>
        <ul>
            <li>Añadido check "es club" en entidades</li>
            <li>Modificado el formato de fechas</li>
            <li>Añadido clonado de eventos</li>
        </ul>
        <h2>Modificaciones 02/10/2017:</h2>
        <ul>
            <li>Arreglado problema con los despliegues con Tomcat7 y Tomcat embebido </li>
            <li>Configurado Tomcat embebido en puerto 8081 y subcarpeta "gobela"</li>
        </ul>
        <h2>Modificaciones 01/10/2017:</h2>
        <ul>
            <li>Importados datos de eventos desde excel de eventos</li>
            <li>Subida a producción de apartado de Eventos</li>
        </ul>
        <h2>Modificaciones 30/09/2017:</h2>
        <ul>
            <li>Añadido menú de Eventos en página de inicio</li>
            <li>Añadido menú de Modalidades en página de inicio</li>
            <li>Añadido check "Evento Solidario" a Evento</li>
        </ul>
        <h2>Modificaciones 09/09/2017:</h2>
        <ul>
            <li>Importados datos de Entidades desde excel de eventos</li>
            <li>Cambios en algunos estilos</li>
        </ul>
        <h2>Modificaciones 02/09/2017:</h2>
        <ul>
            <li>Añadido campo "teléfono contacto" a Evento</li>
            <li>Modificados tipos de público</li>
            <li>Quitado campo "Club Organizador" de evento hasta tener información válida de los clubes</li>
            <li>Añadida entidad "Lugar"</li>
            <li>Modificado entidad "Recinto" con nuevos valores</li>
            <li>Añadido menú "Lugar" a página principal</li>
            <li>Añadido menú "Recinto" a página principal</li>
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
