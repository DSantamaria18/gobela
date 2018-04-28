package gobela

import java.time.LocalTime

class Sesion {

    String diaSemana
    String horaInicio
    String horaFin
    Recinto recinto
    Instalacion instalacion
    Integer ocupacion

    static belongsTo = [categoria: Categoria]

    static constraints = {
        diaSemana(inList: ['LUNES', 'MARTES', 'MIERCOLES', 'JUEVES', 'VIERNES', 'SABADO', 'DOMINGO'])
    }

    String toString(){
        return "${this.diaSemana}: ${this.horaInicio} - ${this.horaFin} [${this.recinto} - ${this.instalacion}]"
    }
}
