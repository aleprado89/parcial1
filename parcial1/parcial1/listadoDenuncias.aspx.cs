using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace parcial1
{
    public partial class listadoDenuncias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (todoCB.Checked == true)
            {
                denunciasDG.DataSourceID = SqlDataSourceDenunciasTotal.ID;
                SqlDataSourceDenunciasTotal.Select(DataSourceSelectArguments.Empty);
            }
            else
            {
                denunciasDG.DataSourceID = SqlDataSourceDenuncias.ID;
                SqlDataSourceDenuncias.Select(DataSourceSelectArguments.Empty);
            }
        }

        //Todas las Denuncias
        protected void todoCB_CheckedChanged(object sender, EventArgs e)
        {
            if (todoCB.Checked == true)
            {
                denunciasDG.DataSourceID = SqlDataSourceDenunciasTotal.ID;
                SqlDataSourceDenunciasTotal.Select(DataSourceSelectArguments.Empty);
            }
            else
            {
                denunciasDG.DataSourceID = SqlDataSourceDenuncias.ID;
                SqlDataSourceDenuncias.Select(DataSourceSelectArguments.Empty);
            }
        }
    }
}