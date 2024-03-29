package dog.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public interface BondInter {
	String exec(HttpServletRequest req, HttpServletResponse resp)
								throws ServletException, IOException;
}
