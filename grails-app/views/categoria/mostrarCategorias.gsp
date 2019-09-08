<%@ page import="gobela.Modalidad" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>

    <style>

    .grid-container {
        display: grid;
        grid-template-columns: auto auto auto;
        padding: 10px;
        justify-content: space-evenly;
    }

    @media (max-width: 1000px) {
        .grid-container {
            display: grid;
            grid-template-columns: auto auto;
            padding: 10px;
            justify-content: space-evenly;
        }
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
<a href="#list-categoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <g:if test="${categoriasCount > 0}">
            <li><g:link class="create" action="create" params="['clubId': clubId]"><g:message code="default.new.label"
                                                                                              args="[entityName]"/></g:link></li>
        </g:if>
    </ul>
</div>

<div id="show-evento" class="content scaffold-show" role="main">
    <input type="hidden" id="club_id" value="${clubId}"/>
    <g:if test="${categoriasCount > 0}">
        <div class="container-fluid" id="container-grid">
            <g:each in="${categoriasList}" var="categoriasModalidad" status="i">
                <h1>CATEGORIAS ${categoriasModalidad[0].club} ${categoriasModalidad[0].modalidad}</h1>

                <section class="row ">
                    <div class="grid-container" id="grid-categorias">
                        <g:each in="${categoriasModalidad}" var="categoria">
                            <div class="grid-item" id="${categoria.id}">
                                <g:link controller="categoria" action="show" params="[id: categoria.id]"
                                        class="link-categoria" style="text-decoration: none">

                                    <div class="list-cat-item thumbnail">
                                        <div class="caption">
                                            <h1 class="text-center text-uppercase"><strong>${categoria.nombre} ${categoria.sexo}</strong>
                                            </h1>

                                            <div class="list-cat-edades">
                                                <span class="text-capitalize">
                                                    ${categoria.edadMin} - ${categoria.edadMax} años
                                                </span>
                                            </div>

                                            <div class="list-cat-deportistas">
                                                <span>${categoria.numDeportistas}</span> Deportistas
                                            </div>

                                            <g:if test="${categoria?.tecnicosCategorias.size() > 0}">
                                                <div class="list-cat-tecnicos">
                                                    <h2 class="text-center text-uppercase">TECNICOS</strong></h2>
                                                    <g:each in="${categoria?.tecnicosCategorias}" var="tecnico">
                                                        <g:if test="${tecnico.principal}">
                                                            <span class="pull-left" style="padding-right: 10px;"><i
                                                                    class="glyphicon glyphicon-check"></i></span>
                                                        </g:if>
                                                        <span>${tecnico}</span>
                                                        <br/>
                                                    </g:each>
                                                </div>
                                            </g:if>

                                            <g:if test="${categoria?.sesiones.size() > 0}">
                                                <div class="list-cat-sesiones">
                                                    <h2 class="text-center text-uppercase">SESIONES</strong></h2>
                                                    <g:each in="${categoria?.sesiones}" var="sesion">
                                                        <span>${sesion}</span>
                                                        <br/>
                                                    </g:each>
                                                </div>
                                            </g:if>

                                        </div>
                                    </div>
                                </g:link>
                            </div>
                        </g:each>
                    </div>
                </section>
            </g:each>
        </div>
    </g:if>

    <g:else>
        <h1>No existe ningún árbol de categorias definido para este club.</h1>
    </g:else>

    <div class="message" role="status">
        <span>Si quieres generar un nuevo árbol completo, selecciona la modalidad y pincha en el siguiente botón:</span>
        <br/>
    </div>

    <div class="property-list">
        <div class="fieldcontain">
            <label for="modalidad">Selecciona una</label>
            <g:select name="modalidad"
                      from="${Modalidad.listOrderByNombre()}"
                      value="${id}"
                      noSelection="${['': 'Modalidad...']}"
                      optionKey="id"
                      optionValue="nombre"/>
            <span><input type="button" class="btn btn-primary" onclick="generarArbolCategorias();"
                         value="Generar Categorias"/></span>
        </div>
    </div>

</div>
</body>
</html>