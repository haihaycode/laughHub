package controller.auth;

import java.io.IOException;
import java.util.Random;

import common.PageInfo;
import common.PageType;
import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ForgotPassData;
import model.User;
import util.JsonUtils;
import util.getFromRequest;
import util.sendOTP;

@WebServlet({ "/forgotpass", "/api/forgotpass/sendTP", "/api/forgotpass/checkTP" })
public class forgotpass extends HttpServlet {

	private static final long serialVersionUID = 1L;
    private int otp =0;
    private String emailsend = null;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getRequestURI().equals("/LaughHub/forgotpass")) {
			PageInfo.routeSite(req, resp, PageType.FORGOTPASS);
		}else {
			resp.sendRedirect("/LaughHub/forgotpass");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("/api/forgotpass/sendTP")) {
			otp = generateOTP();
			String email = getFromRequest.get(req, "email");
			System.out.println("OTP: " + otp + "- email :" + email);

			if (UserDao.checkEmailExists(email)) {
				resp.setStatus(HttpServletResponse.SC_OK);
				resp.getWriter().write(sendOTP.send(email, otp));
				emailsend= email;
				
			} else {
				resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				resp.getWriter().write("Email không tồn tại !");
			}
		} else if (uri.contains("/api/forgotpass/checkTP")) {
			ForgotPassData forgotPassData = JsonUtils.parseJsonToObject(req, ForgotPassData.class);
			if(!forgotPassData.getEmail().equalsIgnoreCase(emailsend)) {
				resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				resp.getWriter().write("Bạn đã thay đổi email , vui lòng gửi lại otp với email mới !");
			}else {
				if (otp == 0 ||otp!=forgotPassData.getOtp()) {
					resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
					resp.getWriter().write("OTP sai !");
				}else {
					//đúng hết
					System.out.println("đúng hết - Update");
					User user =UserDao.getUserByEmail(forgotPassData.getEmail());
					user.setPassword(forgotPassData.getPassword());
					UserDao.updatePassword(user);
					resp.setStatus(HttpServletResponse.SC_OK);
					resp.getWriter().write("Thay đổi thành công (id) : "+user.getId());
				}
			}
		} else {
			resp.sendRedirect("/LaughHub/forgotpass");
		}
	}

	private int generateOTP() {
		Random random = new Random();
		int otp = 100000 + random.nextInt(900000);
		return otp;
	}

}
