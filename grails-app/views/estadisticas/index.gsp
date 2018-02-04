<%--
  Created by IntelliJ IDEA.
  User: David
  Date: 26/03/2017
  Time: 17:41
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Estadísticas</title>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>
<g:each in="${resultList}" var="resultado" status="i">
    <g:if test="${resultado.size() > 0}">
        <div class="queryResult" id="resultDivL${i}">
            <br>
            <h4>SUBVENCIONES LINEA ${i + 1}</h4>
            <br>
            <table>
                <thead>
                <tr>
                    <g:each in="${resultado[0].keySet()}" var="header">
                        <g:sortableColumn property="header${i}" title="${header}"/>
                    </g:each>
                </tr>
                </thead>
                <tbody>
                <g:each in="${resultado}" var="fila" status="j">
                    <tr class="${(j % 2) == 0 ? 'even' : 'odd'}">
                        <td>${fila.entidad}</td>
                        <td>${fila.solicitante}</td>
                        <td><g:formatNumber number="${fila.concedido}" type="currency" currencyCode="EUR" locale="es_ES"/></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </g:if>
</g:each>
<fieldset class="buttons">
    <g:link class="edit" controller="estadisticas" action="exportarInformeSub">Descargar Informe</g:link>
</fieldset>
</body>
</html>