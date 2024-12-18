package com.kh.dev.student.control;

import com.kh.dev.student.action.Action;
import com.kh.dev.student.action.IdCheckAction;
import com.kh.dev.student.action.IndexAction;
import com.kh.dev.student.action.RegFormAction;
import com.kh.dev.student.action.ZipCheckAction;

//싱글톤
public class ActionFactory {
	private static ActionFactory factory;

	public static synchronized ActionFactory getInstance() {
		if (factory == null) {
			factory = new ActionFactory();
		}
		return factory;
	}

	private ActionFactory() {
	}

	public Action getAction(String cmd) {
		Action action = null;
		switch (cmd) {
		case "index.do":
			action = new IndexAction();
			break;
		case "regForm.do":
			action = new RegFormAction();
			break;
		case "idCheck.do":
			action = new IdCheckAction();
			break;
		case "zipCheck":
			action = new ZipCheckAction();
			break;
		default:
			action = new IndexAction();
			break;
		/*
		case "login":
			action = new LoginFormAction();
			break;
		case "loginProc":
			action = new LoginProcAction();
			break;
		case "logout":
			action = new LogoutAction();
			break;
		case "regForm":
			action = new RegFormAction();
			break;
		case "regProc":
			action = new RegProcAction();
			break;
		case "modifyForm":
			action = new ModifyFormAction();
			break;
		case "modifyProc":
			action = new ModifyProcAction();
			break;
		case "deleteForm":
			action = new DeleteFormAction();
			break;
		case "deleteProc":
			action = new DeleteProcAction();
			break;
		case "idCheck":
			action = new IdCheckAction();
			break;
		
		default:
			action = new IndexAction();
			break;*/
		}
		return action;
	}
}