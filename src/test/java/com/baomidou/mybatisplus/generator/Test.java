package com.baomidou.mybatisplus.generator;

import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.util.Collections;

public class Test {
    public static void main(String[] args) {
        FastAutoGenerator.create("jdbc:postgresql://127.0.0.1:5432/postgres?serverTimezone=Asia/Shanghai&allowMultiQueries=true&useSSL=false&useUnicode=true&characterEncoding=utf-8&currentSchema=power_common", "postgres", "!woshiking0113Q", "power_common")
                .globalConfig(builder -> {
                    builder.author("jinshouxu") // 设置作者
                            .enableSwagger() // 开启 swagger 模式
                            .fileOverride() // 覆盖已生成文件
                            .outputDir(".")
                            .disableOpenDir(); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("com.baomidou.mybatisplus.samples.generator") // 设置父包名
                            .moduleName("system") // 设置父包模块名
                            .pathInfo(Collections.singletonMap(OutputFile.xml, ".")); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.addInclude("t_framework_api_permission_white_list");
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }
}
