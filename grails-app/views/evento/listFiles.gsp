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
                    <td>
                    <g:link action="downloadFile"
                            params='[fileId: infoDoc.nombre.replace(".", "###"), eventoId: params.eventoId]'>
                        <input type="button" class="btn btn-info" value="Descargar"/>
                    </g:link>

                    </td>
                    <td>
                        <g:link class="delete"
                                action="deleteFile"
                                params='[fileId: infoDoc.nombre.replace(".", "###"), eventoId: params.eventoId]'>
                            <input type="button" class="btn btn-danger" value="Borrar"
                                   onclick="return confirm('El fichero se borrará. ¿Estás seguro/a?');"/>
                        </g:link>
                    </td>
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
                    <td>
                        <g:link action="downloadFile"
                                params='[fileId: infoDoc.nombre.replace(".", "###"), eventoId: params.eventoId]'>
                            <input type="button" class="btn btn-info" value="Descargar"/>
                        </g:link>

                    </td>
                    <td>
                        <g:link class="delete"
                                action="deleteFile"
                                params='[fileId: infoDoc.nombre.replace(".", "###"), eventoId: params.eventoId]'>
                            <input type="button" class="btn btn-danger" value="Borrar"
                                   onclick="return confirm('El fichero se borrará. ¿Estás seguro/a?');"/>
                        </g:link>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

</div>--}%
</body>
</html>