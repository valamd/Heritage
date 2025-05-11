<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HeritageHub.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register - HeritageHub</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .register-container {
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        h2 {
            color: #1877f2;
            text-align: center;
            margin-bottom: 1.5rem;
        }
        .input-group {
            margin-bottom: 1rem;
        }
        .input-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #606770;
        }
        .input-group input {
            width: 100%;
            padding: 0.5rem;
            border: 1px solid #dddfe2;
            border-radius: 4px;
            font-size: 1rem;
        }
        .btn-register {
            width: 100%;
            padding: 0.5rem;
            background-color: #1877f2;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn-register:hover {
            background-color: #166fe5;
        }
        .error-message {
            color: #ff0000;
            margin-top: 1rem;
            text-align: center;
        }
        .login-link {
            display: block;
            text-align: center;
            margin-top: 1rem;
            color: #1877f2;
            text-decoration: none;
        }
        .login-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-container">
            <h2>Register to HeritageHub</h2>
            <div class="input-group">
                <label for="txtUsername">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" />
            </div>
            <div class="input-group">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" />
            </div>
            <div class="input-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            </div>
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-register" OnClick="btnRegister_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" />
            <a href="Login.aspx" class="login-link">Already have an account? Login here</a>
        </div>
    </form>
</body>
</html>
