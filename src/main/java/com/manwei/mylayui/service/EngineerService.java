package com.manwei.mylayui.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.manwei.mylayui.po.Engineer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface EngineerService {

    JSONObject showEngineerPage(Pageable pageable);

    JSONArray createJsonArrayByData(Page<Engineer> page);

    Boolean deleteEngineerByID(int id);

    Boolean deleteEngineerList(List<Integer> id_list);

    Boolean insertEngineer(Engineer en);

    Boolean updateEngineer(Engineer en);

    Engineer toEngineer(String obj);
}
