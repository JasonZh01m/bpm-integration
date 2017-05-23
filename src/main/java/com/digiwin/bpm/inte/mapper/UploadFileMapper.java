package com.digiwin.bpm.inte.mapper;

import com.digiwin.bpm.inte.model.UploadFile;

import java.util.List;

public interface UploadFileMapper {
    int deleteByPrimaryKey(String oid);

    int insert(UploadFile record);

    int insertSelective(UploadFile record);

    UploadFile selectByPrimaryKey(String oid);

    int updateByPrimaryKeySelective(UploadFile record);

    int updateByPrimaryKey(UploadFile record);

    List<UploadFile> findFilesByParent(String parent);
}