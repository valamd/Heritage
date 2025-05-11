<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="HeritageHub.Gallery" %> 
<!DOCTYPE html> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head runat="server"> 
    <title>Heritage Hub Gallery</title> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <style> 
        /* General styling for the body */
        body { 
            font-family: Arial, sans-serif; 
            line-height: 1.6; 
            color: #333; 
            background-color: #f4f4f4; 
            margin: 0; 
            padding: 0; 
        }

        /* Styling for the main container */
        .container { 
            width: 90%; 
            margin: auto; 
            overflow: hidden; 
            padding: 20px; 
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

        /* Styling for the gallery container */
        .gallery { 
            display: flex; 
            flex-direction: column; 
            gap: 20px; 
        }

        /* Individual heritage item container */
        .heritage-item { 
            display: flex; 
            background: #fff; 
            border-radius: 5px; 
            overflow: hidden; 
            box-shadow: 0 0 10px rgba(0,0,0,0.1); 
        }

        /* Image container for each heritage item */
        .heritage-item-image { 
            flex: 1; 
            max-width: 50%; 
        }

        /* Image styling */
        .heritage-item-image img { 
            width: 100%; 
            height: 100%; 
            object-fit: cover; 
        }

        /* Content container for each heritage item */
        .heritage-item-content { 
            flex: 1; 
            padding: 20px; 
            display: flex; 
            flex-direction: column; 
        }

        /* Styling for heritage item title */
        .heritage-item h3 { 
            margin-top: 0; 
        }

        /* Like button section */
        .like-section, .comment-section { 
            margin-top: 15px; 
        }

        /* Button styling */
        .btn { 
            display: inline-block; 
            padding: 10px 15px; 
            background: #3498db; 
            color: #fff; 
            border: none; 
            cursor: pointer; 
            border-radius: 5px; 
        }

        /* Button hover effect */
        .btn:hover { 
            background: #2980b9; 
        }

        /* Comment box styling */
        .comment-box { 
            width: 100%; 
            padding: 10px; 
            margin-bottom: 10px; 
            border-radius: 5px; 
            border: 1px solid #ddd; 
        }

        /* Comments section styling */
        .comments { 
            margin-top: 15px; 
            max-height: 150px; 
            overflow-y: auto; 
        }

        /* Individual comment styling */
        .comment { 
            background: #f9f9f9; 
            padding: 10px; 
            margin-bottom: 10px; 
            border-radius: 5px; 
        }

        /* Responsive design for small screens */
        @media(max-width: 768px) { 
            .heritage-item { 
                flex-direction: column; 
            } 
            .heritage-item-image { 
                max-width: 100%; 
            } 
        } 
    </style> 
</head> 

<body> 
    <form id="form1" runat="server"> 
        <!-- Header section with Home button and title -->
        <header> 
            <div class="container"> 
                <!-- Home button with image and redirection to Home.aspx -->
                <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/photos/home.png" ToolTip="Home" CssClass="home-icon" PostBackUrl="~/Home.aspx" /> 
                <h1>Heritage Hub Gallery</h1> 
            </div> 
        </header> 

        <!-- Main content container -->
        <div class="container"> 
            <!-- Repeater for displaying heritage items dynamically -->
            <div class="gallery"> 
                <asp:Repeater ID="rptHeritage" runat="server"> 
                    <ItemTemplate> 
                        <!-- Heritage item container -->
                        <div class="heritage-item"> 
                            <!-- Display the heritage image -->
                            <div class="heritage-item-image"> 
                                <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("HeritageName") %>' /> 
                            </div> 

                            <!-- Heritage item content -->
                            <div class="heritage-item-content"> 
                                <h3><%# Eval("HeritageName") %></h3> <!-- Heritage Name -->
                                <p><%# Eval("Description") %></p> <!-- Heritage Description -->

                                <!-- Like section -->
                                <div class="like-section"> 
                                    <!-- Like button to trigger 'Like' event -->
                                    <asp:Button ID="btnLike" runat="server" Text="Like" CssClass="btn" CommandArgument='<%# Eval("HeritageID") %>' OnClick="btnLike_Click" /> 
                                    <!-- Label displaying number of likes -->
                                    <asp:Label ID="lblLikes" runat="server" Text='<%# Eval("LikeCount") + " Likes" %>'></asp:Label> 
                                </div>

                                <!-- Comment section -->
                                <div class="comment-section"> 
                                    <!-- Comment text box for user input -->
                                    <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Rows="3" placeholder="Add a comment" CssClass="comment-box"></asp:TextBox> 
                                    <!-- Comment button to trigger 'Comment' event -->
                                    <asp:Button ID="btnComment" runat="server" Text="Comment" CssClass="btn" CommandArgument='<%# Eval("HeritageID") %>' OnClick="btnComment_Click" /> 
                                </div>

                                <!-- Label displaying total number of comments -->
                                <asp:Label ID="lblComments" runat="server" Text='<%# Eval("CommentCount") + " Comments" %>'></asp:Label> 
                                    <asp:Button ID="btnShowComments" runat="server" Text="Show Comments" CssClass="btn" PostBackUrl='<%# "Comment.aspx?HeritageID=" + Eval("HeritageID") %>' />

                                <!-- Display comments in a nested repeater -->
                                <div class="comments"> 
                                    <asp:Repeater ID="rptComments" runat="server"> 
                                        <ItemTemplate> 
                                            <div class="comment"> 
                                                <!-- Display comment text and timestamp -->
                                                <p><%# Eval("CommentText") %></p> 
                                                <small>Posted on <%# Eval("CommentedOn") %></small> 
                                            </div> 
                                        </ItemTemplate> 
                                    </asp:Repeater> 
                                </div>
                            </div> 
                        </div> 
                    </ItemTemplate> 
                </asp:Repeater> 
            </div> 
        </div> 

        <!-- Display total likes for all heritage items -->
        <div style="text-align:center;"> 
            <asp:Label ID="TotalLikes" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label> 
        </div> 
    </form> 
</body> 
</html>
