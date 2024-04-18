package util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class UploadUtils {
	public static String uploadFile(HttpServletRequest request, String uploadDirectory, String fieldName,
			String customFileName) throws ServletException, IOException {
		// Thư mục để lưu trữ file
		String uploadPath = request.getServletContext().getRealPath(uploadDirectory);

		// Tạo thư mục nếu nó không tồn tại
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		// Xử lý file được tải lên
		Part filePart = request.getPart(fieldName);
		String fileName = customFileName.isEmpty() ? getSubmittedFileName(filePart) : customFileName;
		File uploadedFile = new File(uploadDir, fileName);

		// Kiểm tra xem file đã tồn tại chưa
		if (uploadedFile.exists()) {
			uploadedFile.delete(); // Xóa file cũ
		}

		try (InputStream fileContent = filePart.getInputStream()) {
			Files.copy(fileContent, uploadedFile.toPath());
		}

		return fileName;
	}

	// Phương thức để lấy tên file từ một Part
	private static String getSubmittedFileName(Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

	public static boolean deleteFile(ServletContext context, String relativePath) {
		// Lấy đường dẫn thư mục gốc của ứng dụng web
		String rootPath = context.getRealPath("/");

		// Tạo đối tượng File cho tệp cần xóa
		File fileToDelete = new File(rootPath + relativePath);

		// Kiểm tra xem tệp tồn tại hay không
		if (fileToDelete.exists()) {
			// Thử xóa tệp
			boolean isDeleted = fileToDelete.delete();

			// Trả về kết quả xóa
			return isDeleted;
		} else {
			// Nếu tệp không tồn tại, trả về false
			return false;
		}
	}
}
