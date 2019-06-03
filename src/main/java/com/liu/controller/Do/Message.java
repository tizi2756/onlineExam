package com.liu.controller.Do;

import java.io.Serializable;

/**
 * @Auther: Administrator
 * @Date: 2019/5/30 19:00
 * @Description:
 */
public class Message implements Serializable {

    private static final long serialVersionUID = -2999571571280318844L;
    private String result = "success";
    private int generatedId;
    private String messageInfo;

    private Object object;

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }

    public String getMessageInfo() {
        return messageInfo;
    }

    public void setMessageInfo(String messageInfo) {
        this.messageInfo = messageInfo;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public int getGeneratedId() {
        return generatedId;
    }

    public void setGeneratedId(int generatedId) {
        this.generatedId = generatedId;
    }


}

