/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mail;

import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.interactive.form.PDAcroForm;
import org.apache.pdfbox.pdmodel.interactive.form.PDField;

/**
 *
 * @author vedant
 */
public class card 
{
    public static void main(String[] args) 
    {
        try {
            PDDocument pDDocument = PDDocument.load(new File("C:/dependency/healthcard1.pdf"));
            PDAcroForm pDAcroForm = pDDocument.getDocumentCatalog().getAcroForm();
            PDField field = pDAcroForm.getField("name");
            field.setValue("vedant");
            field = pDAcroForm.getField("dob");
            field.setValue("29-06-2000");
            
            field = pDAcroForm.getField("gender");
            field.setValue("male");
            
            field = pDAcroForm.getField("mobile");
            field.setValue("7567537272");
            
            field = pDAcroForm.getField("bloodgroup");
            field.setValue("O+");
            
            field = pDAcroForm.getField("address");
            field.setValue("dhg");
            
//            PDDocument pDDocument = PDDocument.load(new File("C:/dependency/healthcard1.pdf"));
            pDDocument.save(new File("C:/dependency/healthcard2.pdf"));
            
        } catch (IOException ex) {
            Logger.getLogger(card.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
}
