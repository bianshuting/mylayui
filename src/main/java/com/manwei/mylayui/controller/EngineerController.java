package com.manwei.mylayui.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.manwei.mylayui.model.ResponseResult;
import com.manwei.mylayui.po.Engineer;
import com.manwei.mylayui.service.EngineerService;
import com.manwei.mylayui.utils.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Min;
import java.util.List;

@Controller
@RequestMapping(value = "/engineer")
public class EngineerController {
    final private  EngineerService engineerService;

    @Autowired
    public EngineerController(EngineerService engineerService){
        this.engineerService = engineerService;
    }


    @RequestMapping(value="/mytabledb")
    public String testMyTable(){
        return "mytabledb";
    }

    @RequestMapping(value="/addengineer")
    public String addEngineer(){
        return "addengineer";
    }

    @GetMapping(value = "/mytabledbjson")
    @ResponseBody
    public JSONObject myTable(@Min(value = 1) @RequestParam(value = "page") int page, @RequestParam(value = "limit") int limit){
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = PageRequest.of(page - 1, limit, sort);
        return engineerService.showEngineerPage(pageable);
    }

    @PostMapping(value = "/del_engineer")
    @ResponseBody
    public ResponseResult delEngineer(@RequestParam(value = "id") int id){
            Boolean del_flag = engineerService.deleteEngineerByID(id);
            if(del_flag) {
                return ResultUtil.success("删除成功！");
            }else {
                return ResultUtil.error("删除失败！");
            }

    }

    @PostMapping(value = "/del_engineer_list")
    @ResponseBody
    public ResponseResult delEngineerList(@RequestBody String id){
        Boolean del_flag = false;
        if (id != null && id.length() > 0) {
            JSONArray jsonArray = JSONObject.parseArray(id);
            List<Integer> list = jsonArray.toJavaList(Integer.class);
            del_flag = engineerService.deleteEngineerList(list);
        }
        if(del_flag) {
            return ResultUtil.success("删除成功！");
        }else {
            return ResultUtil.error("删除失败！");
        }

    }

    @PostMapping(value = "/insert_engineer")
    @ResponseBody
    public ResponseResult insertEngineer(@RequestParam(value = "en") String obj){
        Engineer en = engineerService.toEngineer(obj);
        Boolean insert_flag = engineerService.insertEngineer(en);
        if(insert_flag) {
            return ResultUtil.success("添加成功！");
        }else {
            return ResultUtil.error("添加失败！");
        }

    }

    @PostMapping(value = "/update_engineer")
    @ResponseBody
    public ResponseResult updateEngineer(@RequestParam(value = "en") String obj){
        Engineer en = engineerService.toEngineer(obj);
        Boolean edit_flag = engineerService.updateEngineer(en);
        if(edit_flag) {
            return ResultUtil.success("修改成功！");
        }else {
            return ResultUtil.error("修改失败！");
        }

    }

}
