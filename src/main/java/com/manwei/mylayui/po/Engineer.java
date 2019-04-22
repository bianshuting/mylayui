package com.manwei.mylayui.po;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Controller;

import javax.persistence.*;

@Entity
@Table(name = "engineer")
@Getter
@Setter
public class Engineer {

    @Id
    @Column(name = "id",nullable = false)
    private int id;

    @Column(name = "username",nullable = false)
    private String username;

    @Column(name = "experience")
    private String experience;

    @Column(name = "sex")
    private String sex;

    @Column(name ="score")
    private int score;

    @Column(name = "city")
    private String city;

    @Column(name = "sign")
    private String sign;

    @Column(name = "classify")
    private String classify;

    @Column(name = "wealth")
    private int wealth;
}
