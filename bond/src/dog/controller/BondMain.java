package dog.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;
/**
 * 
 * @author 	지명준
 * @since	2024.03.29
 * @version v.1.0
 * 			2024.03.29 - 요청 처리 클래스 작성 [ 작성자 : 지명준 ]
 *
 */

public class BondMain implements BondInter {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("isRedirect", false);
		//뷰
		String view="main";
		return view;
	}

}
