package gobela

import jxl.Workbook
import jxl.WorkbookSettings
import jxl.write.Border
import jxl.write.BorderLineStyle
import jxl.write.Colour
import jxl.write.Formula
import jxl.write.Label
import jxl.write.Number
import jxl.write.WritableCellFormat
import jxl.write.WritableFont
import jxl.write.WritableSheet
import jxl.write.WritableWorkbook

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class HistoricoSesionesController {

    SesionService sesionService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.order = "desc"
        def historicoSesionesList = HistoricoSesiones.findAll("from HistoricoSesiones as hs order by hs.fecha desc, hs.sesion.horaInicio desc, hs.sesion.horaFin desc")

        respond historicoSesionesList, model: [historicoSesionesList: historicoSesionesList, historicoSesionesCount: HistoricoSesiones.count()]
    }

    def exportarListadoHistoricoSesiones(params) {
        Date filtrofechadesde = (params?.filtrofechadesde == "") ? null : Date.parse("yyyy-MM-dd", params.filtrofechadesde)
        Date filtrofechahasta = (params?.filtrofechahasta == "null") ? null : Date.parse("yyyy-MM-dd", params.filtrofechahasta)
        def filtroclub = (params?.filtroclub == "null") ? null : params.filtroclub as Long
        Club club = Club.get(filtroclub)
        def filtrocategoria = (params?.filtrocategoria == "null") ? null : params.filtrocategoria as Long
        Categoria categoria = Categoria.get(filtrocategoria)
        def filtroRecinto = (params?.filtrorecinto == "null") ? null : params.filtrorecinto as Long
        Recinto recinto = Recinto.get(filtroRecinto)
        def filtroInstalacion = (params?.filtroinstalaciones == "null") ? null : params.filtroinstalaciones as Long
        Instalacion instalacion = Instalacion.get(filtroInstalacion)
        Boolean filtroresultado = (params?.filtroresultado == "null") ? null : new Boolean(params.filtroresultado)

        def listaSesiones = sesionService.filtraHistoricoSesiones(filtrofechadesde, filtrofechahasta, club, categoria, recinto, instalacion, filtroresultado)

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
        final int ULTIMA_FILA_SESIONES =  PRIMERA_FILA_SESIONES + listaSesiones.size() - 1
        int fila_actual = PRIMERA_FILA_SESIONES

        listaSesiones.each {
            final HistoricoSesiones hs = it as HistoricoSesiones
            sheet.addCell(new Label(COLUMNA_INICIAL, fila_actual, hs.fecha.format("dd-MM-yyyy"), cellFormat))
            sheet.addCell(new Label(COLUMNA_INICIAL + 1, fila_actual, hs.sesion.categoria.club.toString(), cellFormat))
            sheet.addCell(new Label(COLUMNA_INICIAL + 2, fila_actual, hs.sesion.categoria.nombre + ' [' + hs.sesion.categoria.sexo + ']', cellFormat))
            sheet.addCell(new Label(COLUMNA_INICIAL + 3, fila_actual, hs.sesion.recinto.nombre.toUpperCase(), cellFormat))
            sheet.addCell(new Label(COLUMNA_INICIAL + 4, fila_actual, hs.sesion.instalacion.nombreInstalacion.toUpperCase(), cellFormat))
            sheet.addCell(new Label(COLUMNA_INICIAL + 5, fila_actual, hs.sesion.diaSemana.toString(), cellFormat))
            sheet.addCell(new Label(COLUMNA_INICIAL + 6, fila_actual, hs.sesion.horaInicio + ' - ' + hs.sesion.horaFin, cellFormat))
            sheet.addCell(new Number(COLUMNA_INICIAL + 7, fila_actual, hs.participantes, cellFormat))
            sheet.addCell(new Number(COLUMNA_INICIAL + 8, fila_actual, hs.ocupacion, cellFormat))
            String resultado = (hs.resultadoOk) ? "OK" : "NO OK"
            sheet.addCell(new Label(COLUMNA_INICIAL + 9, fila_actual, resultado, cellFormat))
            sheet.addCell(new Label(COLUMNA_INICIAL + 10, fila_actual, hs.observaciones, cellFormat))
            fila_actual++
        }

        // La fórmula se evalua en Excel, donde las filas empiezan por 1, no por 0, por lo que hay que sumar 1 a las filas
        sheet.addCell(new Formula(COLUMNA_INICIAL, fila_actual, "CONTARA(B${PRIMERA_FILA_SESIONES+1}:B${ULTIMA_FILA_SESIONES+1})", headerFormat))
        sheet.addCell(new Label(COLUMNA_INICIAL +1, fila_actual, "", headerFormat))
        sheet.addCell(new Label(COLUMNA_INICIAL +2, fila_actual, "", headerFormat))
        sheet.addCell(new Label(COLUMNA_INICIAL +3, fila_actual, "", headerFormat))
        sheet.addCell(new Label(COLUMNA_INICIAL +4, fila_actual, "", headerFormat))
        sheet.addCell(new Label(COLUMNA_INICIAL +5, fila_actual, "", headerFormat))
        sheet.addCell(new Label(COLUMNA_INICIAL +6, fila_actual,"TOTALES:" , headerFormat))
        sheet.addCell(new Formula(COLUMNA_INICIAL +7, fila_actual, "SUMA(I${PRIMERA_FILA_SESIONES+1}:I${ULTIMA_FILA_SESIONES+1})", headerFormat))
        sheet.addCell(new Label(COLUMNA_INICIAL +8, fila_actual, "", headerFormat))
        sheet.addCell(new Label(COLUMNA_INICIAL +9, fila_actual, "", headerFormat))
        sheet.addCell(new Label(COLUMNA_INICIAL +10, fila_actual, "", headerFormat))


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
        Categoria categoria = Categoria.get(categoriaId)
        def filtroRecinto = (params?.recintoId == "null") ? null : params.recintoId as Long
        Recinto recinto = Recinto.get(filtroRecinto)
        def filtroInstalacion = (params?.instalacionId == "null") ? null : params.instalacionId as Long
        Instalacion instalacion = Instalacion.get(filtroInstalacion)
        Boolean resultado = (params?.resultado == "null") ? null : new Boolean(params.resultado)

        def historicoSesionesList = sesionService.filtraHistoricoSesiones(fdesde, fhasta, club, categoria, recinto, instalacion, resultado)
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
        HistoricoSesiones historicoSesiones1 = new HistoricoSesiones()
        Sesion sesion = Sesion.get(params.sesionId as Long)
        historicoSesiones1.sesion = sesion
        Date fecha = new Date().parse('yyyy-MM-dd', params.fecha)
        historicoSesiones1.fecha = fecha
        historicoSesiones1.participantes = params.participantes as int
        historicoSesiones1.ocupacion = params.ocupacion as int
        historicoSesiones1.observaciones = params.observaciones
        historicoSesiones1.resultadoOk = (params.resultadoOk == "true") ? true : false

        save(historicoSesiones1)
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
//        def sesionesList = sesionService.filtraSesiones(historicoSesiones.sesion.diaSemana, historicoSesiones.sesion.instalacion)
        def listaSesiones = sesionService.filtraSesiones(historicoSesiones.sesion.diaSemana, historicoSesiones.fecha)
        DiaSemana diaSemana = historicoSesiones.sesion.diaSemana

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'historicoSesiones.label', default: 'HistoricoSesiones'), historicoSesiones.id])
//                render template: "/sesion/listaSesiones", model: [sesionesList: sesionesList, dia: historicoSesiones.sesion.diaSemana.toString(), instalacion: historicoSesiones.sesion.instalacion]
                render template: "/sesion/listaSesiones2", model: [diaSemana: diaSemana, listaSesiones: listaSesiones]
