package com.shinhan.frontcontrollerpattern;

import java.util.Map;

// 모든 controller의 규격서
public interface CommonControllerInterface {
	public String execute(Map<String, Object> data) throws Exception;
}
