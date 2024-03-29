package dog.controller.member;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import dog.controller.BondInter;

public class Logout implements BondInter {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("isRedirect", true);
		HttpSession session = req.getSession();
		String view = "/main.bond";
		if(session.getAttribute("SID")!=null) {
			session.removeAttribute("SID");
		}
		return view;
	}

}
