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
            
        }

        public void PopularGrid()
        {
            ServicoDAO osDao = new ServicoDAO();
            DataTable dTable = osDao.ListarTodos();

            gdvServicos.DataSource = dTable;
            gdvServicos.DataBind();
        }
    }
}