package com.finacialsys.service;

import java.util.List;
import com.finacialsys.model.entity.Log;
public interface LogService {
	List<Log> getLogs();
	Log findLogByID(int logID);
	String getLogName(int logID);
}
