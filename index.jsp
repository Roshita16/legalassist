<%@ page import="com.portal.utils.LegalAPIService" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.portal.utils.LegalAPIService.LogEntry" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Legal Assistant - Get Advice</title>
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
        
        .page-header {
            margin-bottom: 2rem;
        }
        
        .page-title {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .page-description {
            color: var(--text-secondary);
        }
        
        .legal-form {
            background-color: var(--white);
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            margin-bottom: 2rem;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-label {
            display: block;
            font-weight: 500;
            margin-bottom: 0.5rem;
        }
        
        .form-hint {
            display: block;
            font-size: 0.875rem;
            color: var(--text-secondary);
            margin-bottom: 0.5rem;
        }
        
        .form-control {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #d1d5db;
            border-radius: 0.5rem;
            background-color: var(--white);
            transition: border-color 0.2s, box-shadow 0.2s;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.2);
        }
        
        textarea.form-control {
            min-height: 200px;
            resize: vertical;
        }
        
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            padding: 0.75rem 1.5rem;
            background-color: var(--primary-color);
            color: var(--white);
            border: none;
            border-radius: 0.5rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.2s, transform 0.2s;
        }
        
        .btn:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
        }
        
        .btn:active {
            transform: translateY(0);
        }
        
        .btn-lg {
            padding: 1rem 2rem;
            font-size: 1.125rem;
        }
        
        .result-container {
            background-color: var(--white);
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            margin-top: 2rem;
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.3s, transform 0.3s;
        }
        
        .result-container.show {
            opacity: 1;
            transform: translateY(0);
        }
        
        .result-section {
            margin-bottom: 2rem;
        }
        
        .result-section:last-child {
            margin-bottom: 0;
        }
        
        .section-header {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1rem;
        }
        
        .section-icon {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 0.5rem;
            font-size: 1.25rem;
        }
        
        .section-title {
            font-size: 1.25rem;
            font-weight: 600;
        }
        
        .law-section {
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .law-description {
            margin-bottom: 1.5rem;
            color: var(--text-secondary);
        }
        
        .steps-list {
            list-style: none;
        }
        
        .step-item {
            display: flex;
            gap: 1rem;
            padding: 1rem;
            border-radius: 0.5rem;
            background-color: var(--bg-color);
            margin-bottom: 0.75rem;
            transition: transform 0.2s;
        }
        
        .step-item:hover {
            transform: translateX(5px);
        }
        
        .step-number {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: var(--primary-color);
            color: var(--white);
            font-weight: 600;
            flex-shrink: 0;
        }
        
        .alert {
            padding: 1rem;
            border-radius: 0.5rem;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .alert-info {
            background-color: rgba(59, 130, 246, 0.1);
            color: var(--info);
            border-left: 4px solid var(--info);
        }
        
        .alert-warning {
            background-color: rgba(245, 158, 11, 0.1);
            color: var (--warning);
            border-left: 4px solid var(--warning);
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
        
        .loading {
            display: none;
            text-align: center;
            padding: 2rem;
        }
        
        .spinner {
            border: 4px solid rgba(0, 0, 0, 0.1);
            border-radius: 50%;
            border-top: 4px solid var(--primary-color);
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
            margin: 0 auto 1rem;
        }
        
        .loading-text {
            color: var(--text-secondary);
        }
        
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        .footer {
            background-color: var(--white);
            padding: 1.5rem 1rem;
            text-align: center;
            color: var(--text-secondary);
            border-top: 1px solid rgba(0, 0, 0, 0.05);
            margin-top: auto;
        }
        
        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }
            
            .main-content {
                padding: 1.5rem 1rem;
            }
            
            .legal-form, .result-container {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <%
        // Check if user is logged in
        HttpSession s3 = request.getSession(false);
        String username = null;
        if (s3 != null) {
            username = (String) s3.getAttribute("username");
        }
        
        // Get first letter for avatar if logged in
        String firstLetter = username != null ? username.substring(0, 1).toUpperCase() : "G";
        
        // Clear previous logs when loading the page
        LegalAPIService.clearConsoleLogs();
        
        // Process form submission
        String query = request.getParameter("problem");
        Map<String, Object> legalAdvice = null;
        if (query != null && !query.trim().isEmpty()) {
            legalAdvice = LegalAPIService.getLegalAdvice(query);
        }
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
                <a href="index.jsp" class="nav-link active">Get Advice</a>
                <a href="#" class="nav-link">Resources</a>
                <a href="#" class="nav-link">Contact</a>
            </div>
            
            <% if (username != null) { %>
                <div class="user-menu">
                    <button class="user-button" id="userMenuButton">
                        <div class="user-avatar"><%= firstLetter %></div>
                        <span><%= username %></span>
                        <i class="fas fa-chevron-down"></i>
                    </button>
                    
                    <div class="user-dropdown" id="userDropdown">
                        <a href="welcome.jsp" class="dropdown-item">
                            <i class="fas fa-tachometer-alt"></i>
                            <span>Dashboard</span>
                        </a>
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
            <% } else { %>
                <div class="nav-links">
                    <a href="login.html" class="nav-link">Login</a>
                    <a href="signup.html" class="nav-link">Sign Up</a>
                </div>
            <% } %>
        </nav>
    </header>

    <main class="main-content">
        <div class="page-header">
            <h1 class="page-title">Legal Consultation</h1>
            <p class="page-description">Describe your legal situation and get immediate guidance tailored to your needs.</p>
        </div>
        
        <div class="alert alert-info">
            <i class="fas fa-info-circle fa-lg"></i>
            <div>
                <strong>Note:</strong> This is a preliminary guidance only. For complex legal matters, please consult with a qualified legal professional.
            </div>
        </div>
        
        <div class="legal-form">
            <form id="legalForm" method="post" action="index.jsp">
                <div class="form-group">
                    <label for="problem" class="form-label">Describe Your Legal Situation</label>
                    <span class="form-hint">Try mentioning keywords like "theft", "car accident", "divorce", "landlord", or "injury" for demo purposes.</span>
                    <textarea id="problem" name="problem" class="form-control" placeholder="Please describe your situation in detail..." required><%= query != null ? query : "" %></textarea>
                </div>
                
                <button type="submit" class="btn btn-lg" id="submitBtn">
                    <span>Get Legal Guidance</span>
                    <i class="fas fa-gavel"></i>
                </button>
            </form>
        </div>
        
        <div class="loading" id="loadingIndicator">
            <div class="spinner"></div>
            <p class="loading-text">Analyzing your situation...</p>
        </div>
        
        <% if (legalAdvice != null) { %>
            <div class="result-container show" id="resultContainer">
                <div class="result-section">
                    <div class="section-header">
                        <div class="section-icon icon-primary">
                            <i class="fas fa-gavel"></i>
                        </div>
                        <h2 class="section-title">Applicable Law</h2>
                    </div>
                    
                    <h3 class="law-section"><%= legalAdvice.get("section") %></h3>
                    <p class="law-description"><%= legalAdvice.get("description") %></p>
                </div>
                
                <div class="result-section">
                    <div class="section-header">
                        <div class="section-icon icon-success">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <h2 class="section-title">Recommended Steps</h2>
                    </div>
                    
                    <ul class="steps-list">
                        <% 
                            String[] steps = (String[]) legalAdvice.get("steps");
                            for (int i = 0; i < steps.length; i++) {
                        %>
                            <li class="step-item">
                                <div class="step-number"><%= i + 1 %></div>
                                <div class="step-text"><%= steps[i] %></div>
                            </li>
                        <% } %>
                    </ul>
                </div>
                
                <div class="alert alert-warning">
                    <i class="fas fa-exclamation-triangle fa-lg"></i>
                    <div>
                        <strong>Disclaimer:</strong> This guidance is not a substitute for professional legal advice. Laws vary by jurisdiction and specific circumstances.
                    </div>
                </div>
            </div>
        <% } %>
    </main>

    <footer class="footer">
        <p>&copy; 2025 Legal Assistant. All rights reserved.</p>
    </footer>

    <script>
        // User dropdown menu toggle
        const userMenuButton = document.getElementById('userMenuButton');
        if (userMenuButton) {
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
        }
        
        // Form submission with loading indicator
        const legalForm = document.getElementById('legalForm');
        const loadingIndicator = document.getElementById('loadingIndicator');
        const resultContainer = document.getElementById('resultContainer');
        
        legalForm.addEventListener('submit', function() {
            // Only show loading if we're not already displaying results (in case of refresh)
            if (resultContainer === null || !resultContainer.classList.contains('show')) {
                loadingIndicator.style.display = 'block';
                
                // Simulate loading delay (remove in production)
                setTimeout(function() {
                    loadingIndicator.style.display = 'none';
                }, 1500);
            }
        });
        
        // Example situations for demo (optional feature)
        const exampleSituations = [
            "My landlord hasn't fixed a leak in my apartment for two months despite multiple requests.",
            "I was in a car accident yesterday. The other driver ran a red light and hit my car.",
            "Someone stole my laptop from my car last night. I have the serial number.",
            "My spouse and I are considering divorce. We have two children and jointly own our home."
        ];
        
        // Function to populate example (can be triggered by a button or other UI element)
        function populateExample() {
            const randomIndex = Math.floor(Math.random() * exampleSituations.length);
            document.getElementById('problem').value = exampleSituations[randomIndex];
        }
    </script>
    
    <!-- Display API logs in browser console -->
    <%= LegalAPIService.getConsoleLogsAsJavaScript() %>
</body>
</html>
