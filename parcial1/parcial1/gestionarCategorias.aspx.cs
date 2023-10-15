using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace parcial1
{
    public partial class gestionarCategorias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //BOTONES

        //Agregar
        protected void agregarBT_Click(object sender, EventArgs e)
        {
            if (categoriaTB.Text != "")
            {
                bool existe = false;
                foreach (ListItem item in this.categoriasLB.Items)
                {                   
                    if (item.Text == categoriaTB.Text)
                    {
                        existe = true;
                    }
                }
                if (existe == false)
                {
                    SqlDataSourceCategorias.Insert();
                    resultadoLB.Text = "Se agregó la categoria " + categoriaTB.Text;

                    categoriaTB.Text = "";
                }
                else
                {
                    resultadoLB.Text = "La categoria ya existe";
                }
            }
        }
        //Actualizar
        protected void actualizarBT_Click(object sender, EventArgs e)
        {
            try
            {
                int count = 0;
                foreach (ListItem item in this.categoriasLB.Items)
                {
                    if (item.Selected)
                    {
                        count++;
                    }
                }
                if (count > 0)
                {
                    if (categoriaTB.Text != "")
                    {
                        SqlDataSourceCategorias.Update();
                        resultadoLB.Text = "Se actualizó la categoria " + categoriaTB.Text;

                        categoriaTB.Text = "";
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
                foreach (ListItem item in this.categoriasLB.Items)
                {
                    if (item.Selected)
                    {
                        count++;
                    }
                }
                if (count > 0)
                {
                    SqlDataSourceCategorias.Delete();
                    resultadoLB.Text = "Se eliminó la categoria.";

                    categoriaTB.Text = "";
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

        //Seleccionar Categoria
        protected void categoriasLB_SelectedIndexChanged(object sender, EventArgs e)
        {
            categoriaTB.Text = categoriasLB.SelectedItem.Text;
        }
    }
}