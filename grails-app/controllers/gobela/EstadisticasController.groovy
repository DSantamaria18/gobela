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

class EstadisticasController {

    def InformesService

    def index() {
        def resultList = InformesService.subvencionesPorLinea()
        [resultList: resultList]
    }

    def exportarInformeSub() {
        def resultList = InformesService.subvencionesPorLinea()
        response.setContentType('application/vnd.ms-excel')
        response.setHeader('Content-Disposition', 'Attachment;Filename="subvenciones.xls"')
        WorkbookSettings ws = new WorkbookSettings()
        ws.setLocale(new Locale("es", "ES"))
        WritableWorkbook workbook = Workbook.createWorkbook(response.outputStream, ws)

        try {
            for (int i = 0; i < resultList.size(); i++) {
                String nombreHoja = "Linea ${i + 1}"
                def datosLinea = resultList[i]
                if (datosLinea.size() > 0) {
                    WritableSheet sheet = workbook.createSheet(nombreHoja, i)
                    WritableFont titleFont = new WritableFont(WritableFont.ARIAL, 16, WritableFont.BOLD)
                    WritableCellFormat titleFormat = new WritableCellFormat()
                    titleFormat.setFont(titleFont)

                    WritableFont headerFont = new WritableFont(WritableFont.ARIAL, 11, WritableFont.BOLD)
                    WritableCellFormat headerFormat = new WritableCellFormat()
                    headerFormat.with {
                        setBackground(Colour.GREY_25_PERCENT)
                        setBorder(Border.ALL, BorderLineStyle.THIN)
                        setFont(headerFont)
                        setWrap(true)
                    }

                    WritableFont cellFont = new WritableFont(WritableFont.ARIAL, 10)
                    WritableCellFormat cellFormat = new WritableCellFormat()
                    cellFormat.with {
                        setFont(cellFont)
                        setBorder(Border.ALL, BorderLineStyle.THIN)
                        setWrap(true)
                    }

                    sheet.addCell(new Label(0, 0, "SUBVENCIONES LINEA ${i + 1}", titleFormat))
                    def cabeceras = datosLinea[0].keySet()

                    for (int j = 0; j < cabeceras.size(); j++) {
                        sheet.addCell(new Label(j, 3, cabeceras[j].toUpperCase(), headerFormat))
                    }
                    for (int z = 0; z < datosLinea.size(); z++) {
                        def subvencion = datosLinea[z]
                        for (int x = 0; x < subvencion.size(); x++) {
                            if (subvencion[x] && subvencion[x].getClass() == String) {
                                sheet.addCell(new Label(x, z + 4, subvencion[x], cellFormat))
                            } else {
                                if (subvencion[x].getClass() == BigDecimal) {
                                    sheet.addCell(new Number(x, z + 4, subvencion[x], cellFormat))
                                    //sheet.addCell(new Number(x, z + 4, subvencion[x], currencyFormat))
                                } else {
                                    if (subvencion[x]) sheet.addCell(new Number(x, z + 4, subvencion[x], cellFormat))
                                }
                            }
                        }
                    }
                    for (int n = 0; n < datosLinea[0].size() - 2; n++) {
                        sheet.addCell(new Label(n, datosLinea.size() + 4, "", headerFormat))
                    }
                    int colum = datosLinea[0].size() - 1
                    int rowIni = 5
                    int rowFin = rowIni + datosLinea.size() - 1
                    sheet.addCell(new Label(datosLinea[0].size() - 2, datosLinea.size() + 4, "TOTAL:", headerFormat))
                    Formula total = new Formula(colum, rowFin, "SUMA(C${rowIni}:C${rowFin})", headerFormat)
                    sheet.addCell(total)

                    for (int c = 0; c < 10; c++) {
                        sheet.setColumnView(c, 20)
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace()
        }

        workbook.write()
        workbook.close()
    }


    def infEventos() {
    }

    def generaInfEventos(params) {
        def resultList = InformesService.eventosPorFechas(params.fDesde, params.fHasta)
        def total = resultList[0].Eventos.first()
        def relevantes = resultList[1].Eventos.first()
        def adaptado = resultList[2].Eventos.first()
        def inclusivo = resultList[3].Eventos.first()
        def tipoActividadList = resultList[4]
        def actividadList = resultList[5]
        def recintoList = resultList[6]
        def lugarList = resultList[7]
        def modalidadList = resultList[8]
        def publicoDestList = resultList[9]
        def edadList = resultList[10]
        def euskeraGKList = resultList[11]
        def euskeraDesarrolloList = resultList[12]
        def euskeraSpeakerList = resultList[13]

        render template: "tablasInfEventos", model: [total: total, relevantes: relevantes, adaptado: adaptado, incusivo: inclusivo, tipoActividadList: tipoActividadList, actividadList: actividadList, recintoList: recintoList, lugarList: lugarList, modalidadList: modalidadList, publicoDestList: publicoDestList, edadList: edadList, euskeraGKList: euskeraGKList, euskeraDesarrolloList: euskeraDesarrolloList, euskeraSpeakerList: euskeraSpeakerList]
    }

    def exportarInformeEventos(params) {
        String fDesde = params.fechaDesde_year + "-" + params.fechaDesde_month + "-" + params.fechaDesde_day
        String fHasta = params.fechaHasta_year + "-" + params.fechaHasta_month + "-" + params.fechaHasta_day
        String fechaDesde = fDesde.split('-').reverse().join('-')
        String fechaHasta = fHasta.split('-').reverse().join('-')

        def resultList = InformesService.eventosPorFechas(fDesde, fHasta)
        def total = resultList[0].Eventos.first()
        def relevantes = resultList[1].Eventos.first()
        def adaptado = resultList[2].Eventos.first()
        def inclusivo = resultList[3].Eventos.first()
        def tipoActividadList = resultList[4].collect { it.values() }
        def actividadList = resultList[5].collect { it.values() }
        def recintoList = resultList[6].collect { it.values() }
        def lugarList = resultList[7].collect { it.values() }
        def modalidadList = resultList[8].collect { it.values() }
        def publicoDestList = resultList[9].collect { it.values() }
        def edadList = resultList[10].collect { it.values() }
        def euskeraGKList = resultList[11].collect { it.values() }
        def euskeraDesarrolloList = resultList[12].collect { it.values() }
        def euskeraSpeakerList = resultList[13].collect { it.values() }


        response.setContentType('application/vnd.ms-excel')
        response.setHeader('Content-Disposition', "Attachment;Filename='Informe_Eventos_${fechaDesde}_${fechaHasta}.xls'")
        WorkbookSettings ws = new WorkbookSettings()
        ws.setLocale(new Locale("es", "ES"))
        WritableWorkbook workbook = Workbook.createWorkbook(response.outputStream, ws)

        WritableFont titleFont = new WritableFont(WritableFont.ARIAL, 16, WritableFont.BOLD)
        WritableCellFormat titleFormat = new WritableCellFormat()
        titleFormat.setFont(titleFont)

        WritableFont headerFont = new WritableFont(WritableFont.ARIAL, 11, WritableFont.BOLD)
        WritableCellFormat headerFormat = new WritableCellFormat()
        headerFormat.with {
            setBackground(Colour.GREY_25_PERCENT)
            setBorder(Border.ALL, BorderLineStyle.THIN)
            setFont(headerFont)
            setWrap(true)
        }

        WritableFont cellFont = new WritableFont(WritableFont.ARIAL, 10)
        WritableCellFormat cellFormat = new WritableCellFormat()
        cellFormat.with {
            setFont(cellFont)
            setBorder(Border.ALL, BorderLineStyle.THIN)
            setWrap(true)
        }

        String nombreHoja = "Informe de Eventos"
        WritableSheet sheet = workbook.createSheet(nombreHoja, 0)

        sheet.addCell(new Label(0, 0, "Eventos entre ${fechaDesde} y ${fechaHasta}", titleFormat))

        int columna = 0
        int fila = 3
        try {
            sheet.addCell(new Label(columna, fila, "TOTAL DE EVENTOS: ", titleFormat))
            sheet.addCell(new Number(columna + 1, fila, total, titleFormat))
            fila = fila + 2

            sheet.addCell(new Label(columna, fila, "RELEVANTES: ", titleFormat))
            sheet.addCell(new Number(columna + 1, fila, relevantes, titleFormat))
            fila = fila + 2

            sheet.addCell(new Label(columna, fila, "DEPORTE ADAPTADO: ", titleFormat))
            sheet.addCell(new Number(columna + 1, fila, adaptado, titleFormat))
            fila = fila + 2

            sheet.addCell(new Label(columna, fila, "DEPORTE INCLUSIVO: ", titleFormat))
            sheet.addCell(new Number(columna + 1, fila, inclusivo, titleFormat))
            fila = fila + 2

            sheet.addCell(new Label(columna, fila, "EVENTOS POR TIPO DE ACTIVIDAD: ", titleFormat))
            sheet.addCell(new Label(columna, fila + 1, "Tipo de Actividad", headerFormat))
            sheet.addCell(new Label(columna + 1, fila + 1, "Num Eventos", headerFormat))
            fila = fila + 2
            tipoActividadList.each {
                sheet.addCell(new Label(columna, fila, it[0], cellFormat))
                sheet.addCell(new Number(columna + 1, fila, it[1], cellFormat))
                fila++
            }
            fila = fila + 2

            sheet.addCell(new Label(columna, fila, "EVENTOS POR ACTIVIDAD: ", titleFormat))
            sheet.addCell(new Label(columna, fila + 1, "Actividad", headerFormat))
            sheet.addCell(new Label(columna + 1, fila + 1, "Num Eventos", headerFormat))
            fila = fila + 2
            actividadList.each {
                sheet.addCell(new Label(columna, fila, it[0], cellFormat))
                sheet.addCell(new Number(columna + 1, fila, it[1], cellFormat))
                fila++
            }
            fila = fila + 2

            sheet.addCell(new Label(columna, fila, "EVENTOS POR RECINTO: ", titleFormat))
            sheet.addCell(new Label(columna, fila + 1, "Tipo de Actividad", headerFormat))
            sheet.addCell(new Label(columna + 1, fila + 1, "Num Eventos", headerFormat))
            fila = fila + 2
            recintoList.each {
                sheet.addCell(new Label(columna, fila, it[0], cellFormat))
                sheet.addCell(new Number(columna + 1, fila, it[1], cellFormat))
                fila++
            }
            fila = fila + 2

            sheet.addCell(new Label(columna, fila, "EVENTOS POR LUGAR: ", titleFormat))
            sheet.addCell(new Label(columna, fila + 1, "LUGAR", headerFormat))
            sheet.addCell(new Label(columna + 1, fila + 1, "Num Eventos", headerFormat))
            fila = fila + 2
            lugarList.each {
                sheet.addCell(new Label(columna, fila, it[0], cellFormat))
                sheet.addCell(new Number(columna + 1, fila, it[1], cellFormat))
                fila++
            }
            fila = fila + 2

            sheet.addCell(new Label(columna, fila, "EVENTOS POR MODALIDAD: ", titleFormat))
            sheet.addCell(new Label(columna, fila + 1, "Modalidad", headerFormat))
            sheet.addCell(new Label(columna + 1, fila + 1, "Num Eventos", headerFormat))
            fila = fila + 2
            modalidadList.each {
                sheet.addCell(new Label(columna, fila, it[0], cellFormat))
                sheet.addCell(new Number(columna + 1, fila, it[1], cellFormat))
                fila++
            }
            fila = fila + 2

            sheet.addCell(new Label(columna, fila, "EVENTOS POR PERFIL DE GENERO: ", titleFormat))
            sheet.addCell(new Label(columna, fila + 1, "Público Destinatario", headerFormat))
            sheet.addCell(new Label(columna + 1, fila + 1, "Num Eventos", headerFormat))
            fila = fila + 2
            publicoDestList.each {
                sheet.addCell(new Label(columna, fila, it[0], cellFormat))
                sheet.addCell(new Number(columna + 1, fila, it[1], cellFormat))
                fila++
            }
            fila = fila + 2

            sheet.addCell(new Label(columna, fila, "EVENTOS POR PERFIL DE EDAD: ", titleFormat))
            sheet.addCell(new Label(columna, fila + 1, "Tipo de Público", headerFormat))
            sheet.addCell(new Label(columna + 1, fila + 1, "Num Eventos", headerFormat))
            fila = fila + 2
            edadList.each {
                sheet.addCell(new Label(columna, fila, it[0], cellFormat))
                sheet.addCell(new Number(columna + 1, fila, it[1], cellFormat))
                fila++
            }
            fila = fila + 2

            sheet.addCell(new Label(columna, fila, "EVENTOS POR PERFIL LINGÜÍSTICO: ", titleFormat))
            sheet.addCell(new Label(columna, fila + 1, "Comunicación con GK", headerFormat))
            sheet.addCell(new Label(columna + 1, fila + 1, "Num Eventos", headerFormat))
            fila = fila + 2
            euskeraGKList.each {
                sheet.addCell(new Label(columna, fila, it[0], cellFormat))
                sheet.addCell(new Number(columna + 1, fila, it[1], cellFormat))
                fila++
            }
            sheet.addCell(new Label(columna, fila + 1, "Desarrollo del Evento", headerFormat))
            sheet.addCell(new Label(columna + 1, fila + 1, "Num Eventos", headerFormat))
            fila = fila + 2
            euskeraDesarrolloList.each {
                sheet.addCell(new Label(columna, fila, it[0], cellFormat))
                sheet.addCell(new Number(columna + 1, fila, it[1], cellFormat))
                fila++
            }
            sheet.addCell(new Label(columna, fila + 1, "Speaker", headerFormat))
            sheet.addCell(new Label(columna + 1, fila + 1, "Num Eventos", headerFormat))
            fila = fila + 2
            euskeraSpeakerList.each {
                sheet.addCell(new Label(columna, fila, it[0], cellFormat))
                sheet.addCell(new Number(columna + 1, fila, it[1], cellFormat))
                fila++
            }
            fila = fila + 2

            sheet.setColumnView(0, 35)
            for (int c = 1; c < 5; c++) {
                sheet.setColumnView(c, 15)
            }

        } catch (Exception e) {
            e.printStackTrace()
        }

        workbook.write()
        workbook.close()
    }
}
