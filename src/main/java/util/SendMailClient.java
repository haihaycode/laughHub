package util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMailClient {
	public static String send(String to, String uid) {

		LocalDateTime now = LocalDateTime.now();

		// Định dạng ngày tháng năm và giờ
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
		String formattedDateTime = now.format(formatter);

		// thiết lập
		
		final String username = "laughhubteam@gmail.com";
		final String password = "matn azcs gjmk hsiq";
		String mess = "";

		// cấu hình
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "465");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");// TLS
		prop.put("mail.smtp.starttls.required", "true");
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		Session session = Session.getInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject("Chào " + uid + " LaughHub - Chào mừng bạn đến với LaughHub");

			// Thiết lập nội dung của email với hình ảnh
			String content = "<h2>Xin chào " + uid + ",</h2><br><br>";
			content += "<p>Chúng tôi rất vui mừng khi bạn đã đến với LaughHub. Hãy truy cập <a href='http://localhost:8080/LaughHub/index' target='_blank'>trang web</a> để xem các video mới nhất.</p><br>";
			content += "<p><img  src='https://firebasestorage.googleapis.com/v0/b/webbanhang-392408.appspot.com/o/images%2Fweb.png?alt=media&token=3e5bd7c6-ce6b-4eeb-9873-eca87a01b63d' alt='LaughHub Image'></p><br>"; // Thay

			content += "<p><img  src='https://firebasestorage.googleapis.com/v0/b/webbanhang-392408.appspot.com/o/images%2F11.png?alt=media&token=12913f79-0ee4-417c-a9fe-82dabb65c6c6' alt='LaughHub Image'></p><br>";
			content += "<p><strong>Ngày tham gia:</strong> " + formattedDateTime + "</p>"; 
			content += "<p>Trân trọng,</p>";
			content += "<p>LaughHub Team</p>";
			message.setContent(content, "text/html; charset=utf-8");

			// Gửi email
			Transport.send(message);

			// Redirect hoặc hiển thị thông báo thành công
			mess = "Gửi mail thành công";
		} catch (MessagingException mex) {
			System.out.println(mex.getMessage());
			mess = "Gửi mail thất bại";
		}
		return mess;
	}
}
