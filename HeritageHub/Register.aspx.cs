using System;
using System.Configuration;
using System.Data.SqlClient;

namespace HeritageHub
{
    public partial class Register : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "All fields are required!";
                return;
            }

            // Check if user exists
            if (IsUserExists(username))
            {
                lblMessage.Text = "Username already exists!";
                return;
            }

            // Register user
            if (RegisterUser(username, email, password))
            {
                lblMessage.Text = "Registration successful!";
                Response.Redirect("Login.aspx"); // Redirect to login page
            }
            else
            {
                lblMessage.Text = "Registration failed!";
            }
        }

        private bool IsUserExists(string username)
        {
            bool exists = false;
            string connectionString = ConfigurationManager.ConnectionStrings["HeritageHubDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    int count = (int)cmd.ExecuteScalar();
                    exists = count > 0;
                }
            }

            return exists;
        }

        private bool RegisterUser(string username, string email, string password)
        {
            bool isRegistered = false;
            string connectionString = ConfigurationManager.ConnectionStrings["HeritageHubDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "INSERT INTO Users (Username, Email, Password, Role) VALUES (@Username, @Email, @Password, 'User')";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password); // Store hashed password in production

                    int result = cmd.ExecuteNonQuery();
                    isRegistered = result > 0;
                }
            }

            return isRegistered;
        }
    }
}
