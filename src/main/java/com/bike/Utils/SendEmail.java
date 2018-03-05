package com.bike.Utils;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import sun.misc.BASE64Encoder;

import com.bike.Dto.EmailSendInfo;


public class SendEmail {

   Logger logger = LogManager.getLogger(SendEmail.class);

    private Properties properties = null;

    public SendEmail(Properties properties) {
        this.properties = properties;
    }

    public SendEmail(String propertiesFileName) {
        try {
            InputStream inputStream = Thread.currentThread().getContextClassLoader()
                    .getResourceAsStream(propertiesFileName);
            if (inputStream != null) {
                properties = new Properties();
                properties.load(inputStream);
                inputStream.close();
            }
        }
        catch(Exception ex) {
            logger.error("initialization SendEmail failure", ex);
        }
    }

    private void setBaseProperties(EmailSendInfo emailDto) {
        if (StringUtils.isNotBlank(properties.getProperty("EMAIL_ACCOUNT"))) {
            emailDto.setAccount(properties.getProperty("EMAIL_ACCOUNT"));
            emailDto.setAddressor(properties.getProperty("EMAIL_ACCOUNT"));
        }
        if (StringUtils.isNotBlank(properties.getProperty("EMAIL_PASSWORD"))) {
            emailDto.setPassword(properties.getProperty("EMAIL_PASSWORD"));
        }
        if (StringUtils.isNotBlank(properties.getProperty("EMAIL_PORT"))) {
            emailDto.setPort(properties.getProperty("EMAIL_PORT"));
        }
        if (StringUtils.isNotBlank(properties.getProperty("EMAIL_HOST"))) {
            emailDto.setHost(properties.getProperty("EMAIL_HOST"));
        }
        if (StringUtils.isNotBlank(properties.getProperty("EMAIL_TYPE"))) {
            emailDto.setType(properties.getProperty("EMAIL_TYPE"));
        }
        if (StringUtils.isNotBlank(properties.getProperty("EMAIL_SUBJECT"))) {
            emailDto.setSubject(properties.getProperty("EMAIL_SUBJECT"));
        }
        if (StringUtils.isNotBlank(properties.getProperty("EMAIL_FROM_SHOW_NAME"))) {
            emailDto.setShowName(properties.getProperty("EMAIL_FROM_SHOW_NAME"));
        }
    }

    private Properties getProperties(com.bike.Dto.EmailSendInfo emailDto) {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", emailDto.getHost());
        if ("ssl".equalsIgnoreCase(emailDto.getType())) {
            properties.put("mail.smtp.socketFactory.port", emailDto.getPort());
            properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            if (emailDto.getHost().indexOf("gmail") != -1) {
                properties.put("mail.smtp.EnableSSL.enable", "true");
                properties.setProperty("mail.smtp.socketFactory.fallback", "false");
                properties.put("mail.smtp.port", emailDto.getPort());
            }
        }
        else if ("tls".equalsIgnoreCase(emailDto.getType())) {
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.ssl.checkserveridentity", "false");
            properties.put("mail.smtp.ssl.trust", emailDto.getHost());
            properties.put("mail.smtp.port", emailDto.getPort());
        }
        else {
            properties.put("mail.smtp.port", emailDto.getPort());
        }
        if (emailDto.getHost().indexOf("gmail") != -1) {
            properties.put("mail.smtp.auth", "true");
        }
        else {
            properties.put("mail.smtp.auth", emailDto.isValidate() ? "true" : "false");
        }

        return properties;
    }

    
    public boolean sendAuditResultEmailByHTMLTemplate(String recipients, Boolean validate,
            String templatePath) throws UnsupportedEncodingException {
    	
    	BASE64Encoder encoder = new BASE64Encoder();
    	String email = encoder.encode(recipients.getBytes("UTF-8"));
    	
        EmailSendInfo emailDto = new EmailSendInfo();
        setBaseProperties(emailDto);
        boolean sendresult = false;
        emailDto.setFullName("localhost:8080/ShareBikeLease/user/toResetPassword?email="+email);
        emailDto.setSubject(properties.getProperty("EMAIL_SUBJECT"));
        emailDto.setRecipients(recipients);
        emailDto.setTemplatePath(templatePath);
        emailDto.setValidate(true);

        try {
            SimpleMailSender sender = new SimpleMailSender();
            sender.sendAuditResultEmail(emailDto, getProperties(emailDto));
            sendresult = true;
        }
        catch(Exception e) {
            logger.error("-----Send audit result email to " + emailDto.getRecipients() + " fail!-----");
            e.printStackTrace();
            sendresult = false;
        }
        return sendresult;

    }

}
