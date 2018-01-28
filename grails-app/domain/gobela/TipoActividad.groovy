package gobela

class TipoActividad {

    String nombre

    static constraints = {
        nombre(unique: true, nullable: false, blank: false)
    }

    String toString(){
        return nombre?.toUpperCase()
    }
}
