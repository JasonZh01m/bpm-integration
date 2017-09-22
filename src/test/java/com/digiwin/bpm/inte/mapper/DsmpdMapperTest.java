package com.digiwin.bpm.inte.mapper;

import com.digiwin.bpm.inte.model.Dsmpd;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by JasonZh on 2017/5/31.
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉Junit Spring配置文件
@ContextConfiguration({"classpath:spring-context.xml", "classpath:spring-mvc.xml"})
public class DsmpdMapperTest {

    private static Logger logger = LoggerFactory.getLogger(DsmpdMapperTest.class);

    @Autowired
    private DsmpdMapper dsmpdMapper;

    @Test
    public void selectByPrimaryKey() throws Exception {
        Dsmpd dsmpd = dsmpdMapper.selectByPrimaryKey("C78AD6E5348000015C711ADC858C25F0");
        logger.debug("Dsmpd:{}", dsmpd);

//        List<Dsmpd> dsmpdList = dsmpdMapper.selectAllDsmpd();
//        logger.debug("dsmpdList:{}", dsmpdList);


    }

}