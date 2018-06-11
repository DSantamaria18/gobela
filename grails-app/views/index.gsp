<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Gobela21</title>

    <asset:link rel="icon" href="gobela21/icon_kirolak.png" type="image/x-ico"/>
</head>

<body>
<content tag="nav">
    <sec:ifAnyGranted roles='ROLE_ADMIN'>
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
    </sec:ifAnyGranted>

    <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_USER, ROLE_MANAGER'>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">Eventos<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><g:link class="list" controller="evento" action="index">Eventos</g:link></li>
                %{--<li><g:link class="create" controller="evento" action="create">Nuevo Evento</g:link></li>--}%
                <li><g:link class="list" controller="lugar" action="index">Lugares</g:link></li>
                <li><g:link class="list" controller="recinto" action="index">Recintos</g:link></li>
                <li><g:link class="list" controller="instalacion" action="index">Instalaciones</g:link></li>
                <li><g:link class="list" controller="modalidad" action="index">Modalidades</g:link></li>
                <li><g:link class="list" controller="material" action="index">Material</g:link></li>
                <li><g:link class="list" controller="solicitudMaterial"
                            action="index">Solicitudes Material</g:link></li>
                <li><g:link class="list" controller="zona" action="index">Zonas</g:link></li>
                <li><g:link class="list" controller="tipoActividad" action="index">Tipos de Actividad</g:link></li>
                <li><g:link class="list" controller="actividad" action="index">Actividades</g:link></li>
            </ul>
        </li></sec:ifAnyGranted>

    <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_USER,ROLE_MANAGER'>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">Entidades<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><g:link class="list" controller="entidad" action="index">Entidades</g:link></li>
                <li><g:link class="list" controller="contacto" action="index">Contactos</g:link></li>
                <li><g:link class="list" controller="nivelEuskera" action="index">Niveles Euskera</g:link></li>
                <li><g:link class="list" controller="titulacion" action="index">Titulaciones</g:link></li>
                <li><g:link class="list" controller="tecnico" action="index">Técnicos</g:link></li>
                <li><g:link class="list" controller="sesion" action="index">Sesiones</g:link></li>
                %{--<li><g:link class="list" controller="club" action="index">Clubes</g:link></li>--}%
                %{--<li><g:link class="list" controller="categoria" action="index">Categorías</g:link></li>--}%
            </ul>
        </li>
    </sec:ifAnyGranted>

    <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MANAGER'>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">Subvenciones<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><g:link class="list" controller="solicitud" action="index">Lista Solicitudes</g:link></li>
                <li><g:link class="create" controller="solicitud" action="create">Crear Solicitud</g:link></li>
            </ul>
        </li>
    </sec:ifAnyGranted>

    <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MANAGER, ROLE_USER'>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">Estadísticas<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MANAGER'>
                    <li><g:link class="list" controller="Estadisticas" action="index">Informe Subvenciones</g:link></li>
                </sec:ifAnyGranted>
                <li><g:link class="list" controller="Estadisticas" action="infEventos">Informe Eventos</g:link></li>
            </ul>
        </li>
    </sec:ifAnyGranted>

    <sec:ifAnyGranted roles='ROLE_ADMIN'>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">Seguridad<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li class="controller"><g:link controller="User" action="index">Usuarios</g:link></li>
                <li class="controller"><g:link controller="Role" action="index">Roles</g:link></li>
                <li class="controller"><g:link controller="UserRole" action="index">Roles-Usuarios</g:link></li>
            </ul>
        </li>
    </sec:ifAnyGranted>

    <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MANAGER, ROLE_USER'>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">Incidencias<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><g:link class="list" controller="Incidencia" action="index">Incidencias</g:link></li>
            </ul>
        </li>
    </sec:ifAnyGranted>

    <li><sec:ifLoggedIn><g:link controller='logout'>Cerrar Sesión</g:link></sec:ifLoggedIn></li>
    <li><sec:ifNotLoggedIn><g:link controller='login'>Identificarse</g:link></sec:ifNotLoggedIn></li>

</content>

<div class="svg" role="presentation">
    <div class="grails-logo-container">
        <asset:image src="gobela21/kirolak_apaisado_copiar_2.jpg" class="grails-logo"/>
    </div>
</div>

