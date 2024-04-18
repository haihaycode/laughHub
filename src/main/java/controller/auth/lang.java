package controller.auth;


import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.CookieUtils;
@WebServlet("/lang")
public class lang extends HttpServlet {
 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	resp.sendError(404);
}
 @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 String lang= req.getParameter("language");
	 if(lang!=null) {
		 CookieUtils.remove("lang", req, resp);
		 CookieUtils.add("lang", lang, 30*24, resp);
		 resp.sendRedirect("/LaughHub/index");
	 }else {
		 resp.sendError(404);
	 }
	}
}
