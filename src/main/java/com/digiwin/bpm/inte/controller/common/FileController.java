package com.digiwin.bpm.inte.controller.common;

import com.digiwin.bpm.inte.model.UploadFile;
import com.digiwin.bpm.inte.service.FileService;
import com.digiwin.bpm.inte.utils.FileUtils;
import com.digiwin.bpm.inte.utils.IdGen;
import dto.Message;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by JasonZh on 2017/5/23.
 */
@Controller
public class FileController {

    private static Logger logger = LoggerFactory.getLogger(FileController.class);

    @Autowired
    private FileService fileService;


    @Value("${inte.filepath}")
    private String uploadPath;


    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadFile(MultipartHttpServletRequest request) {
        logger.debug("inner upload6666... ");

        Map<String, Object> resMap = new HashMap<String, Object>();

        if(request.getParameter("creator").trim() == "") {
            logger.error("IN UPLOAD METHOLD, creator is empty");
            resMap.put("message", new Message("creator不能为空!", 0));
            return resMap;
        }
        if(request.getParameter("parent").trim() == "") {
            logger.error("IN UPLOAD METHOLD, parent is empty");
            resMap.put("message", new Message("parent不能为空!", 0));
            return resMap;
        }


        Iterator<String> itr = request.getFileNames();
        MultipartFile mpf;
        List<UploadFile> uploadFileList = new ArrayList<UploadFile>();
        while (itr.hasNext()) {
            mpf = request.getFile(itr.next());
            UploadFile uploadFile = new UploadFile();
            uploadFile.setOid(IdGen.uuid());
            uploadFile.setCreator(request.getParameter("creator").trim());
            uploadFile.setParent(request.getParameter("parent").trim());
            uploadFile.setName(mpf.getOriginalFilename());
            uploadFile.setContenttype(mpf.getContentType());
            uploadFile.setFilesize(mpf.getSize());
            uploadFile.setCreatedate(new Date());
            uploadFile.setReserv1(request.getParameter("reserv1"));
            uploadFile.setReserv2(request.getParameter("reserv2"));
            uploadFile.setReserv3(request.getParameter("reserv3"));

            String diskpath = uploadPath + File.separator + uploadFile.getParent().hashCode();
            FileUtils.createDirectory(diskpath);
            File file = new File(diskpath + File.separator + mpf.getOriginalFilename());
            logger.debug("file path:{}", file.getPath());
            try {
                mpf.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }

            if(fileService.addFile(uploadFile) > 0) {
                logger.debug("File Uploaded successfully! {}", uploadFile);
                uploadFileList.add(uploadFile);
            }
        }
        if (uploadFileList.size() > 0) {
            resMap.put("message", new Message("上传成功！", 1));
        } else {
            resMap.put("message", new Message("上传失败！", 0));
        }

        resMap.put("uploadFiles", uploadFileList);

        return resMap;
    }

    /**
     * 下载附件
     * @param oid
     * @param request
     * @param response
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/download/{oid}", method = RequestMethod.GET)
    public void downloadFile(@PathVariable String oid, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        UploadFile uploadFile = fileService.findFile(oid);
        if (uploadFile == null) {
            logger.error("文件在数据库中不存在:{}", oid);
        }
        logger.debug("uploadFile:{}", uploadFile);

        String diskpath = uploadPath + File.separator + uploadFile.getParent().hashCode();
        String filepath = diskpath + File.separator + uploadFile.getName();
        logger.debug("filepath:{}", filepath);

        File file = new File(filepath);
        if (file.exists()) {
            FileUtils.downFile(file, request, response, uploadFile.getName());
        } else {
            logger.error("文件不存在:{}", oid);
        }
    }


    /**
     * 删除附件
     * @param oid
     * @param request
     * @param response
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/delete/{oid}", method = RequestMethod.POST)
    @ResponseBody
    public Message deleteFile(@PathVariable String oid, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        UploadFile uploadFile = fileService.findFile(oid);
        Message message = new Message();
        if (uploadFile == null) {
            message.setCode(0);
            message.setMessage("删除失败！");
            return message;
        }

        int res = fileService.removeFile(oid);
        if (res > 0) {
            logger.error("文件删除成功:{}", oid);

            String diskpath = uploadPath + File.separator + uploadFile.getParent().hashCode();
            String filepath = diskpath + File.separator + uploadFile.getName();
//            logger.debug("filepath:{}", filepath);
            FileUtils.deleteFile(filepath);

            message.setCode(1);
            message.setMessage("删除成功！");

        } else {
            logger.error("文件删除失败:{}", oid);
            message.setCode(0);
            message.setMessage("删除失败！");
        }
        return message;
    }

    /**
     * 查找parent对应的所有附件
     *
     * @return
     */
    @RequestMapping(value = "/files/{parent}", method = RequestMethod.GET)
    @ResponseBody
    public List<UploadFile> getUploadedFiles(@PathVariable String parent) {
        if (parent == null || parent.trim() == "") {
            logger.error("parent is empty!");
            throw new RuntimeException("Parent is Empty!!");
        }

        List<UploadFile> uploadFiles = fileService.findFilesByParent(parent);
        return uploadFiles;
    }

    /**
     * 数据绑定日期格式化
     *
     * @param binder
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

}
