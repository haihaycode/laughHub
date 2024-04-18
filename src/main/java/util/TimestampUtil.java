package util;


import java.sql.Timestamp;
import java.util.Date;

public class TimestampUtil {

	public static Timestamp getCurrentTimestamp() {
		Date now = new Date(); // Lấy thời gian hiện tại
		return new Timestamp(now.getTime()); // Chuyển đổi thành timestamp và trả về
	}
}
