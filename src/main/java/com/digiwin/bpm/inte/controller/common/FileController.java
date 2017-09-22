package com.digiwin.bpm.inte.controller.common;

import com.digiwin.bpm.inte.model.UploadFile;
import com.digiwin.bpm.inte.service.ExcelService;
import com.digiwin.bpm.inte.service.FileService;
import com.digiwin.bpm.inte.utils.FileUtils;
import com.digiwin.bpm.inte.utils.IdGen;

import dto.Message;

import org.omg.CORBA.Request;
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

    @Autowired
    private ExcelService excelService;


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
     * 导出Dsmpd（厂商资质）
     * @throws UnsupportedEncodingException 
     */
    @RequestMapping(value="/exportDsmpd", method = RequestMethod.GET)
    public void exportDsmpd(@RequestParam String txtCsppID, @RequestParam String txtZzzsmc, @RequestParam String txtITSxyqyfrtID,
                            @RequestParam String ddlSyqy, @RequestParam String txtSyqy_zdy, @RequestParam String zzsyFc, @RequestParam String txtYxqssj, @RequestParam String txtYxzzsj,
                            @RequestParam String txtZzfjyssj,@RequestParam String saveType, HttpServletResponse response) throws UnsupportedEncodingException {

        Map<String, String> map = new HashMap<String, String>();
        map.put("dsmpd003", txtCsppID);
        map.put("dsmpd002", txtZzzsmc);
        map.put("dsmpd004", txtITSxyqyfrtID);

        logger.debug("ddlSyqy:{}", ddlSyqy);
        String txtSyqy = "";
        String newTxtSyqy_zdy = "";
        if(("0").equals(ddlSyqy)){
        	txtSyqy = "中国大陆地区";
        	logger.error("**************txtSyqy:{}", txtSyqy);
        	map.put("dsmpd013", txtSyqy);
        }
        if(("1").equals(ddlSyqy)){
        	newTxtSyqy_zdy = new String(txtSyqy_zdy.getBytes("iso8859-1"), "utf-8");
        	txtSyqy = "自定义";
        	logger.error("**************newTxtSyqy_zdy:{}", newTxtSyqy_zdy);
        	map.put("dsmpd013", txtSyqy);
        	map.put("dsmpd013C", newTxtSyqy_zdy);
        }
        if(("2").equals(ddlSyqy)){
        	map.put("dsmpd013", txtSyqy);
        }

       /* String newzzsyFc = new String(zzsyFc.getBytes("ISO-8859-1"), "UTF-8");
        logger.error("**************newzzsyFc:{}", newzzsyFc);
*/
        logger.error("**************zzsyFc:{}", zzsyFc);
        map.put("dsmpd012", zzsyFc.replaceAll(";", "%%"));
        map.put("dsmpd006", txtYxqssj);
        map.put("dsmpd007", txtYxzzsj);
        map.put("dsmpd017", txtZzfjyssj);
        map.put("saveType", saveType);

//      logger.error("**************txtCsppID:{}", txtCsppID);
//      logger.error("**************txtZzzsmc:{}", txtZzzsmc);
//      logger.error("**************txtITSxyqyfrtID:{}", txtITSxyqyfrtID);
//      logger.error("**************ddlSyqy:{}", ddlSyqy);
//      logger.error("**************zzsyFc:{}", zzsyFc);
//      logger.error("**************txtYxqssj:{}", txtYxqssj);
//      logger.error("**************txtYxzzsj:{}", txtYxzzsj);
//      logger.error("**************txtZzfjyssj:{}", txtZzfjyssj);
//      logger.error("**************saveType:{}", saveType);
        
        excelService.export(map, response);

        logger.debug("Inner exportDsmpd");


    }
    
    /**
     * 导出Xyglzy（厂商协议）
     */
    @RequestMapping(value="/exportXyglzy", method = RequestMethod.GET)
    public void exportDsmpb(@RequestParam String txtCsppID, @RequestParam String txtYcxyqyfrt, @RequestParam String txtITSxyqyfrtID, @RequestParam String txtKjxymc,
                            @RequestParam String txtWfxybh, @RequestParam String txtDfxybh, @RequestParam String txtXylbName, @RequestParam String txtLrrName,
                            @RequestParam String ddlZt, HttpServletResponse response) {

        Map<String, String> map = new HashMap<String, String>();
        map.put("dsmpa002", txtCsppID);
        map.put("dsmpa003", txtYcxyqyfrt);
        map.put("dsmpa004", txtITSxyqyfrtID);
        map.put("dsmpa005", txtKjxymc);

//        logger.debug("ddlSyqy:{}", ddlSyqy);
//        map.put("dsmpd013C", ddlSyqy);
        map.put("dsmpa006", txtWfxybh);
        map.put("dsmpa007", txtDfxybh);
        map.put("dsmpa008", txtXylbName);
        map.put("dsmpa020C", txtLrrName);
        map.put("ddlZt", ddlZt);

        excelService.selectOIDForXyglzy(map, response);

        logger.debug("Inner exportXyglzy");


    }
    
    /**
     * 导出Rzjsgl（厂商认证技术）
     */
    @RequestMapping(value="/exportRzjsgl", method = RequestMethod.GET)
    public void exportDsmpfg(@RequestParam String txtCsppID, @RequestParam String ddGllbID, @RequestParam String txtXymc, @RequestParam String txtZzmc,
                            @RequestParam String txtRzfx, @RequestParam String ddlLb, @RequestParam String txtKsh, @RequestParam String txtKskmmc,
                            @RequestParam String hdnFygjcbzx, @RequestParam String hdnGcsName, @RequestParam String ddlKsfs, @RequestParam String ddlzt, 
                            @RequestParam String txtXqrs, @RequestParam String txtITSxyqyfrt, HttpServletResponse response) {

        Map<String, String> map = new HashMap<String, String>();
        map.put("dsmpf002", txtCsppID);
        
        if(("").equals(ddGllbID)){
        	map.put("dsmpf003", "2");
        }else{
        	map.put("dsmpf003", ddGllbID);
        }
        map.put("dsmpf011", txtXymc);
        map.put("dsmpf012", txtZzmc);

//        logger.debug("ddlSyqy:{}", ddlSyqy);
//        map.put("dsmpd013C", ddlSyqy);
        map.put("dsmpf004", txtRzfx);
        if(("0").equals(ddlLb)){
        	map.put("dsmpf005", "销售");
        }
        if(("1").equals(ddlLb)){
        	map.put("dsmpf005", "售前");
        }
        if(("2").equals(ddlLb)){
        	map.put("dsmpf005", "售后");
        }
        if(("3").equals(ddlLb)){
        	map.put("dsmpf005", "技术");
        }
        map.put("dsmpf006", txtKsh);
        map.put("dsmpf007", txtKskmmc);
        map.put("dsmpf010", hdnFygjcbzx);
        map.put("dsmpg002", hdnGcsName);
        if(("0").equals(ddlKsfs)){
        	map.put("dsmpf008", "网上考试");
        }
        if(("1").equals(ddlKsfs)){
        	map.put("dsmpf008", "考试中心考试");
        }
        if(("2").equals(ddlKsfs)){
        	map.put("dsmpf008", "笔试");
        }
        if(("3").equals(ddlKsfs)){
        	map.put("dsmpf008", "面试");
        }
        if(("4").equals(ddlKsfs)){
        	map.put("dsmpf008", "LAB");
        }
        
        if(("").equals(ddlzt)){
        	map.put("ddlZt", "2");
        }else{
        	map.put("ddlZt", ddlzt);
        }
        map.put("dsmpf009", txtXqrs);
        map.put("dsmpf014", txtITSxyqyfrt);
        
//        logger.error("**************txtCsppID:{}", txtCsppID);
//        logger.error("**************ddGllbID:{}", ddGllbID);
//        logger.error("**************txtXymc:{}", txtXymc);
//        logger.error("**************txtZzmc:{}", txtZzmc);
//        logger.error("**************txtRzfx:{}", txtRzfx);
//        logger.error("**************ddlLb:{}", ddlLb);
//        logger.error("**************txtKsh:{}", txtKsh);
//        logger.error("**************txtKskmmc:{}", txtKskmmc);
//        logger.error("**************hdnFygjcbzx:{}", hdnFygjcbzx);
//        logger.error("**************hdnGcsName:{}", hdnGcsName);
//        logger.error("**************ddlKsfs:{}", ddlKsfs);
//        logger.error("**************ddlzt:{}", ddlzt);
//        logger.error("**************txtXqrs:{}", txtXqrs);
//        logger.error("**************txtITSxyqyfrt:{}", txtITSxyqyfrt);

        excelService.selectAllForRzjsgl(map, response);

        logger.debug("Inner exportXyglzy");


    }
    
    /**
     * 导出Fdgl（厂商返点管理）
     */
    @RequestMapping(value="/exportFdgl", method = RequestMethod.GET)
    public void exportFdgl(@RequestParam String txtCsppID, @RequestParam String txtCsppName, @RequestParam String txtXymc,
            @RequestParam String ddlGllb, @RequestParam String txtZzzsmc, @RequestParam String txtJsfrt, @RequestParam String ddlZt,
            HttpServletResponse response) {

        Map<String, String> map = new HashMap<String, String>();
        map.put("dsmph002", txtCsppID);
        map.put("dsmph002C", txtCsppName);
        map.put("dsmph004", txtXymc);

        map.put("dsmph003", ddlGllb);
        map.put("dsmph006", txtZzzsmc);
        map.put("dsmph007", txtJsfrt);
        map.put("ddlZt", ddlZt);

//        logger.error("txtCsppID:{}",txtCsppID);
//        logger.error("txtCsppName:{}",txtCsppName);
//        logger.error("txtXymc:{}",txtXymc);
//        logger.error("ddlGllb:{}",ddlGllb);
//        logger.error("txtZzzsmc:{}",txtZzzsmc);
//        logger.error("txtJsfrt:{}",txtJsfrt);
//        logger.error("ddlZt:{}",ddlZt);
        
        excelService.exportfdgl(map, response);

        logger.debug("Inner exportFdgl");


    }


    /**
     * 导出Ycgys（异常供应商备案作业）
     */
    @RequestMapping(value="/exportYcgys", method = RequestMethod.GET)
    public void exportYcgys(@RequestParam String txtGysID, @RequestParam String txtGysName, @RequestParam String txtXxly,
            @RequestParam String txtRdly, @RequestParam String txtRdxz, @RequestParam String txtPOApproveDateFrom, @RequestParam String txtPOApproveDateTo,
            HttpServletResponse response) {

        Map<String, String> map = new HashMap<String, String>();
        map.put("dsapd001", txtGysID);
        map.put("dsapd002", txtGysName);
        map.put("dsapd003", txtXxly);

        map.put("dsapd004", txtRdly);
        map.put("dsapd005", txtRdxz);
        map.put("txtPOApproveDateFrom", txtPOApproveDateFrom);
        map.put("txtPOApproveDateTo", txtPOApproveDateTo);
//        logger.error("txtGysID:{}",txtGysID);
//        logger.error("txtGysName:{}",txtGysName);
//        logger.error("txtXxly:{}",txtXxly);
//        logger.error("txtRdly:{}",txtRdly);
//        logger.error("txtRdxz:{}",txtRdxz);
//        logger.error("txtPOApproveDateFrom:{}",txtPOApproveDateFrom);
//        logger.error("txtPOApproveDateTo:{}",txtPOApproveDateTo);
        
        
        excelService.exportycgys(map, response);

        logger.debug("Inner exportFdgl");


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
