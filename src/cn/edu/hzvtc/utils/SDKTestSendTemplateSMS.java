package cn.edu.hzvtc.utils;

import cn.edu.hzvtc.sdk.CCPRestSDK;

import java.util.HashMap;
import java.util.Random;
import java.util.Set;

/**
 * @author: XuYi
 * @date: 2021/6/23 20:26
 * @description:
 */
public class SDKTestSendTemplateSMS {
    public static void main(String[] args) {
        /*生成随机六位验证码*/
        Random random = new Random();
        String codes = "";
        for(int i=0;i<6;i++){
            codes += random.nextInt(10);
        }
        HashMap<String, Object> result = null;
        CCPRestSDK restAPI = new CCPRestSDK();
        restAPI.init("app.cloopen.com", "8883");
        // 初始化服务器地址和端口，生产环境配置成app.cloopen.com，端口是8883.
        restAPI.setAccount("8aaf070879f030fc017a1ded96890dae", "3697c27663ff4fd8a444459f8965a17c");
        // 初始化主账号名称和主账号令牌，登陆云通讯网站后，可在控制首页中看到开发者主账号ACCOUNT SID和主账号令牌AUTH TOKEN。
        restAPI.setAppId("8aaf070879f030fc017a1ded97610db4");
        // 请使用管理控制台中已创建应用的APPID。
        result = restAPI.sendTemplateSMS("18212629751","1" ,new String[]{codes,"2"});
        System.out.println("SDKTestGetSubAccounts result=" + result);
        if("000000".equals(result.get("statusCode"))){
            //正常返回输出data包体信息（map）
            HashMap<String,Object> data = (HashMap<String, Object>) result.get("data");
            Set<String> keySet = data.keySet();
            for(String key:keySet){
                Object object = data.get(key);
                System.out.println(key +" = "+object);
            }
        }else{
            //异常返回输出错误码和错误信息
            System.out.println("错误码=" + result.get("statusCode") +" 错误信息= "+result.get("statusMsg"));
        }
    }
}
