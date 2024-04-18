package common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PageInfo {
	private String title;
	private String contentUrl;
	private String scriptUrl;

	public PageInfo() {
		super();
	}

	public PageInfo(String title, String contentUrl, String scriptUrl) {
		super();
		this.title = title;
		this.contentUrl = contentUrl;
		this.scriptUrl = scriptUrl;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContentUrl() {
		return contentUrl;
	}

	public void setContentUrl(String contentUrl) {
		this.contentUrl = contentUrl;
	}

	public String getScriptUrl() {
		return scriptUrl;
	}

	public void setScriptUrl(String scriptUrl) {
		this.scriptUrl = scriptUrl;
	}

	private static Map<PageType, PageInfo> map = new HashMap<PageType, PageInfo>();

	static {
		map.put(PageType.CLIENT_HOME, new PageInfo(" LaughHub | Tập hợp các video -  clip mới nhất ",
				"/views/client/components/home.jsp", "index"));
		map.put(PageType.REGISTER,
				new PageInfo(" Đăng Ký tài khoản | LaughHub ", "/views/client/components/register.jsp", "register"));
		map.put(PageType.LOGIN,
				new PageInfo(" Đăng nhập tài khoản | LaughHub ", "/views/client/components/login.jsp", "login"));
		map.put(PageType.INFO,
				new PageInfo(" Thông tin tài khoản | LaughHub ", "/views/client/components/info.jsp", "info"));
		map.put(PageType.CHANGEPASS, new PageInfo(" Thay đổi mật khẩu  | LaughHub ",
				"/views/client/components/changepass.jsp", "changepass"));
		map.put(PageType.FORGOTPASS,
				new PageInfo(" Quên mật khẩu ?  | LaughHub ", "/views/client/components/forgotpass.jsp", "forgotpass"));	
		
		
		
		map.put(PageType.CLIENT_VIDEO,
				new PageInfo("xem video  | LaughHub ", "/views/client/components/watchVideo.jsp", "video"));
		map.put(PageType.CLIENT_HISTORIES,
				new PageInfo("Lịch sử đã xem  | LaughHub ", "/views/client/components/histories.jsp", "histories"));
		map.put(PageType.CLIENT_FAVORITES,
				new PageInfo(" Trang yêu thích  ?  | LaughHub ", "/views/client/components/favorites.jsp", "favorites"));
		map.put(PageType.CLIENT_SHARED,
				new PageInfo(" Video đã share   | LaughHub ", "/views/client/components/shared.jsp", "shared"));

		map.put(PageType.ADMIN_HOME,
				new PageInfo("Admin Dashboard   | LaughHub ", "/views/admin/components/home.jsp", "admin"));
		map.put(PageType.ADMIN_USERS,
				new PageInfo("Quản lý người dùng   | LaughHub ", "/views/admin/components/users.jsp", "users"));
		map.put(PageType.ADMIN_CATEGORIES,
				new PageInfo("Quản lý danh mục video  | LaughHub ", "/views/admin/components/categories.jsp", "categories"));
		map.put(PageType.ADMIN_VIDEOS,
				new PageInfo("Quản lý video  | LaughHub ", "/views/admin/components/videos.jsp", "videos"));
		
		map.put(PageType.ADMIN_STATISTIC_LIKE,
				new PageInfo("Thống kê lượt yêu thích theo video  | LaughHub ", "/views/admin/components/statistic/like.jsp", "statistic.like"));
		map.put(PageType.ADMIN_STATISTIC_USERSLIKE,
				new PageInfo("Thống kê lượt người yêu thích của từng video  | LaughHub ", "/views/admin/components/statistic/UsersLike.jsp", "statistic.UsersLIke"));
		map.put(PageType.ADMIN_STATISTIC_SHARE,
				new PageInfo("Thống kê lượt người gửi & nhận của từng video được chia sẽ  | LaughHub ", "/views/admin/components/statistic/share.jsp", "statistic.share"));
		
		
		map.put(PageType.ERROR_404_NOT_FOUND,
				new PageInfo(" 404_Not_Found  | LaughHub ", "/views/client/components/not_found_404.jsp", "not_found_404"));
	}

	// hàm chuyển trang client
	public static void routeSite(HttpServletRequest request, HttpServletResponse response, PageType pageType)
			throws ServletException, IOException {
		PageInfo pageInfo = map.get(pageType);
		request.setAttribute("content", pageInfo);
		request.getRequestDispatcher("/views/client/masterLayout.jsp").forward(request, response);
	}

	// hàm chuyển trang admin
	public static void routeAdmin(HttpServletRequest request, HttpServletResponse response, PageType pageType)
			throws ServletException, IOException {
		PageInfo pageInfo = map.get(pageType);
		request.setAttribute("content", pageInfo);
		request.getRequestDispatcher("/views/admin/masterLayout.jsp").forward(request, response);

	}
}
