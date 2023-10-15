using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace parcial1
{
    public partial class gestionarDenuncias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        //BOTONES

        //Agregar
        protected void agregarBT_Click(object sender, EventArgs e)
        {
            if (textoTB.Text != "" && categoriaDDL.Text != "")
            {                
                SqlDataSourceDenuncias.Insert();
                resultadoLB.Text = "Se agregó la denuncia";

                textoTB.Text = "";
            }
        }
        //Actualizar
        protected void actualizarBT_Click(object sender, EventArgs e)
        {
            try
            {
                int count = 0;
                foreach (ListItem item in this.denunciasLB.Items)
                {
                    if (item.Selected)
                    {
                        count++;
                    }
                }
                if (count > 0)
                {
                    if (textoTB.Text != "" && categoriaDDL.Text != "")
                    {
                        SqlDataSourceDenuncias.Update();
                        resultadoLB.Text = "Se actualizó la denuncia";

                        textoTB.Text = "";
                    }
                    else
                    {
                        resultadoLB.Text = "Faltan cargar datos";
                    }
                }
                else
                {
                    resultadoLB.Text = "Falta seleccionar";
                }
            }
            catch (SqlException)
            {
                resultadoLB.Text = "Error al actualizar datos";
            }
        }
        //Eliminar
        protected void eliminarBT_Click(object sender, EventArgs e)
        {
            try
            {
                int count = 0;
                foreach (ListItem item in this.denunciasLB.Items)
                {
                    if (item.Selected)
                    {
                        count++;
                    }
                }
                if (count > 0)
                {
                    SqlDataSourceDenuncias.Delete();
                    resultadoLB.Text = "Se eliminó la denuncia.";

                    textoTB.Text = "";
                }
                else
                {
                    resultadoLB.Text = "Falta seleccionar";
                }
            }
            catch (SqlException)
            {
                resultadoLB.Text = "Error al eliminar datos";
            }
        }        

        //Seleccion Denuncia
        protected void denunciasLB_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSourceDenunciasModificar.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader reader = (SqlDataReader)SqlDataSourceDenunciasModificar.Select(DataSourceSelectArguments.Empty);
            if (reader.Read())
            {
                textoTB.Text = reader["texto"].ToString();
                categoriaDDL.SelectedValue = reader["idDenunciaCategoria"].ToString();
            }
        }
    }
}