package com.digiwin.bpm.inte.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.*;

/**
 * Created by JasonZh on 2017/5/31.
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉Junit Spring配置文件
@ContextConfiguration({"classpath:spring-context.xml", "classpath:spring-mvc.xml"})
public class ExcelServiceImplTest {

    private static Logger logger = LoggerFactory.getLogger(ExcelServiceImplTest.class);

    @Autowired
    private ExcelService excelService;

    @Test
    public void export() throws Exception {
        Map<String, String> map = new HashMap<String, String>();
        map.put("dsmpd003", "");
        map.put("dsmpd002", "");
        map.put("dsmpd004", "");

        map.put("dsmpd013C", "qq");
        map.put("dsmpd012", "");
        map.put("dsmpd006", "");
        map.put("dsmpd007", "");
        map.put("dsmpd017", "");
        map.put("dsmpd017", "");

        excelService.export(map);
    }

    @Test
    public void export2() throws Exception {
//        excelService.export2();
    }

}