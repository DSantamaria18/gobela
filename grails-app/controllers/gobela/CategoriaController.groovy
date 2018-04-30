package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class CategoriaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    private static final BASE_CATEGORIES = [
            ['PRE-BENJAMIN', 'MASC', 7, 9, 0],
            ['PRE-BENJAMIN', 'FEM', 7, 9, 0],
            ['BENJAMIN 1', 'MASC', 9, 10, 0],
            ['BENJAMIN 1', 'FEM', 9, 10, 0],
            ['BENJAMIN 2', 'MASC', 10, 11, 0],
            ['BENJAMIN 2', 'FEM', 10, 11, 0],
            ['ALEVIN 1', 'MASC', 11, 12, 0],
            ['ALEVIN 1', 'FEM', 11, 12, 0],
            ['ALEVIN 2', 'MASC', 12, 13, 0],
            ['ALEVIN 2', 'FEM', 12, 13, 0],
            ['INFANTIL 1', 'MASC', 13, 14, 0],
            ['INFANTIL 1', 'FEM', 13, 14, 0],
            ['INFANTIL 2', 'MASC', 14, 15, 0],
            ['INFANTIL 2', 'FEM', 14, 15, 0],
            ['CADETE 1', 'MASC', 15, 16, 0],
            ['CADETE 1', 'FEM', 15, 16, 0],
            ['CADETE 2', 'MASC', 16, 17, 0],
            ['CADETE 2', 'FEM', 16, 17, 0],
            ['JUVENIL 1', 'MASC', 17, 18, 0],
            ['JUVENIL 1', 'FEM', 17, 18, 0],
            ['JUVENIL 2', 'MASC', 18, 19, 0],
            ['JUVENIL 2', 'FEM', 18, 19, 0],
            ['SENIOR', 'MASC', 18, 40, 0],
            ['SENIOR', 'FEM', 18, 40, 0],
            ['MASTER', 'MASC', 30, 99, 0],
            ['MASTER', 'FEM', 30, 99, 0]
    ]

    def mostrarCategorias() {
        Club club = Club.get(params.clubId as Long)

        def modalidadesList = Categoria.createCriteria().list {
            eq('club', club)
            projections {
                groupProperty('modalidad')
            }
        }

        def categoriasList = []

        modalidadesList.each {
            Modalidad modalidad = Modalidad.findByNombre(it)
            def categoriasModalidad = Categoria.createCriteria().list {
                and {
                    eq('club', club)
                    eq("modalidad", modalidad)
                }
                order("edadMin", "asc")
            }
            categoriasList.add(categoriasModalidad)
        }

        respond categoriasList, model: [categoriasList: categoriasList, categoriasCount: categoriasList.size(), clubId: params.clubId]
    }

    def generarArbolCategorias() {
        Modalidad modalidad = Modalidad.get(params.modalidadId as Long)
        Club club = Club.get(params.clubId as Long)

        BASE_CATEGORIES.each {
            Categoria cat = new Categoria()
            cat.nombre = it[0]
            cat.sexo = it[1]
            cat.edadMin = it[2]
            cat.edadMax = it[3]
            cat.numDeportistas = it[4]
            cat.club = club
            cat.modalidad = modalidad

            cat.save flush: true
        }


        def categoriasList = Categoria.createCriteria().list {
            eq('club', club)
            order("edadMin", "asc")
        }

        redirect action: 'mostrarCategorias', params: ['clubId': params.clubId]
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Categoria.list(params), model: [categoriaCount: Categoria.count()]
    }

    def show(Categoria categoria) {
        respond categoria
    }

    def create() {
        respond new Categoria(params), model: ['clubId': params.clubId]
    }

    @Transactional
    def save(Categoria categoria) {
        if (categoria == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (categoria.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond categoria.errors, view: 'create'
            return
        }

        categoria.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'categoria.label', default: 'Categoria'), categoria.id])
                redirect categoria
            }
            '*' { respond categoria, [status: CREATED] }
        }
    }

    def edit(Categoria categoria) {
        respond categoria
    }

    @Transactional
    def update(Categoria categoria) {
        if (categoria == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (categoria.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond categoria.errors, view: 'edit'
            return
        }

        categoria.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'categoria.label', default: 'Categoria'), categoria.id])
                redirect categoria
            }
            '*' { respond categoria, [status: OK] }
        }
    }

    @Transactional
    def delete(Categoria categoria) {

        if (categoria == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        categoria.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'categoria.label', default: 'Categoria'), categoria.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
