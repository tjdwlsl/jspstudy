package com.guestbook.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;


//DB처리하는 메서드들을 가지고 있는 클래스

public class DAO {
	//실제 사용하는 클래스 : SqlSession
	private static SqlSession ss;
	//싱글턴 패턴(동기화 처리) : 프로그램이 종료될 때 까지 한번 만들어진 객체를 재 사용함
	private synchronized static SqlSession getSession() {
		if(ss == null) {
			ss = DBservice.getFactory().openSession();
		}
		return ss;
	}
	
	//DB 처리하는 메서드들
	//1.list
	public static List<VO> getList(){
		List<VO> list = getSession().selectList("guestbook.list");
		return list;
	}
	
	//정보 DB에 저장(insert, update, delete는 결과가 int)
	public static int getInsert(VO vo) {
		int result = getSession().insert("guestbook.insert", vo);
		//insert, update, delete는 commit을 해야함
		ss.commit();
		return result;
	}
	
	//정보 DB에 저장(insert, update, delete는 결과가 int)
	public static int getUpdate(VO vo) {
		int result = getSession().update("guestbook.update", vo);
		//insert, update, delete는 commit을 해야함
		ss.commit();
		return result;
	}
	
	// primary key를 이용해서 하나의 상세정보 가져오기
	public static VO getOneList(String idx) {
		VO vo = getSession().selectOne("guestbook.onelist", idx);
		return vo;
			
	}
	public static int getDelete(String idx) {
		int result = getSession().delete("gutestbook.delete", idx);
		ss.commit();
		return result;
	}
	
}
