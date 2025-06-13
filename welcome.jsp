<%@ page import="com.portal.utils.LegalAPIService" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - Legal Assistant</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4f46e5;
            --primary-hover: #4338ca;
            --primary-light: #e0e7ff;
            --text-primary: #111827;
            --text-secondary: #4b5563;
            --bg-color: #f3f4f6;
            --white: #ffffff;
            --success: #10b981;
            --warning: #f59e0b;
            --danger: #ef4444;
            --info: #3b82f6;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-primary);
            line-height: 1.5;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        .header {
            background-color: var(--white);
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 10;
        }
        
        .navbar {
            max-width: 1200px;
            margin: 0 auto;
            padding: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 700;
            font-size: 1.25rem;
            color: var(--primary-color);
            text-decoration: none;
        }
        
        .nav-links {
            display: flex;
            align-items: center;
            gap: 1.5rem;
        }
        
        .nav-link {
            color: var(--text-secondary);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s;
        }
        
        .nav-link:hover {
            color: var(--primary-color);
        }
        
        .nav-link.active {
            color: var(--primary-color);
        }
        
        .user-menu {
            position: relative;
        }
        
        .user-button {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem;
            background: none;
            border: none;
            cursor: pointer;
            color: var(--text-secondary);
            font-weight: 500;
            transition: color 0.2s;
        }
        
        .user-button:hover {
            color: var(--primary-color);
        }
        
        .user-dropdown {
            position: absolute;
            top: 100%;
            right: 0;
            width: 200px;
            background-color: var(--white);
            border-radius: 0.5rem;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
            padding: 0.5rem 0;
            z-index: 20;
            opacity: 0;
            visibility: hidden;
            transform: translateY(10px);
            transition: all 0.2s;
        }
        
        .user-dropdown.show {
            opacity: 1;
            visibility: visible;
            transform: translateY(0);
        }
        
        .dropdown-item {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.75rem 1rem;
            color: var(--text-primary);
            text-decoration: none;
            transition: background-color 0.2s;
        }
        
        .dropdown-item:hover {
            background-color: var(--bg-color);
        }
        
        .dropdown-divider {
            height: 1px;
            background-color: var(--bg-color);
            margin: 0.5rem 0;
        }
        
        .main-content {
            flex: 1;
            padding: 2rem 1rem;
            max-width: 1200px;
            margin: 0 auto;
            width: 100%;
        }
        
        .welcome-card {
            background-color: var(--white);
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            margin-bottom: 2rem;
            text-align: center;
        }
        
        .welcome-title {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }
        
        .welcome-subtitle {
            color: var(--text-secondary);
            margin-bottom: 1.5rem;
        }
        
        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .dashboard-card {
            background-color: var(--white);
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
            display: flex;
            flex-direction: column;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }
        
        .card-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1rem;
        }
        
        .card-title {
            font-weight: 600;
            font-size: 1.125rem;
        }
        
        .card-icon {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 0.5rem;
            font-size: 1.25rem;
        }
        
        .icon-primary {
            background-color: var(--primary-light);
            color: var(--primary-color);
        }
        
        .icon-success {
            background-color: rgba(16, 185, 129, 0.1);
            color: var(--success);
        }
        
        .icon-warning {
            background-color: rgba(245, 158, 11, 0.1);
            color: var(--warning);
        }
        
        .icon-info {
            background-color: rgba(59, 130, 246, 0.1);
            color: var(--info);
        }
        
        .card-content {
            flex: 1;
        }
        
        .card-description {
            color: var(--text-secondary);
            margin-bottom: 1rem;
        }
        
        .card-action {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            margin-top: auto;
        }
        
        .card-action:hover {
            text-decoration: underline;
        }
        
        .footer {
            background-color: var(--white);
            padding: 1.5rem 1rem;
            text-align: center;
            color: var(--text-secondary);
            border-top: 1px solid rgba(0, 0, 0, 0.05);
            margin-top: auto;
        }
        
        .user-avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: var(--primary-light);
            color: var(--primary-color);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
        }
        
        .date-display {
            margin-bottom: 1rem;
            color: var(--text-secondary);
            text-align: right;
        }
        
        @media (max-width: 768px) {
            .dashboard {
                grid-template-columns: 1fr;
            }
            
            .nav-links {
                display: none;
            }
            
            .menu-toggle {
                display: block;
            }
        }
    </style>
