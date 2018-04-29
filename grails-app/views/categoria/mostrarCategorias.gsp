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
        grid-template-columns: auto auto auto auto;
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
            <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                                  args="[entityName]"/></g:link></li>
        </g:if>
    </ul>
</div>

<div id="show-evento" class="content scaffold-show" role="main">
    <input type="hidden" id="club_id" value="${clubId}"/>
    <g:if test="${categoriasCount > 0}">
    %{--<div id="list-categoria" class="content scaffold-list" role="main">
        --}%%{--<h1><g:message code="default.list.label" args="[entityName]"/></h1>--}%%{--
        <h1>${categoriasList[0].club.entidad.nombreEntidad} - ${categoriasList[0].modalidad.nombre}</h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <f:table collection="${categoriasList}"/>

        <div class="pagination">
            <g:paginate total="${categoriasCount ?: 0}"/>
        </div>
    </div>--}%
        <div class="container-fluid">
            <h1>CATEGORIAS ${categoriasList[0].club} ${categoriasList[0].modalidad}</h1>

            <section class="row ">
                <div class="grid-container" id="grid-categorias">
                    <g:each in="${categoriasList}" var="categoria" status="i">
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
                                                <g:each in="${categoria?.tecnicosCategorias}" status="j"
                                                        var="tecnico">
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
                                                <g:each in="${categoria?.sesiones}" status="k"
                                                        var="sesion">
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
            <label for="modalidad">Selecciona una modalidad</label>
            <g:select name="modalidad"
                      from="${Modalidad.listOrderByNombre()}"
                      value="${id}"
                      noSelection="${['': 'Selecciona...']}"
                      optionKey="id"
                      optionValue="nombre"/>
            <span><input type="button" class="btn btn-primary" onclick="generarArbolCategorias();"
                         value="Generar Categorias"/></span>
        </div>
    </div>
    %{--</g:else>--}%

</div>

<g:javascript>

    function generarArbolCategorias() {
        var res = confirm('Se generará un nuevo árbol de categorías. ¿Estás seguro/a?');
        // console.log(res);
        if (res) {
            var modalidadId = $('[name="modalidad"]').val();
            console.log(modalidadId);
            var clubId = $('#club_id').val();
            console.log(clubId);

            $.post("/gobela/categoria/generarArbolCategorias", {
                modalidadId: modalidadId,
                clubId: clubId
            }, function (data, status) {
                console.log(status);
            });
        }
    }

</g:javascript>

</body>
</html>