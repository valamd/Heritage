<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddHeritage.aspx.cs" Inherits="HeritageHub.AddHeritage" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Heritage - Heritage Hub</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            max-width: 600px;
            margin: 2rem auto;
            background: #fff;
            padding: 2rem;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        header {
            background: #3498db;
            color: white;
            padding: 1rem 0;
            text-align: center;
            margin-bottom: 2rem;
        }
        h1 {
            margin: 0;
        }
        .form-group {
            margin-bottom: 1rem;
        }
                .container {
    position: relative;
    width: 90%;
    margin: auto;
    overflow: hidden;
    padding: 20px;
}

.home-icon {
    position: absolute;
    top: 20px;
    left: 20px; /* Adjust this value to control horizontal positioning */
    width: 40px;
    height: 40px;
    cursor: pointer;
}
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: bold;
        }
        .form-control {
            width: 100%;
            padding: 0.5rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }
        textarea.form-control {
            height: 100px;
        }
        .btn {
            display: inline-block;
            background: #3498db;
            color: #fff;
            padding: 0.7rem 1.5rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            transition: background 0.3s ease;
        }
        .btn:hover {
            background: #2980b9;
        }
        .file-upload {
            margin-top: 0.5rem;
        }
        @media (max-width: 768px) {
            .container {
                width: 95%;
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
      <form id="form1" runat="server">
    <header>
        <h1>Heritage Hub</h1>
        <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/photos/home.png" 
    ToolTip="Home" CssClass="home-icon" PostBackUrl="~/AdminHome.aspx" />
    </header>
    <div class="container">
        <h2>Add New Heritage</h2>
      
            <div class="form-group">
                <label for="txtHeritageName">Heritage Name:</label>
                <asp:TextBox ID="txtHeritageName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtDescription">Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="fileUploadImage">Select Image:</label>
                <asp:FileUpload ID="fileUploadImage" runat="server" CssClass="file-upload" />
            </div>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn" />
        </form>
    </div>
</body>
</html>