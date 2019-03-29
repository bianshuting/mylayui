package com.manwei.mylayui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/view")
public class ViewController {

    @RequestMapping(value = "/test")
    public String test(){
        return "test";
    }

}
