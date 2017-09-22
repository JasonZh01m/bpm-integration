package com.digiwin.bpm.inte.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.digiwin.bpm.inte.model.Fdgl;

public interface FdglMapper {

	List<Fdgl> selectAllDsmph(Map<String, String> map);
	
	List<Fdgl> selectFdglall(Map<String, String> map);

	List<Fdgl> selectFdglByOID(@Param("dsmph001") String dsmph001, @Param("ddlZt") String ddlZt);

	List<Fdgl> selectFdglByQOID(@Param("dsmph001") String dsmph001, @Param("ddlZt") String ddlZt);

	
	
}
