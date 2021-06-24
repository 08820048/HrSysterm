package cn.edu.hzvtc.entity;

/**
 * @author: XuYi
 * @date: 2021/6/16 10:51
 * @description: 用户信息实体
 */
public class UserInfo {
    /*用户编号*/
    private Integer userId;
    /*用户名*/
    private String userName;
    /*密码*/
    private String userPassword;
    /*手机号*/
    private  String userTelephone;
    /*验证码*/
    private String userCode;

    public UserInfo() {
    }

    public UserInfo(Integer userId, String userName, String userPassword, String userTelephone, String userCode) {
        this.userId = userId;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userTelephone = userTelephone;
        this.userCode = userCode;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
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

    public String getUserTelephone() {
        return userTelephone;
    }

    public void setUserTelephone(String userTelephone) {
        this.userTelephone = userTelephone;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", userTelephone='" + userTelephone + '\'' +
                ", userCode='" + userCode + '\'' +
                '}';
    }
}
