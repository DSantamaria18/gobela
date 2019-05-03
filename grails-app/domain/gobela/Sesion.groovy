package gobela


enum DiaSemana{
    LUNES(1), MARTES(2), MIERCOLES(3), JUEVES(4), VIERNES(5), SABADO(6), DOMINGO(7)

    private final int orden

    DiaSemana(int orden) {
        this.orden = orden
    }

    int getOrden() {
        return orden
    }
}

class Sesion {

    DiaSemana diaSemana
    String horaInicio
    String horaFin
    Recinto recinto
    Instalacion instalacion
    Integer ocupacion
    boolean activa

    static belongsTo = [categoria: Categoria]
    static hasMany = [historicoSesiones: HistoricoSesiones]

    static constraints = {
    }

    String toString(){
        return "${this.diaSemana}: ${this.horaInicio} - ${this.horaFin} [${this.recinto} - ${this.instalacion}]"
    }
}
