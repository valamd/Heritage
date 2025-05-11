using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace HeritageHub
{
    public partial class Comment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get the HeritageID from the query string
                string heritageID = Request.QueryString["HeritageID"];
                if (!string.IsNullOrEmpty(heritageID))
                {
                    LoadComments(int.Parse(heritageID));
                }
            }
        }

        private void LoadComments(int heritageID)
        {
            string connString = WebConfigurationManager.ConnectionStrings["HeritageHubDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT [CommentID], [UserID], [CommentText], [CommentedOn] FROM [Comments] WHERE [HeritageID] = @HeritageID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@HeritageID", heritageID);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                rptComments.DataSource = reader;
                rptComments.DataBind();
                conn.Close();
            }
        }
    }
}
