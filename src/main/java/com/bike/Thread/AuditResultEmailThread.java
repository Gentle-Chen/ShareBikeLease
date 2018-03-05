package com.bike.Thread;

import java.io.UnsupportedEncodingException;

import com.bike.Utils.ConfigManager;
import com.bike.Utils.SendEmail;


public class AuditResultEmailThread implements Runnable {


    private String templatePath;

    private String email;

    private String userName;


    public AuditResultEmailThread(String email , String templatePath) {
        this.email = email;
        this.templatePath = templatePath;
    }

    public void run() {
        SendEmail sendEmail = new SendEmail(ConfigManager.getConfigProps());
        try {
			sendEmail.sendAuditResultEmailByHTMLTemplate(email, true, templatePath);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

}
