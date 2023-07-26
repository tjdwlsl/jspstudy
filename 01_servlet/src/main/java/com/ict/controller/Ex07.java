package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Ex07")
public class Ex07 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//요청 시 한글 처리
				request.setCharacterEncoding("utf-8");
				
				//응답 시 한글 처리
				response.setContentType("text/html; charset=UTF-8");
				//출력을 위해서
				PrintWriter out = response.getWriter();
				
				try {
					//파라미터값은 무조건 String
					String num1 = request.getParameter("num1");
					String num2 = request.getParameter("num2");
					String op = request.getParameter("op");
					
					int k1 = Integer.parseInt(num1);
					int k2 = Integer.parseInt(num2);
					
					
					int result = 0;
					switch (op) {
					case "+": result = k1 + k2;
						break;
					case "-": result = k1 - k2;
						break;
					case "*": result = k1 * k2;
						break;
					case "/": result = k1 / k2;
						break;
			}		
				out.println("<h2>결과 : " + k1 + op + k2 + "=" + result + "</h2>"	);
				} catch (Exception e) {
					out.println("<h2>결과 : 0으로는 나눌 수가 없습니다.</h2>");
				}
				

				
	}
}
