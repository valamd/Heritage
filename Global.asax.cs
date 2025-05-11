using System;
using System.Linq;
using System.Web;

namespace HeritageHub
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            // Define the list of pages that don't require authentication
            string[] allowedPages = { "Login.aspx", "Register.aspx", "Logout.aspx" };

            // Get the current page being requested
            string currentPage = HttpContext.Current.Request.Url.AbsolutePath;

            // Check if the current page is in the list of allowed pages
            bool isAllowedPage = allowedPages.Any(page => currentPage.EndsWith(page, StringComparison.OrdinalIgnoreCase));

            // If the session is null and the requested page is not allowed, redirect to login
            if (Session["Username"] == null && !isAllowedPage)
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}
