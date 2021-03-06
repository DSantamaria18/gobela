// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'gobela.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'gobela.UserRole'
grails.plugin.springsecurity.authority.className = 'gobela.Role'
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
        [pattern: '/', access: ['permitAll']],
        [pattern: '/error', access: ['permitAll']],
        [pattern: '/index', access: ['permitAll']],
        [pattern: '/index.gsp', access: ['permitAll']],
        [pattern: '/shutdown', access: ['permitAll']],
        [pattern: '/assets/**', access: ['permitAll']],
        [pattern: '/**/js/**', access: ['permitAll']],
        [pattern: '/**/css/**', access: ['permitAll']],
        [pattern: '/**/images/**', access: ['permitAll']],
        [pattern: '/**/fonts/**', access: ['permitAll']],
        [pattern: '/**/favicon.ico', access: ['permitAll']],
        [pattern: '/User/**', access: ['ROLE_ADMIN']],
        [pattern: '/Role/**', access: ['ROLE_ADMIN']],
        [pattern: '/UserRole/**', access: ['ROLE_ADMIN']],
        [pattern: '/Solicitud/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER']],
        [pattern: '/Estadisticas/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/Estadisticas/index', access: ['ROLE_ADMIN', 'ROLE_MANAGER']],
        [pattern: '/Balance/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER']],
        [pattern: '/Memoria/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER']],
        [pattern: '/Justificacion/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER']],
        [pattern: '/Valoracion/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER']],
        [pattern: '/Evento/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/Lugar/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/Recinto/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/Modalidad/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/Material/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/SolicitudMaterial/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/Entidad/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/Club/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/Zona/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/Instalacion/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/Contacto/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/Actividad/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/TipoActividad/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/Incidencia/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/NivelEuskera/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/Titulacion/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/Tecnico/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/Categoria/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/TecnicoCategoria/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/Sesion/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/Asamblea/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/HistoricoSesiones/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']]

]

grails.plugin.springsecurity.filterChain.chainMap = [
        [pattern: '/assets/**', filters: 'none'],
        [pattern: '/**/js/**', filters: 'none'],
        [pattern: '/**/css/**', filters: 'none'],
        [pattern: '/**/images/**', filters: 'none'],
        [pattern: '/**/favicon.ico', filters: 'none'],
        [pattern: '/**', filters: 'JOINED_FILTERS']
]