package com.kh.dev.student.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dev.student.control.ActionForward;
import com.kh.dev.student.model.StudentDAO;
import com.kh.dev.student.model.ZipCodeVO;

public class ZipCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
	HttpServletResponse response) throws IOException {
	request.setCharacterEncoding("UTF-8");
	StudentDAO dao = StudentDAO.getInstance();
	String check = request.getParameter("check");
	String dong = request.getParameter("dong");
	ZipCodeVO zvo = new ZipCodeVO();
	zvo.setDong(dong);
	ArrayList<ZipCodeVO> zipcodeList = dao.selectZipCode(zvo);
	int totalList = zipcodeList.size();
	request.setAttribute("check", check);
	request.setAttribute("dong", dong);
	request.setAttribute("zipcodeList", zipcodeList);
	request.setAttribute("totalList", totalList);
	return new ActionForward(
	"/mvcMem/zipCheck.jsp",false);
	}


}
