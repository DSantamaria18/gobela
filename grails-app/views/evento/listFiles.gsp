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
                                params='[fileId: infoDoc.nombre.replace(".", "###"),
                                         eventoId: params.eventoId,
                                         tipo: "info"]'>
                            <input type="button" class="btn btn-success" value="Descargar"/>
                        </g:link>

                    </td>
                    <td>
                        <g:link class="delete"
                                action="deleteFile"
                                params='[fileId  : infoDoc.nombre.replace(".", "###"),
                                         eventoId: params.eventoId,
                                         folder  : "info"]'>
                            <input type="button" class="btn btn-danger" value="Borrar"
                                   onclick="return confirm('El fichero se borrará. ¿Estás seguro/a?');"/>
                        </g:link>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="container">
        <div class="col-md-8 col-md-offset-2">
            <h3>Subir Fichero</h3>
            <form method="POST" action="#" enctype="multipart/form-data">
                <div class="form-group">
                    <div class="input-group input-file" name="Fichier1">
                        <span class="input-group-btn">
                            <button class="btn btn-dark btn-choose" type="button" onclick="buscar()">Buscar</button>
                        </span>
                        <input type="text" class="form-control" id="fileNameInput" placeholder='Selecciona un fichero...' readonly />
                        %{--<input type="hidden" name="eventoId" value="${params.eventoId}"/>--}%
                        <input type="hidden" name="tipo" value="info"/>
                        <span class="input-group-btn">
                            <g:actionSubmit class="btn btn-primary" value="Subir" action="uploadFile"/>
                        </span>
                        <input type="file" class="form-control" id="fileUpload" name="fileUpload"
                               onchange="copyFileName()"
                               style="visibility:hidden";/>
                    </div>
                </div>
            </form>
        </div>
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