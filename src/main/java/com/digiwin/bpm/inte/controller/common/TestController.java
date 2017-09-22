package com.digiwin.bpm.inte.controller.common;

import com.digiwin.bpm.inte.model.UploadFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;


/**
 * Author: JasonZh
 * Date: 2017/05/22
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
    public UploadFile testUpload2(MultipartHttpServletRequest request) {
        logger.debug("inner testupload... ");
        
        UploadFile uploadFile = new UploadFile();
        // TODO: 2017/5/23

        Iterator<String> itr = request.getFileNames();
        logger.debug("creator:{}", request.getParameter("creator"));
        MultipartFile mpf;

        while (itr.hasNext()) {
            mpf = request.getFile(itr.next());
            File file = new File(uploadPath + File.separator + mpf.getOriginalFilename());
            try {
                mpf.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            logger.debug("Uploading {}", mpf);
        }

//        logger.debug("{}", folder);

        return uploadFile;
    }


}
