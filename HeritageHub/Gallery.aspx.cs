using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace HeritageHub
{
    public partial class Gallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindHeritageData();
            }
        }
      //public static int LikeHeritage(int heritageID)
      //  {
      //      // Simulate a logged-in user ID
      //      int userID = 1;  // Replace with the actual logic for retrieving the logged-in user's ID

      //      string connectionString = ConfigurationManager.ConnectionStrings["HeritageHubDB"].ConnectionString;

      //      using (SqlConnection conn = new SqlConnection(connectionString))
      //      {
      //          conn.Open();

      //          // Insert like record into the Likes table
      //          string query = "INSERT INTO Likes (HeritageID, UserID) VALUES (@HeritageID, @UserID)";
      //          using (SqlCommand cmd = new SqlCommand(query, conn))
      //          {
      //              cmd.Parameters.AddWithValue("@HeritageID", heritageID);
      //              cmd.Parameters.AddWithValue("@UserID", userID);
      //              cmd.ExecuteNonQuery();
      //          }

      //          // Retrieve and return the updated like count for the heritage item
      //          string countQuery = "SELECT COUNT(*) FROM Likes WHERE HeritageID = @HeritageID";
      //          using (SqlCommand cmdCount = new SqlCommand(countQuery, conn))
      //          {
      //              cmdCount.Parameters.AddWithValue("@HeritageID", heritageID);
      //              int likeCount = (int)cmdCount.ExecuteScalar();
      //              return likeCount;  // Return the updated like count
      //          }
      //      }
      //  }


        private void BindHeritageData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["HeritageHubDB"].ConnectionString;
            string query = @"
        SELECT 
            h.HeritageID, 
            h.HeritageName, 
            h.Description, 
            h.ImagePath,
            ISNULL(COUNT(DISTINCT l.LikeID), 0) AS LikeCount,
            ISNULL(COUNT(DISTINCT c.CommentID), 0) AS CommentCount
        FROM 
            Heritage h
        LEFT JOIN 
            Likes l ON h.HeritageID = l.HeritageID
        LEFT JOIN 
            Comments c ON h.HeritageID = c.HeritageID
        GROUP BY 
            h.HeritageID, h.HeritageName, h.Description, h.ImagePath";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptHeritage.DataSource = dt;
                    rptHeritage.DataBind();
                }
            }
        }


        private void UpdateTotalLikes()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["HeritageHubDB"].ConnectionString;
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "SELECT COUNT(*) FROM Likes";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        int totalLikes = Convert.ToInt32(cmd.ExecuteScalar());
                        TotalLikes.Text = totalLikes.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception, e.g., log error
                TotalLikes.Text = "Error calculating total likes";
            }
        }

       
        protected void btnLike_Click(object sender, EventArgs e)
        {
            Button btnLike = (Button)sender;
            int heritageID = Convert.ToInt32(btnLike.CommandArgument);
            int userID = 1; // Assuming you have a logged-in user ID (replace with actual user ID)

            string connectionString = ConfigurationManager.ConnectionStrings["HeritageHubDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "INSERT INTO Likes (HeritageID, UserID) VALUES (@HeritageID, @UserID)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@HeritageID", heritageID);
                    cmd.Parameters.AddWithValue("@UserID", userID);

                    cmd.ExecuteNonQuery();
                }
            }

          
            BindHeritageData();

        }

        // Handle Comment button click
        protected void btnComment_Click(object sender, EventArgs e)
        {
            Button btnComment = (Button)sender;
            int heritageID = Convert.ToInt32(btnComment.CommandArgument);
            RepeaterItem item = (RepeaterItem)btnComment.NamingContainer;
            TextBox txtComment = (TextBox)item.FindControl("txtComment");
            string commentText = txtComment.Text;
            int userID = 1; // Assuming you have a logged-in user ID (replace with actual user ID)

            if (!string.IsNullOrWhiteSpace(commentText))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["HeritageHubDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "INSERT INTO Comments (HeritageID, UserID, CommentText) VALUES (@HeritageID, @UserID, @CommentText)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@HeritageID", heritageID);
                        cmd.Parameters.AddWithValue("@UserID", userID);
                        cmd.Parameters.AddWithValue("@CommentText", commentText);

                        cmd.ExecuteNonQuery();
                    }
                }

                // Optionally, refresh the data to show the new comment
                BindHeritageData();

            }
        }
    }
}



    

