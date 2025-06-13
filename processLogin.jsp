<%@ page import="java.sql.*" %>
<%@ page import="com.portal.utils.DataBUtil" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try (Connection conn = DataBUtil.getConnection()) {
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            HttpSession s1 = request.getSession();  // Create or get session
            s1.setAttribute("username", username);  // Store username in session
            response.sendRedirect("welcome.jsp");  // Redirect to welcome page
        } else {
            out.println("<h3>Invalid username or password. Please try again.</h3>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<h3>Error: Unable to process login.</h3>");
    }
%>
