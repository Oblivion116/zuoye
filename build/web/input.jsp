<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" contentType="text/html" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP中更新数据库</title>
</head>
<body bgcolor="CCCFFF">
    <br><br>
    <center>
        <form action="inputcheack.jsp" method="post">
            <h2>输入要添加学生的信息</h2>
            <hr>
            <table border="0" width="200">
                <tr>
                    <td>学号</td>
                    <td><input type="text" name="studentNumber"></td>
                </tr>
                <tr>
                    <td>姓名</td>
                    <td><input type="text" name="studentName"></td>
                </tr>
                <tr>
                    <td>性别</td>
                    <td><input type="text" name="studentSex"></td>
                </tr>
                <tr>
                    <td>年龄</td>
                    <td><input type="text" name="studentAge"></td>
                </tr>
                <tr>
                    <td>体重</td>
                    <td><input type="text" name="studentWeight"></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="提交">
        </form>
    </center>

    <% 
    // 获取表单数据
    String studentNumber = request.getParameter("studentNumber");
    String studentName = request.getParameter("studentName");
    String studentSex = request.getParameter("studentSex");
    String studentAge = request.getParameter("studentAge");
    String studentWeight = request.getParameter("studentWeight");

    // 确保表单数据存在才执行数据库操作
    if (studentNumber != null && studentName != null && studentSex != null && studentAge != null && studentWeight != null) {
        // 数据库连接配置
        String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
        String user = "root";
        String password = "123456";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // 加载MySQL JDBC驱动
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 连接数据库
            conn = DriverManager.getConnection(url, user, password);

            // 插入数据的 SQL 语句
            String sql = "INSERT INTO stuinfo (SID, SName, SSex, SAge, SWeight) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            // 设置参数
            pstmt.setString(1, studentNumber);
            pstmt.setString(2, studentName);
            pstmt.setString(3, studentSex);
            pstmt.setInt(4, Integer.parseInt(studentAge));
            pstmt.setDouble(5, Double.parseDouble(studentWeight));

            // 执行插入操作
            int rows = pstmt.executeUpdate();
            if (rows > 0) {
    %>
                <h3>学生信息已成功提交至数据库！</h3>
    <% 
            } else {
    %>
                <h3>提交失败，请重试！</h3>
    <% 
            }
        } catch (Exception e) {
    %>
            <h3>出现错误：<%= e.getMessage() %></h3>
    <% 
        } finally {
            // 关闭数据库连接
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    %>
</body>
</html>
