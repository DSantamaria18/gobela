package gobela

class NivelEuskera {

    String nivel

    static constraints = {
        nivel(nullable: false, blank: false, unique: true)
    }

    String toString(){
        return this?.nivel?.toUpperCase()
    }
}
