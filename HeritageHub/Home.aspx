<%@ Page Language="c#" AutoEventWireup="true" Inherits="HeritageHub.Home" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HeritageHub - Explore Architectural Wonders</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: lightblue;
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        header {
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #4a4a4a;
        }
        nav ul {
            list-style-type: none;
            display: flex;
            gap: 20px;
        }
        nav ul li a {
            text-decoration: none;
            color: #4a4a4a;
            font-size: 16px;
            transition: color 0.3s ease;
        }
        nav ul li a:hover {
            color: #007bff;
        }
        .hero {
            height: 100vh;
            background-image: url('/Images/heritage-hero.jpg');
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding-top: 60px;
        }
        .hero-content {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 40px;
            border-radius: 10px;
            max-width: 600px;
        }
        .hero-content h1 {
            font-size: 48px;
            margin-bottom: 20px;
            color: #333;
        }
        .hero-content p {
            font-size: 18px;
            margin-bottom: 30px;
            color: #4a4a4a;
        }
        .cta-button {
            display: inline-block;
            padding: 12px 24px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .cta-button:hover {
            background-color: #0056b3;
        }
        .features {
            display: flex;
            justify-content: space-around;
            padding: 60px 0;
        }
        .feature {
            text-align: center;
            max-width: 300px;
        }
        .feature h3 {
            margin-top: 20px;
            color: #333;
        }
        .feature p {
            color: #666;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="container header-content">
                <div class="logo">HeritageHub</div>
                <nav>
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="Gallery.aspx">Gallery</a></li>
                        <li><a href="Logout.aspx">Logout </a></li>

         
                    </ul>
                </nav>
            </div>
        </header>
        
        <div class="hero">
            <div class="hero-content">
                <h1>Discover Architectural Wonders</h1>
                <p>Explore, appreciate, and engage with heritage architecture from around the world.</p>
                <a href="Gallery.aspx" class="cta-button">Start Exploring</a>
            </div>
        </div>

        <div class="container">
            <div class="features">
                <div class="feature">
                    <img src="/Images/placeholder-icon.png" alt="Browse Icon" style="width: 64px; height: 64px;" />
                    <h3>Browse Heritage</h3>
                    <p>Discover a vast collection of architectural marvels from different eras and cultures.</p>
                </div>
                <div class="feature">
                    <img src="/Images/placeholder-icon.png" alt="Interact Icon" style="width: 64px; height: 64px;" />
                    <h3>Interact & Engage</h3>
                    <p>Like and comment on your favorite heritage sites. Share your thoughts with the community.</p>
                </div>
                <div class="feature">
                    <img src="/Images/placeholder-icon.png" alt="Contribute Icon" style="width: 64px; height: 64px;" />
                    <h3>Contribute</h3>
                    <p>Are you an admin? Add, update, and manage heritage listings to enrich our collection.</p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>