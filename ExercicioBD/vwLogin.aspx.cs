﻿using ExemploBD.Models;
using ExemploBD.Models.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExercicioBD
{
    public partial class vwLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TxtEmail_TextChanged(object sender, EventArgs e)
        {

        }

        protected void BtnLogar_Click(object sender, EventArgs e)
        {
            ClienteDAO clienteDao = new ClienteDAO();
            Cliente c = clienteDao.ValidarLogin(TxtEmail.Text,TxtSenha.Text);

            if (c != null)
            {
                Session["cliente"] = c;
                Response.Redirect("~/vwCliente.aspx");
            }
            else
            {
                LblResultado.Text = "Acesso invalido";
            }
        }

        protected void TxtSenha_TextChanged(object sender, EventArgs e)
        {

        }
    }
}