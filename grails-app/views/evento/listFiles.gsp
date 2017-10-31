<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Document List</title>
</head>

<body>
<div class="content scaffold-list" role="main">
    <h1>Información y Carteles</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div id="success"></div>

    <div class="list">
        <table>
            <thead>
            <tr>
                <th>Fichero</th>
                <th>Tamaño (bytes)</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${infoDocsList}" status="i" var="infoDoc">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    <td>${infoDoc.nombre.decodeURL()}</td>
                    <td>${infoDoc.tamaño.decodeURL()}</td>
                    <td><a href="${createLinkTo(dir: 'images', file: infoDoc.decodeURL(), absolute: true)}"
                           target="_new">Descargar${i}</a></td>
                    <td><g:link action="delete" id="${infoDoc.replace('.', '###')}"
                                onclick="return confirm('El fichero se borrará. ¿Estás seguro/a?');">Borrar</g:link></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>

<br/>
<hr>
<br/>

%{--<div class="content scaffold-list" role="main">
    <h1>Solicitudes y Permisos</h1>
    <g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="nombre" title="Nombre" />
            <g:sortableColumn property="fechaSubida" title="Fecha de Subida" />
        </tr>
        </thead>
        <tbody>
        <g:each in="${eventDocList}" status="i" var="eventDoc">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link action="download" id="${eventDoc.id}">${eventDoc.nombre}</g:link></td>
                <td><g:formatDate date="${eventDoc.fechaSubida}" /></td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${eventDocListCount}" />
    </div>
</div>--}%
</body>
</html>