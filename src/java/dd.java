
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.interactive.form.PDAcroForm;
import java.io.*;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;
import org.apache.pdfbox.pdmodel.interactive.form.PDField;


import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import mail.ResizeImageExample;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author vedant
 */
public class dd 
{
    public static void main(String[] args) throws IOException {
        
        System.out.println("getImgpage-start"); 
                    PDDocument pDDocument = PDDocument.load(new File("C:/dependency/healthcard.pdf"));
                    PDAcroForm pDAcroForm = pDDocument.getDocumentCatalog().getAcroForm();
//                    PDPage page = (PDPage)pDDocument.getDocumentCatalog().getAllPages().get(0);
//                    PDPageContentStream contentStream = new PDPageContentStream(pDDocument, page ,true, true);
//                    contentStream.drawImage( ximage, 425, 675 );
//                    pDAcroForm.
//                    PDImageXObject imgx = PDImageXObject.createFromByteArray(pDDocument, byteArray,".jpg");
//                    PDPage paged = pDDocument.getPage(0);
//                    PDPageContentStream contents = new PDPageContentStream(pDDocument,paged);
//                    contents.drawImage(imgx,165,250);
//                    pDDocument.getDocument().;


                    PDField field = pDAcroForm.getField("name");
                    field.setValue("Vedant Raval");
                    
                    
                    
                    field = pDAcroForm.getField("dob");
                    field.setValue("29-06-00");
                
                     field = pDAcroForm.getField("gender");
                    field.setValue("male");
                
                     field = pDAcroForm.getField("mobile");
                    field.setValue("9724067806");
                
                     field = pDAcroForm.getField("bloodgroup");
                    field.setValue("o+");
                
                     field = pDAcroForm.getField("address1");
                    field.setValue("k-133");
                
                     field = pDAcroForm.getField("address2");
                    field.setValue("Taluka:Gandhinagar");
                
                    field = pDAcroForm.getField("address3");
                    field.setValue("District:Gandhinagr");
                
                     field = pDAcroForm.getField("id");
                    field.setValue("1721bece30129");
                    
                    
                    
//                    InputStream is = blob.getBinaryStream();
                  

                    
                    
//                     field = pDAcroForm.getField("Image");
//                    field.setValue(blob.toString());
//                    
//                    File file = File.createTempFile(id+"-healthcard",".pdf");
                    File file = new File("C:/dependency/shubham.pdf");
                    
                    pDDocument.save(file);
                    
                    PDDocument doc = null;
        try {
            
            File file1 = new File("C:/dependency/shubham.pdf");
            doc = PDDocument.load(file1);
            // Choose IMAGE File
//            ResizeImageExample rie = new ResizeImageExample();
            File img = new File("C:/dependency/rsz_cps_0006.jpg");
//            File input = new File("C:/Users/vedant/Downloads/CPS_0006.jpg");
            BufferedImage image = ImageIO.read(img);
            
            image = ResizeImageExample.resize(image, 0, 0);
            
            
            PDImageXObject pdImage = PDImageXObject.createFromFile("C:/dependency/rsz_cps_0006.jpg", doc);
//            PDImageXObject pdImage = ;
//            pdImage.setHeight(14);
//            pdImage.setWidth(50);
            PDPage page = doc.getPage(0);
            PDPageContentStream contentStream = new PDPageContentStream(doc, page);
            // Set Position of image on PDF
            contentStream.drawImage(pdImage,30,30);
            contentStream.close();
            doc.save("C:/dependency/shubham1.pdf");
            doc.close();
                    
        
    }
        catch (IOException e) {
            e.printStackTrace();
        }
    
}
}