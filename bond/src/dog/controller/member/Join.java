package dog.controller.member;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import dog.controller.BondInter;

public class Join implements BondInter {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 할일
		// 세션검사
		Object sid = req.getSession().getAttribute("SID");
		
		if(sid != null) {
			// 로그인이 되어있으면
			req.setAttribute("isRedirect", true);
			return "/main.bond";
		}
		String view="member/join";
		return view;
	}

}
