package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.BVO;
import com.ict.db.DAO;
import com.ict.page.paging;


public class ListCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
//		List<BVO> list = DAO.getList();
//		request.setAttribute("list", list);
		
		
		//페이지 처리
		paging paging = new paging();
		
		//1. 전체 게시물의 수
		int count = DAO.getCount();
		paging.setTotalRecord(count);
		
		//2. 전체 페이지의 수
		//전체 게시글의 수가 한 페이지 안에 존재하는 원글의 수 보다 작거나 같으면
		//전체 페이지 수는 1페이지
		if(paging.getTotalRecord() <= paging.getNumPerpage()) {
			paging.setTotalPage(1);
		}else {
			paging.setTotalPage(paging.getTotalRecord()/paging.getNumPerpage());
			//나머지가 있으면 1페이지 증가
			if(paging.getTotalRecord()%paging.getNumPerpage() != 0) {
				paging.setTotalPage(paging.getTotalPage()+1);
			}
		}
		
		//3. 현재 페이지 구하기
		//cmd가 list이면 무조건 cPage라는 현재 페이지 값을 가지고 와야함
		//cPage가 nowPage로 변경 됨
		String cPage = request.getParameter("cPage");
		
		if(cPage == null) {
			paging.setNowPage(1);
		}else {
			paging.setNowBlock(Integer.parseInt(cPage));
		}

		
		//**4-1. 현재 페이지의 시작번호와 끝번호 구하기
		paging.setBegin((paging.getNowPage()-1)*paging.getNumPerpage()+1);
		paging.setEnd((paging.getBegin()-1)+paging.getNumPerpage());
		
		//**4-2. 시작번호와 끝번호를 가지고 DB에서 원하는 만큼의 게시물을 가져옴
		List<BVO> list = DAO.getList(paging.getBegin(), paging.getEnd());
		request.setAttribute("list", list);
		
		//**5. 현재 페이지의 시작블로과 끝 블록 구하기
		paging.setBeginBlock((int)((paging.getNowPage()-1)/paging.getPagePerBlock())
				*paging.getPagePerBlock()+1);
		paging.setEnd(paging.getBeginBlock()+paging.getPagePerBlock()-1);
		
		//주의 사항 : endBlock이 totalPage보다 클 수가 있다.
		
		
		return "view/list.jsp";
		
		
		
		
		
	
	}
}
