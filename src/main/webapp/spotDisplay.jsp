<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.dai.database.SpotsDatabase"%>
<!DOCTYPE html>
<html>
  <head>
  <title >List of spots</title>
  <link href="css/index.css" rel="stylesheet">
  </head>
  <input type="button" value="Back to Spotter Main Page" onclick="window.location='spotterPage.jsp'" ><br/><br/>
  <body>
  table {
    table-layout: auto;
    border-collapse: collapse;
    width: 100%;
  }
  <table border="1">
      <tr>
        <td>name</td>
        <td>address</td>
        <td>city</td>
        <td>zipcode</td>
        <td>description</td>   
  </tr>
  <% 

    try {   
       SpotsDatabase spot = new SpotsDatabase();
       Connection con = spot.getCon();
       PreparedStatement pst;
       ResultSet rs;
            
            pst = con.prepareStatement("select name, address, city, zipcode, description from spots");
            rs = pst.executeQuery();
            while (rs.next()) 
            {
                    out.println(rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3) + rs.getInt(4) + rs.getString(5) "<br/><br/>");
            }
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
  %>
    
</body>
</html>