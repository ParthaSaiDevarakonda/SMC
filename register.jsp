<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
  <head>
   <title>Registration</title>
  </head>
  <body>
<%
  String fn = request.getParameter("fname");
  String ln = request.getParameter("lname");
  String id = request.getParameter("sid");
  String em = request.getParameter("email");
  String phn = request.getParameter("phone");
  String ct = request.getParameter("cont");
  String dp = request.getParameter("dept");
  String pb = request.getParameter("prob");

  String url = "jdbc:mysql://localhost:3306/PBL";
  String un = "root";
  String pw = "root";
  Connection conn = DriverManager.getConnection(url, un, pw);

  String sql = "INSERT INTO helpform (fname, lname, sid, email, phone, contact, dept, prob) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
  PreparedStatement pstmt = conn.prepareStatement(sql);
  pstmt.setString(1, fn);
  pstmt.setString(2, ln);
  pstmt.setString(3, id);
  pstmt.setString(4, em);
  pstmt.setString(5, phn);
  pstmt.setString(6, ct);
  pstmt.setString(7, dp);
  pstmt.setString(8, pb);

  pstmt.executeUpdate();

  pstmt.close();
  conn.close();
%>
	<div style="padding: 30px">
		<h2>Form Submitted Successfully</h2>
		<p>Thank you for Submitting, <%= fn %>! Your issue have been added to our database.</p>
    <p>issue will addressed soon!</p>
		<a href="./index.html" class="a-green">Return to Homepage</a>
	</div>
  </body>
</html>