package gobela

import java.text.SimpleDateFormat

enum DiaSemana{
    LUNES(1), MARTES(2), MIERCOLES(3), JUEVES(4), VIERNES(5), SABADO(6), DOMINGO(7)

    private final int orden

    DiaSemana(int orden) {
        this.orden = orden
    }

    static DiaSemana getDiaSemanaFromFecha(final Date fecha) {
        String dia = new SimpleDateFormat("EEEE", new Locale('es', 'ES')).format(fecha).toUpperCase()
//        String eguna = new SimpleDateFormat("EEEE", new Locale('eu', 'ES')).format(hoy)

        DiaSemana diaSemana
        if (dia.equals("MIÉRCOLES")) {
            diaSemana = DiaSemana.MIERCOLES
        } else if (dia.equals("SÁBADO")) {
            diaSemana = DiaSemana.SABADO
        } else {
            diaSemana = dia
        }
        return diaSemana
    }

    int getOrden() {
        return orden
    }
}