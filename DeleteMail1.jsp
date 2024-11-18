
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head><style>
.myTextBox{
font-size:32px;
}
.myButton{
font-size:32px;
}
</style></head>
<body>
<br><br><br><br><br><br><br><br>
<%
int mid=Integer.parseInt(request.getParameter("mid"));
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "emailsoftware";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql =" update mails set inbox=0 where mid="+mid;
int resultSet = statement.executeUpdate(sql);
connection.close();
while(resultSet>0){
    response.sendRedirect("inbox.jsp");
}
} catch (Exception e) {
out.println(e.getMessage());
}
%>