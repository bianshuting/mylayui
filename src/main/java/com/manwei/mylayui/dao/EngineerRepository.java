package com.manwei.mylayui.dao;


import com.manwei.mylayui.po.Engineer;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;


public interface EngineerRepository  extends JpaRepository<Engineer, Integer> {

     Page<Engineer> findAll(Pageable pageable);

     Engineer findById(int id);

}
