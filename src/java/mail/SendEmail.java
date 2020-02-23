package mail;


import com.sun.xml.internal.ws.encoding.DataHandlerDataSource;
import java.io.*;
import java.util.*; 
import javax.mail.*; 
import javax.mail.internet.*; 
import javax.activation.*; 
import javax.mail.Session; 
import javax.mail.Transport;

public class SendEmail
{
    
     public boolean sendfile(String sender,String password,String recipient,String msg,File f,String filename)
     {
         boolean val = false;
         
         // Recipient's email ID needs to be mentioned.
//      String to = "destinationemail@gmail.com";

      // Sender's email ID needs to be mentioned
//      String from = "fromemail@gmail.com";
//      final String username = "manishaspatil";//change accordingly
//      final String password = "******";//change accordingly

      // Assuming you are sending email through relay.jangosmtp.net
      String host = "localhost";

      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", "smtp.gmail.com");
      
      props.put("mail.smtp.port", "587");

      // Get the Session object.
      Session session = Session.getInstance(props,
         new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(sender,password);
	   }
         });

         
         
         
        try 
        { 
            // MimeMessage object. 
            MimeMessage message = new MimeMessage(session); 
      
            // Set From Field: adding senders email to from field. 
            message.setFrom(new InternetAddress(sender)); 
      
            // Set To Field: adding recipient's email to from field. 
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
      
            // Set Subject: subject of the email 
            message.setSubject("Reciept of application"); 
              
            // creating first MimeBodyPart object 
            BodyPart messageBodyPart1 = new MimeBodyPart();  
 
//            messageBodyPart1.setText("This is body of the mail"); 
            messageBodyPart1.setContent(msg,"text/html");
            
            // creating second MimeBodyPart object 
            BodyPart messageBodyPart2 = new MimeBodyPart();  
//            String filename = "attachment.txt"
            DataSource source = new FileDataSource(f);
            messageBodyPart2.setDataHandler(new DataHandler(source));   
            messageBodyPart2.setFileName(filename);   
              
            // creating MultiPart object 
            Multipart multipartObject = new MimeMultipart();   
            multipartObject.addBodyPart(messageBodyPart1);   
            multipartObject.addBodyPart(messageBodyPart2); 
      
      
      
            // set body of the email. 
            message.setContent(multipartObject); 
      
            // Send email. 
            Transport.send(message); 
            System.out.println("Mail successfully sent"); 
            val = true;
            return val;
        } 
        catch (MessagingException mex)  
        { 
            mex.printStackTrace(); 
            return val;
        } 
         
         
     }
}
