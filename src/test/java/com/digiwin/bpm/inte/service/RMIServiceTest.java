package com.digiwin.bpm.inte.service;

import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import com.digiwin.bpm.dms.service.common.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.client.RestTemplate;

/**
 * Created by JasonZh on 2017/6/10.
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉Junit Spring配置文件
@ContextConfiguration({"classpath:spring-context.xml", "classpath:spring-mvc.xml"})
public class RMIServiceTest {

    private static Logger logger = LoggerFactory.getLogger(RMIServiceTest.class);

    @Autowired
    private RMIService rmiService;

    @Test
    public void helloWorld() throws Exception {
        rmiService.helloWorld();
    }

    @Test
    public void testGetUser() {
        User user = rmiService.getUser("zhouxh");
        logger.debug("{}", user);
    }

    @Test
    public void testRestTemplate() {
        RestTemplate rest = new RestTemplate();
        rest.getMessageConverters().add(new FastJsonHttpMessageConverter());
        logger.debug("{}", rest.getMessageConverters());

        Parameter parameter = rest.getForObject("http://localhost:8081/bpm-dms/testparam/15b2eb84e1f24a23a4296eb73b5639c6", Parameter.class);
        logger.debug("{}", parameter);

        ResponseEntity<Parameter> response = rest.getForEntity("http://localhost:8081/bpm-dms/testparam/15b2eb84e1f24a23a4296eb73b5639c6", Parameter.class);
        logger.debug("{}", response.getHeaders().getContentType());

    }

}