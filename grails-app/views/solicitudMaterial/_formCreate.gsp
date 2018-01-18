<%@ page import="gobela.SolicitudMaterial" %>
<%@ page import="gobela.Material" %>
<%@ page import="gobela.Evento" %>

<input type="hidden" name="newId" value="${newId}"/>
%{--<input type="hidden" name="oldFechaEntrega" value="${oldFechaEntrega}"/>--}%
%{--<input type="hidden" name="oldLugarEntrega" value="${oldLugarEntrega}"/>--}%
%{--<input type="hidden" name="oldFechaDevolucion" value="${oldFechaDevolucion}"/>--}%
%{--<input type="hidden" name="oldLugarDevolucion" value="${oldLugarDevolucion}"/>--}%

<div class="fieldcontain required">
    %{--<label for="entrega">--}%
    <label>
        <g:message code="solicitudMaterial.entrega.label" default="Fecha de Entrega:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="entrega" precision="day" relativeYears="[-1..2]" value=""/>
    %{--<g:datePicker name="entrega" precision="day" relativeYears="[-1..2]" value="${solicitudMaterial?.entrega}"/>--}%
</div>

<div class="fieldcontain">
    %{--<label for="lugarEntrega">--}%
    <label>
        <g:message code="lugarEntrega.label" default="Lugar Entrega:"/>
    </label>
    <g:field type="text" name="lugarEntrega" id="lugarEntrega" value=""/>
    %{--<g:field type="text" name="lugarEntrega" id="lugarEntrega" value="${this.solicitudMaterial?.lugarEntrega}"/>--}%
</div>

<div class="fieldcontain required">
    %{--<label for="recogida">--}%
    <label>
        <g:message code="solicitudMaterial.recogida.label" default="Fecha de Recogida:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="recogida" precision="day" relativeYears="[-1..2]" value=""/>
    %{--<g:datePicker name="recogida" precision="day" relativeYears="[-1..2]" value="${solicitudMaterial?.recogida}"/>--}%
</div>

<div class="fieldcontain">
    %{--<label for="lugarDevolucion">--}%
    <label>
        <g:message code="lugardevolucion.label" default="Lugar de Recogida:"/>
    </label>
    <g:field type="text" name="lugarDevolucion" id="lugarDevolucion" value=""/>
    %{--<g:field type="text" name="lugarDevolucion" id="lugarDevolucion" value="${this.solicitudMaterial?.lugarDevolucion}"/>--}%
</div>

<div class="fieldcontain">
    %{--<label for="observaciones">--}%
    <label>
        <g:message code="solicitudMaterial.observaciones.label" default="Observaciones:"/>
    </label>
    <g:textArea name="observaciones" cols="60" rows="15" maxlength="2000" value=""/>
    %{--<g:textArea name="observaciones" cols="60" rows="15" maxlength="2000" value="${this.solicitudMaterial?.observaciones}"/>--}%
</div>

<div class="fieldcontain">
    <hr>
</div>

<div class="fieldcontain ${hasErrors(bean: material, field: 'recinto', 'error')} required">
    %{--<label for="material">--}%
    <label>
        <g:message code="material.label" default="Material:"/>
    </label>
    <g:select name="material"
              from="${Material.listOrderByNombre()}"
              value="${material?.nombre})"
              noSelection="${['': 'Selecciona un material...']}"
              optionKey="id"
              optionValue="nombre"/>
</div>

%{--<div class="fieldcontain" id="stock-container">
    <label for="stock">
        <g:message code="stock.label" default="Disponible" readonly="true"/>
    </label>
    <g:field type="number" name="stock" id="stock" readonly="true"/>
</div>--}%

<div class="fieldcontain">
    %{--<label for="cantidad">--}%
    <label>
        <g:message code="cantidad.label" default="Cantidad:"/>
    </label>
    <g:field type="number" name="cantidadMat" id="cantidadMat"/>
</div>

<div class="fieldcontain">
    <label for="comentarios">
        <g:message code="comentarios.label" default="Comentarios Material:"/>
    </label>
    <g:textArea name="comentarios" cols="60" rows="15" maxlength="2000"
                value=""/>
    %{--value="${this.solicitudMaterial?.observaciones}"/>--}%

    <button class="btn btn-dark btn-addMat" type="button" onclick="addMaterial(${eventId})">Añadir</button>
    %{--<button class="btn btn-dark btn-addMat" type="button" onclick="addMaterial(${params.eventoId})">Añadir</button>--}%

</div>

<div class="table-responsive tabla-material">


    <table name="lista-solicitudes">
        <thead>
        <tr>
            <th>Solicitud</th>
            <th>Material</th>
            <th>Cantidad</th>
            <th>Fecha Entrega</th>
            <th>Lugar Entrega</th>
            <th>Fecha Devolución</th>
            <th>Lugar Devolución</th>
            <th>Comentarios Material</th>
            <th>Observaciones</th>
            <th></th>
        </tr>
        </thead>
        <tbody id="lista-material">
        <g:each in="${SolicitudMaterial.findAllByEvento(Evento.get(eventId))}" var="solicitudMaterial" status="i">
            <tr rowIndex="${i}" rowId="${fieldValue(bean: solicitudMaterial, field: "id")}" class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link controller="solicitudMaterial" action="show" id="${solicitudMaterial.id}">
                    ${fieldValue(bean: solicitudMaterial, field: "id")}
                </g:link>
                </td>
                <td>${fieldValue(bean: solicitudMaterial, field: "material")}</td>
                <td>${fieldValue(bean: solicitudMaterial, field: "cantidad")}</td>
                <td><g:formatDate date="${solicitudMaterial.fechaEntrega}" format="dd-MM-yyyy"/></td>
                <td>${fieldValue(bean: solicitudMaterial, field: "lugarEntrega")}</td>
                <td><g:formatDate date="${solicitudMaterial.fechaDevolucion}" format="dd-MM-yyyy"/></td>
                <td>${fieldValue(bean: solicitudMaterial, field: "lugarDevolucion")}</td>
                <td>${fieldValue(bean: solicitudMaterial, field: "comentarios")}</td>
                <td>${fieldValue(bean: solicitudMaterial, field: "observaciones")}</td>
                <td><input class="btn-danger" type="button" value="Borrar" onclick="deleteMaterial(this)"/></td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>


