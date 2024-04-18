package controller.client;

import java.io.IOException;
import java.util.List;

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
import util.JsonUtils;
import util.SessionUtils;
import util.ShareVideoUntils;
import util.TimestampUtil;

@WebServlet({ "/api/share", "/shared" })
public class shareServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("/shared")) {
			SessionUtils sessionUtils = new SessionUtils();
			User user = sessionUtils.getSession(req, "user");
			List<Share> shared = user.getShares();
			req.setAttribute("shared", shared);
			PageInfo.routeSite(req, resp, PageType.CLIENT_SHARED);
		} else {
			resp.sendRedirect("/LaughHub/shared");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (!uri.contains("/shared")) {

			SessionUtils sessionUtils = new SessionUtils();
			User user = sessionUtils.getSession(req, "user");
			if (user == null) {
				resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				resp.getWriter().write("Bạn chưa đăng nhập");
				return;
			} else {
				Share share = new Share();
				User send = JsonUtils.parseJsonToObject(req, User.class);
				share.setEmails(send.getEmail());
				share.setUser(user);
				share.setSharedate(TimestampUtil.getCurrentTimestamp());
				share.setVideo(VideosDao.getVideoByIdActive(send.getId().trim()));

				if (uri.contains("/api/share")) {
					if (ShareDao.insert(share)) {
						ShareVideoUntils.share(share.getEmails(), user,
								VideosDao.getVideoByIdActive(send.getId().trim()));
						resp.setStatus(HttpServletResponse.SC_OK);
						resp.getWriter().write("Chia sẽ video Thành công");
					} else {
						resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
						resp.getWriter().write("Chia sẽ video thất bại ");
					}

				} else if (uri.contains("/api/Unshare")) {

				}
			}

		} else {
			resp.sendRedirect("/LaughHub/shared");
		}
	}
}
