package com.digiwin.bpm.inte.service;

import com.digiwin.bpm.inte.mapper.DsmpdMapper;
import com.digiwin.bpm.inte.model.Dsmpd;
import com.digiwin.bpm.inte.utils.FileUtils;
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

        FileUtils.exportExcel(response, "文件列表.xlsx", workbook);

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
}
