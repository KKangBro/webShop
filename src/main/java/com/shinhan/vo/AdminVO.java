package com.shinhan.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter@Setter
// DTO, VO JavaBeans : data를 저장해서 전송하기위해
public class AdminVO {
	private String email;
	private String manager_name;
	private String pass;
	
	/*
	email   varchar2(20) PRIMARY KEY,
    manager_name    varchar2(50),
    pass    varchar2(20)
	*/
}
