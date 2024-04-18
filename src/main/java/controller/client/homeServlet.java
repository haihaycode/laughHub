package controller.client;

import java.io.IOException;
import java.util.List;

import common.PageInfo;
import common.PageType;
import dao.CategoriesDao;
import dao.VideosDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Video;
import model.VideoCategory;

@WebServlet(urlPatterns = "/index")
public class homeServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String message = req.getSession().getAttribute("message") == null ? null
				: (String) req.getSession().getAttribute("message");
		
		

		List<VideoCategory> categories = CategoriesDao.getAllCategories("");
		List<Video> videos = VideosDao.getAllVideosHome("", 0, false,false);
		req.setAttribute("categories", categories);
		req.setAttribute("videos", videos);

		String q = "";
		Boolean views = true;
		Boolean sortByDateAsc= true;

		int idCategory = 0;
		try {
			
			views = req.getParameter("views") != null ? Boolean.parseBoolean(req.getParameter("views")) : false;
			sortByDateAsc = req.getParameter("sortByDateAsc") != null ? Boolean.parseBoolean(req.getParameter("sortByDateAsc")) : false;
			q = req.getParameter("q") != null ? req.getParameter("q") : "";
			idCategory = req.getParameter("idCategory") != null ? Integer.parseInt(req.getParameter("idCategory")) : 0;
			
			List<Video> lists = VideosDao.getAllVideosHome(q, idCategory, views,sortByDateAsc);

			int totalPages = lists == null ? 0 : lists.size();

			int itemsPerPage = 8;// tổng item / trang
			int Pages = totalPages / itemsPerPage; // tính được tổng số page
			if (totalPages % itemsPerPage != 0) {// tăng 1 đơn vị nếu ra số lẽ
				Pages++;
			}

			req.setAttribute("q", q);
			req.setAttribute("idCategory", idCategory);
			req.setAttribute("totalPages", totalPages);
			req.setAttribute("pageCount", req.getParameter("page") == null ? 0 : req.getParameter("page"));// trang hiện																									// tại
			req.setAttribute("Pages", Pages);// gửi tông page sang jsp
			
			List<Video> videoss = VideosDao.findPageHome(Integer.parseInt(req.getAttribute("pageCount").toString()),
					itemsPerPage, q,  idCategory,views,sortByDateAsc);
			req.setAttribute("list", videoss);
			
			req.setAttribute("views",!views);
			req.setAttribute("sortByDateAsc",!sortByDateAsc);
			
		} catch (Exception e) {
			message = "(lỗi) đã xảy ra lỗi trong quá trình thao tác " + e.getMessage();
		} finally {
			req.getSession().setAttribute("message", message);
			req.getSession().setMaxInactiveInterval(1);
		}

		PageInfo.routeSite(req, resp, PageType.CLIENT_HOME);
	}
}
