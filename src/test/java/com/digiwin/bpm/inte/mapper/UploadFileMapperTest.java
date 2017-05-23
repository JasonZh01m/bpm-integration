package com.digiwin.bpm.inte.mapper;

import com.digiwin.bpm.inte.model.UploadFile;
import com.digiwin.bpm.inte.utils.IdGen;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.parsing.ComponentDefinition;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

import static org.junit.Assert.*;

/**
 * Created by JasonZh on 2017/5/23.
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉Junit Spring配置文件
@ContextConfiguration({"classpath:spring-context.xml", "classpath:spring-mvc.xml"})
public class UploadFileMapperTest {

    private static Logger logger = LoggerFactory.getLogger(UploadFileMapperTest.class);

    @Autowired
    private UploadFileMapper uploadFileMapper;

    @Test
    public void deleteByPrimaryKey() throws Exception {

    }

    @Test
    public void insert() throws Exception {

    }

    @Test
    public void insertSelective() throws Exception {

        for (int i = 0; i < 10; i++) {
            UploadFile uploadFile = new UploadFile();
            uploadFile.setOid(IdGen.uuid());
            uploadFile.setName("测试上传文件" + (i + 100));
            uploadFile.setCreatedate(new Date());
            uploadFileMapper.insertSelective(uploadFile);
        }
    }

    @Test
    public void selectByPrimaryKey() throws Exception {

    }

    @Test
    public void updateByPrimaryKeySelective() throws Exception {

    }

    @Test
    public void updateByPrimaryKey() throws Exception {

    }

}