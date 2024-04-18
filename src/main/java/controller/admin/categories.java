package controller.admin;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import common.PageInfo;
import common.PageType;
import dao.CategoriesDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.VideoCategory;
import util.TimestampUtil;

@WebServlet({ "/admin/categories", "/admin/categories/edit/*" })

public class categories extends HttpServlet {
	/**
	 * 
	 */

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String message = null;
		String uri = req.getRequestURI();
		String q= req.getParameter("q") != null?  req.getParameter("q"):"";

		List<VideoCategory> lists = CategoriesDao.getAllCategories(q!=null? q : "");
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
		
		
		List<VideoCategory> categories = CategoriesDao
				.findPage(Integer.parseInt(req.getAttribute("pageCount").toString()), itemsPerPage,q!=null? q : "");
		req.setAttribute("list", categories);

		if (uri.contains("/admin/categories/edit/")) {
			String[] parts = uri.split("/");
			try {
				int id = Integer.parseInt(parts[parts.length - 1]);
				VideoCategory category = CategoriesDao.find(id);
				if (category == null) {
					message = "(lỗi) Mã số danh mục không tồn tại";
				}
				req.setAttribute("category", category);
			} catch (Exception e) {
				message = "(Lỗi) mã số danh mục phải là số";
			} finally {
				req.getSession().setAttribute("message", message);
				req.getSession().setMaxInactiveInterval(1);

			}
		}

		PageInfo.routeAdmin(req, resp, PageType.ADMIN_CATEGORIES);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String message = null;

		VideoCategory category = new VideoCategory();
		try {
			BeanUtils.populate(category, req.getParameterMap());
			if ("UpdateCategory".equals(req.getParameter("action"))) {
				if (CategoriesDao.updateCategory(category)) {
					message = " Cập nhật danh mục : (" + category.getId() + ") thành công";
				} else {
					message = "(lỗi) cập nhật thất bại";
				}

			} else if ("deleteCategory".equals(req.getParameter("action"))) {
				if (CategoriesDao.deleteCategory(category.getId())) {
					message = " Xóa danh mục : (" + category.getId() + ") thành công";

				} else {
					message = "(lỗi) Xóa thất bại";
				}

			} else if ("AddCategory".equals(req.getParameter("action"))) {
				category.setCreatedDate(TimestampUtil.getCurrentTimestamp());
				if (CategoriesDao.createCategory(category)) {
					message = "Thêm danh mục thành công";
				} else {
					message = "(lỗi) Thêm thất bại";
				}

			}
		} catch (IllegalAccessException | InvocationTargetException e) {
			message = "(lỗi) xảy ra " + e.getMessage().toString();
		} finally {
			req.getSession().setAttribute("message", message);
			req.getSession().setMaxInactiveInterval(1);
			if (message.contains("lỗi")) {
				resp.sendRedirect("/LaughHub/admin/categories/edit/" + category.getId());
			} else {
				resp.sendRedirect("/LaughHub/admin/categories");
			}
			System.out.println(message);
		}

	}
}
