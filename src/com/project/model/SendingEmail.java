package com.project.model;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.javafx.binding.StringFormatter;

public class SendingEmail {

	public static void sendEmail(String email,String token){
   try{
	Properties properties = new Properties();
	properties.put("mail.smtp.auth","true");
	properties.put("mail.smtp.starttls.enable","true");
	properties.put("mail.smtp.host", "smtp.gmail.com");
	properties.put("mail.smtp.port", "587");

      // Get the default Session object.
      Session session = Session.getInstance(properties,new Authenticator() {
    	  protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(AdditionalInfo.COMPANYEMAIL,AdditionalInfo.PASSWORD);
		}
	});
         // Create a default MimeMessage object.
         MimeMessage message = new MimeMessage(session);

         // Set From: header field of the header.
         message.setFrom(new InternetAddress("esacincapp@gmail.com"));

         // Set To: header field of the header.
         message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

         // Set Subject: header field
         message.setSubject("Reset Password");

         // Now set the actual message
         message.setText("click on the link to activate your account<a href='http://localhost:8080/J2EEProject/resetPasword?email="+email+"&token="+token+"'>click here to reset the password</a>","UTF-8", "html");
         // Send message
         Transport.send(message);
         System.out.println("Sent message successfully....");
      }
      catch (MessagingException mex) {
	  System.out.println("error while sending email "+mex.getMessage());
}
}
}
