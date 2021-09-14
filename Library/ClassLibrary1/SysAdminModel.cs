using System;
using System.Collections.Generic;
using System.Configuration;
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

        public int pageSize = 10;
        public int _TotalRowCount = 0;
        public string connectionstring = ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ToString();
        public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ToString());

        //Fuzzy Search Classifier
        public DataSet GetFuzzySearchString(string sParam)
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "SELECT DISTINCT top (5) FirstName, MiddleName, LastName, Specialisation, Pricing, ProfilePic, YearsOfExperience, UpdatedDate, UpdatedTime, fms.score, SOUNDEX(Specialisation) AS SoundexCode from qryDoctorSearch CROSS APPLY(select dbo.FuzzyMatchString('" + sParam  + "', Specialisation) AS score) AS fms ORDER by fms.score desc";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }
        public DataSet GetAllFunction()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select * from qryDoctorSearch";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }

    }
}
