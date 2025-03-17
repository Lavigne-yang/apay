package com.archie.apay.payment.service;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author lavyoung1325 <2034549297@qq.com>
 * Created on 2025-03-17
 */

@SpringBootApplication
@MapperScan("com.archie.apay.payment.service.mapper")
public class PaymentServiceApp {


    public static void main(String[] args) {
        SpringApplication.run(PaymentServiceApp.class, args);
    }


}
