package com.digiwin.bpm.inte.service;

import com.digiwin.bpm.inte.mapper.DsmpdMapper;
import com.digiwin.bpm.inte.mapper.FdglMapper;
import com.digiwin.bpm.inte.mapper.RZjsglMapper;
import com.digiwin.bpm.inte.mapper.XyglzyMapper;
import com.digiwin.bpm.inte.mapper.YcgysMapper;
import com.digiwin.bpm.inte.model.Dsmpd;
import com.digiwin.bpm.inte.model.Fdgl;
import com.digiwin.bpm.inte.model.Ycgys;
import com.digiwin.bpm.inte.utils.FileUtils;

import dto.Rzjsgl;
import dto.Xyglzy;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.jeecgframework.poi.excel.ExcelExportUtil;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.enmus.ExcelStyleType;
import org.jeecgframework.poi.excel.entity.enmus.ExcelType;
import org.jeecgframework.poi.excel.entity.params.ExcelExportEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by JasonZh on 2017/5/31.
 */
@Service
public class ExcelServiceImpl implements  ExcelService {

    @Autowired
    private DsmpdMapper dsmpdMapper;
    @Autowired
    private XyglzyMapper xyglzyMapper;
    @Autowired
    private RZjsglMapper rzjsglMapper;
    @Autowired
    private FdglMapper fdglMapper;
    @Autowired
    private YcgysMapper ycgysMapper;

    @Override
    public void export(Map<String, String> queryMap, HttpServletResponse response) {
//        FileOutputStream fos = null;
        List<ExcelExportEntity> entity = new ArrayList<ExcelExportEntity>();

        ExcelExportEntity excelentity = new ExcelExportEntity("厂商品牌（名称）", "dsmpd003c");
        excelentity.setMergeVertical(true);
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("ITS协议签约法人体", "dsmpd004");
        excelentity.setMergeVertical(true);
        excelentity.setMergeRely(new int[]{0});
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("资质证书名称", "dsmpd002");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("关联的厂商协议", "dsmpd005");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("资质初始获得时间", "dsmpd009");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("证书有效期起始日期", "dsmpd006");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("证书有效期终止日期", "dsmpd007");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("资质证书有效期", "dsmpd008");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("资质使用范畴", "dsmpd012");
        excelentity.setWidth(40);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("授权使用区域", "dsmpd013");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("是否有资质原件", "dsmpd014");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("原件存放信息", "dsmpd015");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("扫描件存放信息", "dsmpd016");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("资质放机要室时间", "dsmpd017");
        excelentity.setWidth(20);
        entity.add(excelentity);

//            excelentity = new ExcelExportEntity("扫描件上传人", "dsmpd016");
//            entity.add(excelentity);


        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

        List<Dsmpd> dsmpdList = dsmpdMapper.selectAllDsmpd(queryMap);
        for (Dsmpd dsmpd : dsmpdList) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("dsmpd002", dsmpd.getDsmpd002());
            map.put("dsmpd003", dsmpd.getDsmpd003());
            map.put("dsmpd003c", dsmpd.getDsmpd003c());
            map.put("dsmpd004", dsmpd.getDsmpd004());
            map.put("dsmpd005", dsmpd.getDsmpd005());
            map.put("dsmpd006", dsmpd.getDsmpd006());
            map.put("dsmpd007", dsmpd.getDsmpd007());
            map.put("dsmpd008", dsmpd.getDsmpd008());
            map.put("dsmpd009", dsmpd.getDsmpd009());
            map.put("dsmpd010", dsmpd.getDsmpd010());
            map.put("dsmpd011", dsmpd.getDsmpd011());
            map.put("dsmpd012", dsmpd.getDsmpd012());
            map.put("dsmpd012c", dsmpd.getDsmpd012c());
            map.put("dsmpd013", dsmpd.getDsmpd013());
            map.put("dsmpd013c", dsmpd.getDsmpd013c());
            map.put("dsmpd014", dsmpd.getDsmpd014());
            map.put("dsmpd015", dsmpd.getDsmpd015());
            map.put("dsmpd016", dsmpd.getDsmpd016());
            map.put("dsmpd017", dsmpd.getDsmpd017());
            map.put("dsmpd018", dsmpd.getDsmpd018());
            map.put("dsmpd019", dsmpd.getDsmpd019());

            list.add(map);
        }

