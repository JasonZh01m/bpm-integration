package com.digiwin.bpm.inte.mapper;

import dto.Rzjsgl;
import java.util.List;
import java.util.Map;

public interface RZjsglMapper {
    
    List<Rzjsgl> selectAllForRzjsgl(Map<String, String> map);
//    List<Xyglzy> selectXyglzyByOID(@Param("dsmpb001") String dsmpb001,@Param("ddlZt") String ddlZt);
}