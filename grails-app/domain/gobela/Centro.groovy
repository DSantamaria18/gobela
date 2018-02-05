package gobela

class Centro {

    String nombre

    static constraints = {
        nombre(nullable: false, blank: false, unique: true)
    }

    String toString(){
        return nombre?.toString()
    }
}
