package com.jsp.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Ex10_1_Model implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//선택한 과일을 장바구니에 담자
		String fruits = request.getParameter("fruits");
		HttpSession ss = request.getSession();
		
		//과일을 담아야 하지만 크기를 알 수 없음
		ArrayList<String> list = 
				(ArrayList<String>)ss.getAttribute("list");
		
		//맨 처음에 해당 페이지로 오면 당연히 session에는 list가 없음
		//싱글턴패턴
		if(list == null) {
			list = new ArrayList<>();
			ss.setAttribute("list", list);
		}
		
		//리스트에 선택된 과일 추가
		list.add(fruits);
		
		return "view/ex10_session_cart.jsp";
	}
}
