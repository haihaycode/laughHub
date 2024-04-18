package util;

import java.io.BufferedReader;
import com.fasterxml.jackson.databind.ObjectMapper; 
import jakarta.servlet.http.HttpServletRequest; 

public class JsonUtils {

    public static <T> T parseJsonToObject(HttpServletRequest req, Class<T> clazz) { 
        try { 
            StringBuilder sb = new StringBuilder(); // Tạo một đối tượng StringBuilder để tạo chuỗi JSON từ dữ liệu được đọc từ HttpServletRequest
            BufferedReader reader = req.getReader(); // Tạo một đối tượng BufferedReader từ HttpServletRequest để đọc dữ liệu

            String line; // Khai báo biến line để lưu trữ dữ liệu từng dòng được đọc từ BufferedReader
            while ((line = reader.readLine()) != null) { // Đọc dữ liệu từ BufferedReader theo dòng, cho đến khi không còn dòng nào
                sb.append(line); // Thêm dữ liệu của mỗi dòng vào StringBuilder
            }

            String json = sb.toString(); // Lấy ra chuỗi JSON từ StringBuilder đã được xây dựng
            ObjectMapper mapper = new ObjectMapper(); // Tạo một đối tượng ObjectMapper để chuyển đổi chuỗi JSON thành đối tượng Java
            return mapper.readValue(json, clazz); // Sử dụng ObjectMapper để chuyển đổi chuỗi JSON thành một đối tượng Java của lớp được chỉ định và trả về kết quả
        } catch (Exception e) { 
            e.printStackTrace();
            return null;
        }
    }
}
