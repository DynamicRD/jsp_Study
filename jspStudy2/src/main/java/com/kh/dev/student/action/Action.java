package com.kh.dev.student.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dev.student.control.ActionForward;


public interface Action {
	//추상메소드를 정의한다
	public ActionForward execute(HttpServletRequest request,HttpServletResponse reponse)throws IOException;
}
