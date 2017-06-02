package com.digiwin.bpm.inte.service;

import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by JasonZh on 2017/5/31.
 */
public interface ExcelService {

    void export(Map<String, String> queryMap, HttpServletResponse response);

    void export2(Map<String, String> queryMap);
}
