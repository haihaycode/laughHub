package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class TestConnect {
	public static void main(String[] args) {
        String host = "bs5h14wg6zljcu2uhmfm-mysql.services.clever-cloud.com";
        String databaseName = "bs5h14wg6zljcu2uhmfm";
        String user = "uyt4rlqm8ad5w1yp";
        String password = "5I1kmQYH8b8AvRHdXhIL";
        int port = 3306;

        String connectionString = "jdbc:mysql://" + host + ":" + port + "/" + databaseName;

        try {
            // Kết nối đến cơ sở dữ liệu
            Connection connection = DriverManager.getConnection(connectionString, user, password);

            if (connection != null) {
                System.out.println("Kết nối thành công đến cơ sở dữ liệu MySQL!");
                connection.close(); // Đóng kết nối sau khi sử dụng
            }
        } catch (SQLException e) {
            System.out.println("Kết nối đến cơ sở dữ liệu thất bại!");
            e.printStackTrace();
        }
    }
}
