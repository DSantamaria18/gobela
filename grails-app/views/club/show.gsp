<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'club.label', default: 'Club')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>

    <style>

    .grid-container {
        display: grid;
        grid-template-columns: auto auto;
        padding: 10px;
        justify-content: space-evenly;
    }

    @media (max-width: 600px) {
        .grid-container {
            display: grid;
            grid-template-columns: auto;
            padding: 10px;
            justify-content: space-evenly;
        }
    }

    </style>

</head>

<body>
<a href="#show-club" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" controller="asamblea" action="create"
                    params="['clubId': club.id]">Añadir Asamblea</g:link></li>
        <li><g:link class="list" controller="categoria" action="mostrarCategorias"
                    params="['clubId': club.id]">Categorías</g:link></li>
        <li><g:link class="list" controller="club" action="exportaClub" params="['clubId': club.id]">Exportar a Excel</g:link> </li>
    </ul>
</div>

<div class="container">
    <div id="show-club" class="content scaffold-show" role="main">
        <h1>${this.club.entidad.nombreEntidad}</h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <br/>
        <h5>Datos Generales</h5>
        <dl class="dl-horizontal">
            <dt><span id="nombre-label" class="property-label">Nombre Club:</span></dt>
            <dd><span class="property-value" aria-labelledby="nombre-label">${this.club.entidad.nombreEntidad}</span>
            </dd>
            <dt><span id="fundacion-label" class="property-label">Fecha Fundación:</span></dt>
            <dd><span class="property-value" aria-labelledby="fundacion-label"><g:formatDate format="dd-MM-yyyy"
                                                                                             date="${this.club.fechaFundacion}"/></span>
            </dd>
            <dt><span id="elecciones-label" class="property-label">Fecha Elecciones:</span></dt>
            <dd><span class="property-value" aria-labelledby="elecciones-label"><g:formatDate format="dd-MM-yyyy"
                                                                                              date="${this.club.fechaElecciones}"/></span>
            </dd>
            <dt><span id="directivos-label" class="property-label">Nº Directivos:</span></dt>
            <dd><span class="property-value" aria-labelledby="directivos-label">${this.club.numDirectivos}</span></dd>
            <dt><span id="canetGK-label" class="property-label">Carnet GK:</span></dt>
            <g:if test="${this.club.carnetGK}">
                <dd><i class="glyphicon glyphicon-ok"></i></dd>
            </g:if>
            <g:else>
                <dd><i class="glyphicon glyphicon-remove"></i></dd>
            </g:else>
        </dl>

        <br/>
        <hr>
        <br/>

        <g:if test="${categoriasList?.size() > 0}">
            <g:each in="${categoriasList}" var="categoriasModalidad">
                <h5>${categoriasModalidad[0].modalidad}</h5>
                <br/>
                <h4>Nº Deportistas:</h4>
                <br/>
                <table class="table table-responsive" style="max-width: 200px">
                    <thead>
                    <tr>
                        <th>Categoría</th>
                        <th>Nº</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${categoriasModalidad}" var="categoria">
                        <tr>
                            <td>${categoria.nombre} ${categoria.sexo}</td>
                            <td>${categoria.numDeportistas}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </g:each>
        </g:if>

        <br/>
        <hr>
        <br/>

        <g:if test="${tecnicosList?.size() > 0}">
            <h5>Técnicos:</h5>
            <br/>
            <table class="table-responsive table-condensed">
                <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Titulación</th>
                    <th>Euskera</th>
                    %{--<th>Nivel</th>--}%
                    <th>Contrato</th>
                    <th>Antigüedad</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${tecnicosList}" var="tecnico">
                    <tr>
                        <td class="text-uppercase">${tecnico?.nombre} ${tecnico.apellidos}</td>
                        <td>${tecnico?.titulacion}</td>
                        <td>${tecnico?.nivelEuskera}</td>
                        %{--<td>${tecnico?.nivel}</td>--}%
                        <td>
                            <g:if test="${tecnico?.contrato}">
                                <i class="glyphicon glyphicon-ok"></i>
                            </g:if><g:else>
                            <i class="glyphicon glyphicon-remove"></i>
                        </g:else>
                        </td>
                        <td>${tecnico?.antiguedad}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </g:if>

        <br/>
        <hr>
        <br/>

        <g:if test="${tecnicosList?.size() > 0}">
            <h5>Instalaciones:</h5>
            <br/>
            <table class="table-responsive">
                <thead>
                <tr>
                    <th>Recinto</th>
                    <th>Instalación</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${instalacionesList}" var="instalacion">
                    <tr>
                        <td>${instalacion.recinto}</td>
                        <td>${instalacion.nombreInstalacion}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </g:if>

        <br/>
        <hr>
        <br/>

        <g:if test="${sesionesList?.size() > 0}">
            <h5>Sesiones:</h5>
            <br/>

            <div class="container-fluid" id="container-grid">
                <section class="row ">
                    <div class="grid-container" id="grid-sesiones">
                        <g:each in="['LUNES', 'MARTES', 'MIERCOLES', 'JUEVES', 'VIERNES', 'SABADO', 'DOMINGO']"
                                var="dia" status="j">
                            <div class="grid-item">
                                <div class="list-sesion-item thumbnail">
                                    <div class="caption">
                                        <h1 class="text-center text-uppercase"><strong>${dia}</strong></h1>
                                        <g:each in="${sesionesList[j]}" var="sesion">
                                            <div class="list-sesion-sesiones">
                                                ${sesion.categoria} ${sesion.horaInicio}-${sesion.horaFin} [${sesion.recinto} - ${sesion.instalacion} (${sesion.ocupacion}%)]
                                            </div>
                                        </g:each>
                                    </div>
                                </div>
                            </div>
                        </g:each>
                    </div>
                </section>
            </div>
        </g:if>


        <br/>
        <hr>
        <br/>

        <g:if test="${asambleasList?.size() > 0}">
            <h5>Asambleas:</h5>
            <br/>
            <table class="table table-responsive">
                <thead>
                <tr>
                    <td>Asamblea</td>
                    <td>Fecha</td>
                </tr>
                </thead>
                <tbody>
                <g:each in="${asambleasList}" var="asamblea">
                    <tr>
                        <td><g:link controller="asamblea" action="show" params="[id: asamblea.id]">${asamblea.nombre}</g:link></td>
                        <td><g:formatDate format="dd-MM-yyyy" date="${asamblea.fecha}"/></td>
                    </tr>

                </g:each>
                </tbody>
            </table>

        </g:if>

        <g:form resource="${this.club}" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${this.club}"><g:message code="default.button.edit.label"
                                                                                      default="Edit"/></g:link>
                <input class="delete" type="submit"
                       value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                       onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>