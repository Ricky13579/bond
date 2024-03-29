package dog.controller.member;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import dog.controller.BondInter;

public class IdCheck implements BondInter {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("isRedirect", null);
		
		String sid = req.getParameter("id");
		
		return null;
	}

}
