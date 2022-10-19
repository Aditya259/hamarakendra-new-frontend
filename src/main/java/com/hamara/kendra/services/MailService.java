package com.hamara.kendra.services;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class MailService {

	@Value("${emailFrom}")
	private String emailFrom;

	@Value("${emailUserName}")
	private String emailUserName;

	@Value("${email_app_password}")
	private String emailAppPassword;

	@Value("${attachmetPath}")
	private String attachmetPath;

	public String getAttachmetPath() {
		return attachmetPath;
	}

	public String getEmailUserName() {
		return emailUserName;
	}

	public String getEmailAppPassword() {
		return emailAppPassword;
	}

	public String getEmailFrom() {
		return emailFrom;
	}

	static Properties properties = new Properties();
	static {
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
	}

	public void sendMail(String toMail, String name) {
		String returnStatement = null;
		try {
			Authenticator auth = new Authenticator() {
				public PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(emailUserName, emailAppPassword);
				}
			};
			Session session = Session.getInstance(properties, auth);
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(emailFrom));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(name));
			message.setSentDate(new Date());
			message.setSubject("Hamara Kendra Service Request");
			message.setText("<p>Hi,</p>\r\n" + "\r\n" + "<p>Thank you for selecting Hamra Kendra.<br />\r\n"
					+ "We have received your request and we will connect with you soon.</p>\r\n" + "\r\n"
					+ "<p>&nbsp;</p>\r\n" + "\r\n" + "<p><strong>Thanks &amp; Regards,<br />\r\n"
					+ "Hamara Kendra</strong></p>\r\n" + "\r\n" + "<p>&nbsp;</p>");
			returnStatement = "The e-mail was sent successfully";
			System.out.println(returnStatement);
			Transport.send(message);
		} catch (Exception e) {
			returnStatement = "error in sending mail";
			e.printStackTrace();
		}
	}

	public void sendMailWithAttachment(String toMail, String name) {
		String returnStatement = null;
		try {
			Authenticator auth = new Authenticator() {
				public PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(emailUserName, emailAppPassword);
				}
			};
			Session session = Session.getInstance(properties, auth);
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(emailFrom));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(name));
			message.setSentDate(new Date());
			message.setSubject("Hamara Kendra Service Request");

			Multipart multipart = new MimeMultipart();

			MimeBodyPart attachmentPart = new MimeBodyPart();

			MimeBodyPart textPart = new MimeBodyPart();

			try {
				StringBuffer sb = new StringBuffer();
				sb.append("Hi,");
				sb.append("\n");
				sb.append("\n");
				sb.append("Thank you for selecting Hamra Kendra.");
				sb.append("\n");
				sb.append("We have received your request and we will connect with you soon.");
				sb.append("\n");
				sb.append("\n");
				sb.append("\n");
				sb.append("Thanks & Regards");
				sb.append("\n");
				sb.append("Hamara Kendra");

				//File f = new File("C:\\Users\\aditya\\Downloads\\ConsentLetter.pdf");
				File f = new File(attachmetPath);
				
				attachmentPart.attachFile(f);
				textPart.setText(sb.toString());
				multipart.addBodyPart(textPart);
				multipart.addBodyPart(attachmentPart);

			} catch (IOException e) {

				e.printStackTrace();

			}

			message.setContent(multipart);

			System.out.println("sending...");
			// Send message
			Transport.send(message);
			System.out.println("Sent message successfully....");
		} catch (Exception e) {
			returnStatement = "error in sending mail";
			e.printStackTrace();
		}
	}

	public void sendSelfMailWithAttachment(String toMail, String name, String selectedService, String custName) {
		String returnStatement = null;
		try {
			Authenticator auth = new Authenticator() {
				public PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(emailUserName, emailAppPassword);
				}
			};
			Session session = Session.getInstance(properties, auth);
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(emailFrom));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(emailFrom));
			message.setSentDate(new Date());
			message.setSubject("Hamara Kendra Service Request - " + selectedService + " " + custName);

			Multipart multipart = new MimeMultipart();

			MimeBodyPart attachmentPart = new MimeBodyPart();

			MimeBodyPart textPart = new MimeBodyPart();

			try {
				StringBuffer sb = new StringBuffer();
				sb.append("Hi Admin,");
				sb.append("\n");
				sb.append("\n");
				sb.append("Customer " + custName + " ( " + name + " ) " + " has submitted the request for "
						+ selectedService);
				sb.append("\n");
				sb.append("And accepted the attached consent");
				sb.append("\n");
				sb.append("\n");
				sb.append("\n");
				sb.append("Thanks & Regards");
				sb.append("\n");
				sb.append("Hamara Kendra");

				//File f = new File("C:\\Users\\aditya\\Downloads\\ConsentLetter.pdf");
				File f = new File(attachmetPath);
				
				attachmentPart.attachFile(f);
				textPart.setText(sb.toString());
				multipart.addBodyPart(textPart);
				multipart.addBodyPart(attachmentPart);

			} catch (IOException e) {

				e.printStackTrace();

			}

			message.setContent(multipart);

			System.out.println("sending...");
			// Send message
			Transport.send(message);
			System.out.println("Sent message successfully....");
		} catch (Exception e) {
			returnStatement = "error in sending mail";
			e.printStackTrace();
		}
	}
}
