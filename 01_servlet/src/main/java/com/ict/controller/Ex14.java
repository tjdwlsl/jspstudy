package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.model.Command;
import com.ict.model.GetCalcCommand;
import com.ict.model.GetLuckyCommand;
import com.ict.model.GetTodayCommand;

@WebServlet("/Ex14")
public class Ex14 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		// 일처리를 구별하기 위해서 cmd 파라미터르 먼저 받아줌
		String cmd = request.getParameter("cmd");
		Command comm = null;
		switch (cmd) {
		case "1": comm = new GetTodayCommand();
			break;
		case "2": comm = new GetLuckyCommand();
			break;
		case "3": comm = new GetCalcCommand();
			break;
		}
		//결과를 보여줄 페이지를 받음
		String path = comm.exec(request, response);
		//페이지 이동(포워딩)
		request.getRequestDispatcher(path).forward(request, response);

	}

}
