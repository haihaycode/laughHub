package util;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import model.Video;
import model.VideoCategory;

@WebFilter("/*")

public class DataSharingFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		ServletContext servletContext = request.getServletContext();
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		List<VideoCategory> categories = (List<VideoCategory>) servletContext.getAttribute("ServletContextCategories");
		List<Video> videos = (List<Video>) servletContext.getAttribute("ServletContextVideos");
        
		
		
		
		// Chuyển tiếp danh sách categories và danh sách videos vào mỗi request
		request.setAttribute("ServletContextCategories", categories);
		request.setAttribute("ServletContextVideos", videos);
		// Chuyển tiếp request và response cho Filter hoặc Servlet tiếp theo trong chuỗi
		chain.doFilter(request, response);
	}
}
