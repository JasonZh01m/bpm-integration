package com.digiwin.bpm.inte.mapper;


import com.digiwin.bpm.inte.model.Folder;

import java.util.List;
import java.util.Set;

public interface FolderMapper {
    int deleteByPrimaryKey(String oid);

    int insert(Folder record);

    int insertSelective(Folder record);

    Folder selectByPrimaryKey(String oid);

    Folder selectByID(Long id);

    Set<Folder> selectAllFolders();

    Set<Folder> selectAllParentFolders();

    int updateByPrimaryKeySelective(Folder record);

    int updateByPrimaryKey(Folder record);
    
    List<Folder> selectChildFolders(String oid);
    
    Folder selectFolderByParent(Long parent);
    
//    List<Folder> selectFolderDocument(String oid);
    

    /**
     * 根据subjects查出所有Folders
     * @param subjects
     * @return
     */
    @Deprecated
    Set<Folder> selectFoldersBySubjects(List<String> subjects);
}