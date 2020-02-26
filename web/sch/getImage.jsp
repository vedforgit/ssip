<%-- 
    Document   : getImage
    Created on : 25 Feb, 2020, 3:14:38 PM
    Author     : Parthik Shah
--%>

<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.pdfbox.pdmodel.PDPage"%>
<%@page import="org.apache.pdfbox.pdmodel.PDPageContentStream"%>
<%@page import="org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject"%>
<%@page import="org.apache.pdfbox.pdmodel.interactive.form.PDField"%>
<%@page import="org.apache.pdfbox.pdmodel.interactive.form.PDAcroForm"%>
<%@page import="org.apache.pdfbox.pdmodel.PDDocument"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Statement"%>
<%@page import="mail.SendEmail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
        <%
            String patientid = request.getParameter("pid");
              String url="jdbc:mysql://localhost:3306/patient";
		   String uname="root";
		   String pwd="root";
                   
                Connection con = null;
                
                String name = "";
                String dob = "";
                String gender = "";
                String mobile = "";
                String bloodgroup = "o+";
                String address1 = "";
                String address2 = "";
                String address3 = "";
                String id = "";
                try
                {
                     Class.forName("com.mysql.jdbc.Driver"); 
        	      con=DriverManager.getConnection(url,uname,pwd);
                      String p=(String)session.getAttribute("patientid");
                      System.out.print("value of p"+p);
                 String sql1="SELECT * FROM detail WHERE id='"+p+"'";
                  Statement st=con.createStatement();
                    st.executeQuery(sql1);
                 ResultSet rs = st.executeQuery(sql1);
                 
 
                 if(rs.next())
                 {
                    Blob blob = rs.getBlob("photo");
//                    File phot = new File();
                    name = rs.getString("firstname")+"   "+rs.getNString("lastname");
                    Date d = new Date();
                    d = rs.getDate("dob");
                    dob = d.toString();
                    gender = rs.getString("gender");
                    mobile = rs.getString("phone");
                    bloodgroup = "O+";
                    address1 = rs.getString("address");
                    address2 = "Tehsil :"+rs.getString("taluka");
                    address3 = "District :"+rs.getString("district");
                    id = rs.getString("id");
                    byte byteArray[] = blob.getBytes(1, (int)blob.length());
                    
                    
//                   msg="sucess";
                    System.out.println("getImgpage-start"); 
                    PDDocument pDDocument = PDDocument.load(new File("C:/dependency/healthcard.pdf"));
                    PDAcroForm pDAcroForm = pDDocument.getDocumentCatalog().getAcroForm();
                    PDImageXObject imgx = PDImageXObject.createFromByteArray(pDDocument, byteArray,".jpg");
                    PDPage paged = pDDocument.getPage(0);
                    PDPageContentStream contents = new PDPageContentStream(pDDocument,paged);
                    contents.drawImage(imgx,165,250);
                    
                    PDField field = pDAcroForm.getField("name");
                    field.setValue(name);
                
                    field = pDAcroForm.getField("dob");
                    field.setValue(dob);
                
                     field = pDAcroForm.getField("gender");
                    field.setValue(gender);
                
                     field = pDAcroForm.getField("mobile");
                    field.setValue(mobile);
                
                     field = pDAcroForm.getField("bloodgroup");
                    field.setValue(bloodgroup);
                
                     field = pDAcroForm.getField("address1");
                    field.setValue(address1);
                
                     field = pDAcroForm.getField("address2");
                    field.setValue(address2);
                
                    field = pDAcroForm.getField("address3");
                    field.setValue(address3);
                
                     field = pDAcroForm.getField("id");
                    field.setValue(id);
                    
//                    InputStream is = blob.getBinaryStream();
                  
                    
                    
//                     field = pDAcroForm.getField("Image");
//                    field.setValue(blob.toString());
//                    
                    File file = File.createTempFile(id+"-healthcard",".pdf");
                    
//                    File file1 = new File(is.toString());
                    pDDocument.save(file);
                    System.out.println("getImgpage-end");
//                    
//                    PDDocument doc = PDDocument.load(file);
//                    PDImageXObject pdImage = PDImageXObject.createFromFile(file.getPath(),doc); 
//                   
//                    
//                     PDPage pages = doc.getPage(1);
//                    PDPageContentStream contents = new PDPageContentStream(doc,pages); 
//                    
//                    contents.drawImage(pdImage, 250, 300);  
                    
                     SendEmail se = new SendEmail();
                     
                    boolean te=se.sendfile("medssip@gmail.com","medssip@123",rs.getString("email").toString(),"<h3>Downlnload Healthcard</h3>", file,"application.pdf");
//                    PDField field = pDAcroForm.getField("name");
//                    field.setValue(name);
                
                     System.out.println(te);
                    response.setContentType("image/gif");
                    OutputStream os = response.getOutputStream();
                    os.write(byteArray);
                    os.flush();
                    os.close();
                }
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
                finally{
    if(con != null){
        try{
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
         %>