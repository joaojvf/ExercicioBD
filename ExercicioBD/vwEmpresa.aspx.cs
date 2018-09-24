using ExercicioBD.Models;
using ExercicioBD.Models.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExercicioBD
{
    public partial class vwEmpresa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {

            EmpresaDAO empresaDao = new EmpresaDAO();
            
            string razao_social = TxtRazaoSocial.Text;
            string cnpj = TxtCnpj.Text;
            string senha = TxtSenha.Text;
            string email = TxtEmail.Text;

            if ((razao_social.Equals("") || cnpj.Length > 45 || senha.Equals("") || email.Equals("")))
            {
                LblResultado.Text = "Dados estão inseridos de forma incorreta!!";
            }
            else
            {
                Empresa empresa = new Empresa()
                {
                    RazaoSocial = razao_social,
                    Cnpj = cnpj,
                    Email = email,
                    Senha = senha
                };

                empresa = empresaDao.Inserir(empresa);
                if (empresa != null)
                {
                    Session["empresa"] = empresa;
                    TxtRazaoSocial.Text = "";
                    TxtCnpj.Text = "";
                    TxtEmail.Text = "";
                    TxtSenha.Text = "";
                    LblResultado.Text = "Empresa cadastrada e logada com sucesso!";

                }
            }
        }

        protected void TxtSenha_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TxtEmail_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TxtCnpj_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TxtRazaoSocial_TextChanged(object sender, EventArgs e)
        {

        }
    }
}