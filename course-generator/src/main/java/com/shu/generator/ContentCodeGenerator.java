package com.shu.generator;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableFill;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.util.Arrays;

public class ContentCodeGenerator {
    private static final String SERVICE_NAME = "course_content";
    private static final String DATA_SOURCE_USER_NAME = "root";
    private static final String DATA_SOURCE_PASSWORD = "19981215yinA";
    private static final String[] TABLE_NAMES = new String[]{
//			"mq_message",
//			"mq_message_history"
            "course_base",
            "course_market",
            "teachplan",
            "teachplan_media",
//            "teachplan_work",
            "course_teacher",
            "course_publish",
            "course_publish_pre",
            "course_category",
//            "course_audit"
    };

    // 一般情况下要先生成DTO类 然后修改此参数再生成 PO 类。
    private static final Boolean IS_DTO = false;

    public static void main(String[] args) {
        AutoGenerator mpg = new AutoGenerator();
        mpg.setTemplateEngine(new FreemarkerTemplateEngine());
        GlobalConfig gc = new GlobalConfig();
        gc.setFileOverride(true);
        gc.setOutputDir(System.getProperty("user.dir") + "/course-generator/src/main/java");
        gc.setAuthor("FCBleomessi10");
        gc.setOpen(false);
        gc.setSwagger2(false);
        gc.setServiceName("%sService");
        gc.setBaseResultMap(true);
        gc.setBaseColumnList(true);

        if (IS_DTO) {
            gc.setSwagger2(true);
            gc.setEntityName("%sDTO");
        }
        mpg.setGlobalConfig(gc);

        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setDbType(DbType.MYSQL);
        dsc.setUrl("jdbc:mysql://139.196.149.231:3306/" + SERVICE_NAME
                + "?serverTimezone=UTC&useUnicode=true&useSSL=false&characterEncoding=utf8");
        dsc.setDriverName("com.mysql.cj.jdbc.Driver");
        dsc.setUsername(DATA_SOURCE_USER_NAME);
        dsc.setPassword(DATA_SOURCE_PASSWORD);
        mpg.setDataSource(dsc);

        PackageConfig pc = new PackageConfig();
        pc.setModuleName(SERVICE_NAME);
        pc.setParent("com.shu");
        pc.setServiceImpl("service.impl");
        pc.setXml("mapper");
        pc.setEntity("model.po");
        mpg.setPackageInfo(pc);

        TemplateConfig tc = new TemplateConfig();
        mpg.setTemplate(tc);

        StrategyConfig strategy = new StrategyConfig();
        strategy.setNaming(NamingStrategy.underline_to_camel);
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
        strategy.setEntityLombokModel(true);
        strategy.setRestControllerStyle(true);
        strategy.setInclude(TABLE_NAMES);
        strategy.setControllerMappingHyphenStyle(true);
        strategy.setTablePrefix(pc.getModuleName() + "_");
        strategy.setEntityBooleanColumnRemoveIsPrefix(true);
        strategy.setRestControllerStyle(true);

        strategy.setTableFillList(Arrays.asList(
                new TableFill("create_date", FieldFill.INSERT),
                new TableFill("change_date", FieldFill.INSERT_UPDATE),
                new TableFill("modify_date", FieldFill.UPDATE)
        ));
        mpg.setStrategy(strategy);
        mpg.execute();
    }
}
