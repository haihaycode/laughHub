package controller.auth;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;

import common.PageInfo;
import common.PageType;
import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.User;

import util.SessionUtils;
import util.UploadUtils;

@WebServlet("/info")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class info extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PageInfo.routeSite(req, resp, PageType.INFO);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = new User();// userForm
		String mess = null;
		try {
			BeanUtils.populate(user, req.getParameterMap());

			if (user.getEmail().equals("") || user.getFullname().equals("")) {
				mess = "(lỗi) Vui Lòng nhập đầy đủ ";
			} else {
				SessionUtils sessionUtils = new SessionUtils();
				User userLogin = sessionUtils.getSession(req, "user");
				

				Part imagePart = req.getPart("imageAccount");
				if (imagePart != null && imagePart.getSize() > 0 && !imagePart.getSubmittedFileName().isEmpty()) {
					String fileName = UploadUtils.uploadFile(req, "/upload/client/image", "imageAccount",
							userLogin.getId().trim().toLowerCase() + ".png");
					user.setAvatar(fileName);
				} else {
					user.setAvatar(userLogin.getAvatar());
				}
				user.setId(userLogin.getId());

				mess = UserDao.update(user);
			}

		} catch (IllegalAccessException | InvocationTargetException e) {
			mess = "(lỗi)" + e.getMessage();
		}

		req.getSession().setAttribute("message", mess);
		req.getSession().setMaxInactiveInterval(1);
		resp.sendRedirect("/LaughHub/info");
		System.out.println(mess);
	}
}
