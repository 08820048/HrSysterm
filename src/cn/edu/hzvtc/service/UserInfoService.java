package cn.edu.hzvtc.service;

import cn.edu.hzvtc.dao.UserInfoMapper;
import cn.edu.hzvtc.entity.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
