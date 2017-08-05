package com.finacialsys.mapper;

import java.util.List;

import com.finacialsys.model.entity.Log;

public interface LogMapper {
   
	int insertLog(Log log);
	int updateLog(Log log);
	int deleteLog(String logName);
	List<Log> findAllLog();
	Log findLogByID(int logID);
	String selectLog(int logID);
}
