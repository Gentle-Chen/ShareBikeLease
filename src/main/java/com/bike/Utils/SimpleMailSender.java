package com.bike.Utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.text.MessageFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.bike.Dto.EmailSendInfo;

public class SimpleMailSender {

	Logger logger = LogManager.getLogger(SimpleMailSender.class);

    private String getEmailContentFromHTML(String templatePath) {
       logger.info("templatePath:" + templatePath);
        File file = new File(templatePath);
        FileInputStream ism = null;
        BufferedReader reader = null;
        String info = null;
        String be = "";
        try {
            ism = new FileInputStream(file);
            InputStreamReader isr = new InputStreamReader(ism, "UTF-8");
            reader = new BufferedReader(isr);
            info = reader.readLine();
            if (info != null) {
                be = be + info;
            }
            while (info != null) {
                info = reader.readLine();
                if (info != null) {
                    be = be + info;
                }
            }
            logger.info("email    :     " + info);
        }
        catch(FileNotFoundException fnfex) {
            logger.error("templatePath not exist", fnfex);
        }
        catch(Exception ex) {
            logger.error("read html template error", ex);
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                }
                catch(IOException ioex) {
                    logger.error("read html template error", ioex);
                }
            }
            if (ism != null) {
                try {
                    ism.close();
                }
                catch(IOException ioex) {
                    logger.error("read html template error", ioex);
                }
            }
        }
        return be;
    }

    
    public boolean sendAuditResultEmail(EmailSendInfo info, Properties properties) throws MessagingException,
    UnsupportedEncodingException {
		boolean ifSuccess = false;
		Authenticator authenticator = new MyAuthenticator(info.getAccount(), info.getPassword());
		Session session = Session.getInstance(properties, authenticator);
		MimeMessage message = new MimeMessage(session);
		message.setSubject(info.getSubject());
		message.setSentDate(new Date()); // set send date
		Address address = new InternetAddress(info.getAddressor(), info.getShowName());
		message.setFrom(address); // set from address
		Address toAddress = new InternetAddress(info.getRecipients());
		message.addRecipient(Message.RecipientType.TO, toAddress);
		
		String str = getEmailContentFromHTML(info.getTemplatePath());
		Object[] obj = new Object[] {info.getFullName()};
		str = MessageFormat.format(str, obj);
		MimeBodyPart mbp1 = new MimeBodyPart();
		mbp1.setContent(str, "text/html;charset=utf-8");
		
		Multipart mp = new MimeMultipart();
		mp.addBodyPart(mbp1);
		message.setContent(mp);
		// send email
		Transport.send(message);
		
		ifSuccess = true;
		logger.info("Send audit result email to " + info.getRecipients() + " success!");
		return ifSuccess;

    }
}
