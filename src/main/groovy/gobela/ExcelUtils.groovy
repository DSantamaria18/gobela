package gobela

import jxl.Workbook
import jxl.WorkbookSettings
import jxl.write.Border
import jxl.write.BorderLineStyle
import jxl.write.Colour
import jxl.write.WritableCellFormat
import jxl.write.WritableFont
import jxl.write.WritableWorkbook

class ExcelUtils {

    static WritableWorkbook createWorkbook(def response, String filename) {
        response.setContentType('application/vnd.ms-excel')
        response.setHeader('Content-Disposition', "Attachment;Filename='${filename}.xls'")
        WorkbookSettings ws = new WorkbookSettings()
        ws.setLocale(new Locale("es", "ES"))
        WritableWorkbook workbook = Workbook.createWorkbook(response.outputStream, ws)
        return workbook
    }

    static WritableCellFormat defaultTitleFormat() {
        WritableFont titleFont = new WritableFont(WritableFont.ARIAL, 16, WritableFont.BOLD)
        WritableCellFormat titleFormat = new WritableCellFormat()
        titleFormat.setFont(titleFont)
        return titleFormat
    }

    static WritableCellFormat defaultHeaderFormat(){
        WritableFont headerFont = new WritableFont(WritableFont.ARIAL, 11, WritableFont.BOLD)
        WritableCellFormat headerFormat = new WritableCellFormat()
        headerFormat.with {
            setBackground(Colour.GREY_25_PERCENT)
            setBorder(Border.ALL, BorderLineStyle.THIN)
            setFont(headerFont)
            setWrap(true)
        }
        return headerFormat
    }

    static WritableCellFormat defaultCellFormat(){
        WritableFont cellFont = new WritableFont(WritableFont.ARIAL, 10)
        WritableCellFormat cellFormat = new WritableCellFormat()
        cellFormat.with {
            setFont(cellFont)
            setBorder(Border.ALL, BorderLineStyle.THIN)
            setWrap(true)
        }
        return cellFormat
    }
}
