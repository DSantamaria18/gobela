<%@ page import="gobela.SolicitudMaterial" %>
<%@ page import="gobela.Material" %>

<input type="hidden" name="evento" value="${params.eventoId}"/>

<div class="fieldcontain ${hasErrors(bean: solicitudMaterial, field: 'entrega', 'error')} required">
    <label for="entrega">
        <g:message code="solicitudMaterial.entrega.label" default="Fecha de Entrega:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="entrega" precision="minute" relativeYears="[-1..2]" value="${solicitudMaterial?.entrega}"/>
</div>

<div class="fieldcontain">
    <label for="lugarEntrega">
        <g:message code="lugarEntrega.label" default="Lugar Entrega:"/>
    </label>
    <g:field type="text" name="lugarEntrega" id="lugarEntrega" value="${this.solicitudMaterial?.lugarEntrega}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudMaterial, field: 'recogida', 'error')} required">
    <label for="recogida">
        <g:message code="solicitudMaterial.recogida.label" default="Fecha de Recogida:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="recogida" precision="minute" relativeYears="[-1..2]" value="${solicitudMaterial?.recogida}"/>
</div>

<div class="fieldcontain">
    <label for="lugarDevolucion">
        <g:message code="lugardevolucion.label" default="Lugar de Recogida:"/>
    </label>
    <g:field type="text" name="lugarDevolucion" id="lugarDevolucion" value="${this.solicitudMaterial?.lugarDevolucion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudMaterial, field: 'observaciones', 'error')} ">
    <label for="observaciones">
        <g:message code="solicitudMaterial.observaciones.label" default="Observaciones:"/>
    </label>
    <g:textArea name="observaciones" cols="60" rows="15" maxlength="2000"
                value="${this.solicitudMaterial?.observaciones}"/>
</div>

<div class="fieldcontain">
    <hr>
</div>

<div class="fieldcontain ${hasErrors(bean: material, field: 'recinto', 'error')} required">
    <label for="material">
        <g:message code="material.label" default="Material:"/>
    </label>
    <g:select name="material"
              from="${gobela.Material.listOrderByNombre()}"
              value="${material?.nombre})"
              noSelection="${['': 'Selecciona un material...']}"
              optionKey="id"
              optionValue="nombre"
              onchange="fillAvailableStock(this.value)"/>
</div>

<div class="fieldcontain" id="stock-container">
    <label for="stock">
        <g:message code="stock.label" default="Disponible" readonly="true"/>
    </label>
    <g:field type="number" name="stock" id="stock" readonly="true"/>
</div>

<div class="fieldcontain">
    <label for="cantidad">
        <g:message code="cantidad.label" default="Cantidad:"/>
    </label>
    <g:field type="number" name="cantidad" id="cantidad"/>
    %{--<input type="button" value="Añadir" class="btn btn-info" onclick="addMaterial()">--}%
</div>

%{--<div class="table-responsive tabla-material">
    <table>
        <thead>
        <tr>
            <th>Material</th>
            <th>Cantidad</th>
            <th>Fecha Entrega</th>
            <th>Lugar Entrega</th>
            <th>Fecha Devolución</th>
            <th>Lugar Devolución</th>
            <th>Observaciones</th>
            <th></th>
        </tr>
        </thead>
        <tbody id="lista-material">
            <g:each in="${this.evento?.solicitudesMaterial}" var="solicitudMaterial" status="i">
                <tr rowId="${i}">
                    <td><g:fieldValue field="${solicitudMaterial.material}" bean="${solicitudMaterial}"/>
                        <input type="hidden"
                               name="solicitudesMaterial[$i].material"
                               id="solicitudesMaterial[$i].material"
                               value="${solicitudMaterial.material}"/>
                    </td>
                    <td><g:fieldValue field="${solicitudMaterial.cantidad}" bean="${solicitudMaterial}"/>
                        <input type="hidden"
                               name="solicitudesMaterial[$i].cantidad"
                               id="solicitudesMaterial[$i].cantidad"
                               value="${solicitudMaterial.cantidad}"/>
                    </td>
                    <td><g:fieldValue field="${solicitudMaterial.entrega}" bean="${solicitudMaterial}"/>
                        <input type="hidden"
                               name="solicitudesMaterial[$i].entrega"
                               id="solicitudesMaterial[$i].entrega"
                               value="${solicitudMaterial.entrega}"/>
                    </td>
                    <td><g:fieldValue field="${solicitudMaterial.lugarEntrega}" bean="${solicitudMaterial}"/>
                        <input type="hidden"
                               name="solicitudesMaterial[$i].lugarEntrega"
                               id="solicitudesMaterial[$i].lugarEntrega"
                               value="${solicitudMaterial.lugarEntrega}"/>
                    </td>
                    <td><g:fieldValue field="${solicitudMaterial.recogida}" bean="${solicitudMaterial}"/>
                        <input type="hidden"
                               name="solicitudesMaterial[$i].recogida"
                               id="solicitudesMaterial[$i].recogida"
                               value="${solicitudMaterial.recogida}"/>
                    </td>
                    <td><g:fieldValue field="${solicitudMaterial.lugarDevolucion}" bean="${solicitudMaterial}"/>
                        <input type="hidden"
                               name="solicitudesMaterial[$i].lugarDevolucion"
                               id="solicitudesMaterial[$i].lugarDevolucion"
                               value="${solicitudMaterial.lugarDevolucion}"/>
                    </td>
                    <td><g:fieldValue field="${solicitudMaterial.observaciones}" bean="${solicitudMaterial}"/>
                        <input type="hidden"
                               name="solicitudesMaterial[$i].observaciones"
                               id="solicitudesMaterial[$i].observaciones"
                               value="${solicitudMaterial.observaciones}"/>
                    </td>
                    <td><input type="button" value="Borrar" onclick="deleteMaterial(this)"/></td>
                </tr>
            </g:each>
        </tbody>
    </table>
</div>--}%


