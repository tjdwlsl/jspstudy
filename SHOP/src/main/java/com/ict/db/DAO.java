package com.ict.db;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class DAO {
	// 실제 사용하는 클래스 : SqlSession
		private static SqlSession ss;
		
		// 싱글턴 패턴 (동기화처리) : 프로그램이 종료될 때 까지 한번 만들어진 객체를 재 사용한다.
		private synchronized  static SqlSession getSession() {
			if(ss == null) {
				ss = DBService.getFactory().openSession();
			}
			return ss;
		}
		
		// 로그인
		public static MemberVO getLogin(MemberVO mvo) {
			MemberVO m_vo = getSession().selectOne("shop.login", mvo);
			return m_vo;
		}
		
		// 리스트
		public static List<ShopVO> getList(String category){
			
			List<ShopVO> list = getSession().selectList("shop.list", category);
			return list;
		}
		
		//상세보기
		public static ShopVO getOneList(String idx) {
			ShopVO vo = getSession().selectOne("shop.oneList", idx);
			return vo;
		}
		
		//카트 리스트 구하기
		public static CartVO getCartList(String m_id, String p_num) {
			Map<String, String> map = new HashMap<>();
			map.put("m_id", m_id);
			map.put("p_num", p_num);
			
			CartVO cvo = getSession().selectOne("shop.cartlist", map);
			return cvo;
		}
		
		//카트에 제품 삽입
		public static int getCartInsert(CartVO c_vo) {
			int result = getSession().insert("shop.cartInsert", c_vo);
			ss.commit();
			return result;
		}
		
		//카트 제품 업데이트(1증가)
		public static int getCartUpdate(CartVO c_vo) {
			int result = getSession().update("shop.cartUpdate", c_vo);
			ss.commit();
			return result;
		}
		
		//카트 리스트
		public static List<CartVO> getAllCartList(String m_id){
			List<CartVO> cartlist = getSession().selectList("shop.cartAlllist", m_id);
			return cartlist;
		}
		
		
		
		//
		
		//카트 delete
		public static int getCartDel(String idx) {
			int result = getSession().delete("shop.cartDel", idx);
			ss.commit();
			return result;
		}
		
		//상품추가
		public static int getProductInsert(ShopVO vo) {
			int result = getSession().insert("shop.productInsert", vo);
			ss.commit();
			return result;
		}
		
}
