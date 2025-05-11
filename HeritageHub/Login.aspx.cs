using System;
using System.Configuration;
using System.Data.SqlClient;

namespace HeritageHub
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Validate the user credentials
            var userInfo = ValidateUser(username, password);

            if (userInfo.Item1)
            {
                // Store user info in session
                Session["Username"] = username;
                Session["IsAdmin"] = userInfo.Item2;

                // Redirect based on role
                if (userInfo.Item2) // Admin user
                {
                    Response.Redirect("AdminHome.aspx");
                }
                else // Regular user
                {
                    Response.Redirect("Home.aspx");
                }
            }
            else
            {
                lblMessage.Text = "Invalid username or password!";
            }
        }

        // Method to validate user from database
        private Tuple<bool, bool> ValidateUser(string username, string password)
        {
            bool isValid = false;
            bool isAdmin = false;
            string connectionString = ConfigurationManager.ConnectionStrings["HeritageHubDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT IsAdmin FROM Users WHERE Username = @Username AND Password = @Password";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        isValid = true;
                        isAdmin = reader.GetBoolean(0); // Check if the user is an admin
                    }
                }
            }

            return Tuple.Create(isValid, isAdmin);
        }
    }
}
