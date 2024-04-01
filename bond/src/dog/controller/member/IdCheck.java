package dog.controller.member;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import dog.dao.BondDao;
import dog.controller.BondInter;

public class IdCheck implements BondInter {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("isRedirect", null);
		
		String sid = req.getParameter("id");
		
		BondDao mDao = new BondDao();
		int cnt = mDao.getIdCnt(sid);
		// 응답 문서 만들고
		String view = "YES";
		if(cnt !=0) {
			// cnt == 0은 이미 누군가 사용하는 아이디
			view = "NO";
		}
		
		return view;
	}

}
