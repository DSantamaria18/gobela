package gobela

import grails.boot.GrailsApp
import grails.gorm.transactions.Transactional
import grails.util.Holders
import org.apache.pdfbox.pdmodel.PDDocument
import org.apache.pdfbox.pdmodel.PDDocumentCatalog
import org.apache.pdfbox.pdmodel.interactive.form.PDAcroForm
import org.apache.pdfbox.pdmodel.interactive.form.PDField

@Transactional
class PdfBoxService {
    static final String UPLOAD_FOLDER = Holders.getGrailsApplication().config.uploadFolder + "/subvenciones/memoria"


    def printMemoria(Memoria memoria){
        def memoriaId = memoria.id
        println("Imprimiendo Memoria")
        File file = new File("C:\\TB\\repos\\gobela\\grails-app\\assets\\pdfTemplates\\Memoria_Deportiva.pdf")
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

            System.out.println("f is: " + f)
            if (f.contains("Taldea EquipoRow1")) {
                //DO SOMETHING
                String value = "example value"
                field.setValue(value)
                System.out.println("printed: " + value + " to: " + f)
            }
        }

        // Save edited file
//        pdfTemplate.save(UPLOAD_FOLDER + "/Memoria_Deportiva.pdf")
        pdfTemplate.save(UPLOAD_FOLDER + "/${memoriaId}/Memoria_Deportiva.pdf")
        pdfTemplate.close()
    }

    def downloadFile() {
        def filename = params.fileId.replace('###', '.')
        def memoriaId = params.memoriaId
//        String tipo = params.tipo
        String ruta = "${UPLOAD_FOLDER}/${memoriaId}/"
        def file = new File(ruta + File.separatorChar + filename)

        response.setContentType("APPLICATION/OCTET-STREAM")
        response.setHeader("Content-Disposition", "Attachment;Filename=\"${filename}\"")
        def fileInputStream = new FileInputStream(file)

        def outputStream = response.getOutputStream()
        byte[] buffer = new byte[4096]
        int len
        while ((len = fileInputStream.read(buffer)) > 0) {
            outputStream.write(buffer, 0, len)
        }
        outputStream.flush()
        outputStream.close()
        fileInputStream.close()
    }
}
