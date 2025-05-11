using System;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

namespace HeritageHub
{
    public partial class AddHeritage : System.Web.UI.Page
    {
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (fileUploadImage.HasFile)
            {
                try
                {
                    // Save the uploaded image to the server
                    string fileName = Path.GetFileName(fileUploadImage.PostedFile.FileName);
                    string folderPath = Server.MapPath("~/Images/");

                    // Ensure the folder exists
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    string filePath = folderPath + fileName;
                    fileUploadImage.SaveAs(filePath);

                    // Store the heritage info in the database
                    string connectionString = ConfigurationManager.ConnectionStrings["HeritageHubDB"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        string query = "INSERT INTO Heritage (HeritageName, Description, ImagePath) VALUES (@HeritageName, @Description, @ImagePath)";
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@HeritageName", txtHeritageName.Text);
                            cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                            cmd.Parameters.AddWithValue("@ImagePath", "/Images/" + fileName);

                            cmd.ExecuteNonQuery();
                        }
                    }

                    Response.Write("Heritage added successfully!");
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
            else
            {
                Response.Write("Please upload an image.");
            }
        }
    }
}
