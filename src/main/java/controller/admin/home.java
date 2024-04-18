package controller.admin;

import java.io.IOException;
import java.util.List;

import common.PageInfo;
import common.PageType;
import dao.CategoriesDao;
import dao.UserDao;
import dao.VideosDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Video;

@WebServlet("/admin")

public class home extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Video> topViews= VideosDao.getAllVideosHome("", 0, false, false);
		req.setAttribute("topViews",  topViews.size() < 8 ? topViews : topViews.subList(0, 8));// top view
		
		
		req.setAttribute("countVideoActive", VideosDao.getAllVideos("", 1, 0).size());
		req.setAttribute("countVideoNoActive", VideosDao.getAllVideos("", 2, 0).size());
		
		
		req.setAttribute("countUsers", UserDao.getAllUsers(""));
		req.setAttribute("countCategories", CategoriesDao.getAllCategories(""));
		req.setAttribute("countVideos",VideosDao.getAllVideos("", 0, 0));
		
		
		

		PageInfo.routeAdmin(req, resp, PageType.ADMIN_HOME);
	}
}
