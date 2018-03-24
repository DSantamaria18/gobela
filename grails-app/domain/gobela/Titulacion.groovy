package gobela

class Titulacion {

    String titulo

    static constraints = {
        titulo(nullable: false, blank: false, unique: true)
    }

    String toString(){
        return this?.titulo?.toUpperCase()
    }
}
