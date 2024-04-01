package dog.dispatch;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import dog.controller.*;

/**
 *@author	지명준
 *@since	2024/03/29
 *@version	v.1.0
 *			2024.03.29
 * 
 */
@WebServlet({"*.bond"})
public class BondDispatch extends HttpServlet {

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	public HashMap<String, BondInter> map;
	
	public void init(ServletConfig config) throws ServletException{
		
		Properties prop = new Properties();
		
		FileInputStream fin = null;
		try {
			String path = this.getClass().getResource("").getPath();
			
			fin = new FileInputStream(path+"../resources/bond.properties");
			
			prop.load(fin);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				fin.close();
			}catch(Exception e) {}
		}
		
		map = new HashMap<String, BondInter>();
		// 키값만 전부 꺼내주기
		Enumeration en = prop.keys();
		
		while(en.hasMoreElements()) {
			String key = (String)en.nextElement();
			
			String path = prop.getProperty(key);
			
			try {
				Class tmp = Class.forName(path);
				
				BondInter val = (BondInter) tmp.newInstance();
				
				map.put(key, val);
				
			}catch(Exception e) {}
		}
	}
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
										throws ServletException, IOException {
		
		String full = req.getRequestURI();
		
		String domain = req.getContextPath();
		
		String realReq = full.substring(domain.length());
		
		BondInter val = map.get(realReq);
		
		Boolean bool = false;
		
		req.setAttribute("isRedirect", bool);
		
		String view = val.exec(req, resp);
		
		resp.setCharacterEncoding("UTF-8");
		
		bool=(Boolean) req.getAttribute("isRedirect");
		
		if(bool == null) {
			PrintWriter pw = resp.getWriter();
			pw.print(view);
		}else if(bool){
			resp.sendRedirect(view);
		}else if(!bool) {
			String prefix = "/WEB-INF/views/";
			String suffix = ".jsp";
			RequestDispatcher rd = req.getRequestDispatcher(prefix+view+suffix);
			rd.forward(req, resp);
		}
		
	}

}
