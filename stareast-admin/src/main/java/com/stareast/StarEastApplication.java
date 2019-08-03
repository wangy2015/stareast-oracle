package com.stareast;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import lombok.extern.slf4j.Slf4j;

/**
 * 启动程序
 *
 * @author stareast
 */
@Slf4j
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class StarEastApplication {
    public static void main(String[] args) {
        SpringApplication.run(StarEastApplication.class, args);
        log.info("项目启动成功");
    }
}