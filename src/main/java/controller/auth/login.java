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
import util.CookieUtils;
import util.JsonUtils;
import util.SessionUtils;

@WebServlet("/login")
public class login extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PageInfo.routeSite(req, resp, PageType.LOGIN);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = JsonUtils.parseJsonToObject(req, User.class);
		User userCheck = UserDao.find(user.getId().trim());
		if (userCheck == null) {
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			resp.getWriter().write("Tài khoản không tồn tại");
		} else {
			if (user.getPassword().equals(userCheck.getPassword())) {

				if (user.isRememberMe() == true) {
					CookieUtils.add("id", user.getId(), 30 * 24, resp);
				}

				SessionUtils sessionUtils = new SessionUtils();
				sessionUtils.setSession(req, "user", userCheck);
				CookieUtils.add("id", user.getId(), 30 * 5, resp);

				resp.setStatus(HttpServletResponse.SC_OK);
				resp.getWriter().write("Đăng nhập thành công !");
			} else {
				resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				resp.getWriter().write("Mật khẩu sai");
			}
		}
	}
}
