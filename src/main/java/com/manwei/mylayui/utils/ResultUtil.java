package com.manwei.mylayui.utils;

import com.manwei.mylayui.model.ResponseResult;

public class ResultUtil {

    public static ResponseResult success(String msg) {
        return new ResponseResult(ResultEnums.SUCCESS.getCode(), msg, null);
    }

    public static ResponseResult error(String msg) {
        return new ResponseResult(ResultEnums.ERROR.getCode(), msg, null);
    }

}
