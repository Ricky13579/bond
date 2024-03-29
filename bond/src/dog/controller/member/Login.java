package dog.controller.member;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import dog.controller.BondInter;
/**
 * 
 * @author	지명준
 * @since	2024.03.29
 * @version v.1.0
 * 			2024.03.29 - 클래스 작성 및 요청 처리 [ 담당자 : 지명준 ]
 *
 */
public class Login implements BondInter {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		Object sid = session.getAttribute("SID");
		if(sid != null) {
			req.setAttribute("isRedirect", true);
			return "/main.bond";
		}
		
		String view = "member/login";
		req.setAttribute("isRedirect", false);
		return view;
	}

}
