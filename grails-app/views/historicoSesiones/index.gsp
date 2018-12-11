<%@ page import="gobela.Club" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'historicoSesiones.label', default: 'Histórico Sesiones')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-historicoSesiones" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                        default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        %{--<li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>--}%
    </ul>
</div>

<div id="list-historicoSesiones" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div class="row">
        <div id="filtro">
            <g:form method="POST" action="exportarListadoHistoricoSesiones">
                <fieldset>
                    <div class="fieldcontain">
                        <label for="filtrofechadesde">Fecha desde</label>
                        <input name="filtrofechadesde" id="filtrofechadesde" type="date">
                    </div>

                    <div class="fieldcontain">
                        <label for="filtrofechahasta">Fecha hasta</label>
                        <input name="filtrofechahasta" id="filtrofechahasta" type="date"
                               value="${new Date().format('yyyy-MM-dd')}">
                    </div>

                    <div class="fieldcontain">
                        <label for="filtroclub">Club</label>
                        <g:select name="filtroclub" id="filtroclub"
                                  from="${gobela.Club.list(sort: "entidad.nombreEntidad", order: "asc")}"
                                  optionKey="id"
                                  noSelection="['null': 'Selecciona un club...']">
                        </g:select>
                    </div>

                    <div class="fieldcontain">
                        <label for="combofiltrocategoria">Categoria</label>
                        <span id="combofiltrocategoria">
                            <g:render template="filtroCategoria"/>
                        </span>
                    </div>


                    <div class="fieldcontain">
                        <label for="filtrorecinto">Recinto</label>
                        <g:select name="filtrorecinto" id="filtrorecinto"
                                  from="${gobela.Recinto.list(sort: "nombre", order: "asc")}"
                                  optionKey="id"
                                  noSelection="['null': 'Selecciona un recinto...']">
                        </g:select>
                    </div>

                    <div class="fieldcontain">
                        <label for="combofiltroinstalaciones">Instalación</label>
                        <span id="combofiltroinstalaciones">
                            <g:render template="filtroInstalaciones"/>
                        </span>
                    </div>



                    <div class="fieldcontain">
                        <label for="filtroresultado">Resultado</label>
                        <g:select name="filtroresultado"
                                  from="['OK', 'NO OK']"
                                  noSelection="['null': 'Resultado...']"
                                  id="filtroresultado"
                                  keys="[true, false]"/>
                    </div>

                    <div class="row fieldcontain" style="display: flow">
                        <a href="#" id="btnfiltrar" class="btn btn-info"
                           style="margin-left: 25%; text-decoration: none">Filtrar</a>

                        <g:actionSubmit class="btn btn-info" value="Descargar"
                                        action="exportarListadoHistoricoSesiones"/>
                    </div>
                </fieldset>
            </g:form>
        </div>
    </div>

    <div class="row" id="tablaListaSesiones">
        <g:render template="listaHistoricoSesiones"/>
        %{--<g:render template="listaHistoricoSesiones" model="[historicoSesionesList: historicoSesionesList, historicoSesionesCount: historicoSesionesList.size()]"/>--}%
        %{--<div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Club</th>
                    <th>Categoria</th>
                    <th>Sesión</th>
                    <th>Participantes</th>
                    <th>Ocupación</th>
                    <th>Resultado</th>
                    <th>Observaciones</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${historicoSesionesList}" var="hs">
                    <tr>
                        <td><g:link controller="historicoSesiones" action="show"
                                    id="${hs.id}">${formatDate(format: "dd-MM-yyyy", date: hs.fecha)}</g:link></td>
                        <td><g:link
                                uri="/club/show?entidadId=${hs.sesion.categoria.club.entidadId}">${hs.sesion.categoria.club}</g:link></td>
                        <td><g:link uri="/categoria/show/${hs.sesion.categoria.id}">${hs.sesion.categoria}</g:link></td>
                        <td><g:link uri="/sesion/show/${hs.sesion.id}">${hs.sesion}</g:link></td>
                        <td>${hs.participantes}</td>
                        <td>${hs.ocupacion}</td>
                        <td>
                            <g:if test="${hs.resultadoOk}">
                                OK
                            </g:if>
                            <g:else>
                                NO OK
                            </g:else>
                        </td>
                        <td>${hs.observaciones}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>

    <div class="pagination">
        <g:paginate total="${historicoSesionesCount ?: 0}"/>
    </div>--}%
    </div>


    <g:javascript>

        $('#btnfiltrar').on('click', function () {
            let params = '?';

            let fdesde = $('#filtrofechadesde').val();
            fdesde = (fdesde.length > 0) ? fdesde : 'null';
            params = params + 'fdesde=' + fdesde;
            let fhasta = $('#filtrofechahasta').val();
            fhasta = (fhasta.length > 0) ? fhasta : 'null';
            params = params + '&fhasta=' + fhasta;
            const clubId = $('#filtroclub').val();
            params = params + '&clubId=' + clubId;
            const categoriaId = $('#filtrocategoria').val();
            params = params + '&categoriaId=' + categoriaId;

            const recintoId = $('#filtrorecinto').val();
            params = params + '&recintoId=' + recintoId;

            const instalacionId = $('#filtroinstalaciones').val();
            params = params + '&instalacionId=' + instalacionId;

            const resultado = $('#filtroresultado').val();
            params = params + '&resultado=' + resultado;

            let url = '/gobela/historicoSesiones/filtraHistoricoSesiones/' + params;
            console.log(url);

            $.ajax({
                url: url,
                method: "GET",
                success: function (data) {
                    console.log(data);
                    $('#tablaListaSesiones').html(data);
                },
                error: function (error) {
                    console.log(error);
                }
            })
        });

        $('#filtroclub').on('change', function () {
            const clubId = $(this).val();
            if (clubId == 'null') {
                $('#filtrocategoria').val('null');
            } else {
                let url = '/gobela/historicoSesiones/filtraCategoriasPorClub/?clubId=' + clubId.toString();

                $.ajax({
                    url: url,
                    method: "GET",
                    success: function (data) {
                        console.log(data);
                        $('#combofiltrocategoria').html(data);
                    },
                    error: function (error) {
                        console.log(error);
                    }
                })
            }
        });

        $('#filtrorecinto').on('change', function () {
            const recintoId = $(this).val();
            if (recintoId == 'null') {
                $('#filtroinstalaciones').val('null');
            } else {
                let url = '/gobela/historicoSesiones/filtraInstalacionesPorRecinto/?recintoId=' + recintoId.toString();

                $.ajax({
                    url: url,
                    method: "GET",
                    success: function (data) {
                        console.log(data);
                        $('#combofiltroinstalaciones').html(data);
                    },
                    error: function (error) {
                        console.log(error);
                    }
                })
            }
        });

    </g:javascript>
</body>
</html>