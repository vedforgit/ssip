<%-- 
    Document   : doctorverify
    Created on : 20 Jan, 2020, 6:09:44 PM
    Author     : vedant
--%>

<%@page import="org.apache.pdfbox.pdmodel.common.PDStream"%>
<%@page import="org.apache.pdfbox.pdmodel.interactive.form.*"%>
<%@page import="org.apache.pdfbox.pdmodel.PDDocument"%>
<%@page import="org.apache.commons.lang.RandomStringUtils"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="mail.SendEmail" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
     
     String url="jdbc:mysql://localhost:3306/doctor";
     String uname="root";
     String pass="root";
     String msg="error";
//            
            InputStream inputStream = null;
          
            String un=request.getParameter("un");
            String pwd=request.getParameter("pwd");
            String fn=request.getParameter("fn");
            String ln=request.getParameter("ln");
            String ge=request.getParameter("gender");
            String Phone=request.getParameter("phone");
            String email=request.getParameter("email");
//            String address=request.getParameter("address");
            String distric=request.getParameter("district");
            String taluka=request.getParameter("taluka");
            String li=request.getParameter("li");
            String ad=request.getParameter("address");
//            int id = Integer.parseInt(RandomStringUtils.randomNumeric(6));
            String tempi =RandomStringUtils.randomNumeric(5).toString();
     while(tempi.length()!=6)
     {
         tempi =RandomStringUtils.randomNumeric(6).toString();
     }
     int id = Integer.parseInt(tempi);
//            String phone = "";
            byte bd[] = null;                      
            out.println("start");
            try
            {
                
                ServletFileUpload sf =new ServletFileUpload(new DiskFileItemFactory());
                List<FileItem> multifiles = sf.parseRequest(request);
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(url,uname,pass);
                Statement st = con.createStatement();
                for(FileItem item : multifiles)
                {
                   System.out.println("field:"+item.getFieldName()); 
                   System.out.println("value:"+item.getString());
                   if(item.getFieldName().equals("un"))
                   {
                       un = item.getString();
                   }
                   if(item.getFieldName().equals("address"))
                   {
                       ad = item.getString();
                   }
                   if(item.getFieldName().equals("pwd"))
                   {
                       pwd = item.getString();
                   }
                   if(item.getFieldName().equals("fn"))
                   {
                       fn = item.getString();
                   }
                   if(item.getFieldName().equals("ln"))
                   {
                       ln = item.getString();
                   }
                   if(item.getFieldName().equals("gender"))
                   {
                       ge = item.getString();
                   }
                   if(item.getFieldName().equals("phone"))
                   {
                       Phone = item.getString();
                   }
                   if(item.getFieldName().equals("email"))
                   {
                       email = item.getString();
                   }
                   if(item.getFieldName().equals("address"))
                   {
                       ad = item.getString();
                   }
                   if(item.getFieldName().equals("district"))
                   {
                       distric = item.getString();
                   }
                   if(item.getFieldName().equals("taluka"))
                   {
                       taluka = item.getString();
                   }
                   if(item.getFieldName().equals("li"))
                   {
                       li = item.getString();
                   }
//                   System.out.println(item.getSize());
//                   System.out.println(item.getContentType());
                   inputStream = item.getInputStream();
                    bd = item.get();
                }
               
                
                
                out.print("page start");
                PreparedStatement ps = con.prepareStatement("insert into detail value(?,?,?,?,?,?,?,?,?,?,?,?,?)");
                ps.setInt(1,id);
                ps.setString(2,fn);
                ps.setString(3,ln);
                ps.setString(4,un);
                ps.setString(5,pwd);
                ps.setString(6,ge);
                ps.setString(7,Phone);
                ps.setString(8,email);
                ps.setString(9,ad);
                ps.setString(10,distric);
                ps.setString(11,taluka);
                ps.setString(12,li);
                ps.setBlob(13,inputStream);
                int x = ps.executeUpdate();
                if(x==0)
                {
                    out.println("nothing");
                  
                }
                else
                {
                    msg="sucess";
                    
                    PDDocument pDDocument = PDDocument.load(new File("C:/Users/vedant/Desktop/doc1.pdf"));
                    PDAcroForm pDAcroForm = pDDocument.getDocumentCatalog().getAcroForm();
                    PDField field = pDAcroForm.getField("application");
                    field.setValue(id+"");
                    field = pDAcroForm.getField("name");
                    field.setValue(fn+" "+ln);
                    
                    field = pDAcroForm.getField("email");
                    field.setValue(email);
                    
                    field = pDAcroForm.getField("contact");
                    field.setValue(Phone);
                    
                    field = pDAcroForm.getField("address");
                    field.setValue(ad);
                   
                    
                    File file = File.createTempFile(application+"",".pdf");
//                    FileOutputStream fos = new FileOutputStream(file);
                    
                    pDDocument.save(file);
                    
                    SendEmail se = new SendEmail();
                    boolean te=se.sendfile("medssip@gmail.com","medssip@123",email,"<h3>thanks for registration", file,"application.pdf");
                    out.print(te);
                   //PDStream pdStream = new PDStream(pDDocument);
                    //byte[] data = pdStream.toByteArray();
                    
                    
                    //pDDocument.save("C:/Users/vedant/Desktop/output.pdf");
                    //pDDocument.close();
                    
                }
      
//                Configuration cond = new Configuration().configure().addAnnotatedClass(detail.class);
//                SessionFactory sfd =  cond.buildSessionFactory();
//                Session s=sfd.openSession();
//                Transaction t = s.beginTransaction();
//                detail dt = new detail();
//                dt.setId(id);
//                dt.setFirstname(fn);
//                dt.setLastname(ln);
//                dt.setUsername(un);
//                dt.setPassword(pwd);
//                dt.setGender(ge);
//                dt.setPhonenumber(phone);
//                dt.setEmail(email);
//                dt.setDistrict(distric);
//                dt.setTaluka(taluka);
//                dt.setLicense(li);
//                dt.setDegree(bd);
//                s.save(dt);
//                t.commit();
                out.print("sucess");
                
            }
            catch(Exception e)
            {
                System.out.println(e);
                out.print(e);
            }
            
            
//            out.println(un);
//            out.println(pwd);
//            out.println(fn);
//            out.println(ln);
//            out.println(ge);
//            out.println(phone);
//            out.println(email);
//            out.println(distric);
//            out.println(li);



    
           
%>
<head>
<script>
    function myload()
    {
        msg = "<%=msg%>";
        if(msg == 'sucess')
        {
            alert("PLEASE NOTEDOWN:\n"+
                    "Your Application Number:"+<%=id%>+"\n"
                    +"Your USERNAME:<%=un%>");
            window.location.href="http://localhost:8084/WebApplication1/sch/login.html";
        }
        else
        {
            alert("Something went wrong....");
        }
    }
</script>
</head>
<body onload="myload()">
    