using ExercicioBD.Models.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExercicioBD
{
    public partial class vwServicos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {   

            PopularGrid();
        }

        public void PopularGrid()
        {
            ServicoDAO osDao = new ServicoDAO();
            DataTable dTable = osDao.ListarTodos();

            gdvServico.DataSource = dTable;
            gdvServico.DataBind();
        }

                   
        

        protected void gdvServico_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            string strQtde = (gdvServico.Rows[e.RowIndex].FindControl("txtQuantidade") as TextBox).Text;
            double valor = Convert.ToDouble((gdvServico.Rows[e.RowIndex].FindControl("LblValor") as Label).Text);
            int tempo = Convert.ToInt32((gdvServico.Rows[e.RowIndex].FindControl("LblTempo") as Label).Text);
            int qtde;

            if(Int32.TryParse(strQtde, out qtde))
            {
                OS_ServicoDAO osDao = new OS_ServicoDAO();
               // osDao.Inserir()
            }
        


        }
    }
}