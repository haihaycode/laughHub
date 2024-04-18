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

public class sendOTP {
	public static String send(String to, int otp) {

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
			message.setSubject( "OTP - "+otp+" Khôi phục lại mật khẩu  "  );

			// Thiết lập nội dung của email với hình ảnh
			String content = "<h2>Xin chào " + to+ ",</h2><br><br>";
			content += "<p> Mã otp khôi phục của bạn là : </p>";
			content += "<p style='color: black; font-size: 60px;  text-align: center;'>" + otp + "</p>";
			content += "<p style='color: black; font-size: 22px; '>Đây là mã otp khôi phục mật khẩu của bạn tại LaughHub <br> Nếu bạn không thực hiện hành động này thì hãy bỏ qua email </p>";
			content += "<p><strong>Ngày Gửi OTP:</strong> " + formattedDateTime + "</p>";
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
