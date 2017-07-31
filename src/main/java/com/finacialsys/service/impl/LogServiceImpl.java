package com.finacialsys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finacialsys.mapper.LogMapper;
import com.finacialsys.model.entity.Log;
import com.finacialsys.service.LogService;
@Service
public class LogServiceImpl implements LogService {

	@Autowired
	LogMapper logMapper;
	@Override
	public List<Log> getLogs() {
		// TODO Auto-generated method stub
		return logMapper.findAllLog();
	}

}
