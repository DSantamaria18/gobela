package gobela

class Sesion {

    DiaSemana diaSemana
    String horaInicio
    String horaFin
    Recinto recinto
    Instalacion instalacion
    Integer ocupacion
    boolean activa

    static belongsTo = [categoria: Categoria]

    static constraints = {
    }

    String toString(){
        return "${this.diaSemana}: ${this.horaInicio} - ${this.horaFin} [${this.recinto} - ${this.instalacion}]"
    }
}
