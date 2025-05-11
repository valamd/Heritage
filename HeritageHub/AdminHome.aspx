<%@ Page Language="C#" AutoEventWireup="true" Inherits="HeritageHub.AdminHome" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Home - HeritageHub</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: lightgrey;
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
        .content {
            margin-top: 80px;
            text-align: center;
        }
        .manage-heritage {
            margin-top: 40px;
        }
        .manage-heritage a {
            display: inline-block;
            padding: 12px 24px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .manage-heritage a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="container header-content">
                <div class="logo">HeritageHub - Admin</div>
                <nav>
                    <ul>
                        <li><a href="AdminHome.aspx">Admin Home</a></li>
                        <li><a href="AddHeritage.aspx">Add Heritage</a></li>
                        <li><a href="ManageHeritage.aspx">Manage Heritage</a></li>
                        <li><a href="Logout.aspx">Logout</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <div class="content">
            <h1>Welcome Admin!</h1>
            <p>You can manage heritage sites from here.</p>

            <div class="manage-heritage">
                <a href="AddHeritage.aspx">Add New Heritage</a>
                <a href="ManageHeritage.aspx">Manage Existing Heritage</a>
            </div>
        </div>
    </form>
</body>
</html>
