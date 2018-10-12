<g:select name="comboInstalaciones"
          id="comboInstalaciones"
          from="${instalacionesList}"
          optionKey="id"
          noSelection="['null': 'Instalación...']"/>

<g:javascript>
    $('#comboInstalaciones').on('change', function () {
        console.log('Instalación seleccionada: ' + $(this).val());
        $('#filtroInstalaciones').val($(this).val());

    });
</g:javascript>