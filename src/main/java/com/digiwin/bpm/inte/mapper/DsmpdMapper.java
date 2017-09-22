package com.digiwin.bpm.inte.mapper;

import com.digiwin.bpm.inte.model.Dsmpd;

import dto.Xyglzy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface DsmpdMapper {
    int deleteByPrimaryKey(String dsmpd001);

    int insert(Dsmpd record);

    int insertSelective(Dsmpd record);

    Dsmpd selectByPrimaryKey(String dsmpd001);

    int updateByPrimaryKeySelective(Dsmpd record);

    int updateByPrimaryKey(Dsmpd record);

    List<Dsmpd> selectAllDsmpd(Map<String, String> map);
}