package com.manwei.mylayui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import javax.validation.constraints.Min;


@Controller
@RequestMapping(value = "/view")
public class ViewController {

    @RequestMapping(value = "/test")
    public String test(){
        return "test";
    }

    @RequestMapping(value="/mytable")
    public String testMyTable(){
        return "mytable";
    }

    @GetMapping(value = "/mytablejson")
    @ResponseBody
    public JSONObject myTable(@Min(value = 1) @RequestParam(value = "page") int page, @RequestParam(value = "limit") int limit){
        JSONObject myobject = new JSONObject();

        JSONArray temp = new JSONArray();

            for(int i=(page-1)*limit+1;i<=limit*page;i++){
                if(i>16){
                    break;
                }
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("id", i);
                jsonObject.put("username", "张三"+i);
                jsonObject.put("experience", i);
                if(i%2==0){
                    jsonObject.put("sex", "女");
                }else{
                    jsonObject.put("sex", "男");
                }
                jsonObject.put("score", i);
                jsonObject.put("city", "天津");
                jsonObject.put("sign", "hello world");
                jsonObject.put("classify", "程序员");
                jsonObject.put("wealth", i);

                temp.add(jsonObject);
            }



        myobject.put("data", temp);
        myobject.put("code", 0);
        myobject.put("count", 16);
        return myobject;
    }

}