        ExportParams params = new ExportParams();
        params.setSheetName("厂商资质工作表");

        Workbook workbook = ExcelExportUtil.exportExcel(params, entity, list);

        FileUtils.exportExcel(response, "文件列表.xls", workbook);

    }

    @Override
    public void export2(Map<String, String> queryMap) {
        List<Dsmpd> dsmpdList = dsmpdMapper.selectAllDsmpd(queryMap);

        ExportParams params = new ExportParams("导出文件", "文件Sheet1", ExcelType.XSSF);
        //params.setFreezeCol(2);
        params.setStyle(ExcelStyleType.BORDER.getClazz());

        Workbook workbook = ExcelExportUtil.exportExcel(params, Dsmpd.class, dsmpdList);

        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream("D:/excel/testMerge3.xls");
            workbook.write(fos);
            fos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

	@Override
	public void selectOIDForXyglzy(Map<String, String> queryMap,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
        List<ExcelExportEntity> entity = new ArrayList<ExcelExportEntity>();

        ExcelExportEntity excelentity = new ExcelExportEntity("厂商品牌", "dsmpa002C");
        excelentity.setMergeVertical(true);
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("原厂协议签约法人体", "dsmpa003");
        excelentity.setMergeVertical(true);
        excelentity.setMergeRely(new int[]{0});
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("ITS协议签约法人体", "dsmpa004");
        excelentity.setWidth(40);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("框架协议名称", "dsmpa005");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("我方协议编号", "dsmpa006");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("对方协议编号", "dsmpa007");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("协议类别", "dsmpa008C");
        excelentity.setWidth(64);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("代理资格", "dsmpa008");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("签署日期", "dsmpb010");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("协议起始日期", "dsmpb011");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("协议终止日期", "dsmpb012");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("协议有效期", "dsmpb013");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("签字人", "dsmpb015C");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("经办人", "dsmpb016C");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("协议到期续签方式", "dsmpb014");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("协议归档时间", "dsmpb019");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("厂商下单法人体名称", "dsmpb004");
        excelentity.setMergeVertical(true);
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("ITS下单法人体", "dsmpb005");
        excelentity.setMergeVertical(true);
        excelentity.setWidth(40);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("直下产品线", "dsmpb007");
        excelentity.setMergeVertical(true);
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("授信额度币种", "dsmpb008");
        excelentity.setMergeVertical(true);
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("授信额度金额", "dsmpb009");
        excelentity.setMergeVertical(true);
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("账期", "dsmpb009C");
        excelentity.setMergeVertical(true);
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("备注", "dsmpb022");
        excelentity.setWidth(20);
        entity.add(excelentity);

        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

        List<Xyglzy> XyglzyList = xyglzyMapper.selectOIDForXyglzy(queryMap);
        for (Xyglzy xyglzy : XyglzyList) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("dsmpa002C", xyglzy.getDsmpa002C());
            map.put("dsmpa003", xyglzy.getDsmpa003());
            map.put("dsmpa004", xyglzy.getDsmpa004());
            map.put("dsmpa005", xyglzy.getDsmpa005());
            map.put("dsmpa006", xyglzy.getDsmpa006());
            map.put("dsmpa007", xyglzy.getDsmpa007());
            map.put("dsmpa008C", xyglzy.getDsmpa008C());
            map.put("dsmpa008", xyglzy.getDsmpa008());
            map.put("dsmpb010", xyglzy.getDsmpb010());
            map.put("dsmpb011", xyglzy.getDsmpb011());
            map.put("dsmpb012", xyglzy.getDsmpb012());
            map.put("dsmpb013", xyglzy.getDsmpb013());
            map.put("dsmpb015C", xyglzy.getDsmpb015C());
            map.put("dsmpb016C", xyglzy.getDsmpb016C());
            map.put("dsmpb014", xyglzy.getDsmpb014());
            map.put("dsmpb019", xyglzy.getDsmpb019());
            map.put("dsmpb005", xyglzy.getDsmpb005());
            map.put("dsmpb004", xyglzy.getDsmpb004());
            map.put("dsmpb007", xyglzy.getDsmpb007());
            map.put("dsmpb008", xyglzy.getDsmpb008());
            map.put("dsmpb009", xyglzy.getDsmpb009());
            map.put("dsmpb009C", xyglzy.getDsmpb009C());
            map.put("dsmpb022", xyglzy.getDsmpb022());

            list.add(map);
        }

        ExportParams params = new ExportParams();
        params.setSheetName("厂商协议工作表");

        Workbook workbook = ExcelExportUtil.exportExcel(params, entity, list);

        FileUtils.exportExcel(response, "文件列表.xls", workbook);
	}

	@Override
	public void selectAllForRzjsgl(Map<String, String> queryMap,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		List<ExcelExportEntity> entity = new ArrayList<ExcelExportEntity>();

        ExcelExportEntity excelentity = new ExcelExportEntity("厂商品牌", "dsmpf002C");
        excelentity.setMergeVertical(true);
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("资质证书名称", "dsmpf011");
        excelentity.setMergeVertical(true);
        excelentity.setMergeRely(new int[]{0});
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("认证法人体", "dsmpf014");
        excelentity.setMergeVertical(true);
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("认证方向", "dsmpf004");
        excelentity.setMergeVertical(true);
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("类别", "dsmpf005");
        excelentity.setMergeVertical(true);
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("考试号", "dsmpf006");
        excelentity.setMergeVertical(true);
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("考试科目名称", "dsmpf007");
        excelentity.setMergeVertical(true);
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("考试方式", "dsmpf008");
        excelentity.setMergeVertical(true);
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("此科目的需求人数", "dsmpf009");
        excelentity.setMergeVertical(true);
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("工程师ID CODE", "dsmpg001");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("工程师姓名", "dsmpg002");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("员工编号", "dsmpg003");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("SBU", "dsmpg005");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("工程师所属平台", "dsmpg006");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("考试通过日期", "dsmpg007");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("考试费用金额", "dsmpg008");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("考试费用币种", "dsmpg009");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("培训费用金额", "dsmpg010");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("培训费用币种", "dsmpg011");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("考试券金额", "dsmpg012");
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("培训券金额", "dsmpg013");
        excelentity.setMergeVertical(true);
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("其他费用类别", "dsmpg014");
        excelentity.setMergeVertical(true);
        excelentity.setWidth(20);
        entity.add(excelentity);

        excelentity = new ExcelExportEntity("其他费用总金额", "dsmpg015");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("费用归集成本中心", "dsmpf010");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("技术认证证书名称", "dsmpg016");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("证书上传人", "creator");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("上传时间", "createdate");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("证书有效期开始时间", "dsmpg017");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("证书有效期截止时间时间", "dsmpg018");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("技术认证证书有效期", "dsmpg019");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("工程师是否在职", "dsmpg020");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("工程师工时", "dsmpg024");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("工时费用", "dsmpg025");
        excelentity.setWidth(20);
        entity.add(excelentity);

        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

        List<Rzjsgl> RzjsglList = rzjsglMapper.selectAllForRzjsgl(queryMap);
        for (Rzjsgl rzjsgl : RzjsglList) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("dsmpf002C", rzjsgl.getDsmpf002C());
            map.put("dsmpg026", rzjsgl.getDsmpg026());
            map.put("dsmpf014", rzjsgl.getDsmpf014());
            map.put("dsmpf004", rzjsgl.getDsmpf004());
            map.put("dsmpf005", rzjsgl.getDsmpf005());
            map.put("dsmpf006", rzjsgl.getDsmpf006());
            map.put("dsmpf007", rzjsgl.getDsmpf007());
            map.put("dsmpf008", rzjsgl.getDsmpf008());
            map.put("dsmpf009", rzjsgl.getDsmpf009());
            map.put("dsmpg001", rzjsgl.getDsmpg001());
            map.put("dsmpg002", rzjsgl.getDsmpg002());
            map.put("dsmpg003", rzjsgl.getDsmpg003());
            map.put("dsmpg005", rzjsgl.getDsmpg005());
            map.put("dsmpg006", rzjsgl.getDsmpg006());
            map.put("dsmpg007", rzjsgl.getDsmpg007());
            map.put("dsmpg008", rzjsgl.getDsmpg008());
            map.put("dsmpg009", rzjsgl.getDsmpg009());
            map.put("dsmpg010", rzjsgl.getDsmpg010());
            map.put("dsmpg011", rzjsgl.getDsmpg011());
            map.put("dsmpg012", rzjsgl.getDsmpg012());
            map.put("dsmpg013", rzjsgl.getDsmpg013());
            map.put("dsmpg014", rzjsgl.getDsmpg014());
            map.put("dsmpg015", rzjsgl.getDsmpg015());
            map.put("dsmpf010", rzjsgl.getDsmpf010());
            map.put("dsmpg016", rzjsgl.getDsmpg016());
            map.put("creator", rzjsgl.getCreator());
            map.put("createdate", rzjsgl.getCreatedate());
            map.put("dsmpg017", rzjsgl.getDsmpg017());
            map.put("dsmpg018", rzjsgl.getDsmpg018());
            map.put("dsmpg019", rzjsgl.getDsmpg019());
            map.put("dsmpg020", rzjsgl.getDsmpg020());
            map.put("dsmpg024", rzjsgl.getDsmpg024());
            map.put("dsmpg025", rzjsgl.getDsmpg025());

            list.add(map);
        }

        ExportParams params = new ExportParams();
        params.setSheetName("技术认证工作表");

        Workbook workbook = ExcelExportUtil.exportExcel(params, entity, list);

        FileUtils.exportExcel(response, "文件列表.xls", workbook);
	}
	
	@Override
	public void exportfdgl(Map<String, String> queryMap,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		 List<ExcelExportEntity> entity = new ArrayList<ExcelExportEntity>();
		 
         ExcelExportEntity excelentity = new ExcelExportEntity("厂商品牌（名称）", "dsmph002C");
         excelentity.setMergeVertical(true);
         excelentity.setWidth(20);
         entity.add(excelentity);
 
         excelentity = new ExcelExportEntity("关联类别", "dsmph003");
         excelentity.setMergeVertical(true);
         excelentity.setMergeRely(new int[]{0});
         excelentity.setWidth(20);
         entity.add(excelentity);
 
         excelentity = new ExcelExportEntity("协议名称", "dsmph004");
         excelentity.setWidth(20);
         entity.add(excelentity);
 
         excelentity = new ExcelExportEntity("资质证书名称", "dsmph006");
         excelentity.setWidth(20);
         entity.add(excelentity);
 
         excelentity = new ExcelExportEntity("接收法人体", "dsmph007");
         excelentity.setWidth(20);
         entity.add(excelentity);
 
         excelentity = new ExcelExportEntity("详细返点计划名称", "dsmpi001");
         excelentity.setWidth(20);
         entity.add(excelentity);
 
         excelentity = new ExcelExportEntity("返点分类id", "dsmpi002");
         excelentity.setWidth(20);
         entity.add(excelentity);
         
         excelentity = new ExcelExportEntity("返点分类", "dsmpi003");
         excelentity.setWidth(20);
         entity.add(excelentity);
 
         excelentity = new ExcelExportEntity("业绩计算开始时间", "dsmpi004");
         excelentity.setWidth(40);
         entity.add(excelentity);
 
         excelentity = new ExcelExportEntity("业绩计算结束时间", "dsmpi005");
         excelentity.setWidth(20);
         entity.add(excelentity);
 
         excelentity = new ExcelExportEntity("认款日期", "dsmpi006");
         excelentity.setWidth(20);
         entity.add(excelentity);
 
         excelentity = new ExcelExportEntity("返点金额", "dsmpi007");
         excelentity.setWidth(20);
         entity.add(excelentity);
 
         excelentity = new ExcelExportEntity("币种", "dsmpi008");
         excelentity.setWidth(20);
         entity.add(excelentity);
 
         excelentity = new ExcelExportEntity("返点发放日期", "dsmpi009");
         excelentity.setWidth(20);
         entity.add(excelentity);
 
         excelentity = new ExcelExportEntity("返点失效日期", "dsmpi010");
         excelentity.setWidth(20);
         entity.add(excelentity);
         
         excelentity = new ExcelExportEntity("厂商 Credit", "dsmpi011");
         excelentity.setWidth(20);
         entity.add(excelentity);
         
         excelentity = new ExcelExportEntity("返点形式", "dsmpi012");
         excelentity.setWidth(20);
         entity.add(excelentity);
         
         excelentity = new ExcelExportEntity("返点到期日", "dsmpi013");
         excelentity.setWidth(20);
         entity.add(excelentity);
         
         excelentity = new ExcelExportEntity("认款人", "dsmpi014");
         excelentity.setWidth(20);
         entity.add(excelentity);
         
         excelentity = new ExcelExportEntity("认款提醒", "dsmpi015");
         excelentity.setWidth(20);
         entity.add(excelentity);
         
         excelentity = new ExcelExportEntity("返点使用时间提醒", "dsmpi016");
         excelentity.setWidth(20);
         entity.add(excelentity);
         
         excelentity = new ExcelExportEntity("返点使用采购单号", "dsmpq004");
         excelentity.setWidth(20);
         entity.add(excelentity);
         
         excelentity = new ExcelExportEntity("返点使用金额", "dsmpq005");
         excelentity.setWidth(20);
         entity.add(excelentity);
         
         excelentity = new ExcelExportEntity("返点是否使用完毕", "dsmpq006");
         excelentity.setWidth(20);
         entity.add(excelentity);
         
         excelentity = new ExcelExportEntity("返点使用情况", "dsmpi020");
         excelentity.setWidth(20);
         entity.add(excelentity);
         
         excelentity = new ExcelExportEntity("录入人代号", "dsmpi021");
         excelentity.setWidth(20);
         entity.add(excelentity);
         
         excelentity = new ExcelExportEntity("录入人", "dsmpi022");
         excelentity.setWidth(20);
         entity.add(excelentity);
         
         excelentity = new ExcelExportEntity("录入时间", "dsmpi023");
         excelentity.setWidth(20);
         entity.add(excelentity);
         
         excelentity = new ExcelExportEntity("邮件通知群组", "dsmpi024");
         excelentity.setWidth(20);
         entity.add(excelentity);
         
         excelentity = new ExcelExportEntity("邮件通知群组代号", "dsmpi025");
         excelentity.setWidth(20);
         entity.add(excelentity);
         
         excelentity = new ExcelExportEntity("备注", "dsmpi025C");
         excelentity.setWidth(20);
         entity.add(excelentity);
         
 
         List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
 

         List<Fdgl> fdglList = fdglMapper.selectFdglall(queryMap);
         for (Fdgl fdgl : fdglList) {
             Map<String, Object> map = new HashMap<String, Object>();
             map.put("dsmph001", fdgl.getDsmph001());
             map.put("dsmph002C", fdgl.getDsmph002C());
             map.put("dsmph003", fdgl.getDsmph003());
             map.put("dsmph004", fdgl.getDsmph004());
             map.put("dsmph006", fdgl.getDsmph006());
             map.put("dsmph007", fdgl.getDsmph007());
        	 map.put("dsmpq004", fdgl.getDsmpq004());
        	 map.put("dsmpq005", fdgl.getDsmpq005());
        	 map.put("dsmpq006", fdgl.getDsmpq006());
        	  map.put("dsmpi001", fdgl.getDsmpi001());
        	  map.put("dsmpi002", fdgl.getDsmpi002());
        	  map.put("dsmpi003", fdgl.getDsmpi003());
        	  map.put("dsmpi004", fdgl.getDsmpi004());
        	  map.put("dsmpi005", fdgl.getDsmpi005());
        	  map.put("dsmpi006", fdgl.getDsmpi006());
        	  map.put("dsmpi007", fdgl.getDsmpi007());
        	  map.put("dsmpi008", fdgl.getDsmpi008());
        	  map.put("dsmpi009", fdgl.getDsmpi009());
        	  map.put("dsmpi010", fdgl.getDsmpi010());
        	  map.put("dsmpi011", fdgl.getDsmpi011());
        	  map.put("dsmpi012", fdgl.getDsmpi012());
        	  map.put("dsmpi013", fdgl.getDsmpi013());
        	  map.put("dsmpi014", fdgl.getDsmpi014());
        	  map.put("dsmpi015", fdgl.getDsmpi015());
        	  map.put("dsmpi016", fdgl.getDsmpi016());
        	  map.put("dsmpi017", fdgl.getDsmpi017());
        	  map.put("dsmpi018", fdgl.getDsmpi018());
	          map.put("dsmpi020", fdgl.getDsmpi020());
	          map.put("dsmpi021", fdgl.getDsmpi021());
	          map.put("dsmpi022", fdgl.getDsmpi022());
	          map.put("dsmpi023", fdgl.getDsmpi023());
	          map.put("dsmpi024", fdgl.getDsmpi024());
	          map.put("dsmpi025", fdgl.getDsmpi025());
	          map.put("dsmpi025C", fdgl.getDsmpi025C());

	         
             list.add(map);
         }
 
         ExportParams params = new ExportParams();
         params.setSheetName("返点管理工作表");
 
         Workbook workbook = ExcelExportUtil.exportExcel(params, entity, list);
 
         FileUtils.exportExcel(response, "文件列表.xls", workbook);
 
     }



	@Override
	public void exportycgys(Map<String, String> queryMap,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		int i=0;
        String str="否";
		List<ExcelExportEntity> entity = new ArrayList<ExcelExportEntity>();
		 
        ExcelExportEntity excelentity = new ExcelExportEntity("序号","序号");
        excelentity.setMergeVertical(true);
        excelentity.setWidth(20);
        entity.add(excelentity);
		
		excelentity = new ExcelExportEntity("信息来源", "dsapd003");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("是否已通知解除","是否已通知解除");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("认定来源", "dsapd004");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("认定性质", "dsapd005");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("认定时间", "dsapd006");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("供应商名称", "dsapd002");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("认定原因", "dsapd007");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        excelentity = new ExcelExportEntity("处罚细节", "dsapd008");
        excelentity.setWidth(20);
        entity.add(excelentity);
        
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        
       
        List<Ycgys> ycgysList = ycgysMapper.selectYcgysall(queryMap);
       
          	
        	  for (Ycgys ycgys : ycgysList) {
	            Map<String, Object> map = new HashMap<String, Object>();
	            i=i+1;
	            
	            map.put("序号", i);
	            map.put("dsapd003", ycgys.getDsapd003());
	            map.put("是否已通知解除",str);
	            map.put("dsapd004", ycgys.getDsapd004());
	            map.put("dsapd005", ycgys.getDsapd005());
	            map.put("dsapd006", ycgys.getDsapd006());
	       	
		        map.put("dsapd002", ycgys.getDsapd002());
		        map.put("dsapd007", ycgys.getDsapd007());
		        map.put("dsapd008", ycgys.getDsapd008());
		         
	
		         
	            list.add(map);
	          }
        

        ExportParams params = new ExportParams();
        params.setSheetName("异常供应商备案工作表");

        Workbook workbook = ExcelExportUtil.exportExcel(params, entity, list);

        FileUtils.exportExcel(response, "文件列表.xls", workbook);
	}
}
