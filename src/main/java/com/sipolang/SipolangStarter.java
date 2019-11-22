package com.sipolang;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages={"com.sipolang"})
public class SipolangStarter {
    public static void main(String[] args) {
        SpringApplication.run(SipolangStarter.class, args);
    }
}
