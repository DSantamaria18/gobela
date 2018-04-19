package gobela

class TecnicoCategoria {

    Boolean principal

    static belongsTo = [categoria: Categoria, tecnico: Tecnico]
    static constraints = {
    }
}
