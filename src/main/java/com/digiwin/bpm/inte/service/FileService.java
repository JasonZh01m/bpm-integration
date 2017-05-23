package com.digiwin.bpm.inte.service;

import com.digiwin.bpm.inte.model.UploadFile;

import java.util.List;

/**
 * Created by JasonZh on 2017/5/23.
 */
public interface FileService {

    /**
     * 添加文件，插入数据库
     * @param uploadFile
     * @return
     */
    int addFile(UploadFile uploadFile);

    /**
     * 根据OID查找文件
     * @param oid
     * @return
     */
    UploadFile findFile(String oid);

    /**
     * 更新文件
     * @param uploadFile
     * @return
     */
    int updateFile(UploadFile uploadFile);

    /**
     * 删除文件，删除数据库记录
     * @param oid
     * @return
     */
    int removeFile(String oid);

    /**
     * 根据Parent查找对应File
     * @param parent
     * @return
     */
    List<UploadFile> findFilesByParent(String parent);

}
