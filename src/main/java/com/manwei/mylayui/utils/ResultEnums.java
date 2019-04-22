package com.manwei.mylayui.utils;

import lombok.Getter;
import lombok.Setter;

@Getter
public enum ResultEnums {
    SUCCESS(200, "请求成功"),
    ERROR(500, "请求失败");

    private Integer code;
    private String msg;

    ResultEnums(Integer code, String msg){
        this.code = code;
        this.msg = msg;
    }

}
