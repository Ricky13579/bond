package dog.controller.gboard;

import java.io.IOException;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import dog.controller.BondInter;
import dog.dao.*;
import dog.vo.*;

public class Gboard implements BondInter {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 뷰
		String view = "gboard/gboard";
		// 응답 방식
		req.setAttribute("METHOD", "FORWARD");
		
		// 할일
		// 세션검사
		String sid=(String) req.getSession().getAttribute("SID");
		
		// 데이터베이스 사용준비
		GboardDao gDao = new GboardDao();
		if(sid == null) {
			// 로그인 한 사람의 경우 작성한 글 카운트 조회
			int cnt = gDao.getCnt(sid);
			// 데이터 세팅
			req.setAttribute("CNT", cnt);
			
		}
		
		// 게시글 리스트 꺼내오기
		ArrayList<BoardVO> list = gDao.getList();
		// 리스트를 화면에 전달하는 방법 - 요청 객체 속성으로 등록해주면 된다.
		req.setAttribute("List", list);
		return view;
	}

}
