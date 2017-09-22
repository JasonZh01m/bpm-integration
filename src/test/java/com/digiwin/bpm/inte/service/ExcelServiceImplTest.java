package com.digiwin.bpm.inte.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.digiwin.bpm.inte.mapper.XyglzyMapper;

import dto.Xyglzy;

import java.util.HashMap;
import java.util.List;
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

//    @Autowired
//    private ExcelService excelService;
    @Autowired
    private XyglzyMapper xyglzyMapper;

    @Test
    public void export() throws Exception {
        Map<String, String> queryMap = new HashMap<String, String>();
        queryMap.put("dsmpa002C", "");
        queryMap.put("dsmpa003", "");
        queryMap.put("dsmpa004", "");

        queryMap.put("dsmpa005", "");
        queryMap.put("dsmpa006", "");
        queryMap.put("dsmpa007", "");
        queryMap.put("dsmpa008C", "");
        queryMap.put("dsmpa008", "");

        List<Xyglzy> XyglzyList = xyglzyMapper.selectOIDForXyglzy(queryMap);
        for (Xyglzy xyglzy : XyglzyList) {
        	logger.debug("OID"+xyglzy.getDsmpa001());
        }
    }

    @Test
    public void export2() throws Exception {
//        excelService.export2();
    }

}