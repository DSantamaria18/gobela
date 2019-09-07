package gobela

import jxl.write.Formula
import jxl.write.Label
import jxl.write.Number
import jxl.write.WritableCellFormat
import jxl.write.WritableSheet
import jxl.write.WritableWorkbook

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class HistoricoSesionesController {

    SesionService sesionService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {

        [historicoSesionesList: [], historicoSesionesCount: 0]
    }

    def exportarListadoHistoricoSesiones(params) {
        final Date filtrofechadesde = (params?.filtrofechadesde == "") ? null : Date.parse("yyyy-MM-dd", params.filtrofechadesde)
        final Date filtrofechahasta = (params?.filtrofechahasta == "null") ? null : Date.parse("yyyy-MM-dd", params.filtrofechahasta)
        final def filtroclub = (params?.filtroclub == "null") ? null : params.filtroclub as Long
        final Club club = Club.get(filtroclub)
        final Long categoriaId = (params?.filtrocategoria == "null") ? null : params.filtrocategoria as Long
        final Long filtroRecinto = (params?.filtrorecinto == "null") ? null : params.filtrorecinto as Long
        final Recinto recinto = Recinto.get(filtroRecinto)
        final Long filtroInstalacion = (params?.filtroinstalaciones == "null") ? null : params.filtroinstalaciones as Long
        final Instalacion instalacion = Instalacion.get(filtroInstalacion)
        final Boolean filtroresultado = (params?.filtroresultado == "null") ? null : new Boolean(params.filtroresultado)

        final def listaSesiones = sesionService.filtraHistoricoSesiones(filtrofechadesde, filtrofechahasta, club, categoriaId, recinto, instalacion, filtroresultado)

        WritableWorkbook workbook = ExcelUtils.createWorkbook(response, "Informe_Historico_Sesiones")
        WritableCellFormat titleFormat = ExcelUtils.defaultTitleFormat()
        WritableCellFormat headerFormat = ExcelUtils.defaultHeaderFormat()
        WritableCellFormat cellFormat = ExcelUtils.defaultCellFormat()

        WritableSheet sheet = workbook.createSheet("Sesiones", 0)

        sheet.addCell(new Label(1, 1, "Histórico de Sesiones de Entrenamiento", titleFormat))

        def cabeceras = ['FECHA', 'CLUB', 'CATEGORIA', 'RECINTO', 'INSTALACION', 'DIA', 'HORA', 'PARTICIPANTES', 'OCUPACION', 'RESULTADO', 'OBSERVACIONES']

        final int COLUMNA_INICIAL = 1
        final int MAX_COLUMN = COLUMNA_INICIAL + cabeceras.size() - 1
        final int FILA_CABECERA = 3
        for (int j = 0; j < cabeceras.size(); j++) {
            sheet.addCell(new Label(COLUMNA_INICIAL + j, FILA_CABECERA, cabeceras[j].toUpperCase(), headerFormat))
        }
        final int PRIMERA_FILA_SESIONES = FILA_CABECERA + 1
        final int ULTIMA_FILA_SESIONES = PRIMERA_FILA_SESIONES + listaSesiones.size() - 1
        int fila_actual = PRIMERA_FILA_SESIONES

        listaSesiones.each {
            final HistoricoSesiones hs = it as HistoricoSesiones
            sheet.addCell(new Label(COLUMNA_INICIAL, fila_actual, hs.fecha.format("dd-MM-yyyy"), cellFormat))
            sheet.addCell(new Label(COLUMNA_INICIAL + 1, fila_actual, hs.club.toString(), cellFormat))
            sheet.addCell(new Label(COLUMNA_INICIAL + 2, fila_actual, HistoricoSesiones.categoriaString(hs) + ' [' + hs.sexo + ']', cellFormat))
            sheet.addCell(new Label(COLUMNA_INICIAL + 3, fila_actual, hs.recinto.nombre.toUpperCase(), cellFormat))
            sheet.addCell(new Label(COLUMNA_INICIAL + 4, fila_actual, hs.instalacion.nombreInstalacion.toUpperCase(), cellFormat))
            sheet.addCell(new Label(COLUMNA_INICIAL + 5, fila_actual, hs.diaSemana.toString(), cellFormat))
            sheet.addCell(new Label(COLUMNA_INICIAL + 6, fila_actual, hs.horaInicio + ' - ' + hs.horaFin, cellFormat))
            sheet.addCell(new Number(COLUMNA_INICIAL + 7, fila_actual, hs.participantes, cellFormat))
            sheet.addCell(new Number(COLUMNA_INICIAL + 8, fila_actual, hs.ocupacion, cellFormat))
            final String resultado = (hs.resultadoOk) ? "OK" : "NO OK"
            sheet.addCell(new Label(COLUMNA_INICIAL + 9, fila_actual, resultado, cellFormat))
            sheet.addCell(new Label(COLUMNA_INICIAL + 10, fila_actual, hs.observaciones, cellFormat))
            fila_actual++
        }

        // La fórmula se evalua en Excel, donde las filas empiezan por 1, no por 0, por lo que hay que sumar 1 a las filas
        sheet.addCell(new Formula(COLUMNA_INICIAL, fila_actual, "CONTARA(B${PRIMERA_FILA_SESIONES + 1}:B${ULTIMA_FILA_SESIONES + 1})", headerFormat))
        sheet.addCell(new Label(COLUMNA_INICIAL + 1, fila_actual, "", headerFormat))
        sheet.addCell(new Label(COLUMNA_INICIAL + 2, fila_actual, "", headerFormat))
        sheet.addCell(new Label(COLUMNA_INICIAL + 3, fila_actual, "", headerFormat))
        sheet.addCell(new Label(COLUMNA_INICIAL + 4, fila_actual, "", headerFormat))
        sheet.addCell(new Label(COLUMNA_INICIAL + 5, fila_actual, "", headerFormat))
        sheet.addCell(new Label(COLUMNA_INICIAL + 6, fila_actual, "TOTALES:", headerFormat))
        sheet.addCell(new Formula(COLUMNA_INICIAL + 7, fila_actual, "SUMA(I${PRIMERA_FILA_SESIONES + 1}:I${ULTIMA_FILA_SESIONES + 1})", headerFormat))
        sheet.addCell(new Label(COLUMNA_INICIAL + 8, fila_actual, "", headerFormat))
        sheet.addCell(new Label(COLUMNA_INICIAL + 9, fila_actual, "", headerFormat))
        sheet.addCell(new Label(COLUMNA_INICIAL + 10, fila_actual, "", headerFormat))


        sheet.setColumnView(1, 15)
        sheet.setColumnView(2, 30)
        sheet.setColumnView(3, 30)
        sheet.setColumnView(4, 20)
        sheet.setColumnView(5, 40)
        sheet.setColumnView(6, 15)
        sheet.setColumnView(7, 15)
        sheet.setColumnView(8, 20)
        sheet.setColumnView(9, 15)
        sheet.setColumnView(10, 15)
        sheet.setColumnView(11, 40)

        workbook.write()
        workbook.close()
    }

    def filtraHistoricoSesiones(params) {
        Date fdesde = (params?.fdesde == "null") ? null : Date.parse("yyyy-MM-dd", params.fdesde)
        Date fhasta = (params?.fhasta == "null") ? null : Date.parse("yyyy-MM-dd", params.fhasta)
        def clubId = (params?.clubId == "null") ? null : params.clubId as Long
        Club club = Club.get(clubId)
        def categoriaId = (params?.categoriaId == "null") ? null : params.categoriaId as Long
        def filtroRecinto = (params?.recintoId == "null") ? null : params.recintoId as Long
        Recinto recinto = Recinto.get(filtroRecinto)
        def filtroInstalacion = (params?.instalacionId == "null") ? null : params.instalacionId as Long
        Instalacion instalacion = Instalacion.get(filtroInstalacion)
        Boolean resultado = (params?.resultado == "null") ? null : new Boolean(params.resultado)

        final def historicoSesionesList = sesionService.filtraHistoricoSesiones(fdesde, fhasta, club, categoriaId, recinto, instalacion, resultado)
        render template: "listaHistoricoSesiones", model: [historicoSesionesList: historicoSesionesList, historicoSesionesCount: historicoSesionesList.size()]
    }

    def filtraCategoriasPorClub(params) {
        Long clubId = params?.clubId as Long
        Club club = Club.get(clubId)
        def categoriasPorClubList = Categoria.findAllByClub(club)

        render template: "filtroCategoria", model: [categoriasPorClubList: categoriasPorClubList]
    }

    def filtraInstalacionesPorRecinto(params) {
        Long recintoId = params?.recintoId as Long
        Recinto recinto = Recinto.get(recintoId)
        def instalacionesPorRecintoList = Instalacion.findAllByRecinto(recinto)

        render template: "filtroInstalaciones", model: [instalacionesPorRecintoList: instalacionesPorRecintoList]
    }

    def show(HistoricoSesiones historicoSesiones) {
        respond historicoSesiones
    }

    def create() {
        HistoricoSesiones historicoSesiones = new HistoricoSesiones()

        final Date fecha = new Date().parse('yyyy-MM-dd', params.fecha)
        historicoSesiones.fecha = fecha
        historicoSesiones.participantes = params.participantes as int
        historicoSesiones.ocupacion = params.ocupacion as int
        historicoSesiones.observaciones = params.observaciones
        historicoSesiones.resultadoOk = (params.resultadoOk == "true")

        // Sesion
        final Sesion sesion = Sesion.get(params.sesionId as Long)
        //        historicoSesiones.sesion = sesion
        historicoSesiones.sesionId = sesion.id
        historicoSesiones.diaSemana = sesion.diaSemana
        historicoSesiones.horaInicio = sesion.horaInicio
        historicoSesiones.horaFin = sesion.horaFin
        historicoSesiones.recinto = sesion.recinto
        historicoSesiones.instalacion = sesion.instalacion
        historicoSesiones.ocupacionEsperada = sesion.ocupacion

        // Categoria
        historicoSesiones.categoriaId = sesion.categoria.id
        historicoSesiones.nombreCategoria = sesion.categoria.nombre
        historicoSesiones.sexo = sesion.categoria.sexo
        historicoSesiones.numDeportistas = sesion.categoria.numDeportistas
        historicoSesiones.edadMin = sesion.categoria.edadMin
        historicoSesiones.edadMax = sesion.categoria.edadMax
        historicoSesiones.club = sesion.categoria.club
        historicoSesiones.modalidad = sesion.categoria.modalidad

        // Entidad
        historicoSesiones.entidad = sesion.categoria.club.entidad

        save(historicoSesiones)
    }

    @Transactional
    def save(HistoricoSesiones historicoSesiones) {
        if (historicoSesiones == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (historicoSesiones.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond historicoSesiones.errors, view: 'create'
            return
        }

        historicoSesiones.save flush: true
        final def listaSesiones = sesionService.filtraSesiones(historicoSesiones.diaSemana, historicoSesiones.fecha)
        final DiaSemana diaSemana = historicoSesiones.diaSemana

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'historicoSesiones.label', default: 'HistoricoSesiones'), historicoSesiones.id])
                render template: "/sesion/listaSesiones2", model: [diaSemana: diaSemana, listaSesiones: listaSesiones]
            }
        }
    }

    def edit(final HistoricoSesiones historicoSesiones) {
        respond historicoSesiones
    }

    @Transactional
    def update(HistoricoSesiones historicoSesiones) {
        if (historicoSesiones == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (historicoSesiones.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond historicoSesiones.errors, view: 'edit'
            return
        }

        historicoSesiones.save flush: true

        def sesionesList = sesionService.filtraSesiones(historicoSesiones.diaSemana, historicoSesiones.fecha)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'historicoSesiones.label', default: 'HistoricoSesiones'), historicoSesiones.id])
                redirect historicoSesiones
            }
            '*' { respond historicoSesiones, [status: OK] }
        }
    }

    @Transactional
    def delete(HistoricoSesiones historicoSesiones) {

        if (historicoSesiones == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        historicoSesiones.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'historicoSesiones.label', default: 'HistoricoSesiones'), historicoSesiones.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'historicoSesiones.label', default: 'HistoricoSesiones'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
