<%@ page import="java.sql.*" %>
<%@ page import="com.portal.utils.DataBUtil" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");

    try (Connection conn = DataBUtil.getConnection()) {
        String sql = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, password);
        stmt.setString(3, email);
        stmt.executeUpdate();
        out.println("<h3>Registration successful!</h3>");
        Thread.sleep(2000); // Simulate a delay for user experience
        response.sendRedirect("login.html"); // Redirect to login page after registration
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<h3>Error: Unable to register user.</h3>");
        out.println("<p>" + e.getMessage() + "</p>"); // Print actual SQL error message for debugging
    }
%>
