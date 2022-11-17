<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="login.jsp" %>


<%
    request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("username");
    String password=request.getParameter("password");
    boolean idFlag = false;
    boolean passwordFlag = false;
    String feedback = "";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase","root","123456");      //连接到数据库
        Statement stmt = null;
        ResultSet resultSet = null;
        String sql = ("SELECT * FROM user");
        stmt = conn.createStatement();
        resultSet = stmt.executeQuery(sql);
        while (resultSet.next()){
            if (resultSet.getString("username").equals(username)){
                idFlag = true;
                if(resultSet.getString("password").equals(password)){
                    passwordFlag = true;
                }
            }
        }
        if (idFlag == true && passwordFlag == true)
            feedback = "登录成功!";
        else if(idFlag == false)
            feedback = "用户不存在，请检查用户名！";
        else if (passwordFlag == false)
            feedback = "密码错误！";
        conn.close();
    }catch (Exception e){
        e.printStackTrace();
    }

    request.setAttribute("feedback", feedback);
    request.getRequestDispatcher("login.jsp").forward(request, response);
%>
