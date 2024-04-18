package controller.client;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.beanutils.BeanUtils;

import common.PageInfo;
import common.PageType;
import dao.VideosDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Video;
import util.CookieUtils;

@WebServlet("/histories")
public class historiesServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String watchedVideosJson = CookieUtils.get("watched_videos", req);
		String[] watchedVideoIds = watchedVideosJson.split("/");

		Set<String> uniqueVideoIds = new HashSet<>();// lọc được id duy nhất
		for (String videoId : watchedVideoIds) {
			uniqueVideoIds.add(videoId.trim());
		}

		List<Video> watchedVideos = new ArrayList<>();
		for (String uniqueVideoId : uniqueVideoIds) {
			Video video = VideosDao.getVideoByIdActive(uniqueVideoId);
			if (video != null) {
				watchedVideos.add(video);
			}
		}
		Collections.reverse(watchedVideos);

		req.setAttribute("watchedVideos", watchedVideos);

		PageInfo.routeSite(req, resp, PageType.CLIENT_HISTORIES);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String message = "";
		Video video = new Video();
		try {
			BeanUtils.populate(video, req.getParameterMap());
			if (req.getParameter("action").equals("removeWatchTv")) {
				String watchedVideosJson = CookieUtils.get("watched_videos", req);
				if (!watchedVideosJson.isEmpty()) {
					List<String> watchedVideoIds = new ArrayList<>(Arrays.asList(watchedVideosJson.split("/")));
					for (int i = 0; i < watchedVideoIds.size(); i++) {
						if (watchedVideoIds.get(i).equals(video.getId())) {
							watchedVideoIds.remove(i);
							i--; // Giảm chỉ số để kiểm tra phần tử tiếp theo sau khi xóa
						}
					}
					watchedVideosJson = String.join("/", watchedVideoIds);
					CookieUtils.add("watched_videos", watchedVideosJson, 30 * 24, resp);
					message="Xóa video đã xem thành công";
				}
			}
		} catch (IllegalAccessException | InvocationTargetException e) {

		} finally {
			req.getSession().setAttribute("message", message);
			req.getSession().setMaxInactiveInterval(1);
			resp.sendRedirect("/LaughHub/histories");
		}
	}
}
