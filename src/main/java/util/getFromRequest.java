	package util;
	
	import java.io.BufferedReader;
	import java.io.IOException;
	import java.util.stream.Collectors;
	
	import com.fasterxml.jackson.databind.JsonNode;
	import com.fasterxml.jackson.databind.ObjectMapper;
	
	import jakarta.servlet.http.HttpServletRequest;
	
	public class getFromRequest {
		  public static String get(HttpServletRequest request, String nameRequest) throws IOException {
		        // Đọc dữ liệu từ yêu cầu
		        BufferedReader reader = request.getReader(); // Lấy đối tượng BufferedReader để đọc dữ liệu từ yêu cầu
		        String requestBody = reader.lines().collect(Collectors.joining(System.lineSeparator())); // Đọc dữ liệu từ BufferedReader dưới dạng các dòng và thu thập chúng vào một chuỗi requestBody
		        
		        // Phân tích JSON để lấy dữ liệu trường cần
		        ObjectMapper mapper = new ObjectMapper(); // Tạo một đối tượng ObjectMapper để phân tích JSON
		        JsonNode jsonNode = mapper.readTree(requestBody); // Phân tích chuỗi JSON thành cây nút JSON bằng cách sử dụng ObjectMapper
		        String value = jsonNode.get(nameRequest).asText(); // Lấy giá trị của trường có tên nameRequest từ cây nút JSON và chuyển đổi nó thành một chuỗi
		        
		        return value; // Trả về giá trị của trường cần lấy từ yêu cầu
		    }
	}
