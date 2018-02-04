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

<br/>
<hr>
<br/>

<h3>Eventos por Modalidad:</h3>

<table>
    <thead>
    <tr>
        <th>Modalidad</th>
        <th>Nº Eventos</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${modalidadList}" status="i" var="modalidad">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td>${modalidad.modalidad}</td>
            <td>${modalidad.num}</td>
        </tr>
    </g:each>
    </tbody>
</table>

<br/>
<hr>
<br/>

<h3>Eventos por Perfil de Género:</h3>

<table>
    <thead>
    <tr>
        <th>Público Destinatario</th>
        <th>Nº Eventos</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${publicoDestList}" status="i" var="pdest">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td>${pdest.pdest}</td>
            <td>${pdest.num}</td>
        </tr>
    </g:each>
    </tbody>
</table>

<br/>
<hr>
<br/>

<h3>Eventos por Perfil de Edad:</h3>

<table>
    <thead>
    <tr>
        <th>Tipo de Público</th>
        <th>Nº Eventos</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${edadList}" status="i" var="edad">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td>${edad.pub}</td>
            <td>${edad.num}</td>
        </tr>
    </g:each>
    </tbody>
</table>

<br/>
<hr>
<br/>

<h3>Eventos por Perfil Lingüístico:</h3>

<table>
    <thead>
    <tr>
        <th>Comunicación con GK</th>
        <th>Nº Eventos</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${euskeraGKList}" status="i" var="euskeraGK">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td>${euskeraGK.gk}</td>
            <td>${euskeraGK.num}</td>
        </tr>
    </g:each>
    </tbody>
</table>

<table>
    <thead>
    <tr>
        <th>Desarrollo del Evento</th>
        <th>Nº Eventos</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${euskeraDesarrolloList}" status="i" var="desarrollo">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td>${desarrollo.des}</td>
            <td>${desarrollo.num}</td>
        </tr>
    </g:each>
    </tbody>
</table>

<table>
    <thead>
    <tr>
        <th>Speaker</th>
        <th>Nº Eventos</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${euskeraSpeakerList}" status="i" var="speaker">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td>${speaker.speaker}</td>
            <td>${speaker.num}</td>
        </tr>
    </g:each>
    </tbody>
</table>