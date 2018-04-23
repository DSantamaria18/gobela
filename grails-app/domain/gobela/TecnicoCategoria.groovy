package gobela

class TecnicoCategoria {

    Boolean principal

    static belongsTo = [categoria: Categoria, tecnico: Tecnico]
    static constraints = {
    }

    String toString(){
        return this?.tecnico

    }
}
