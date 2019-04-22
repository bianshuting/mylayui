package com.manwei.mylayui.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.manwei.mylayui.dao.EngineerRepository;
import com.manwei.mylayui.po.Engineer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EngineerServiceImpl implements EngineerService {
    final private EngineerRepository engineerRepository;

    @Autowired
    public EngineerServiceImpl(EngineerRepository engineerRepository) {
        this.engineerRepository = engineerRepository;
    }

    @Override
    public JSONObject showEngineerPage(Pageable pageable){
        JSONObject myobj = new JSONObject();
        Page<Engineer> pageInfo = engineerRepository.findAll(pageable);
        if(pageInfo!=null){
            myobj.put("code", 0);
            myobj.put("msg", "");
            myobj.put("data", createJsonArrayByData(pageInfo));
            myobj.put("count", pageInfo.getTotalElements());
        }else{
            myobj.put("code", 1);
            myobj.put("msg", "无数据！");
            myobj.put("data", null);
            myobj.put("count", 0);
        }
        return myobj;
    }

    @Override
    public JSONArray createJsonArrayByData(Page<Engineer> page){
        JSONArray data = null;
        if(page!=null){
            data = new JSONArray();
            for(Engineer en : page){
                JSONObject myobj = new JSONObject();
                myobj.put("id", en.getId());
                myobj.put("username",en.getUsername());
                myobj.put("experience",en.getExperience());
                myobj.put("sex",en.getSex());
                myobj.put("score",en.getScore());
                myobj.put("city",en.getCity());
                myobj.put("sign",en.getSign());
                myobj.put("classify",en.getClassify());
                myobj.put("wealth",en.getWealth());

                data.add(myobj);
            }

        }
        return data;
    }

    @Override
    public Boolean deleteEngineerByID(int id){
        Boolean del_flag = false;
        try{
            engineerRepository.deleteById(id);
            del_flag=true;
        }catch(Exception e){
            e.printStackTrace();

        }
         return del_flag;
    }

    @Override
    public Boolean deleteEngineerList(List<Integer> id_array){
        Boolean del_flag=false;
        int i=0;
        for(Integer id : id_array){
           try{
               engineerRepository.deleteById(id);
               ++i;
           }catch(Exception e){
               e.printStackTrace();
           }
        }
        if(i == id_array.size()){
            del_flag = true;
        }
        return del_flag;
    }

    @Override
    public Engineer toEngineer(String objstr){
        JSONObject obj = JSONObject.parseObject(objstr);
        Engineer en = null;

        if(obj!=null){
            en = new Engineer();
            en.setId(obj.getIntValue("id"));
            en.setUsername(obj.getString("username"));
            en.setExperience(obj.getString("experience"));
            en.setSex(obj.getString("sex"));
            en.setScore(obj.getIntValue("score"));
            en.setCity(obj.getString("city"));
            en.setSign(obj.getString("sign"));
            en.setClassify(obj.getString("classify"));
            en.setWealth(obj.getIntValue("wealth"));
        }
        return en;
    }

    @Override
    public Boolean insertEngineer(Engineer en){
        Boolean insert_flag=false;
        try{
            engineerRepository.save(en);
            insert_flag=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return insert_flag;
    }

    @Override
    public Boolean updateEngineer(Engineer en){
        Boolean update_flag=false;
        try{
          if(en != null){
              Engineer en_info = engineerRepository.findById(en.getId());
              if(en_info != null){
                  en_info.setUsername(en.getUsername());
                  en_info.setExperience(en.getExperience());
                  en_info.setSex(en.getSex());
                  en_info.setScore(en.getScore());
                  en_info.setCity(en.getCity());
                  en_info.setSign(en.getSign());
                  en_info.setClassify(en.getClassify());
                  en_info.setWealth(en.getWealth());

                  engineerRepository.save(en_info);

                  update_flag=true;
              }
          }
        }catch(Exception e){
            e.printStackTrace();
        }
        return update_flag;
    }
}
