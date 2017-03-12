package com.oaec.housecrm.util;

import java.util.Map;
import java.util.Set;

/**
 * Created by Kevin on 2017/3/12.
 */
public class ParameterUtil {
    /**
     * 将参数数组转换为参数字符串
     * @param parameters
     */
    public static void convert(Map<String,Object> parameters){
        Set<String> keySet = parameters.keySet();
        for (String s : keySet) {
            Object o = parameters.get(s);
            if (o instanceof String []){
                String[] strs = (String[]) o;
                String value = strs[0];
//                System.out.println(value);
//                try {
//                    value = new String(value.getBytes("ISO-8859-1"),"UTF-8");
//                } catch (UnsupportedEncodingException e) {
//                    e.printStackTrace();
//                }
                parameters.put(s,value);
            }
        }
    }
}
