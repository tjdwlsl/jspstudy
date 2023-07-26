package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Ex11_2")
public class Ex11_2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		//JSP에 out 내장 객체가 존재하는데 같은 기능을 함
		PrintWriter out = response.getWriter();
			
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		
		out.println("<h2>Ex11_2</h2>");
		out.println("<h3><ul>");
		out.println("<li>이름 : "+ name + "</li>");
		out.println("<li>나이 : "+ age + "</li>");
		out.println("<li>주소 : "+ request.getAttribute("addr") + "</li>");
		out.println("</ul></h3>");
		
		//Ex11_2 포워딩 
		//포워드에 포워드 또 할수있음
		//request.getRequestDispatcher("Ex11_2").forward(request, response);		
		
	}

}
