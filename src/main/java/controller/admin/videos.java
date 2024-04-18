package controller.admin;

import java.io.IOException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import common.PageInfo;
import common.PageType;
import dao.CategoriesDao;
import dao.VideosDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Video;
import model.VideoCategory;
import util.TimestampUtil;
import util.UploadUtils;

@WebServlet({ "/admin/videos", "/admin/videos/edit/*" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class videos extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String message = req.getSession().getAttribute("message") == null ? null
				: (String) req.getSession().getAttribute("message");
		String uri = req.getRequestURI();
		String q = "";
		int active = 0;
		int idCategory = 0;
		
		try {
			q = req.getParameter("q") != null ? req.getParameter("q") : "";
			active = req.getParameter("active") != null ? Integer.parseInt(req.getParameter("active")) : 0;
			idCategory = req.getParameter("idCategory") != null ? Integer.parseInt(req.getParameter("idCategory")) : 0;
		} catch (Exception e) {
			message = "(lỗi) đã xảy ra lỗi trong quá trình thao tác " + e.getMessage();
		} finally {
			req.getSession().setAttribute("message", message);
			req.getSession().setMaxInactiveInterval(1);
		}
		System.out.println(active + "" + idCategory + "" + q);
		List<VideoCategory> categories = CategoriesDao.getAllCategories("");

		List<Video> lists = VideosDao.getAllVideos(q, active, idCategory);

		int totalPages = lists == null ? 0 : lists.size();

		int itemsPerPage = 10;// tổng item / trang
		int Pages = totalPages / itemsPerPage; // tính được tổng số page
		if (totalPages % itemsPerPage != 0) {// tăng 1 đơn vị nếu ra số lẽ
			Pages++;
		}

		req.setAttribute("q", q);
		req.setAttribute("active", active);
		req.setAttribute("idCategory", idCategory);
		req.setAttribute("categories", categories);

		req.setAttribute("totalPages", totalPages);
		req.setAttribute("pageCount", req.getParameter("page") == null ? 0 : req.getParameter("page"));// trang hiện tại
		req.setAttribute("Pages", Pages);// gửi tông page sang jsp
		List<Video> videos = VideosDao.findPage(Integer.parseInt(req.getAttribute("pageCount").toString()),
				itemsPerPage, q, active, idCategory);
		req.setAttribute("list", videos);

		if (uri.contains("/admin/videos/edit/")) {
			try {
				String[] parts = uri.split("/");

				String id = parts[parts.length - 1];
				Video video = VideosDao.find(id);
				if (video == null) {
					message = "(lỗi) video này không tồn tại";
				}

				req.setAttribute("video", video);
			} catch (Exception e) {
				message = "(lỗi)" + e.getMessage();
			}

			req.getSession().setAttribute("message", message);
			req.getSession().setMaxInactiveInterval(1);

		}

		PageInfo.routeAdmin(req, resp, PageType.ADMIN_VIDEOS);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String message = null;
		Video video = new Video();
		try {
			BeanUtils.populate(video, req.getParameterMap());
			int categoryId = Integer.parseInt(req.getParameter("videoCategoryId"));
			VideoCategory videoCategory = new VideoCategory();
			videoCategory.setId(categoryId);
			video.setVideoCategory(videoCategory);
			Part imagePart = req.getPart("posterVideo");
			if (imagePart != null && imagePart.getSize() > 0 && !imagePart.getSubmittedFileName().isEmpty()) {
				String fileName = UploadUtils.uploadFile(req, "/upload/client/poster", "posterVideo",
						video.getId().trim().toLowerCase() + ".png");
				video.setPoster(fileName);
			} else {
				video.setPoster(null);
			}
			video.setVideodate(TimestampUtil.getCurrentTimestamp());
			
			if ("CreateVideo".equals(req.getParameter("action"))) {
				video.setViews(0);
				if (VideosDao.createVideo(video)) {
					message = "Thêm video thành công";
				} else {
					message = "(lỗi)Tạo video thất bại - có thể id ytb đã tồn tại ";
				}
			} else if ("DeleteVideo".equals(req.getParameter("action"))) {
				if (VideosDao.deleteVideo(video.getId())) {
					message = "Xóa video thành công";
					// cần xóa hình trong resource khi xóa video

				} else {
					message = "(lỗi)xóa video thất bại - có thể id ytb không tồn tại ";
				}
			} else if ("UpdateVideo".equals(req.getParameter("action"))) {
				if (VideosDao.updateVideo(video)) {
					message = "Cập nhật video thành công";
				} else {
					message = "(lỗi)Cập video thất bại - có thể id ytb không tồn tại ";
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			System.out.println(message);
			req.getSession().setAttribute("message", message);
			req.getSession().setMaxInactiveInterval(1);
			if (message.contains("lỗi")) {
				resp.sendRedirect("/LaughHub/admin/videos");
			} else {
				resp.sendRedirect("/LaughHub/admin/videos");
			}
		}
	}
}
