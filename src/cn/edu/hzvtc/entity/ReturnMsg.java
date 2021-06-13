package cn.edu.hzvtc.entity;

import java.util.HashMap;
import java.util.Map;

/**
 * @author: XuYi
 * @date: 2021/6/10 8:47
 * @description: 用于标识异步请求的操作结果
 */
public class ReturnMsg {
    /*存放请求处理结果的数据*/
    private Map<String,Object> extend=new HashMap<String, Object>();
    /*状态码，用来标识操作的状态，100表示成功，200表示失败，300表示数据不存在..*/
    private Integer code;
    /*提示消息*/
    private String msg;

    public Map<String, Object> getExtend() {
        return extend;
    }

    public static ReturnMsg success(){
        ReturnMsg result = new ReturnMsg();
        result.setCode(100);
        result.setMsg("操作成功!");
        return  result;
    }
    public static ReturnMsg fail(){
        ReturnMsg result = new ReturnMsg();
        result.setCode(200);
        result.setMsg("操作失败!");
        return  result;
    }
    public ReturnMsg add(String key,Object value){
        this.getExtend().put(key, value);
        return this;
    }
    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ReturnMsg() {
    }

    public ReturnMsg(Map<String, Object> extend, Integer code, String msg) {
        this.extend = extend;
        this.code = code;
        this.msg = msg;
    }
}
