package filter;

import java.io.IOException;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.CookieUtils;

@WebFilter("/*")
public class I18nFilter extends HttpFilter {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		String lang =CookieUtils.get("lang", request);
		
		if (lang != null) {
			request.getSession().setAttribute("lang", lang);
		}else {
			CookieUtils.add("lang", "vi", 30*24, response);
		}
		chain.doFilter(request, response);
	}

	
}
