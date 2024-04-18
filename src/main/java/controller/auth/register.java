package controller.auth;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;

import common.PageInfo;
import common.PageType;
import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import util.JsonUtils;
import util.SendMailClient;

@WebServlet("/register")
public class register extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PageInfo.routeSite(req, resp, PageType.REGISTER);
	}
	
	//api register

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = JsonUtils.parseJsonToObject(req, User.class);
		try {
			BeanUtils.populate(user, req.getParameterMap());
			if(UserDao.checkIdExists(user).contains("existed")) {
				resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				resp.getWriter().write("Tài khoản đã tồn tại ");
			}else {
				String result = UserDao.create(user);
				if (result.contains("success")) {
					//sendMail
					System.out.println(SendMailClient.send(user.getEmail(), user.getFullname()));;
					//sendMail
					
					resp.setStatus(HttpServletResponse.SC_OK);
					resp.getWriter().write("Đăng ký tài khoản thành công");
					
					
				} else {
					resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
					resp.getWriter().write(result +" : Có lỗi xảy ra khi tạo người dùng ");
				}
			}
		} catch (IllegalAccessException | InvocationTargetException e) {
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			resp.getWriter().write("Có lỗi xảy ra khi tạo người dùng "+e.getMessage());
		}
	}
}
