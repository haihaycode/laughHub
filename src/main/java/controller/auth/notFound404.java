package controller.auth;

import java.io.IOException;

import common.PageInfo;
import common.PageType;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/error_404")
public class notFound404 extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      PageInfo.routeSite(req, resp, PageType.ERROR_404_NOT_FOUND);
	}
}
