<%-- 
    Document   : inputcheack
    Created on : 2024年11月25日, 17:42:00
    Author     : huhuaji
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>数据更新后的页面</title>
</head>
<body>
    <center>
        <h3>已添加学生信息</h3>
        <hr>
        <%
            // 处理学生信息参数
            String studentNumber = request.getParameter("studentNumber");
            byte b[] = studentNumber.getBytes("ISO-8859-1");
            studentNumber = new String(b, "UTF-8");

            String studentName = request.getParameter("studentName");
            byte b1[] = studentName.getBytes("ISO-8859-1");
            studentName = new String(b1, "UTF-8");

            String studentSex = request.getParameter("studentSex");
            byte b2[] = studentSex.getBytes("ISO-8859-1");
            studentSex = new String(b2, "UTF-8");

            String studentAge = request.getParameter("studentAge");
byte b3[] = studentAge.getBytes("ISO-8859-1");
studentAge = new String(b3, "UTF-8");

String studentWeight = request.getParameter("studentWeight");
byte b4[] = studentWeight.getBytes("ISO-8859-1");
studentWeight = new String(b4, "UTF-8");

try {
    Class.forName("com.mysql.jdbc.Driver");

    // String url = "jdbc:mysq1://localhost:3306/test";
    String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=gbk";
    String user = "root";
    String password = "123456";

    Connection conn = DriverManager.getConnection(url, user, password);
    Statement stmt = conn.createStatement();

    String sql = "insert into stuinfo values('" + studentNumber + "','" + studentName + "','" + studentSex + "', " + studentAge + ")";
    stmt.executeUpdate(sql);

    String sql1 = "update stuinfo set SAge=18";
    stmt.executeUpdate(sql1);
%>

<h3>已更改学生信息</h3>
<hr>

<%
    String sq12 = "delete from stuinfo where SSex='f'";
    // String sq12 = "delete from stuinfo where SName='3kEt'";
    stmt.executeUpdate(sq12);
%>

<h3>已删除学生信息</h3>
<hr>
<h3>经过以上操作后,数据库中有以下记录</h3>

<table border="2" bgcolor="ccceee" align="center">
    <tr>
        <td>学号</td>
        <td>姓名</td>
        <td>性别</td>
        <td>年龄</td>
        <td>体重</td>
    </tr>
<%
    // Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    // String ur13 = "jdbc:sqlserver://localhost:1433;databasename=student";
    // String user3 = "sa";
    // String password3 = "root";
    // Connection conn3 = DriverManager.getConnection(ur13, user3, password3);
    // Statement stmt3 = conn3.createStatement();

    String sq13 = "select * from stuinfo";
    ResultSet rs = stmt.executeQuery(sq13);

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
    }
%>
<%
    rs.close();
    stmt.close();
    conn.close();
%>
<%
    }catch (ClassNotFoundException e) {
        System.out.println("Sorry, can't find the Driver!");
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</table>
<hr>
</center>
</body>
</html>

