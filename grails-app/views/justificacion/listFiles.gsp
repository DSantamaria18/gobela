<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Document List</title>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link action="show" params="[id: params.justificacionId]">Volver</g:link> </li>
    </ul>
</div>

<div class="content scaffold-list" role="main">
    <h1>Ficheros de Justificación</h1>
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
            <g:each in="${justificacionesDocsList}" status="i" var="justificacionDoc">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    <td>${justificacionDoc.nombre.decodeURL()}</td>
                    <td>${justificacionDoc.tamaño.decodeURL()}</td>
                    <td>
                        <g:link action="downloadFile"
                                params='[fileId  : justificacionDoc.nombre.replace(".", "###"),
                                         justificacionId: params.justificacionId]'>
                            <input type="button" class="btn btn-success" value="Descargar"/>
                        </g:link>

                    </td>
                    <td>
                        <g:link class="delete"
                                action="deleteFile"
                                params='[fileId  : justificacionDoc.nombre.replace(".", "###"),
                                         justificacionId: params.justificacionId]'>
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
                    <div class="input-group input-file" name="justificacionFiles">
                        <span class="input-group-btn">
                            <button class="btn btn-dark btn-choose" type="button" onclick="buscar('justificacion')">Buscar</button>
                        </span>
                        <input type="text" class="form-control" id="justificacionFileNameInput"
                               placeholder='Selecciona un fichero...' readonly/>
                        <span class="input-group-btn">
                            <g:actionSubmit class="btn btn-primary" value="Subir" action="uploadJustificacionFile"/>
                        </span>
                        <input type="file" class="form-control" id="justificacionFileUpload" name="justificacionFileUpload"
                               onchange="copyFileName('justificacion')"
                               style="visibility:hidden" ;/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>