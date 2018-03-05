package com.bike.Utils;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator {
	
    String account;

    String password;

    public MyAuthenticator(String account, String password) {
        super();
        this.account = account;
        this.password = password;
    }

    public MyAuthenticator() {

    }

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(account, password);
    }
}
