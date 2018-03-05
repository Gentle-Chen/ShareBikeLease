package com.bike.Utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class ConfigManager {

    private static String CONFIG_FILE = "/config.properties";
    
    private static Properties configProps = new Properties();

    static {
    	initialize();
    }

    private static void initialize() {
        try {
                configProps.load(ConfigManager.class.getResourceAsStream(CONFIG_FILE));
        } catch (Exception e) {
                e.printStackTrace();
        }
    }

    public static String getConfigValue(String configKey) {
        String configValue = (String) configProps
                        .getProperty(configKey);
        return configValue;
    }

    public static int getConfigValueAsInt(String configKey) {
        int intValue = 0;
        try {
                intValue = Integer.parseInt(getConfigValue(configKey));
        } catch (NumberFormatException e) {
                intValue = 0;

        }
        return intValue;
    }

    public static Properties getConfigProps(){
        return configProps;
    }
    

}
