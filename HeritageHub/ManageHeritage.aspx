<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageHeritage.aspx.cs" Inherits="HeritageHub.ManageHeritage" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Heritage - Heritage Hub</title>
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
            width: 90%;
            max-width: 1200px;
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
            position: relative;
        }
        h1 {
            margin: 0;
        }
        .home-icon {
            position: absolute;
            top: 10px;
            left: 10px;
            width: 35px;
            height: 35px;
            cursor: pointer;
        }
        .message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 4px;
            border: 1px solid #f5c6cb;
        }
        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .gridview th {
            background-color: #3498db;
            color: white;
            padding: 12px;
            text-align: left;
        }
        .gridview td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .gridview tr:hover {
            background-color: #e9e9e9;
        }
        .icon-button {
            width: 20px;
            height: 20px;
            margin: 0 5px;
            cursor: pointer;
            vertical-align: middle;
        }
        .gridview-actions {
            text-align: center;
            white-space: nowrap;
        }
        .edit-form {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 5px;
            margin-top: 10px;
            max-width: 500px;
        }
        .edit-form input[type="text"], .edit-form textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .edit-form textarea {
            height: 100px;
            resize: vertical;
            max-width: 100%;
            overflow-y: auto;
        }
        .btn {
            display: inline-block;
            background: #3498db;
            color: #fff;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background 0.3s ease;
        }
        .btn:hover {
            background: #2980b9;
        }
        .btn-danger {
            background: #e74c3c;
        }
        .btn-danger:hover {
            background: #c0392b;
        }
        .edit-actions {
            text-align: right;
            margin-top: 10px;
        }
        .description-cell {
            max-width: 300px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
      
        .edit-form textarea {
        height: auto;
        min-height: 100px;
        resize: vertical;
        max-width: 100%;
        overflow-y: auto;
    }

    @media (max-width: 768px) {
        .container {
            width: 95%;
            padding: 1rem;
        }
        .gridview {
            font-size: 14px;
        }
        .description-cell {
            max-width: 150px;
        }
        .edit-form {
            max-width: 95%;
        }
        
    }

    .icon-button {
    width: 20px;
    height: 20px;
    margin: 0 5px;
    cursor: pointer;
    vertical-align: middle;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.icon-button:hover {
    transform: scale(1.2);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.icon-button:active {
    transform: scale(1.1);
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
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
            <h2>Manage Heritage</h2>
           <!-- Label for displaying messages like success/error -->
            <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>
           <!-- GridView to display heritage items --> 
            <asp:GridView ID="GridViewHeritage" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="HeritageID" 
                OnRowEditing="GridViewHeritage_RowEditing" 
                OnRowUpdating="GridViewHeritage_RowUpdating" 
                OnRowCancelingEdit="GridViewHeritage_RowCancelingEdit" 
                OnRowDeleting="GridViewHeritage_RowDeleting"
                CssClass="gridview">
                <Columns>
                    <asp:BoundField DataField="HeritageID" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="HeritageName" HeaderText="Heritage Name" />
                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <div class="description-cell" title='<%# Eval("Description") %>'>
                                <%# Eval("Description") %>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                     
                    <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="gridview-actions">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnEdit" runat="server" CommandName="Edit" 
                                ImageUrl="~/photos/pen.png" CssClass="icon-button" ToolTip="Edit" />
                            <asp:ImageButton ID="btnDelete" runat="server" CommandName="Delete" 
                                ImageUrl="~/photos/delete.png" CssClass="icon-button" ToolTip="Delete" 
                                OnClientClick="return confirm('Are you sure you want to delete this item?');" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <div class="edit-form">
                               <h2> <asp:Label runat="server" AssociatedControlID="txtHeritageName">Heritage Name:</asp:Label></h2>
                                <asp:TextBox ID="txtHeritageName" runat="server" Text='<%# Bind("HeritageName") %>' />
                                
                                <h2><asp:Label runat="server" AssociatedControlID="txtDescription">Description:</asp:Label></h2>
                                <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine" />
                               <!-- Update and Cancel buttons for edit form -->
                                <div class="edit-actions">
                                    <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" CssClass="btn" />
                                    <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
                                </div>
                            </div>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
