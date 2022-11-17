<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="register.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("username");
    String password=request.getParameter("password");
    String sex = (String) request.getParameter("sex");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase","root","123456");
        PreparedStatement ps= con.prepareStatement("insert into user values(?,?,?)");
        ps.setString(1,username);   //设置插入的username的值
        ps.setString(2,password);   //设置插入的password的值
        ps.setString(3,sex);        //设置插入的sex的值
        ps.execute();               //执行sql
        ps.close();
        con.close();
    }catch (Exception e){
        e.printStackTrace();
    }
%>
