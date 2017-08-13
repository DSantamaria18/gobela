package gobela

class RecintosEvento {
    static belongsTo = [evento: Evento, recinto: Recinto]

    static RecintosEvento create(Evento evento, Recinto recinto, boolean flush = false){
        new RecintosEvento(evento: evento, recinto: recinto).save(flush: flush, insert: true)
    }

    static constraints = {
    }
}
