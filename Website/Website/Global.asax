<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>

<script RunAt="server">

    static void RegisterRoutes(RouteCollection routes)
    {
        //first param is unique, second param is the expected url, thrid param is the actual file/page
        //general root menu
        routes.MapPageRoute("rtencf", "en", "~/Error.aspx");
        routes.MapPageRoute("rten", "error", "~/Default.aspx");
        routes.MapPageRoute("rtIndex", "Index", "~/Default.aspx");
        routes.MapPageRoute("rtRegister", "Register", "~/Register.aspx");


    }
    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        RegisterRoutes(RouteTable.Routes);
        //SqlServerTypes.Utilities.LoadNativeAssemblies(Server.MapPath("~/bin"));
    }
</script>
