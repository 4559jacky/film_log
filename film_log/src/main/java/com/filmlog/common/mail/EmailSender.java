/*
 * package com.filmlog.common.mail;
 * 
 * import java.io.FileNotFoundException; import java.io.FileReader; import
 * java.io.IOException; import java.util.Properties;
 * 
 * import javax.mail.Authenticator; import javax.mail.Message; import
 * javax.mail.MessagingException; import javax.mail.PasswordAuthentication;
 * import javax.mail.Session; import javax.mail.Transport; import
 * javax.mail.internet.InternetAddress; import javax.mail.internet.MimeMessage;
 * 
 * public class EmailSender { public static void sendEmail(String toEmail,
 * String subject, String body) throws FileNotFoundException, IOException {
 * Properties prop = new Properties();
 * 
 * String path = EmailSender.class.getResource("smtp.properties").getPath();
 * prop.load(new FileReader(path)); String host = prop.getProperty("host");
 * String fromEmail = prop.getProperty("fromEmail"); String password =
 * prop.getProperty("password"); String port = prop.getProperty("port"); String
 * auth = prop.getProperty("auth"); String sslEnable =
 * prop.getProperty("sslEnable");
 * 
 * 
 * // String host = "smtp.naver.com"; // Gmail을 사용할 경우 // String fromEmail =
 * "wodlr1784@naver.com"; // 보내는 이메일 주소 // String password = "jje6531784@"; //
 * 이메일 비밀번호
 * 
 * Properties properties = new Properties(); properties.put("mail.smtp.host",
 * host); properties.put("mail.smtp.port", port);
 * properties.put("mail.smtp.auth", auth);
 * properties.put("mail.smtp.ssl.enable", sslEnable);
 * 
 * Session session = Session.getInstance(properties, new Authenticator() {
 * protected PasswordAuthentication getPasswordAuthentication() { return new
 * PasswordAuthentication(fromEmail, password); } });
 * 
 * try { Message message = new MimeMessage(session); message.setFrom(new
 * InternetAddress(fromEmail)); message.setRecipients(Message.RecipientType.TO,
 * InternetAddress.parse(toEmail)); message.setSubject(subject);
 * message.setText(body);
 * 
 * Transport.send(message); System.out.println("Email sent successfully."); }
 * catch (MessagingException e) { throw new RuntimeException(e); } } }
 */