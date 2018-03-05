package com.bike.Utils;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class ApplicationUtil {

    Logger logger = LogManager.getLogger(ApplicationUtil.class);

    private static ApplicationUtil appUtil = new ApplicationUtil();

    public static ApplicationUtil getInstance() {
        return appUtil;
    }

    public String getProjectPathSeparator() {
        String result = ApplicationUtil.class.getResource("ApplicationUtil.class").getPath().toString();
        int index = result.indexOf("WEB-INF");
        if (index == -1) {
            index = result.indexOf("bin");
        }
        if (index == -1) {
            return "";
        }
        result = result.substring(0, index);
        if (result.startsWith("file")) {
            result = result.substring(5);
        }
        else if (result.startsWith("jar")) {
            result = result.substring(10);
        }
        if (result.startsWith("/") && File.separator.equals("\\")) {// windows
            result = result.substring(1);
        }
        return result;
    }

    public String getProjectPath() {
        String result = getProjectPathSeparator();
        if (result.endsWith("/"))
            result = result.substring(0, result.length() - 1);
        return result;
    }

    public String getApplicationName() {
        String result = getProjectPath();
        result = result.substring(result.lastIndexOf("/") + 1);
        return result;
    }

    public String getBasePath(HttpServletRequest request) {
        StringBuffer sb = new StringBuffer();
        sb.append(request.getScheme() + "://");
        sb.append(request.getServerName());
        int serverPort = request.getServerPort();
        if (serverPort != 443 && serverPort != 80) {
            sb.append(":").append(serverPort);
        }
        sb.append(request.getContextPath());
        return sb.toString();
    }
    
    public String getBasePathSeparator(HttpServletRequest request) {
        StringBuffer sb = new StringBuffer();
        sb.append(getBasePath(request));
        sb.append("/");
        return sb.toString();
    }
}
