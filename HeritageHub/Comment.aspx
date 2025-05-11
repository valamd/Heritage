<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comment.aspx.cs" Inherits="HeritageHub.Comment" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Comments</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

                /* Header styling */
        header { 
            background: #3498db; 
            color: white; 
            padding-top: 30px; 
            min-height: 70px; 
            border-bottom: #e8491d 3px solid; 
            text-align: center; 
        }

        /* Title inside header */
        header h1 { 
            margin: 0; 
            padding-bottom: 20px; 
        }

        /* Home button styling inside header */
        .home-icon { 
            position: absolute; 
            top: 20px; 
            left: 20px; /* Adjust this value to control horizontal positioning */ 
            width: 40px; 
            height: 40px; 
            cursor: pointer; 
        }


        .container {
            width: 90%;
            margin: auto;
            padding: 20px;
        }

        .comment-card {
            background-color: #fff;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }

        .comment-card:hover {
            transform: translateY(-5px);
        }

        .comment-header {
            font-weight: bold;
        }

        .comment-date {
            font-size: 0.9em;
            color: gray;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
             <header> 
     <div class="container"> 
         <!-- Home button with image and redirection to Home.aspx -->
         <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/photos/home.png" ToolTip="Home" CssClass="home-icon" PostBackUrl="~/Home.aspx" /> 
         <h1>Comments</h1> 
     </div> 
 </header> 

            <!-- Repeater to display comments -->
            <asp:Repeater ID="rptComments" runat="server">
                <ItemTemplate>
                    <div class="comment-card">
                        <div class="comment-header">
                            Commented by User <%# Eval("UserID") %>:
                        </div>
                        <div class="comment-body">
                            <p><%# Eval("CommentText") %></p>
                        </div>
                        <div class="comment-date">
                            Posted on <%# Eval("CommentedOn", "{0:MMMM dd, yyyy}") %>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
