package gobela

import grails.gorm.transactions.Transactional
import jxl.write.Label
import jxl.write.WritableCellFormat
import jxl.write.WritableSheet
import jxl.write.WritableWorkbook

@Transactional
class ContactoService {

    def filtrarContactos(params) {
        Long entidadId = params.entidad as Long
        Entidad entidad = Entidad.get(entidadId)
        return Contacto.findAllByEntidad(entidad)
    }

    def getListaClubes() {
        return Entidad.findAllByEs_club(true, [sort: ['nombreEntidad': 'asc']])
    }

    def getListaContactos(def listaEntidades) {
        def listaContactos = []

        listaEntidades.each {
            def contactos = it.contactos
            contactos.each {
                listaContactos.add(it)
            }
        }

        return listaContactos
    }

    def getListaContactosByModalidadAndClub(){
        /*def listaContactos = [:]
        def listaClubes = Club.findAll()

        listaClubes.categorias.each {
            listaContactos["${it.modalidad}"] = it.club.entidad.contactos
        }*/

        def listaContactos = Contacto.findAll()
        def listaContactosClubs = [:]

        listaContactos.each {
            if(it.entidad.es_club){
//                listaContactosClubs["${it.entidad.nombreEntidad}"]
            }
        }
        return listaContactosClubs
    }

    WritableWorkbook writeContactData(List listaContactos, WritableWorkbook workbook, WritableCellFormat headerFormat, WritableCellFormat cellFormat, WritableCellFormat titleFormat) {
        WritableSheet sheet = workbook.createSheet("Contactos", 0)
        sheet.addCell(new Label(0, 0, "Contactos", titleFormat))

        int columna = 0
        int fila = 3

        def cabeceras = ['CLUB', 'NOMBRE', 'EMAIL', 'TELEFONO']
        cabeceras.each {
            sheet.addCell(new Label(columna, fila, it, headerFormat))
            columna++
        }
        fila++
        columna = 0
        listaContactos.each {
            if (it.activo) {
                sheet.addCell(new Label(columna, fila, it.entidad.nombreEntidad.toUpperCase(), cellFormat))
                columna++
                sheet.addCell(new Label(columna, fila, it.nombre.toUpperCase(), cellFormat))
                columna++
                sheet.addCell(new Label(columna, fila, it.email.toUpperCase(), cellFormat))
                columna++
                sheet.addCell(new Label(columna, fila, it.telefono.toUpperCase(), cellFormat))
                columna = 0
                fila++
            }
        }

        for (int c = 0; c < 6; c++) {
            sheet.setColumnView(c, 40)
        }
        return workbook
    }
}
