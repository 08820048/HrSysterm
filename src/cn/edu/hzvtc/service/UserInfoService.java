package cn.edu.hzvtc.service;

import cn.edu.hzvtc.dao.UserInfoMapper;
import cn.edu.hzvtc.entity.UserInfo;
import cn.edu.hzvtc.sdk.CCPRestSDK;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Random;
import java.util.Set;

/**
 * @author: XuYi
 * @date: 2021/6/16 14:50
 * @description:
 */
@Service
public class UserInfoService {
    @Autowired
    private UserInfoMapper userInfoMapper;

    /**
     * 注册之前检查用户名是否存在 存在不能注册
     * @param userName
     * @return
     */
    public boolean checkUserName(String userName){
        boolean result = false;
        if(userInfoMapper.selectByuserName(userName).size()==0){
            result = true;
        }
        return result;
    }

    /**
     * 手改密码之前检查手机号是否存在 否则不能修改密码
     * @param telephone
     * @return
     */
    public boolean checkUserTelephone(String telephone){
        boolean result = false;
        if(userInfoMapper.selectByuserTelephone(telephone).size()!=0){
            result = true;
        }
        return result;
    }

    /**
     * 保存用户信息
     * @param userInfo
     */
    public Integer save(UserInfo userInfo){
        Integer result=0;
        /*判断用户名是否可用*/
        if(userInfoMapper.selectByuserName(userInfo.getUserName()).size()==0) {
            int res = userInfoMapper.insert(userInfo);
            if(res>0){
                /*用户信息保存成功*/
                result=1;
                //userInfo.setUserStatus("N");
            }else {
                result= -1;
            }
        }
        return result;
    }

    /**
     * 查询用户名和密码
     * @param userName 用户名
     * @param password 密码
     * @return 用户对象
     */
    public UserInfo selectByuserAndPassword(String userName, String password){
        return userInfoMapper.selectByuserAndPassword(userName, password);
    }

    /**
     * 登录方法
     * @param userName
     * @param userPassword
     * @return
     */
    public boolean login(String userName,String userPassword){
        System.out.println("service用户名："+userName+"密码"+userPassword);
        boolean islogin = false;
        UserInfo userInfo = userInfoMapper.selectByuserAndPassword(userName, userPassword);
        System.out.println("服务层userfingo:"+userInfo);
        if(userInfo!=null){
            System.out.println("服务层userfingo:"+userInfo);
            if (userInfo.getUserPassword().equals(userPassword) && userInfo.getUserName().equals(userName)){
                islogin = true;
            }else {
                islogin=false;
            }
        }else {
            System.out.println("用户名或密码不正确");
            islogin = false;
        }
        System.out.println("servvice中的islogin:"+islogin);
        return islogin;
    }

    /**
     * 发送短信验证码
     * @param userTelephone
     * @return
     */
    public boolean sendCodeMsg(String userTelephone,HttpSession session) {
        System.out.println("服务层手机号："+userTelephone);
        boolean flag = false;
        if (userTelephone != null && userTelephone != "" && userTelephone.length() == 11) {
            /*生成随机六位验证码*/
            Random random = new Random();
            String codes = "";
            for (int i = 0; i < 6; i++) {
                codes += random.nextInt(10);
            }
            /*创建SDK对象*/
            HashMap<String, Object> result = null;
            CCPRestSDK restAPI = new CCPRestSDK();
            restAPI.init("app.cloopen.com", "8883");
            // 初始化服务器地址和端口
            restAPI.setAccount("", "");
            // 初始化主账号名称和主账号令牌
            restAPI.setAppId("");
            // 请使用管理控制台中已创建应用的APPID
            result = restAPI.sendTemplateSMS(userTelephone, "1", new String[]{codes, "2"});
            /*将验证码存入session*/
            session.setAttribute("code",codes);
            /*设置验证码有效期为2分钟*/
            session.setMaxInactiveInterval(120);
            System.out.println("服务层resultL:"+result);
            if ("000000".equals(result.get("statusCode"))) {
                flag = true;
                //正常返回输出data包体信息（map）
                HashMap<String, Object> data = (HashMap<String, Object>) result.get("data");
                Set<String> keySet = data.keySet();
                for (String key : keySet) {
                    Object object = data.get(key);
                    System.out.println(key + " = " + object);
                }
            } else {
                flag = false;
                //异常返回输出错误码和错误信息
                System.out.println("错误码=" + result.get("statusCode") + " 错误信息= " + result.get("statusMsg"));
            }
        }
        return flag;
    }

    /**
     * 修改密码
     * @param userPassword
     * @param userTelephone
     * @return
     */
    public  boolean editPassword(String userPassword,String userTelephone,String userCode){
        boolean flag = false;
        System.out.println("服务层验证码："+userCode);
        //String code = (String)session.getAttribute("code");
        Integer integer = userInfoMapper.updatePasswordByTelephone(userPassword, userTelephone);
        if(integer>0){
            flag=true;
        }else {
            flag = false;
        }
        return flag;
    }
}
