<%@ page import="com.glowfit.dao.DBConnection, java.sql.*" %>
<%
  try {
    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM fashion");
    ResultSet rs = ps.executeQuery();
    if (rs.next()) out.println("Fashion count: " + rs.getInt(1));
    rs.close(); ps.close(); con.close();
  } catch (Exception e) {
    out.println("ERROR: " + e.getMessage());
  }
%>