package gobela

import jxl.Workbook
import jxl.WorkbookSettings
import jxl.format.Alignment
import jxl.format.VerticalAlignment
import jxl.write.Boolean
import jxl.write.Border
import jxl.write.BorderLineStyle
import jxl.write.Colour
import jxl.write.Label
import jxl.write.Number
import jxl.write.WritableCellFormat
import jxl.write.WritableFont
import jxl.write.WritableSheet
import jxl.write.WritableWorkbook
import org.codehaus.groovy.runtime.NullObject

import java.sql.Timestamp
import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class ClubController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Club.list(params), model: [clubCount: Club.count()]
    }

    def show(params) {
        Entidad entidad = Entidad.get(params.entidadId as Long)
        Club club = Club.findAllByEntidad(entidad).first()

        def categoriasList = getCategoriasList(club)
        def tecnicosList = getTecnicosList(club)
        def instalacionesList = getInstalacionesList(club)
        def sesionesList = getSesionesList(club)
        def asambleasList = getAsambleasList(club)

        [club: club, categoriasList: categoriasList, tecnicosList: tecnicosList, instalacionesList: instalacionesList, sesionesList: sesionesList, asambleasList: asambleasList]
    }

    def show2(params) {
        Entidad entidad = Entidad.get(params.entidadId as Long)
        Club club = Club.findAllByEntidad(entidad).first()
        [club: club]
    }

    def create() {
        respond new Club(params)
    }

    @Transactional
    def save(Club club) {
        if (club == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (club.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond club.errors, view: 'create'
            return
        }

        Entidad entidad = Entidad.get(club.entidad.id)
        club.save flush: true
        entidad.es_club = true
        entidad.save(flush: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'club.label', default: 'Club'), club.id])
                redirect(action: "show", params: [entidadId: entidad.id])
            }
            '*' { respond club, [status: CREATED] }
        }
    }

    def edit(Club club) {
        respond club
    }

    @Transactional
    def update(Club club) {
        if (club == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (club.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond club.errors, view: 'edit'
            return
        }

        Entidad entidad = Entidad.get(club.entidad.id)
        club.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'club.label', default: 'Club'), club.id])
                redirect(action: "show", params: [entidadId: entidad.id])
            }
            '*' { respond club, [status: OK] }
        }
    }

    @Transactional
    def delete(Club club) {

        if (club == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        Entidad entidad = Entidad.get(club.entidad.id)
        club.delete flush: true

        entidad.es_club = false
        entidad.save(flush: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'club.label', default: 'Club'), club.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'club.label', default: 'Club'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    private List getModalidadesList(Club club) {
        List modalidadesList = Categoria.createCriteria().list {
            eq('club', club)
            projections {
                groupProperty('modalidad')
            }
        }

        return modalidadesList
    }

    private List getCategoriasList(Club club) {
        List modalidadesList = getModalidadesList(club)

        List categoriasList = []

        modalidadesList.each {
            Modalidad modalidad = Modalidad.findByNombre(it)
            def categoriasModalidad = Categoria.createCriteria().list {
                and {
                    eq('club', club)
                    eq("modalidad", modalidad)
                }
                order("edadMin", "asc")
                order("sexo", "desc")
            }
            categoriasList.add(categoriasModalidad)
        }

        return categoriasList
    }

    private static List getTecnicosList(Club club) {
        List tecnicosList = TecnicoCategoria.executeQuery("select distinct(tc.tecnico) from TecnicoCategoria tc " +
                "where tc.categoria.club = :club", [club: club])
        return tecnicosList
    }

    private static List getInstalacionesList(Club club) {
        List instalacionesList = Sesion.executeQuery("select distinct(s.instalacion) from Sesion s where s.categoria.club = :club", [club: club])
        return instalacionesList
    }

    private static List getSesionesList(Club club) {
        List sesionesList = []
        DiaSemana.each {
            def sesionesDia = Sesion.executeQuery("from Sesion s where s.categoria.club = :club and diaSemana = :dia order by horaInicio", [club: club, dia: it])
            sesionesList.add(sesionesDia)
        }
        return sesionesList
    }

    private static List getAsambleasList(Club club) {
        def asambleasList = Asamblea.createCriteria().list {
            eq('club', club)
            order('fecha', 'desc')
        }
        return asambleasList
    }

    def exportaClub() {
        Club club = Club.get(params.clubId as Long)

        final def modalidadesList = getModalidadesList(club)
        final def categoriasList = getCategoriasList(club)
        final def tecnicosList = getTecnicosList(club)
        final def instalacionesList = getInstalacionesList(club)
        final def sesionesList = getSesionesList(club)

        WritableWorkbook workbook = ExcelUtils.createWorkbook(response, "${club.entidad.nombreEntidad}")

        WritableFont titleFont = new WritableFont(WritableFont.ARIAL, 16, WritableFont.BOLD)
        WritableCellFormat titleFormat = new WritableCellFormat()
        titleFormat.setFont(titleFont)

        WritableFont headerFont = new WritableFont(WritableFont.ARIAL, 8, WritableFont.BOLD)
        WritableCellFormat headerFormat = new WritableCellFormat()
        headerFormat.with {
            setAlignment(Alignment.CENTRE)
            setVerticalAlignment(VerticalAlignment.CENTRE)
            setBackground(Colour.GREY_25_PERCENT)
            setBorder(Border.ALL, BorderLineStyle.THIN)
            setFont(headerFont)
            setWrap(true)
        }

        WritableFont cellFont = new WritableFont(WritableFont.ARIAL, 8)
        WritableCellFormat cellFormat = new WritableCellFormat()
        cellFormat.with {
            setAlignment(Alignment.CENTRE)
            setVerticalAlignment(VerticalAlignment.CENTRE)
            setFont(cellFont)
            setBorder(Border.ALL, BorderLineStyle.THIN)
            setWrap(true)
        }

        WritableFont datosHeaderFont = new WritableFont(WritableFont.ARIAL, 8, WritableFont.BOLD)
        WritableCellFormat datosHeaderFormat = new WritableCellFormat()
        datosHeaderFormat.with {
            setBackground(Colour.GREY_25_PERCENT)
            setBorder(Border.ALL, BorderLineStyle.THIN)
            setFont(datosHeaderFont)
            setWrap(true)
        }

        WritableFont datosCellFont = new WritableFont(WritableFont.ARIAL, 8)
        WritableCellFormat datosCellFormat = new WritableCellFormat()
        datosCellFormat.with {
            setAlignment(Alignment.RIGHT)
            setVerticalAlignment(VerticalAlignment.CENTRE)
            setFont(datosCellFont)
            setBorder(Border.ALL, BorderLineStyle.THIN)
            setWrap(true)
        }

        WritableFont categoriasHeaderFont = new WritableFont(WritableFont.ARIAL, 8, WritableFont.BOLD)
        WritableCellFormat categoriasMascHeaderFormat = new WritableCellFormat()
        categoriasMascHeaderFormat.with {
            setBackground(Colour.SKY_BLUE)
            setBorder(Border.ALL, BorderLineStyle.THIN)
            setFont(categoriasHeaderFont)
            setWrap(true)
        }

        WritableCellFormat categoriasFemHeaderFormat = new WritableCellFormat()
        categoriasFemHeaderFormat.with {
            setBackground(Colour.PINK2)
            setBorder(Border.ALL, BorderLineStyle.THIN)
            setFont(categoriasHeaderFont)
            setWrap(true)
        }

        WritableFont categoriasCellFont = new WritableFont(WritableFont.ARIAL, 8)
        WritableCellFormat categoriasCellFormat = new WritableCellFormat()
        categoriasCellFormat.with {
            setAlignment(Alignment.RIGHT)
            setFont(categoriasCellFont)
            setBorder(Border.ALL, BorderLineStyle.THIN)
            setWrap(true)
        }



        try {
            int hojaIndex = 0
            for (int modalidadIndex = 0; modalidadIndex < modalidadesList.size(); modalidadIndex++) {
                // Creamos la hoja
                String nombreHoja = modalidadesList[modalidadIndex]
                WritableSheet sheet = workbook.createSheet(nombreHoja, hojaIndex)
                hojaIndex++

                // Añadimos los datos del club
                sheet.addCell(new Label(1, 2, "NOMBRE CLUB: ", datosHeaderFormat))
                sheet.addCell(new Label(2, 2, club.entidad.nombreEntidad, datosCellFormat))
                sheet.addCell(new Label(1, 3, "FUNDACION: ", datosHeaderFormat))
                sheet.addCell(new Label(2, 3, formatDate(format: "dd-MM-yyyy", date: club.fechaFundacion), datosCellFormat))
                sheet.addCell(new Label(1, 4, "Nº DIRECTIVOS:", datosHeaderFormat))
                sheet.addCell(new Number(2, 4, club.numDirectivos, datosCellFormat))
                sheet.addCell(new Label(1, 5, "FECHA ELECCIONES: ", datosHeaderFormat))
                sheet.addCell(new Label(2, 5, formatDate(format: "dd-MM-yyyy", date: club.fechaElecciones), datosCellFormat))
                sheet.addCell(new Label(1, 6, "CARNET GK: ", datosHeaderFormat))
                String carnetGK = (club.carnetGK) ? "SI" : "NO"
                sheet.addCell(new Label(2, 6, carnetGK, datosCellFormat))

                // Añadimos las categorías
                sheet.addCell(new Label(1, 9, "DEPORTISTAS", titleFormat))
                int col = 1
                int row = 11

                categoriasList[modalidadIndex].each {

                    if (it.sexo == "MASC") {
                        sheet.addCell(new Label(col, row, it.nombre + " " + it.sexo, categoriasMascHeaderFormat))
                        sheet.addCell(new Number(col + 1, row, it.numDeportistas, categoriasCellFormat))
                    }else {
                        sheet.addCell(new Label(col, row + 1, it.nombre + " " + it.sexo, categoriasFemHeaderFormat))
                        sheet.addCell(new Number(col + 1, row + 1, it.numDeportistas, categoriasCellFormat))
                        col = col + 2
                    }
                    // Separamos en filas las categorías
                    if (col > 9) {
                        col = 1
                        row = row + 3
                    }
                }
                col = 1
                row = row + 4

                // Añadimos los técnicos
                sheet.addCell(new Label(1, row, "TECNICOS", titleFormat))
                row = row + 2
                col = 1

                sheet.addCell(new Label(col, row, "NOMBRE", headerFormat))
                col++
                sheet.addCell(new Label(col, row, "TITULACION", headerFormat))
                col++
                sheet.addCell(new Label(col, row, "EUSKERA", headerFormat))
                col++
                sheet.addCell(new Label(col, row, "CONTRATO", headerFormat))
                col++
                sheet.addCell(new Label(col, row, "ANTIGÜEDAD", headerFormat))

                col = 1
                row++
                tecnicosList.each {
                    sheet.addCell(new Label(col, row, it.nombre.toUpperCase() + " " + it.apellidos.toUpperCase() , cellFormat))
                    col++
                    sheet.addCell(new Label(col, row, it.titulacion.toString() , cellFormat))
                    col++
                    sheet.addCell(new Label(col, row, it.nivelEuskera.toString() , cellFormat))
                    col++
                    String contrato = (it.contrato)? "SI" : "NO"
                    sheet.addCell(new Label(col, row, contrato, cellFormat))
                    col++
                    sheet.addCell(new Label(col, row, it.antiguedad.toString(), cellFormat))
                    row++
                    col = 1
                }
                row = row + 2

                //Añadimos las instalaciones
                sheet.addCell(new Label(1, row, "INSTALACIONES", titleFormat))
                row = row + 2
                col = 1

                sheet.addCell(new Label(col, row, "RECINTO", headerFormat))
                col++
                sheet.addCell(new Label(col, row, "INSTALACION", headerFormat))

                col = 1
                row++
                instalacionesList.each {
                    sheet.addCell(new Label(col, row, it.recinto.toString() , cellFormat))
                    col++
                    sheet.addCell(new Label(col, row, it.toString() , cellFormat))
                    row++
                    col = 1
                }
                row = row + 2

                // Añadimos las sesiones de entrenamiento
                sheet.addCell(new Label(1, row, "SESIONES DE ENTRENAMIENTO", titleFormat))
                row = row + 2
                col = 1

                DiaSemana.each {
                    sheet.addCell(new Label(col, row, it.toString(), headerFormat))
                    col++
                }
                row++
                col = 1

                int fila = row  // Guardamos la primera fila de la tabla de sesiones para volver a ella tras cada iteración
                sesionesList.each {
                    def diaSesion = it
                    diaSesion.each {
                        def sesion = it
                        String sesionInfo = "${sesion.categoria.toString()} ${sesion.horaInicio} - ${sesion.horaFin} [${sesion.recinto.toString()} - ${sesion.instalacion.toString()} (${sesion.ocupacion}%)] "
                        sheet.addCell(new Label(col, fila, sesionInfo , cellFormat))
                        fila++
                    }
                    fila = row
                    col++
                }

                sheet.setColumnView(0, 10)
                for (int c = 1; c < 40; c++) {
                    sheet.setColumnView(c, 20)
                }
            }
        } catch (Exception e) {
            e.printStackTrace()
        }
        workbook.write()
        workbook.close()
    }
}