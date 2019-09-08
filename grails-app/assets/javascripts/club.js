//= require jquery-2.2.0.min
//= require bootstrap
//= require_tree .
//= require_self

function mostrarTecnicosInactivos() {
    const mostrar = document.getElementById('check-tecnicos').checked;
    const elems = $("[data-activo=false]");
        if (mostrar) {
            elems.css('display', '');
        } else {
            elems.css('display', 'none');
        }
}