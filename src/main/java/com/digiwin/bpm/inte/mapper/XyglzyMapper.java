package com.digiwin.bpm.inte.mapper;

import dto.Xyglzy;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface XyglzyMapper {
    
    List<Xyglzy> selectOIDForXyglzy(Map<String, String> map);
//    List<Xyglzy> selectXyglzyByOID(@Param("dsmpb001") String dsmpb001,@Param("ddlZt") String ddlZt);
}