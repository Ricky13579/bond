package dog.controller.member;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import dog.controller.BondInter;
import dog.dao.*;

public class LoginProc implements BondInter {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 리다이렉트 설정
				req.setAttribute("isRedirect", true);
				String view = "/main.bond";
				
				// 파라미터 꺼내고
				String sid = req.getParameter("id");
				String spw = req.getParameter("pw");
				// 데이터베이스 작업
				BondDao mDao=new BondDao();
				int cnt = mDao.getLogin(sid, spw);
				//System.out.println("############## cnt : " + cnt);
				// 결과에 따라 조건 처리
				if(cnt != 1) {
					view = "/member/login.bond";
					return view;
				}
				
				// 로그인 처리를 해줘야 하는 겅우
				// 로그인 처리는 세션에 SID 키값으로 아이디를 기억시키기로 한다.
				req.getSession().setAttribute("SID", sid);
				
				return view;
	}

}