//                redirect historicoSesiones
            }
//            '*' { respond historicoSesiones, [status: CREATED] }
        }
    }

    def edit(HistoricoSesiones historicoSesiones) {
        /* historicoSesiones.participantes = params.participantes as int
         historicoSesiones.ocupacion = params.ocupacion as int
         historicoSesiones.observaciones = params.observaciones
         historicoSesiones.resultadoOk = (params.resultadoOk == "true") ? true : false
         update(historicoSesiones)*/

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

//        def sesionesList = sesionService.filtraSesiones(historicoSesiones.sesion.diaSemana, historicoSesiones.sesion.instalacion)
        def sesionesList = sesionService.filtraSesiones(historicoSesiones.sesion.diaSemana, historicoSesiones.fecha)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'historicoSesiones.label', default: 'HistoricoSesiones'), historicoSesiones.id])
//                render template: "/sesion/listaSesiones", model: [sesionesList: sesionesList, dia: historicoSesiones.sesion.diaSemana.toString(), instalacion: historicoSesiones.sesion.instalacion]
                redirect historicoSesiones
            }
            '*' { respond historicoSesiones, [status: OK] }
//            render template: "/sesion/listaSesiones", model: [sesionesList: sesionesList, dia: historicoSesiones.sesion.diaSemana.toString(), instalacion: historicoSesiones.sesion.instalacion]
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
