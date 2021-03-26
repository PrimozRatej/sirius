package com.sirius.domain.conf.auth;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
public class SpringbootAuthUpdatedApplication {

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return SpringbootAuthUpdatedApplication.getEncoder();
    }

    public static BCryptPasswordEncoder getEncoder(){
        return new BCryptPasswordEncoder();
    }
}
