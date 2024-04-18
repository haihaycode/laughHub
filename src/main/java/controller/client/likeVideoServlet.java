package controller.client;

import java.io.IOException;
import java.util.List;

import com.google.gson.JsonObject;

import common.PageInfo;
import common.PageType;
import dao.FavoriteDao;
import dao.VideosDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Favorite;
import model.User;
import model.Video;
import util.SessionUtils;
import util.TimestampUtil;
import util.getFromRequest;

@WebServlet({ "/api/like", "/api/Unlike", "/favorites" })
public class likeVideoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if(uri.contains("/favorites")) {
			SessionUtils sessionUtils = new SessionUtils();
			User user = sessionUtils.getSession(req, "user");
	    	List<Video> video = VideosDao.getAllFavoriteVideosByUserId(user.getId().trim());
	    	req.setAttribute("videosHistoy", video);
	    	PageInfo.routeSite(req, resp, PageType.CLIENT_FAVORITES);
		}else {
			resp.sendRedirect("/LaughHub/favorites");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (!uri.contains("/favorites")) {

			SessionUtils sessionUtils = new SessionUtils();
			User user = sessionUtils.getSession(req, "user");
			if (user == null) {
				resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				resp.getWriter().write("Bạn chưa đăng nhập");
				return;
			} else {
				Favorite favorite = new Favorite();
				String videoId = getFromRequest.get(req, "videoId");
				favorite.setVideo(VideosDao.find(videoId));
				favorite.setLikedate(TimestampUtil.getCurrentTimestamp());
				favorite.setUser(user);

				if (uri.contains("/api/like")) {
					if (!FavoriteDao.existsByVideoIdAndUserId(favorite.getVideo().getId(),
							favorite.getUser().getId())) {
						if (FavoriteDao.create(favorite)) {
							Video video = VideosDao.find(videoId);

							String likeCount = Integer.toString(video.getFavorites().size());

							JsonObject jsonResponse = new JsonObject();

							// Đặt các thuộc tính vào JsonObject
							jsonResponse.addProperty("likeCount", likeCount);
							jsonResponse.addProperty("message", "like video thành công");

							// Chuyển đối tượng JsonObject thành chuỗi JSON
							String jsonString = jsonResponse.toString();

							resp.setStatus(HttpServletResponse.SC_OK);
							resp.getWriter().write(jsonString);

						} else {
							resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
							resp.getWriter().write("Có lỗi xảy ra");
						}
					} else {
						resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
						resp.getWriter().write("Bạn đã like video này rồi");
					}
				} else if (uri.contains("/api/Unlike")) {
					if(FavoriteDao.deleteByVideoIdAndUserId(favorite.getVideo().getId(), favorite.getUser().getId())) {
						Video video = VideosDao.find(videoId);
						String likeCount = Integer.toString(video.getFavorites().size());
						JsonObject jsonResponse = new JsonObject();
						// Đặt các thuộc tính vào JsonObject
						jsonResponse.addProperty("likeCount", likeCount);
						jsonResponse.addProperty("message", "Xoá video thành công");

						// Chuyển đối tượng JsonObject thành chuỗi JSON
						String jsonString = jsonResponse.toString();

						resp.setStatus(HttpServletResponse.SC_OK);
						resp.getWriter().write(jsonString);

					} else {
						resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
						resp.getWriter().write("Có lỗi xảy ra");
					}
				}
			}

		} else {
			resp.sendRedirect("/LaughHub/favorites");
		}
	}
}
