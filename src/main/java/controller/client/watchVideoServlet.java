package controller.client;

import java.io.IOException;
import java.util.List;

import common.PageInfo;
import common.PageType;
import dao.VideosDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Favorite;
import util.CookieUtils;

@WebServlet("/watchVideo")
public class watchVideoServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String message = req.getSession().getAttribute("message") == null ? null
				: (String) req.getSession().getAttribute("message");
		if (req.getParameter("v") == null) {
			resp.sendRedirect("/LaughHub/index");
		} else {
			String v = req.getParameter("v");
			if (VideosDao.getVideoByIdActive(v) != null) {
				
				
				
				
				VideosDao.updateVideoViews(VideosDao.getVideoByIdActive(v));
				req.setAttribute("randomVideo", VideosDao.getRandomizedList(VideosDao.getAllVideos("", 0, 0)));																													// random
				req.setAttribute("videoWatch", VideosDao.getVideoByIdActive(v));

				String watchedVideosJson = CookieUtils.get("watched_videos", req);
				if (!watchedVideosJson.isEmpty()) {
				    watchedVideosJson += "/" + v;
				} else {
				    watchedVideosJson = v;
				}
				CookieUtils.add("watched_videos", watchedVideosJson, 30 * 24, resp);
				
				PageInfo.routeSite(req, resp, PageType.CLIENT_VIDEO);

			} else {
				message = "(lỗi)video không tồn tại";
				req.getSession().setAttribute("message", message);
				req.getSession().setMaxInactiveInterval(1);
				resp.sendRedirect("/LaughHub/index");
			}

		}
	}
}
