package gobela

class Material {

    String nombre
    Integer stock = 0

//    static belongsTo = [solicitudMaterial: SolicitudMaterial]

    static constraints = {
        nombre(nullable: false, blank: false, unique: true)
        stock(nullable: true, blank: true)
    }

    String toString(){
        return nombre
    }
}
