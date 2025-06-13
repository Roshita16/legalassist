<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Legal Assistant - Your Legal Guidance Partner</title>
    <style>
        :root {
            --primary-color: #4f46e5;
            --primary-hover: #4338ca;
            --text-primary: #111827;
            --text-secondary: #4b5563;
            --bg-gradient-from: #f9fafb;
            --bg-gradient-to: #f3f4f6;
            --white: #ffffff;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            line-height: 1.5;
            color: var(--text-primary);
        }

        /* Navigation */
        nav {
            background: var(--white);
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            position: fixed;
            width: 100%;
            z-index: 1000;
        }

        .nav-content {
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
            color: var(--primary-color);
            font-weight: 700;
            font-size: 1.25rem;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
        }

        .nav-links a {
            color: var(--text-secondary);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s;
        }

        .nav-links a:hover,
        .nav-links a.active {
            color: var(--primary-color);
        }

        /* Hero Section */
        .hero {
            padding: 8rem 1rem 4rem;
            background: linear-gradient(to bottom, var(--bg-gradient-from), var(--bg-gradient-to));
            display: flex;
            align-items: center;
            justify-content: space-between;
            max-width: 1200px;
            margin: 0 auto;
            gap: 4rem;
        }

        .hero-content {
            flex: 1;
        }

        .hero h1 {
            font-size: 3rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
            line-height: 1.2;
        }

        .hero p {
            font-size: 1.25rem;
            color: var(--text-secondary);
            margin-bottom: 2rem;
        }

        .hero-image {
            flex: 1;
        }

        .hero-image img {
            width: 100%;
            border-radius: 1rem;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        .cta-button {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 1rem 2rem;
            background-color: var(--primary-color);
            color: var(--white);
            text-decoration: none;
            border-radius: 0.5rem;
            font-weight: 500;
            transition: background-color 0.2s;
        }

        .cta-button:hover {
            background-color: var(--primary-hover);
        }

        /* Features Section */
        .features {
            padding: 4rem 1rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .features h2 {
            text-align: center;
            font-size: 2.25rem;
            margin-bottom: 3rem;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .feature-card {
            padding: 2rem;
            background: var(--white);
            border-radius: 1rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            text-align: center;
        }

        .feature-card svg {
            color: var(--primary-color);
            margin-bottom: 1rem;
        }

        .feature-card h3 {
            margin-bottom: 1rem;
            font-size: 1.25rem;
        }

        .feature-card p {
            color: var(--text-secondary);
        }

        /* About Section */
        .about {
            padding: 4rem 1rem;
            background: var(--white);
        }

        .about-content {
            max-width: 1200px;
            margin: 0 auto;
            text-align: center;
        }

        .about h2 {
            font-size: 2.25rem;
            margin-bottom: 1.5rem;
        }

        .about p {
            color: var(--text-secondary);
            max-width: 800px;
            margin: 0 auto 3rem;
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
        }

        .stat {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary-color);
        }

        .stat-label {
            color: var(--text-secondary);
            font-weight: 500;
        }

        /* Contact Section */
        .contact {
            padding: 4rem 1rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .contact h2 {
            text-align: center;
            font-size: 2.25rem;
            margin-bottom: 3rem;
        }

        .contact-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 4rem;
        }

        .contact-form {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .form-group label {
            font-weight: 500;
        }

        .form-group input,
        .form-group textarea {
            padding: 0.75rem;
            border: 1px solid #d1d5db;
            border-radius: 0.5rem;
            font-size: 1rem;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
        }

        button {
            padding: 0.75rem 1.5rem;
            background-color: var(--primary-color);
            color: var(--white);
            border: none;
            border-radius: 0.5rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        button:hover {
            background-color: var(--primary-hover);
        }

        .contact-info {
            padding: 2rem;
            background: var(--white);
            border-radius: 1rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }

        .contact-info h3 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        .contact-info p {
            color: var(--text-secondary);
            margin-bottom: 2rem;
        }

        .contact-details p {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }

        /* Footer */
        footer {
            background: var(--text-primary);
            color: var(--white);
            padding: 4rem 1rem 1rem;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 4rem;
            margin-bottom: 3rem;
        }

        .footer-section h4 {
            font-size: 1.25rem;
            margin-bottom: 1.5rem;
        }

        .footer-section p {
            color: #9ca3af;
        }

        .footer-section ul {
            list-style: none;
        }

        .footer-section ul li {
            margin-bottom: 0.75rem;
        }

        .footer-section ul a {
            color: #9ca3af;
            text-decoration: none;
            transition: color 0.2s;
        }

        .footer-section ul a:hover {
            color: var(--white);
        }

        .footer-bottom {
            max-width: 1200px;
            margin: 0 auto;
            padding-top: 2rem;
            border-top: 1px solid #374151;
            text-align: center;
            color: #9ca3af;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero {
                flex-direction: column;
                text-align: center;
                padding-top: 6rem;
            }

            .hero h1 {
                font-size: 2.5rem;
            }

            .contact-container {
                grid-template-columns: 1fr;
            }

            .nav-links {
                display: none;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-bXRv...etc..." crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <header>
        <nav>
            <div class="nav-content">
                <div class="logo">
                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M8 3H6l4 12h2M16 3h2l-4 12h-2"/>
                        <path d="M12 3v18"/>
                        <path d="M3 9v6"/>
                        <path d="M21 9v6"/>
                    </svg>
                    <span>Legal Assistant</span>
                </div>
                <div class="nav-links">
                    <a href="#" class="active">Home</a>
                    <!-- <a href="index.html">Get Help</a> -->
                    <a href="#about">About</a>
                    <a href="#contact">Contact</a>
                </div>
            </div>
        </nav>
    </header>

    <main>
        <section class="hero">
            <div class="hero-content">
                <h1>Get Expert Legal Guidance</h1>
                <p>Understand your legal rights and get step-by-step guidance on how to proceed with your case.</p>
                <a href="login.html" class="cta-button">
                    Get Legal Assistance
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M5 12h14"/>
                        <path d="m12 5 7 7-7 7"/>
                    </svg>
                </a>
            </div>
            <div class="hero-image">
                <img src="https://images.unsplash.com/photo-1589829545856-d10d557cf95f?auto=format&fit=crop&q=80&w=800" alt="Legal consultation">
            </div>
        </section>

        <section class="features">
            <h2>How We Can Help</h2>
            <div class="feature-grid">
                <div class="feature-card">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M14.5 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7.5L14.5 2z"/>
                        <polyline points="14 2 14 8 20 8"/>
                    </svg>
                    <h3>Legal Information</h3>
                    <p>Get detailed information about laws and regulations relevant to your case.</p>
                </div>
                <div class="feature-card">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M4 19.5v-15A2.5 2.5 0 0 1 6.5 2H20v20H6.5a2.5 2.5 0 0 1 0-5H20"/>
                    </svg>
                    <h3>Case Guidance</h3>
                    <p>Receive step-by-step guidance on how to proceed with your legal matter.</p>
                </div>
                <div class="feature-card">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/>
                        <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/>
                    </svg>
                    <h3>Legal Resources</h3>
                    <p>Access a comprehensive database of legal resources and documentation.</p>
                </div>
            </div>
        </section>

        <section id="about" class="about">
            <div class="about-content">
                <h2>About Our Service</h2>
                <p>Legal Assistant is your first step towards understanding your legal rights and obligations. We provide preliminary guidance to help you navigate the legal system effectively.</p>
                <div class="stats">
                    <div class="stat">
                        <span class="stat-number">0</span>
                        <span class="stat-label">Cases Analyzed</span>
                    </div>
                    <div class="stat">
                        <span class="stat-number">24/7</span>
                        <span class="stat-label">Available</span>
                    </div>
                    <div class="stat">
                        <span class="stat-number">0%</span>
                        <span class="stat-label">Satisfaction</span>
                    </div>
                </div>
            </div>
        </section>

        <section id="contact" class="contact">
            <h2>Contact Us</h2>
            <div class="contact-container">
                
                <form id="contactForm" class="contact-form" action="https://api.web3forms.com/submit" method="POST">
                    <input type="hidden" name="access_key" value="d10e042f-0362-4705-bbe5-d14ba7be552c">
                    

                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea id="message" name="message" rows="4" required></textarea>
                    </div>
                    <button type="submit">Send Message</button>
                </form>

                <div class="contact-info">
                    <h3>Get in Touch</h3>
                    <p>We'd love to hear from you! Reach out with questions or feedback.</p>
                    <div class="contact-details">
                        <p><i class="fas fa-phone contact-icon"></i> <a href="tel:+15551234567">+91 74165 88898</a></p>
                        <p><i class="fas fa-envelope contact-icon"></i> <a href="mailto:support@legalassistant.com">22P61A05A4@vbithyd.ac.in</a></p>
                    </div>
                </div>
            </div>
        </section>

    </main>

    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h4>Legal Assistant</h4>
                <p>Your trusted partner for legal guidance and support.</p>
            </div>
            <div class="footer-section">
                <h4>Quick Links</h4>
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <!-- <li><a href="index.html">Get Help</a></li> -->
                    <li><a href="#about">About</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Legal</h4>
                <ul>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms of Service</a></li>
                    <li><a href="#">Disclaimer</a></li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2025 Legal Assistant. All rights reserved.</p>
        </div>
    </footer>

    <script>
        // Smooth scrolling for navigation links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));

                if (target) {
                    // Smooth scroll with fallback
                    target.scrollIntoView({ behavior: 'smooth', block: 'start' });

                    // Fallback for older browsers
                    setTimeout(() => {
                        window.scrollTo({
                            top: target.offsetTop - 50, // Adjust for fixed header if needed
                            behavior: 'smooth'
                        });
                    }, 200);
                }
            });
        });

        // Contact form handling with Web3Forms API
        const contactForm = document.getElementById('contactForm');
        if (contactForm) {
            contactForm.addEventListener('submit', function (e) {
                e.preventDefault();

                // Get form values
                const formData = new FormData(this);

                // Send data to Web3Forms
                fetch("https://api.web3forms.com/submit", {
                    method: "POST",
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert("✅ Your message has been sent successfully!");
                        contactForm.reset();
                    } else {
                        alert("❌ Error: " + data.message);
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert("❌ Submission failed. Please check your internet connection.");
                });
            });
        }

        // Add active class to navigation links based on scroll position
        window.addEventListener('scroll', function () {
            const sections = document.querySelectorAll('section');
            const navLinks = document.querySelectorAll('.nav-links a');

            let currentSection = '';

            sections.forEach(section => {
                const sectionTop = section.offsetTop;
                const sectionHeight = section.clientHeight;
                if (window.scrollY >= sectionTop - 150) {
                    currentSection = section.getAttribute('id');
                }
            });

            navLinks.forEach(link => {
                link.classList.remove('active');
                if (link.getAttribute('href') === `#${currentSection}`) {
                    link.classList.add('active');
                }
            });
        });
    </script>
</body>
</html>
