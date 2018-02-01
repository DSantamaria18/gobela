<h1>TOTAL DE EVENTOS: ${total}</h1>
<h3>Relevantes: ${relevantes}</h3>
<h3>Deporte Adaptado: ${adaptado} </h3>
<h3>Deporte Inclusivo: ${inclusivo} </h3>

<br/>
<hr>
<br/>

<h3>Eventos por Tipo de Actividad:</h3>

<table>
    <thead>
    <tr>
        <th>Tipo de Actividad</th>
        <th>Nº Eventos</th>
    </tr>
    </thead>
    <tbody>
        <g:each in="${tipoActividadList}" status="i" var="tipoActividad">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>${tipoActividad.ta}</td>
                <td>${tipoActividad.num}</td>
            </tr>
        </g:each>
    </tbody>
</table>

<br/>
<hr>
<br/>

<h3>Eventos por Actividad:</h3>

<table>
    <thead>
    <tr>
        <th>Actividad</th>
        <th>Nº Eventos</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${actividadList}" status="i" var="actividad">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td>${actividad.act}</td>
            <td>${actividad.num}</td>
        </tr>
    </g:each>
    </tbody>
</table>

<br/>
<hr>
<br/>

<h3>Eventos por Recinto:</h3>

<table>
    <thead>
    <tr>
        <th>Recinto</th>
        <th>Nº Eventos</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${recintoList}" status="i" var="recinto">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td>${recinto.recinto}</td>
            <td>${recinto.num}</td>
        </tr>
    </g:each>
    </tbody>
</table>

<br/>
<hr>
<br/>

<h3>Eventos por Lugar:</h3>

<table>
    <thead>
    <tr>
        <th>Lugar</th>
        <th>Nº Eventos</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${lugarList}" status="i" var="lugar">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td>${lugar.lugar}</td>
            <td>${lugar.num}</td>
        </tr>
    </g:each>
    </tbody>
</table>