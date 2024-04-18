package controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import common.PageInfo;
import common.PageType;
import dao.ShareDao;
import dao.VideosDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Favorite;
import model.Share;
import model.User;
import model.Video;

@WebServlet("/admin/statistic")
public class statistic extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String category = req.getParameter("category");
		if (category == null) {
			resp.sendRedirect("/LaughHub/admin");
		} else {
			if (category.equals("like")) {
				List<Video> videos = VideosDao.getAllVideos("", 0, 0);
				req.setAttribute("videos", videos);
				PageInfo.routeAdmin(req, resp, PageType.ADMIN_STATISTIC_LIKE);
			} else if (category.equals("UsersLIke")) {
				req.setAttribute("videos", VideosDao.getAllVideos("", 0, 0));
				String Videoid = req.getParameter("v") != null ? req.getParameter("v") : "";
				
				if (VideosDao.find(Videoid) == null) {
					req.getSession().setAttribute("message", "(lỗi) video không tồn tại !");
					req.getSession().setMaxInactiveInterval(1);
				} else {
					//có video -> truy vấn các favorite liên quan đến video đó -> 
					//duyệt qua favorite -> gết toàn bộ người yêu thích dựa trên favorite đó 
					Video video = VideosDao.find(Videoid);
					List<Favorite> favorites = video.getFavorites();
					List<User> users = new ArrayList<>();
					for (Favorite favorite : favorites) {
						users.add(favorite.getUser());
					}
					req.setAttribute("users", users);
				}

				PageInfo.routeAdmin(req, resp, PageType.ADMIN_STATISTIC_USERSLIKE);
			} else if (category.equals("share")) {
				req.setAttribute("videos", VideosDao.getAllVideos("", 0, 0));
				String Videoid = req.getParameter("v") != null ? req.getParameter("v") : "";
				if (VideosDao.find(Videoid) == null) {
					req.getSession().setAttribute("message", "(lỗi) video không tồn tại !");
					req.getSession().setMaxInactiveInterval(1);
				} else {
					Video video = VideosDao.find(Videoid);
					List<Share> shares = ShareDao.findByVideoId(video.getId());

					List<User> users = new ArrayList<>();
					for (Share share : shares) {
						users.add(share.getUser());
					}

					// Tạo một Set để lưu trữ các User duy nhất 
					Set<User> uniqueUsers = new HashSet<>(users);
					users.clear();
					users.addAll(uniqueUsers);

					// Thiết lập thuộc tính users
					req.setAttribute("shares", shares);
					req.setAttribute("users", users);

				}
				PageInfo.routeAdmin(req, resp, PageType.ADMIN_STATISTIC_SHARE);
			} else {
				resp.sendRedirect("/LaughHub/admin");
			}
		}
	}
}
