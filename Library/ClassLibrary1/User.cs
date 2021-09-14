using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using _Foundation;

namespace ClassLibrary1
{
    public partial class SysAdminModel: _Database
    {
        public string Name = string.Empty;
        public bool getClientProfile(string username, string sPassword)
        {
            try
            {
                string sPasswordDB = string.Empty;
                DataSet ds = new DataSet();
                string sSQL = "select * from tbl_user WHERE [username]=@username ";
                SqlCommand objCmd = new SqlCommand();
                objCmd.Parameters.Clear();
                objCmd.Parameters.AddWithValue("@username", username);
                objCmd.CommandText = sSQL;
                ds = ExecuteDataSet(objCmd);
                if (ds.Tables[0].Rows.Count <= 0)
                {
                    ErrorMessage = "Invalid User. Contact Administrator.";
                    return false;
                }
                sPasswordDB = ds.Tables[0].Rows[0]["userpassword"].ToString();
                if (sPasswordDB.Trim() == string.Empty)
                {
                    ErrorMessage = "Password Not found in the database.";
                }
                else
                {
                  
                    if (sPassword != sPasswordDB)
                    {
                        ErrorMessage = "Invalid password.";
                        return false;
                    }
                }
               
                Name = ds.Tables[0].Rows[0]["name"].ToString();
             
                return true;
            }
            catch (Exception ex)
            {
                ErrorMessage = "No Login Connection.";
                return false;
            }
        }
        public bool CRUDUser(string rec_id, string name,string phone_no,string username,string userpassword,string StatementType)
		{
			con.Open();
			SqlCommand cmd = new SqlCommand("CRUDUser", con);
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.AddWithValue("@rec_id", rec_id);
			cmd.Parameters.AddWithValue("@name", name);
			cmd.Parameters.AddWithValue("@phone_no", phone_no);
			cmd.Parameters.AddWithValue("@username", username);
			cmd.Parameters.AddWithValue("@userpassword", userpassword);
			cmd.Parameters.AddWithValue("@StatementType", StatementType);
			if (ExecuteNonQuery(cmd) <= 0)
			{
				ErrorMessage = "Unable to process transaction";
				return false;
			}
			ErrorMessage = "Record executed successfully .";
			return true;
		}

	}
}
