using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace HeritageHub
{
    public partial class ManageHeritage : System.Web.UI.Page
    {
        // Bind GridView with heritage data
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        // Method to bind GridView with heritage data
        private void BindGridView()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["HeritageHubDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT HeritageID, HeritageName, Description, ImagePath FROM Heritage";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        GridViewHeritage.DataSource = reader;
                        GridViewHeritage.DataBind();
                    }
                }
            }
        }

        // Event handler for deleting a row
        protected void GridViewHeritage_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int heritageID = Convert.ToInt32(GridViewHeritage.DataKeys[e.RowIndex].Value); // Getting HeritageID
            string connectionString = ConfigurationManager.ConnectionStrings["HeritageHubDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // First, delete related records from the Likes table
                string deleteLikesQuery = "DELETE FROM Likes WHERE HeritageID = @HeritageID";
                using (SqlCommand cmd = new SqlCommand(deleteLikesQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@HeritageID", heritageID);
                    cmd.ExecuteNonQuery();
                }

                // Now, delete the record from the Heritage table
                string deleteHeritageQuery = "DELETE FROM Heritage WHERE HeritageID = @HeritageID";
                using (SqlCommand cmd = new SqlCommand(deleteHeritageQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@HeritageID", heritageID);
                    cmd.ExecuteNonQuery();
                }
            }

            // Refresh the GridView after deletion
            BindGridView();
        }


        // Event handler for editing a row
        protected void GridViewHeritage_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewHeritage.EditIndex = e.NewEditIndex;
            BindGridView(); // Rebind the GridView to allow editing
        }

        protected void GridViewHeritage_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewHeritage.EditIndex = -1;
            BindGridView(); // Rebind the GridView to cancel editing
        }


        // Event handler for updating a row
        protected void GridViewHeritage_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                // Ensure the row index is valid
                if (e.RowIndex >= 0 && e.RowIndex < GridViewHeritage.Rows.Count)
                {
                    // Get the HeritageID from the DataKeys collection
                    int heritageID = Convert.ToInt32(GridViewHeritage.DataKeys[e.RowIndex].Value);

                    // Get the updated values from the TextBoxes
                    TextBox txtHeritageName = (TextBox)GridViewHeritage.Rows[e.RowIndex].FindControl("txtHeritageName");
                    TextBox txtDescription = (TextBox)GridViewHeritage.Rows[e.RowIndex].FindControl("txtDescription");

                    if (txtHeritageName != null && txtDescription != null)
                    {
                        string heritageName = txtHeritageName.Text;
                        string description = txtDescription.Text;

                        string connectionString = ConfigurationManager.ConnectionStrings["HeritageHubDB"].ConnectionString;
                        using (SqlConnection conn = new SqlConnection(connectionString))
                        {
                            conn.Open();
                            string query = "UPDATE Heritage SET HeritageName = @HeritageName, Description = @Description WHERE HeritageID = @HeritageID";
                            using (SqlCommand cmd = new SqlCommand(query, conn))
                            {
                                cmd.Parameters.AddWithValue("@HeritageID", heritageID);
                                cmd.Parameters.AddWithValue("@HeritageName", heritageName);
                                cmd.Parameters.AddWithValue("@Description", description);
                                cmd.ExecuteNonQuery();
                            }
                        }

                        GridViewHeritage.EditIndex = -1; // Exit edit mode
                        BindGridView(); // Rebind the GridView to reflect changes
                    }
                }
            }
            catch (Exception ex)
            {
                // Log or handle the error as needed
                lblMessage.Text = "An error occurred: " + ex.Message;
            }
        } 


    }
}
