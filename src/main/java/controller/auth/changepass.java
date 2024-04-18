package controller.auth;

import java.io.IOException;

import common.PageInfo;
import common.PageType;
import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import util.SessionUtils;

@WebServlet("/changepass")
public class changepass extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PageInfo.routeSite(req, resp, PageType.CHANGEPASS);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SessionUtils sessionUtils = new SessionUtils();
		User userLogin = sessionUtils.getSession(req, "user");
		
		String message = null;
		if (userLogin != null) {
			if (req.getParameter("password").equals("") || req.getParameter("repassword").equals("")
					|| req.getParameter("passwordold").equals("")) {
				message = "(lỗi) Vui lòng nhập đầy đủ !";
			} else {
				if (req.getParameter("password").equals(req.getParameter("repassword"))) {
					if (req.getParameter("passwordold").equals(userLogin.getPassword())) {
						userLogin.setPassword(req.getParameter("password"));
						UserDao.updatePassword(userLogin);
						message = "Đổi mật khẩu thành công với mật khẩu mới là  " + userLogin.getPassword();
					} else {
						message = "(lỗi) Mật khẫu cũ không đúng !";
					}
				} else {
					message = "(lỗi) Mật khẫu nhập lại không trùng khớp !";
				}
			}
		} else {
			resp.sendRedirect("/LaughHub/login");
		}

		req.getSession().setAttribute("message", message);
		req.getSession().setMaxInactiveInterval(3);
		resp.sendRedirect("/LaughHub/changepass");
		System.out.println(message);
	}
}
