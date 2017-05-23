package com.digiwin.bpm.inte.service;

import com.digiwin.bpm.inte.mapper.UploadFileMapper;
import com.digiwin.bpm.inte.model.UploadFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by JasonZh on 2017/5/23.
 */
@Service
public class FileServiceImpl implements FileService {

    @Autowired
    private UploadFileMapper uploadFileMapper;

    /**
     * 添加文件，插入数据库
     * @param uploadFile
     * @return
     */
    @Override
    public int addFile(UploadFile uploadFile) {
        return uploadFileMapper.insertSelective(uploadFile);
    }

    /**
     * 根据OID查找文件
     * @param oid
     * @return
     */
    @Override
    public UploadFile findFile(String oid) {
        return uploadFileMapper.selectByPrimaryKey(oid);
    }

    /**
     * 更新文件
     * @param uploadFile
     * @return
     */
    @Override
    public int updateFile(UploadFile uploadFile) {
        return uploadFileMapper.updateByPrimaryKeySelective(uploadFile);
    }

    /**
     * 删除文件，删除数据库记录
     * @param oid
     * @return
     */
    @Override
    public int removeFile(String oid) {
        return uploadFileMapper.deleteByPrimaryKey(oid);
    }

    /**
     * 根据Parent查找对应File
     * @param parent
     * @return
     */
    public List<UploadFile> findFilesByParent(String parent) {
        return uploadFileMapper.findFilesByParent(parent);
    }

}
