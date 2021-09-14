using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary1;

public partial class _Default : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!this.IsPostBack)
            {
              if (Session["audit_username"] == null)
                {
                    Response.Redirect("Register");
                }
                else
                {
                    GetAllFunction();
                }
            }
        }
        catch(Exception ex)
        {

        }
    }

    protected void Page_UnLoad(object sender, EventArgs e)
    {
        try
        {
            objAdm.CloseConnection();
        }
        catch(Exception ex)
        {

        }
    }
    protected void Page_Init(object sender, EventArgs e)
    {

    }
    private void GetAllFunction()
    {
        try
        {
            DataSet ds = objAdm.GetAllFunction();
            ltDoctor.DataSource = ds;
            ltDoctor.DataBind();
        }
        catch(Exception ex)
        {

        }
    }
    public enum MsgType
    {
        Error = 0,
        Success = 1,
        Warning = 2
    }
   
    public void DisplayMessage(String sMessage, MsgType type)
    {
        try
        {
            if (sMessage.Trim() == "")
            {
                pnlAlert.Visible = false;
            }
            else
            {
                lblMsg.Text = sMessage;
                if (type == MsgType.Success)
                {
                    pnlAlert.CssClass = "alert alert-success";
                    spIcon.InnerHtml = "<i class='fa fa-check-circle-o'></i>";
                }
                else if (type == MsgType.Warning)
                {
                    pnlAlert.CssClass = "alert alert-warning";
                    spIcon.InnerHtml = "<i class='fa fa-exclamation-triangle'></i>";
                }
                else
                {
                    pnlAlert.CssClass = "alert alert-danger";
                    spIcon.InnerHtml = "<i class='fa fa-exclamation-circle'></i>";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "displayMsg", "alert('" + sMessage + "');", true);
                }
                pnlAlert.Visible = true;
                //ClientScript.RegisterStartupScript(this.GetType(), "displayMsg", "alert('" + sMessage + "');", true);
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            pnlAlert.Visible = true;
        }
    }
    protected void SearchForDoctor(object sender, EventArgs e)
    {
        try
        {
            if(string.IsNullOrEmpty (Search.Value))
            {
                DisplayMessage("Please feel free to search for your doctor.", MsgType.Error);
            }
            else
            {
                FuzzyFunctionGetData();
            }
        }
        catch(Exception ex)
        {

        }
    }
    private void FuzzyFunctionGetData()
    {
        try
        {
            DataSet ds = objAdm.GetFuzzySearchString(Search.Value);
            ltDoctor.DataSource = ds;
            ltDoctor.DataBind();
        }
        catch(Exception ex)
        {

        }
    }
}