<div id="content" role="main">
    <section class="row colset-2-its">
        <h1>ULTIMOS CAMBIOS</h1>

        <h2>Modificaciones 11-06-2018</h2>
        <ul>
            <li>[Clubes] Corregido error check-in de sesiones</li>
        </ul>

        <h2>Modificaciones 27-05-2018</h2>
        <ul>
            <li>[Clubes] Exportación a Excel de datos de club</li>
            <li>[Clubes] Vista general de sesiones de entrenamiento</li>
            <li>[Clubes] Filtrado en vista general de sesiones de entrenamiento</li>
            <li>[Clubes] Añadido enlace a Sesiones en menú de Entidades</li>
            <li>[Clubes] Creado modal de verificación de sesiones de entrenamiento</li>
            <li>[Clubes] Cambios visuales en tabla de sesiones</li>
            <li>[Clubes] Creada entidad "Histórico de Sesiones"</li>
            <li>[Clubes] Creada lógica "Histórico de Sesiones"</li>
            <li>[Clubes] Creado modal de creación-edición "Histórico de Sesiones"</li>
        </ul>

        <h2>Modificaciones 01-05-2018</h2>
        <ul>
            <li>[Clubes] Creada relación Técnicos <-> Categorías</li>
            <li>[Clubes] Creada entidad Categoría</li>
            <li>[Clubes] Creada lógica de categorías vacías</li>
            <li>[Clubes] Creada plantilla de categoría</li>
            <li>[Clubes] Creada vista de asociación técnicos-categorías</li>
            <li>[Clubes] Añadida opción de categorías mixtas</li>
            <li>[Clubes] Categorías ordenadas por edad</li>
            <li>[Clubes] Añadida relación laboral a Técnicos</li>
            <li>[Clubes] Creada entidad Sesiones de Entrenamiento</li>
            <li>[Clubes] Creada lógica para Sesiones de Entrenamiento</li>
            <li>[Clubes] Creadas vista de creación de Sesiones de Entrenamiento</li>
            <li>[Clubes] Creadas vista de edición de Sesiones de Entrenamiento</li>
            <li>[Clubes] Generación automática de árbol de categorías por defecto</li>
            <li>[Clubes] Asignación directa de técnicos desde vista de categoría</li>
            <li>[Clubes] Varios árboles de categorías para un mismo club</li>
            <li>[Clubes] Modificada vista de fichas de categorías para soportar varios árboles de categorías para un mismo club</li>
            <li>[Clubes] Cambios en gestión de días de la semana para las sesiones de entrenamiento</li>
        </ul>

        <h2>Modificaciones 26-03-2018</h2>
        <ul>
            <li>[Clubes] Añadidos Niveles de Euskera</li>
            <li>[Clubes] Añadida vista creación de Niveles de Euslkera</li>
            <li>[Clubes] Añadida vista edición de Niveles de Euslkera</li>
            <li>[Clubes] Añadidas Titulaciones</li>
            <li>[Clubes] Añadida vista de creación de Titulaciones</li>
            <li>[Clubes] Añadida vista de edición de Titulaciones</li>
            <li>[Clubes] Añadidos Técnicos</li>
            <li>[Clubes] Añadida vista de creación de Técnicos</li>
            <li>[Clubes] Añadida vista de edición de Técnicos</li>
            <li>[Clubes] Añadidos Clubes</li>
            <li>[Clubes] Añadida vista de creación de Clubes</li>
            <li>[Clubes] Añadida vista de edición de Clubes</li>
            <li>[Clubes] Añadidas Asambleas</li>
            <li>[Clubes] Añadida vista de creación de Asamblea</li>
            <li>[Clubes] Añadida vista de edición de Asamblea</li>
        </ul>

        <h2>Modificaciones 20/03/2018</h2>
        <ul>
            <li>[Multikirolak] Añadido campo "Edad Mínima" a evento</li>
            <li>[Multikirolak] Edad mínima por defecto es 0</li>
        </ul>

        <h2>Modificaciones 19/03/2018</h2>
        <ul>
            <li>[Incidencias] Se establece el portentaje de ocupación por defecto en 100%</li>
            <li>[Incidencias] Se ha incrementado el tamaño del campo "Observaciones" de Evento a 5000 caracteres</li>
            <li>[Incidencias] Añadido filtrado de contactos por Entidad en vista de listado de contactos</li>
            <li>[Incidencias] Añadido filtrado de eventos por recinto</li>
            <li>[Incidencias] Añadido filtrado de eventos por Entidad Organizadora</li>
        </ul>

        <h2>Modificaciones 06/02/2018</h2>
        <ul>
            <li>[Incidencias] Creada entidad Incidencia</li>
            <li>[Incidencias] Creadas vistas para Incidencia</li>
            <li>[Incidencias] Añadido menú incidencias en página principal</li>
        </ul>

        <h2>Modificaciones 05/02/2018</h2>
        <ul>
            <li>Corregido valor del campo "Inclusivo" en vista de Informe de Evento</li>
        </ul>

        <h2>Modificaciones 04/02/2018 - 2</h2>
        <ul>
            <li>[Export eventos filtrados] Creada consulta</li>
            <li>[Export eventos filtrados] Añadido botón para exportación</li>
            <li>[Export eventos filtrados] Añadido lógica de exportación</li>
        </ul>
        <h2>Modificaciones 04/02/2018</h2>
        <ul>
            <li>Añadido campo "Deporte Inclusivo" a filtrado de eventos</li>
            <li>Cambiado "Multikirola" a combo en filtrado de eventos</li>
            <li>Cambiado "Deporte Adaptado" a combo en filtrado de eventos</li>
            <li>Añadido campo "Lugar" a filtrado de eventos</li>
            <li>Corregido error de pérdida de datos en campos al editar evento</li>
            <li>Modificado criterio de fechas para filtrado de eventos</li>
            <li>Creada entidad "Actividad" para definir los tipos de actividad actuales</li>
            <li>Creada vista para crear actividades</li>
            <li>Creada vista para editar actividades</li>
            <li>Creada vista para ver info de las actividades</li>
            <li>Añadido campo "Actividad" a Evento</li>
            <li>Añadido campo "Actividad" a vista de creación de Evento</li>
            <li>Añadido campo "Actividad" a vista de Evento</li>
            <li>Añadido campo "Actividad" a vista de clonar Evento</li>
            <li>Añadido campo "Actividad" a filtrado de Eventos</li>
            <li>Añadida entidad "Tipo de Actividad"</li>
            <li>Creada vista para añadir tipos de actividad</li>
            <li>Creada vista para editar tipos de actividad</li>
            <li>Creada vista para ver info de tipo de actividad</li>
            <li>[Perfil Lingüístico] Añadido campo para "Comunicación con GK" en Evento</li>
            <li>[Perfil Lingüístico] Añadido campo para "Comunicación con GK" en vista Evento</li>
            <li>[Perfil Lingüístico] Añadido campo para "Comunicación con GK" en vista crear Evento</li>
            <li>[Perfil Lingüístico] Añadido campo para "Comunicación con GK" en vista editar Evento</li>
            <li>[Perfil Lingüístico] Añadido campo para "Comunicación con GK" en vista clonar Evento</li>
            <li>[Perfil Lingüístico] Añadido campo para "desarrollo evento" en vista Evento</li>
            <li>[Perfil Lingüístico] Añadido campo para "desarrollo evento" en vista crear Evento</li>
            <li>[Perfil Lingüístico] Añadido campo para "desarrollo evento" en vista editar Evento</li>
            <li>[Perfil Lingüístico] Añadido campo para "desarrollo evento" en vista clonar Evento</li>
            <li>[Perfil Lingüístico] Añadido campo para "speaker" en vista Evento</li>
            <li>[Perfil Lingüístico] Añadido campo para "speaker" en vista crear Evento</li>
            <li>[Perfil Lingüístico] Añadido campo para "speaker" en vista editar Evento</li>
            <li>[Perfil Lingüístico] Añadido campo para "speaker" en vista clonar Evento</li>
            <li>[Informe Eventos] Crear consulta Total Eventos</li>
            <li>[Informe Eventos] Crear consulta Total Eventos relevantes</li>
            <li>[Informe Eventos] Crear consulta Total Eventos deporte adaptado</li>
            <li>[Informe Eventos] Crear consulta Total Eventos deporte inclusivo</li>
            <li>[Informe Eventos] Crear consulta Total Eventos por Recinto</li>
            <li>[Informe Eventos] Crear consulta Total Eventos por Lugar</li>
            <li>[Informe Eventos] Crear consulta Total Eventos por Tipo de Actividad</li>
            <li>[Informe Eventos] Crear consulta Total Eventos por Actividad</li>
            <li>[Informe Eventos] Crear consulta Total Eventos por Modalidad</li>
            <li>[Informe Eventos] Crear consulta Eventos por Perfil de género</li>
            <li>[Informe Eventos] Crear consulta Eventos por Perfil de edad</li>
            <li>[Informe Eventos] Crear consulta Eventos por Perfil lingüístico</li>
            <li>[Informe Eventos] Añadido link a informe de eventos en menú Estadísticas</li>
            <li>[Informe Eventos] Añadidos permisos a informe de eventos en menú Estadísticas</li>
            <li>[Informe Eventos] Creada vista de generación de informe de Eventos</li>
            <li>[Informe Eventos] Exportación a Excel de informe de Eventos</li>
        </ul>

        <h2>Modificaciones 21/01/2018</h2>
        <ul>
            <li>Corregido error al crear zonas nuevas</li>
            <li>Cambiado estado por defecto para eventos nuevos a "Confirmado"</li>
            <li>Añadido campo "% Ocupación" a Evento</li>
            <li>Añadido campo "Email Contacto" a Evento</li>
            <li>Añadido apartado de ficheros post-evento para Evento</li>
            <li>Añadido "Contactos" a menú de Entidades en página principal</li>
            <li>Añadida relación entre Contacto y Entidad</li>
            <li>Añadida lógica de contactos a Evento</li>
            <li>Añadida carga de datos de contacto al seleccionar uno en creación de eventos</li>
            <li>Añadidas fechas del evento como fechas por defecto para solicitudes de material</li>
            <li>Añadido "Concentración/Tecnificación" como tipo de actividad</li>
            <li>Cambiado formato de fechas de lista de materiales en vista de evento</li>
            <li>Corregido contacto en clonado de eventos</li>
            <li>Añadido campo "Deporte Inclusivo" a evento</li>
            <li>Añadido campo "Deporte Inclusivo a vista de evento</li>
            <li>Añadido campo "Deporte Inclusivo a vista de creación de evento</li>
            <li>Añadido campo "Deporte Inclusivo a vista de edición de evento</li>
            <li>Añadido campo "Deporte Inclusivo a clonado de evento</li>
            <li>Añadido "Contacto" a vista de evento</li>
            <li>Añadido "Email Contacto" a vista de evento</li>
            <li>Añadido "Instalación" a vista de evento</li>
            <li>Añadido "Zona" a vista de evento</li>
            <li>Añadido "Ocupación" a vista de evento</li>
            <li>Añadido "Público Destinatario" a vista de evento</li>
            <li>Añadido "Contacto" a clonado de evento</li>
            <li>Añadido "Email Contacto" a clonado de evento</li>
            <li>Añadido "Instalación" a clonado de evento</li>
            <li>Añadido "Zona" a clonado de evento</li>
            <li>Añadido "Ocupación" a clonado de evento</li>
            <li>Añadido "Público Destinatario" a clonado de evento</li>
            <li>Creada consulta de Solicitudes de Material por fechas y lugares</li>
            <li>Creada vista de filtrado de Solicitudes de Material</li>
            <li>Añadido descarga en Excel de informe de Solicitudes de Material por fechas y lugares</li>
            <li>Cambiado el criterio de ordenación de los eventos filtrados. Ahora se muestran en orden de fecha, estado, tipo de ctividad y modalidad</li>
            <li>Añadido filtrado de eventos por relevancia</li>
        </ul>

        <h2>Modificaciones 03/01/2018</h2>
        <ul>
            <li>Corregido error al crear entidades nuevas</li>
            <li>Añadido campo recinto a vista de evento</li>
            <li>Añadido campo instalación a vista de evento</li>
            <li>Añadido campo horario a vista de evento</li>
            <li>Añadido campo observaciones a vista de evento</li>
            <li>Cambiado formato de fechas en vista de evento</li>
        </ul>

        <h2>Modificaciones 29/12/2017</h2>
        <ul>
            <li>Añadido campo "horario" como texto libre en Evento</li>
            <li>Eliminado campo "Entidad colaboradora" de Evento</li>
            <li>Nombres de entidades en mayúsculas en combos de Evento</li>
            <li>Añadida búsqueda de entidades por nombre</li>
            <li>Añadida Instalaciones asociadas a los Recintos</li>
            <li>En Evento sólo se muestran las instalaciones del recinto seleccionado</li>
        </ul>

        <h2>Modificaciones 06/12/2017</h2>
        <ul>
            <li>Creada estructura de PDFs oficiales</li>
            <li>Añadido servicio de impresión de formularios PDF</li>
            <li>Añadida descarga de PDF oficial de balance de subvención</li>
            <li>Nombre de evento en mayúsculas en listado de eventos</li>
            <li>Deshabilitada la gestión de Stock para solicitudes de material</li>
        </ul>

        <h2>Modificaciones 15/11/2017:</h2>
        <ul>
            <li>Arreglado problema con menú en móviles</li>
            <li>Corregido error en creación de modalidad nueva</li>
        </ul>

        <h2>Modificaciones 8/11/2017:</h2>
        <ul>
            <li>Añadida lógica de filtrado de eventos</li>
            <li>Añadido registro de errores en fichero de texto</li>
            <li>Añadido formulario de filtrado de eventos</li>
            <li>Añadido template para tablaEventos</li>
            <li>Corregido label "Representa a una entidad" en Solicitud</li>
            <li>Cambiado formato de fechas en vista de evento</li>
        </ul>

        <h2>Modificaciones 5/11/2017:</h2>
        <ul>
            <li>Arreglado error en la creación de nuevas valoraciones con campo vacío</li>
        </ul>

        <h2>Modificaciones 3/11/2017:</h2>
        <ul>
            <li>Añadida entidad Zona</li>
            <li>Creadas vistas para Zona</li>
            <li>Creada relación Lugar-Zona</li>
            <li>Añadido enlace a Zonas en menú de Eventos</li>
            <li>Arreglos en maquetación de "Num Participantes" en Evento</li>
            <li>JS para control de combos de Zona-Lugar en creación de eventos</li>
            <li>JS para control de combos de Zona-Lugar en edición de eventos</li>
            <li>Habilitada gestión de ficheros para balance de ingresos y gastos de subvenciones</li>
            <li>Habilitada gestión de ficheros para justificaciones de subvenciones</li>
        </ul>

        <h2>Modificaciones 1/11/2017:</h2>
        <ul>
            <li>Habilitada subida de ficheros para Evento</li>
            <li>Creada vista de gestión de ficheros en Evento</li>
            <li>Añadido botón en Evento para la gestión de ficheros</li>
            <li>Habilitada la descarga de ficheros de Evento</li>
            <li>Añadido botón para el borrado de ficheros de Evento</li>
            <li>Añadida doble comprobación para el borrado de ficheros de evento</li>
            <li>Mejoras visuales en formulario de gestión de ficheros de evento</li>
            <li>Añadido JS de control para formulario de gestión de ficheros de evento</li>
            <li>Añadida navegación a vista de gestión de ficheros de evento</li>
        </ul>

        <h2>Modificaciones 29/10/2017:</h2>
        <ul>
            <li>Creadas vistas para acceso de usuarios</li>
            <li>Activada capa de seguridad</li>
            <li>Creados roles principales</li>
            <li>Creado mapeo de acceso por rol</li>
            <li>Upgrade de módulo de subvenciones a Grails 3</li>
            <li>Creado formulario de acceso de usuarios</li>
            <li>creadas vistas de gestión de usuarios</li>
            <li>creadas vistas de gestion de roles</li>
            <li>creadas vistas de asignación de roles a usuarios</li>
            <li>Creados botones de login y logout en menú superior</li>
            <li>Habilitada selección múltiple para valoraciones línea 3</li>
            <li>Añadida comprobación de suma total de puntuaciones por línea</li>
            <li>Añadido mensaje de error si la suma total de puntos supera los 100</li>
            <li>Deshabilitado botón de guardar valoración si la puntuación supera los 100 puntos</li>
            <li>Cambiado favicon</li>
            <li>Cambios menores en diseño</li>
            <li>Incrementado el número de eventos por página en índice de eventos</li>
            <li>Añadido campo hora a inicio de evento</li>
            <li>Añadida fecha y hora de fin de evento</li>
            <li>Añadida hora a fecha de entrega de solicitud de material</li>
            <li>Añadida hora a fecha de recogida de solicitud de material</li>
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
            <li>Arreglado problema con los despliegues con Tomcat7 y Tomcat embebido</li>
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
            <li>Arreglado problema con los despliegues con Tomcat7 y Tomcat embebido</li>
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
