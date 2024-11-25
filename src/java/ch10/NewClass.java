/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ch10;

/**
 *
 * @author huhuaji
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class NewClass {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/blog?useSSL=false&serverTimezone=UTC";
        String username = "root"; // 替换为你的用户名
        String password = "123456"; // 替换为你的密码

        // SQL 查询语句
        String query = "show tables";

        try (Connection connection = DriverManager.getConnection(url, username, password);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            System.out.println("数据库连接成功！");
            System.out.println("查询结果：");

            // 遍历结果集并输出数据
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");

                System.out.println("ID: " + id + ", Title: " + title + ", Content: " + content);
            }
        } catch (SQLException e) {
            System.out.println("数据库连接或查询失败！");
            e.printStackTrace();
        }
    }
}
