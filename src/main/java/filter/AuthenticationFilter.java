package filter;

import java.io.IOException;

import dao.UserDao;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import util.CookieUtils;
import util.SessionUtils;

@WebFilter(filterName = "AuthenticationFilter", urlPatterns = "/*")
public class AuthenticationFilter implements Filter {

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) arg0;
		HttpServletResponse httpResponse = (HttpServletResponse) arg1;
		String uri = httpRequest.getRequestURI();
	

		if (!CookieUtils.get("id", (HttpServletRequest) arg0).equals("")) {
			String id = CookieUtils.get("id", (HttpServletRequest) arg0);
			SessionUtils sessionUtils = new SessionUtils();
			sessionUtils.setSession((HttpServletRequest) arg0, "user", UserDao.find(id));
			User user = sessionUtils.getSession(httpRequest, "user");
			if (uri.contains("admin") && !user.getAdmin() || uri.contains("/login")||uri.contains("/register")) {
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/index");
				return;
			}
		} else {
			if ((uri.contains("/info") || uri.contains("/favorites") || uri.contains("/changepass")
					|| uri.contains("/shared") || uri.contains("/admin"))) {
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
				return;
			}
		}

		arg2.doFilter(arg0, arg1);

	}

}
