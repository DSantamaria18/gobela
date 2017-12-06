package gobela


import grails.gorm.transactions.Transactional
import grails.util.Holders
import org.apache.pdfbox.pdmodel.PDDocument
import org.apache.pdfbox.pdmodel.PDDocumentCatalog
import org.apache.pdfbox.pdmodel.interactive.form.PDAcroForm
import org.apache.pdfbox.pdmodel.interactive.form.PDField

@Transactional
class PdfBoxService {
    static final String PDF_TEMPLATES_FOLDER = Holders.getGrailsApplication().config.uploadFolder + "/subvenciones/pdfTemplates/"

    def printMemoria(final Memoria memoria, final String path) {
        final def memoriaId = memoria.id

//        println("Imprimiendo Memoria ${memoriaId}")
        File file = new File(PDF_TEMPLATES_FOLDER + "Memoria_deportiva.pdf")
        PDDocument pdfTemplate = PDDocument.load(file)
        PDDocumentCatalog docCatalog = pdfTemplate.getDocumentCatalog()
        PDAcroForm acroForm = docCatalog.getAcroForm()

        // Get field names
        List<PDField> fieldList = acroForm.getFields()

        // String the object array
        String[] fieldArray = new String[fieldList.size()]
        int i = 0
        for (PDField sField : fieldList) {
            fieldArray[i] = sField.getFullyQualifiedName()
            i++
        }

        // Loop through each field in the array and do something
        for (String f : fieldArray) {
            PDField field = acroForm.getField(f)
            String value = ""

//            System.out.println("f is: " + f)
            if (f.contains("1Situación actual del club")) {
                value = memoria.situacion
            }

            if (f.contains("2 Retos planteados Objetivos que se espera lograr")) {
                value = memoria.retos
            }

            if (f.contains("3 Acciones y actividades a desarrollar")) {
                value = memoria.acciones
            }

            if (f.contains("4 Propuestas de mejora con respecto a temporadas anteriores")) {
                value = memoria.mejoras
            }

            if (f.contains("5 Sistemas de evaluación y seguimiento")) {
                value = memoria.sistemas
            }

            if (f.contains("6 Personal técnico Detallar el personal que se encargará del desarrollo de las actividades " +
                    "sus perfiles y gastos dedicados a cada integrante del equipo")) {
                value = memoria.tecnicos
            }

            if (f.equals("Kirolarikopurua Número de deportistasRow1")) {
                value = memoria.numDeportistas
            }

            if (f.equals("Emakumezkoak MujeresRow1")) {
                value = memoria.numMujeres
            }

            if (f.equals("Gizonezkoak HombresRow1")) {
                value = memoria.numHombres
            }

            if (f.equals("Getxokoak Residentes en GetxoRow1")) {
                value = memoria.numResidentes
            }

            if (f.contains("8 Participación en la política deportiva local")) {
                value = memoria.politicaDeportiva
            }

            if (f.contains("9 Otras colaboraciones a destacar")) {
                value = memoria.colaboraciones
            }

            if (f.contains("10 Contribuciones a la difusión de una imagen positiva de Getxo en el exterior se podrán " +
                    "adjuntar pruebas justificativas")) {
                value = memoria.contribuciones
            }

            field.setValue(value)
//            System.out.println("printed: " + value + " to: " + f)
        }

        // Save edited file
        String ruta = "${path}/${memoriaId}/"
        File folder = new File(ruta)
        if (!folder.exists()) {
            folder.mkdirs()
        }
        pdfTemplate.save(path + "/${memoriaId}/${memoriaId}_Memoria_Deportiva.pdf")
        pdfTemplate.close()
    }
}
