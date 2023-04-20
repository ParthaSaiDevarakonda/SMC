<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
  <head>
   <title>Login Status</title>
	<link rel="stylesheet" href="CSS/styles.css">
  </head>
  <body>
	<%
      String id= request.getParameter("uid");
      String pass = request.getParameter("pass");
      String url = "jdbc:mysql://localhost:3306/PBL";
      String un = "root";
      String pw = "root";
      Connection conn = DriverManager.getConnection(url, un, pw);
      String sql = "SELECT * FROM ulogin WHERE userID=? AND password=?;";
      PreparedStatement stmt = conn.prepareStatement(sql);
      stmt.setString(1, id);
      stmt.setString(2, pass);
      ResultSet rs = stmt.executeQuery();
      if (rs.next()) {
        String nm = rs.getString("userID");
        String phone = rs.getString("phoneNo");
      String email = rs.getString("email");
        out.println("<p>Login successful!</p>");
        out.println("<p>Welcome, " + nm + "!<br>");
        out.println("Email: " + email + "<br>");
        out.println("Phone: " + phone + "</p>");
        } else {
        out.println("<p>Invalid username or password.</p>");
      }
      out.println("<a href='index.html' class='a-green'>Return to Homepage</a>");
      rs.close();

      stmt.close();
      conn.close();
    %>
  </body>
</html>