</head>
<body>
    <%
        // Check if the user is logged in
        HttpSession s3 = request.getSession(false);
        String username = null;
        if (s3 != null) {
            username = (String) s3.getAttribute("username");
        }
        
        // If no session or username, redirect to login
        if (username == null) {
            response.sendRedirect("login.html");
            return;
        }
        
        // Format the current date
        SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, MMMM d, yyyy");
        String currentDate = dateFormat.format(new Date());
        
        // Get first letter for avatar
        String firstLetter = username.substring(0, 1).toUpperCase();
    %>

    <header class="header">
        <nav class="navbar">
            <a href="home.jsp" class="logo">
                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M8 3H6l4 12h2M16 3h2l-4 12h-2"/>
                    <path d="M12 3v18"/>
                    <path d="M3 9v6"/>
                    <path d="M21 9v6"/>
                </svg>
                <span>Legal Assistant</span>
            </a>
            
            <div class="nav-links">
                <a href="home.jsp" class="nav-link">Home</a>
                <a href="index.jsp" class="nav-link active">Dashboard</a>
                <a href="#" class="nav-link">Resources</a>
                <a href="#" class="nav-link">Contact</a>
            </div>
            
            <div class="user-menu">
                <button class="user-button" id="userMenuButton">
                    <div class="user-avatar"><%= firstLetter %></div>
                    <span><%= username %></span>
                    <i class="fas fa-chevron-down"></i>
                </button>
                
                <div class="user-dropdown" id="userDropdown">
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-user"></i>
                        <span>Profile</span>
                    </a>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-cog"></i>
                        <span>Settings</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="home.jsp" class="dropdown-item">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Logout</span>
                    </a>
                </div>
            </div>
        </nav>
    </header>

    <main class="main-content">
        <div class="date-display">
            <i class="far fa-calendar-alt"></i> <%= currentDate %>
        </div>
        
        <div class="welcome-card">
            <h1 class="welcome-title">Welcome back, <%= username %>!</h1>
            <p class="welcome-subtitle">Access your legal assistance dashboard to get the guidance you need.</p>
        </div>
        
        <div class="dashboard">
            <div class="dashboard-card">
                <div class="card-header">
                    <h2 class="card-title">Legal Consultation</h2>
                    <div class="card-icon icon-primary">
                        <i class="fas fa-gavel"></i>
                    </div>
                </div>
                <div class="card-content">
                    <p class="card-description">Describe your legal situation and get customized guidance from our legal assistant.</p>
                    <a href="index.jsp" class="card-action">
                        <span>Get Advice</span>
                        <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>
            
            <div class="dashboard-card">
                <div class="card-header">
                    <h2 class="card-title">Document Templates</h2>
                    <div class="card-icon icon-success">
                        <i class="fas fa-file-alt"></i>
                    </div>
                </div>
                <div class="card-content">
                    <p class="card-description">Access and download legal document templates for various situations.</p>
                    <a href="#" class="card-action">
                        <span>Browse Templates</span>
                        <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>
            
            <div class="dashboard-card">
                <div class="card-header">
                    <h2 class="card-title">Find Attorneys</h2>
                    <div class="card-icon icon-warning">
                        <i class="fas fa-user-tie"></i>
                    </div>
                </div>
                <div class="card-content">
                    <p class="card-description">Search for qualified attorneys in your area specialized in your legal matter.</p>
                    <a href="#" class="card-action">
                        <span>Search Directory</span>
                        <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>
        
        <div class="dashboard">
            <div class="dashboard-card">
                <div class="card-header">
                    <h2 class="card-title">Recent Activity</h2>
                    <div class="card-icon icon-info">
                        <i class="fas fa-history"></i>
                    </div>
                </div>
                <div class="card-content">
                    <p class="card-description">View your recent consultations and document downloads.</p>
                    <a href="#" class="card-action">
                        <span>View History</span>
                        <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>
            
            <div class="dashboard-card">
                <div class="card-header">
                    <h2 class="card-title">Legal Resources</h2>
                    <div class="card-icon icon-primary">
                        <i class="fas fa-book"></i>
                    </div>
                </div>
                <div class="card-content">
                    <p class="card-description">Browse articles, guides, and FAQs about common legal matters.</p>
                    <a href="#" class="card-action">
                        <span>Explore Resources</span>
                        <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>
            
            <div class="dashboard-card">
                <div class="card-header">
                    <h2 class="card-title">Support</h2>
                    <div class="card-icon icon-success">
                        <i class="fas fa-headset"></i>
                    </div>
                </div>
                <div class="card-content">
                    <p class="card-description">Need help with using our platform? Contact our support team.</p>
                    <a href="#" class="card-action">
                        <span>Get Support</span>
                        <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>
    </main>

    <footer class="footer">
        <p>&copy; 2025 Legal Assistant. All rights reserved.</p>
    </footer>

    <script>
        // User dropdown menu toggle
        const userMenuButton = document.getElementById('userMenuButton');
        const userDropdown = document.getElementById('userDropdown');
        
        userMenuButton.addEventListener('click', function() {
            userDropdown.classList.toggle('show');
        });
        
        // Close dropdown when clicking outside
        document.addEventListener('click', function(event) {
            if (!userMenuButton.contains(event.target) && !userDropdown.contains(event.target)) {
                userDropdown.classList.remove('show');
            }
        });
    </script>
</body>
</html>