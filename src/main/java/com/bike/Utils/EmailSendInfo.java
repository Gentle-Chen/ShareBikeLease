/**   
 * Copyright (c) 2004-2014 i-Sprint Technologies, Inc.
 * address: 
 * All rights reserved. 
 * 
 * This software is the confidential and proprietary information of 
 * i-Sprint Technologies, Inc. ("Confidential Information").  You shall not 
 * disclose such Confidential Information and shall use it only in 
 * accordance with the terms of the license agreement you entered into 
 * with i-Sprint. 
 *
 * @Title: EmailSendInfoDto.java 
 * @author YG Tan 
 * @Package com.isprint.server.yessafeid.basic.model.dto 
 * @Description: TODO(simple description this file what to do.) 
 * @date Oct 15, 2014 1:40:31 PM 
 * @version V1.0   
 */
package com.bike.Utils;

import java.io.Serializable;

/**
 * @ClassName: EmailSendInfoDto
 * @Description: TODO(simple description this class what to do.)
 * @author YG Tan
 * @version 1.0
 */
public class EmailSendInfo implements Serializable {

    /**
     * @Fields serialVersionUID : TODO(simple description what to do.)
     */
    private static final long serialVersionUID = -743586160591434738L;

    /**
     * @Fields account : TODO(simple description what to do.)
     */
    private String account;

    /**
     * @Fields password : TODO(simple description what to do.)
     */
    private String password;

    /**
     * @Fields addressor : TODO(simple description what to do.)
     */
    private String addressor;

    /**
     * @Fields recipients : TODO(simple description what to do.)
     */
    private String recipients;

    /**
     * @Fields host : TODO(simple description what to do.)
     */
    private String host;

    /**
     * @Fields port : TODO(simple description what to do.)
     */
    private String port;

    /**
     * @Fields validate : TODO(need validate(free email server need).)
     */
    private boolean validate;

    /**
     * @Fields showName : TODO(from display name.)
     */
    private String showName;

    /**
     * @Fields subject : TODO(simple description what to do.)
     */
    private String subject;

    /**
     * @Fields content : TODO(simple description what to do.)
     */
    private String content;

    /**
     * @Fields imgPath : TODO(simple description what to do.)
     */
    private String imgPath;

    /**
     * @Fields xmlPath : TODO(simple description what to do.)
     */
    private String templatePath;

    /**
     * @Fields fullName : TODO(simple description what to do.)
     */
    private String fullName;

    /**
     * @Fields userName : TODO(simple description what to do.)
     */
    private String userName;

    /**
     * @Fields userPassword : TODO(simple description what to do.)
     */
    private String userPassword;

    private String link;
    
    /**
     * 
     */
    private String type;

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddressor() {
        return addressor;
    }

    public void setAddressor(String addressor) {
        this.addressor = addressor;
    }

    public String getRecipients() {
        return recipients;
    }

    public void setRecipients(String recipients) {
        this.recipients = recipients;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public boolean isValidate() {
        return validate;
    }

    public void setValidate(boolean validate) {
        this.validate = validate;
    }

    public String getShowName() {
        return showName;
    }

    public void setShowName(String showName) {
        this.showName = showName;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getTemplatePath() {
        return templatePath;
    }

    public void setTemplatePath(String templatePath) {
        this.templatePath = templatePath;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

}
