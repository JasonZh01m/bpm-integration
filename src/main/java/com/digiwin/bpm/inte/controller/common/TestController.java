package com.digiwin.bpm.inte.controller.common;

import com.digiwin.bpm.inte.model.Folder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


/**
 * Author: JasonZh
 * Date: 2017/1/9
 */
@Controller
public class TestController {

    private static Logger logger = LoggerFactory.getLogger(TestController.class);

    @Value("${inte.filepath}")
    private String uploadPath;



    @RequestMapping(value = "/index")
    public String testdocParameter() {

        logger.info("show index.jsp!");
        return "index";
    }

    @RequestMapping(value = "testupload")
    public String testUpload() {
        logger.debug("inner testupload...");


        return "index";
    }


    @RequestMapping(value = "testupload2", method = RequestMethod.POST)
    @ResponseBody
    public Folder testUpload2(MultipartHttpServletRequest request) {
        logger.debug("inner testupload...");
        Folder folder = new Folder();
        folder.setId(1L);
        folder.setName("TEST NAME");
        folder.setCreator("JASONZH");

        Iterator<String> itr = request.getFileNames();
        MultipartFile mpf;

        while (itr.hasNext()) {
            mpf = request.getFile(itr.next());
            File file = new File(uploadPath + File.separator + mpf.getOriginalFilename());
            try {
                mpf.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            logger.debug("Uploading {}", mpf.getOriginalFilename());
        }

//        logger.debug("{}", folder);

        return folder;
    }


}
