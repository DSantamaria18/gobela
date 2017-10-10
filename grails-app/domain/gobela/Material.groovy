package gobela

class Material {

    String nombre
    Integer stock
    static constraints = {
        nombre(nullable: false, blank: false, unique: true)
        stock(nullable: false, blank: false)
    }
}
