package com.wcs.service;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.wcs.entity.Customer;

import javax.mail.Authenticator;

/**
 *
 * @author Administrator
 */
public class MailService1 {

    public static void sendHelloMailWithLogo(String name, String emailTo, String seats, String date, String time) {//member
    	System.out.println("test1");
    	if (emailTo == null || !emailTo.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            throw new IllegalArgumentException("email格式不正確!");            
        }
        System.out.println("test1");
        //以下為寄件所需的SMTP伺服器與帳號設定，這裡使用gmail的SMTP Server
        final String host = "smtp.gmail.com";
        final int port = 587;
        final String username = "ucom5508@gmail.com";
//        final String password = "Ucom%508";//your password        
        final String pwd2 = "wnehlfuxycjozjsy";
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", port);
        
        //Properties props = new Properties();
        props.put("mail.imap.ssl.enable", "true"); // required for Gmail
        props.put("mail.imap.sasl.enable", "true");
//        props.put("mail.imap.sasl.mechanisms", "XOAUTH2");
        props.put("mail.imap.auth.login.disable", "true");
        props.put("mail.imap.auth.plain.disable", "true");
//        Session session = Session.getInstance(props);
        
        System.out.println("test1");
        Session session = Session.getInstance(props, 
        		new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, pwd2);
            }
        });
        try {
//        	Store store = session.getStore("imap");
//        	store.connect("imap.gmail.com", username, password);
        	/*HttpSession httpsession = httpRequest.getSession();
        	Customer member = (Customer)httpsession.getAttribute("member");*/
            // 以下建立message物件作為mail的內容
            Message message = new MimeMessage(session);

            // Set 收件email: header field of the header.
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailTo));

            // Set Subject: header field
            message.setSubject("感謝您於Warm Cuisine Site線上訂位");

            // This mail has 2 part, the BODY and the embedded image
            MimeMultipart multipart = new MimeMultipart("related");

            // first part (the html)            
            BodyPart messageBodyPart = new MimeBodyPart();

            Map<String, Object> map = new HashMap<>();
            map.put("title", name + "您好，您的訂位資訊如下：");
            map.put("seats", seats);
            map.put("date", date);    
            map.put("time", time);    
            String ipAddress = java.net.InetAddress.getLocalHost().getHostAddress();
            map.put("host", ipAddress);

            String htmlText = MailService.processTemplateWithMap("welcome.ftl", map);
            messageBodyPart.setContent(htmlText, "text/html;charset=utf-8");
            // add it
            multipart.addBodyPart(messageBodyPart);

            // second part (the image)
            String filename = "ftl/shoppingbag.png";
            messageBodyPart = new MimeBodyPart();

            //取得網站上的圖檔
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            URL url = classLoader.getResource("/" + filename);
            System.out.println("url = " + url);
            String imagePath = filename;
            if (url != null) {
                imagePath = url.getPath();
            }
            System.out.println("imagePath = " + imagePath);

            DataSource fds = new FileDataSource(imagePath);
            messageBodyPart.setDataHandler(new DataHandler(fds));
            messageBodyPart.setFileName(filename);
            messageBodyPart.setHeader("Content-ID", "<image>");

            // add image to the multipart
            multipart.addBodyPart(messageBodyPart);

            // put everything together
            message.setContent(multipart);
            // Send message
            Transport.send(message);

            System.out.println("Sent message successfully....");
        } catch (Exception ex) {
            System.out.println("ex = " + ex);
            if (ex.getCause() != null) {
                System.out.println("ex.getCause():" + ex.getCause());
            }
        }
    }

    public static String processTemplateWithMap(String fileName, Map map) {
        final String ftlDir = "ftl";
        try {

            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            URL url = classLoader.getResource("/" + ftlDir);
            System.out.println("url = " + url);
            String ftlPath = ftlDir;
            if (url != null) {
                ftlPath = url.getPath();
            }
            System.out.println("ftlPath = " + ftlPath);
            File dir = new File(ftlPath);

            Configuration cfg = new Configuration(Configuration.VERSION_2_3_23);
            cfg.setDirectoryForTemplateLoading(dir);
            cfg.setDefaultEncoding("UTF-8");
            cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
            Template template = cfg.getTemplate(fileName);
            try (StringWriter stringWriter = new StringWriter();) {
                template.process(map, stringWriter);
                System.out.println(stringWriter);
                return stringWriter.toString();
            }
        } catch (Exception ex) {
            Logger.getLogger(MailService.class.getName()).log(Level.SEVERE, "取得Email樣本檔案(" + fileName + ")失敗", ex);
            throw new RuntimeException("取得Email樣本檔案(" + fileName + ")失敗", ex);
        }
    }
}
