package controller.admin;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

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
import util.CookieUtils;

@WebServlet({ "/admin/users", "/admin/users/edit/*" })

public class users extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String message = null;
		String q = req.getParameter("q") != null?  req.getParameter("q"):"";

		List<User> lists = UserDao.getAllUsers(q);
		int totalPages = lists.size();

		int itemsPerPage = 10;// tổng item / trang
		int Pages = totalPages / itemsPerPage; // tính được tổng số page
		if (totalPages % itemsPerPage != 0) {// tăng 1 đơn vị nếu ra số lẽ
			Pages++;
		}
		req.setAttribute("q", q);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("pageCount", req.getParameter("page") == null ? 0 : req.getParameter("page"));// trang hiện tại
		req.setAttribute("Pages", Pages);// gửi tông page sang jsp
		List<User> users = UserDao.findPage(Integer.parseInt(req.getAttribute("pageCount").toString()), itemsPerPage,q);
		req.setAttribute("list", users);

		if (uri.contains("admin/users/edit")) {
			String[] parts = uri.split("/");
			String id = parts[parts.length - 1];
			User user = UserDao.find(id.trim());
			if (user == null) {
				message = "(lỗi) tìm kiếm mã user thất bại";
				req.getSession().setAttribute("message", message);
				req.getSession().setMaxInactiveInterval(1);
			}
			req.setAttribute("userEdit", user);
		}
		PageInfo.routeAdmin(req, resp, PageType.ADMIN_USERS);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String message = null;

		User user = new User();
		try {
			BeanUtils.populate(user, req.getParameterMap());

			if ("deleteUser".equals(req.getParameter("action"))) {
				// Xử lý hành động xóa tài khoản
				if (UserDao.deleteUser(user.getId())) {
					message = "Xóa tài khoản thành công";
					//cần xóa hình trong resource khi xóa người dùng
				} else {
					message = "(lỗi) Xóa tài khoản thất bại";
				}
			} else if ("updateUser".equals(req.getParameter("action"))) {
				// Xử lý hành động cập nhật tài khoản
				if (UserDao.update(user).contains("công")) {
					message = "Cập nhật thành công";
				} else {
					message = "(lỗi) Cập nhật thất bại";
				}
			} else if ("LoginUser".equals(req.getParameter("action"))) {
				// Xử lý hành động cập nhật tài khoản
				if (UserDao.find(user.getId()) != null) {
					CookieUtils.add("id", user.getId(), 30 * 24, resp);
					message = "Đăng nhập thành công với id " + user.getId();
				} else {
					message = "(lỗi)Đăng nhập thất bại";
				}

			}

		} catch (IllegalAccessException | InvocationTargetException e) {
			message = "(lỗi) Cập nhật thất bại";
		} finally {
			req.getSession().setAttribute("message", message);
			req.getSession().setMaxInactiveInterval(1);
			if (message.contains("lỗi")) {
				resp.sendRedirect("/LaughHub/admin/users/edit/" + user.getId());
			} else {
				resp.sendRedirect("/LaughHub/admin/users");
			}
			System.out.println(message);
		}
	}

}
