package controller.auth;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.CookieUtils;
import util.SessionUtils;

@WebServlet("/logout")
public class logout extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CookieUtils.remove("id", req, resp);
		SessionUtils sessionUtils = new SessionUtils();
		sessionUtils.removeSession(req,"user");
		
		resp.setStatus(HttpServletResponse.SC_OK);
		resp.getWriter().write("Đăng xuất tài khoản thành công");
	}
}
