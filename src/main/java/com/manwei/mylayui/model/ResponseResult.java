package com.manwei.mylayui.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class ResponseResult<T> implements Serializable {
    private static final long serialVersionUID = -9089101377258414808L;
    /**
     * 状态码 200 500
     */
    private Integer code;
    /**
     * 需要显示的信息
     */
    private String msg;
    /**
     * 返回的数据
     */
    private T data;

    public ResponseResult(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public ResponseResult(Integer code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public ResponseResult(Integer code, T data) {
        this.code = code;
        this.data = data;
    }
}
