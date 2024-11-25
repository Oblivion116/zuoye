<%-- 
    Document   : accessMysql
    Created on : 2024年11月25日, 16:51:35
    Author     : huhuaji
--%>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>通过MySQL的JDBC驱动访问数据库</title>
</head>
<body bgcolor="pink">
    <h3 align="center">使用MySQL的JDBC驱动访问MySQL数据库</h3>
    <hr>
    <table border="1" bgcolor="#ccceee" align="center">
        <tr>
            <th width="87" align="center">学号</th>
            <th width="87" align="center">姓名</th>
            <th width="87" align="center">性别</th>
            <th width="87" align="center">年龄</th>
            <th width="87" align="center">体重</th>
        </tr>
        <%
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            // 加载数据库驱动
            Class.forName("com.mysql.jdbc.Driver");

            // 数据库连接信息
            String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=gbk";
            con = DriverManager.getConnection(url, "root", "123456");

            // 创建Statement对象
            stmt = con.createStatement();
            String sql = "SELECT * FROM stuinfo";

            // 执行查询
            rs = stmt.executeQuery(sql);

            // 遍历结果集
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("SID") %></td>
            <td><%= rs.getString("SName") %></td>
            <td><%= rs.getString("SSex") %></td>
            <td><%= rs.getString("SAge") %></td>
            <td><%= rs.getString("SWeight") %></td>
        </tr>
        <%
            } // while 结束
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            if (rs != null) try { rs.close(); } catch (Exception ex) {}
            if (stmt != null) try { stmt.close(); } catch (Exception ex) {}
            if (con != null) try { con.close(); } catch (Exception ex) {}
        }
        %>
    </table>
</body>
</html>
