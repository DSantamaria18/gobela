package gobela

import java.text.SimpleDateFormat

class Asamblea {

    String nombre
    Date fecha
    String observaciones

    static belongsTo = [club: Club]

    static constraints = {
        nombre(nullable: false, blank: false)
        fecha(nullable: false)
        observaciones(nullable: true, blank: true, maxSize: 5000)
        club(display: false)
    }

    String toString(){
        String fecha = new SimpleDateFormat('dd-MM-yyyy').format(this?.fecha)
        return this?.nombre?.toUpperCase() + " " + fecha
    }
}
