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
    /*激活码*/
    private  String activeCode;
    /*状态码*/
    private String userStatus;

    public UserInfo() {
    }

    public UserInfo(Integer userId, String userName, String userPassword, String activeCode, String userStatus) {
        this.userId = userId;
        this.userName = userName;
        this.userPassword = userPassword;
        this.activeCode = activeCode;
        this.userStatus = userStatus;
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

    public String getActiveCode() {
        return activeCode;
    }

    public void setActiveCode(String activeCode) {
        this.activeCode = activeCode;
    }

    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", activeCode='" + activeCode + '\'' +
                ", userStatus='" + userStatus + '\'' +
                '}';
    }
}
