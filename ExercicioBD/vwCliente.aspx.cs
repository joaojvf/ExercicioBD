using ExemploBD.Models;
using ExemploBD.Models.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExemploBD
{
    public partial class vwCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            ClienteDAO clienteDao = new ClienteDAO();

            string nome = TxtNome.Text;
            string cpf = TxtCpf.Text;
            string rg = TxtRg.Text;
            string id = TxtId.Text;
            
            if((nome.Equals("") || nome.Length > 45 || cpf.Equals("") || cpf.Length > 11 || rg.Equals("") || rg.Length > 15)) 
            {
                LblResultado.Text = "Dados estão inseridos de forma incorreta!!";
            }else if(id != "")
            {
                BtnAlterar_Click(sender, e);
            }
            else
            {
                Cliente cliente = new Cliente()
                {
                    Nome = nome,
                    Cpf = cpf,
                    Rg = rg,
                };

                cliente = clienteDao.Inserir(cliente);
                if (cliente != null)
                {
                    Session["cliente"] = cliente;
                    Response.Redirect("~/vwEndereco.aspx");
                }
            }
            
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            ClienteDAO clienteDao = new ClienteDAO();

            int id = 0;
            if (int.TryParse(TxtId.Text, out id) && id > 0)
            {
                Cliente c = clienteDao.BuscarPorId(id);
                LblResultado.Text = "";
                if (c != null)
                {
                    TxtNome.Text = c.Nome;
                    TxtCpf.Text = c.Cpf;
                    TxtRg.Text = c.Rg;
                }
                else
                {
                    TxtNome.Text = "";
                    TxtCpf.Text = "";
                    TxtRg.Text = "";
                }
            }

            
        }

        protected void BtnAlterar_Click(object sender, EventArgs e)
        {
            ClienteDAO clienteDao = new ClienteDAO();

            int id = 0;
            string nome = TxtNome.Text;
            string cpf = TxtCpf.Text;
            string rg = TxtRg.Text;

            if (!int.TryParse(TxtId.Text, out id) || id < 0)
            {
                LblResultado.Text = "Insira o Id";
            }
            else if (nome.Equals("") || nome.Length > 45 || cpf.Equals("") || cpf.Length > 45 || rg.Equals("") || rg.Length > 9 )
                
            {
                LblResultado.Text = "Dados estão inseridos de forma incorreta!!";
            }
            else
            {
                Cliente c = clienteDao.Alterar(new Cliente
                {
                    Id = id,
                    Nome = nome,
                    Cpf = cpf,
                    Rg = rg
                });

                if (c != null)
                {
                    LblResultado.Text = "Cliente Alterado com Sucesso";
                    Session["cliente"] = c;
                    Response.Redirect("~/vwEndereco.aspx");
                }
            }
        }

        protected void BtnDel_Click(object sender, EventArgs e)
        {
            ClienteDAO clienteDao = new ClienteDAO();
            Cliente c = new Cliente
            {
                Id = Convert.ToInt32(TxtId.Text)
            };

            if (clienteDao.validaDeletar(c))
            {
                if (clienteDao.Deletar(c))
                {
                    LblResultado.Text = "Cliente Deletado com Sucesso";
                }
            }
            else
            {   

                LblResultado.Text = "Cliente tem enderecos cadastrados!";
            }
        }

        protected void BtnListar_Click(object sender, EventArgs e)
        {

        }
    }
}