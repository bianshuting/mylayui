package com.manwei.mylayui;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class MylayuiApplication {

    public static void main(String[] args) {
        SpringApplication.run(MylayuiApplication.class, args);
    }

}
