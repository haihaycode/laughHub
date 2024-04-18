package util;

import java.util.List;

import dao.CategoriesDao;
import dao.VideosDao;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import model.Video;
import model.VideoCategory;
@WebListener
public class AppInitializer implements ServletContextListener {
	
	public void contextInitialized(ServletContextEvent sce) {
		 // Lấy danh sách danh mục video
        List<VideoCategory> categories = CategoriesDao.getAllCategories("");

        // Lấy danh sách video
        List<Video> videos = VideosDao.getAllVideos("", 1, 0); // Giả sử bạn có một phương thức tương tự trong VideoDao

        // Lưu trữ danh sách danh mục và danh sách video trong ServletContext
        ServletContext servletContext = sce.getServletContext();
        servletContext.setAttribute("ServletContextCategories", categories);
        servletContext.setAttribute("ServletContextVideos", videos);
      
		
		
	}


}
