using ExemploBD.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExercicioBD.Models.DAO
{
    public class EmpresaDAO
    {
        private ConexaoBD conn;
        public EmpresaDAO()
        {
            conn = new ConexaoBD();
        }

        public Empresa Inserir(Empresa e)
        {
            try
            {
                string sql = "INSERT INTO empresa(razao_social, cnpj, email, senha) VALUES (@razao_social,@cnpj,@email, @senha)";
                conn.Comando.CommandText = sql;
                conn.Comando.Parameters.AddWithValue("@razao_social", e.RazaoSocial);
                conn.Comando.Parameters.AddWithValue("@cnpj", e.RazaoSocial);
                conn.Comando.Parameters.AddWithValue("@email", e.Email);
                conn.Comando.Parameters.AddWithValue("@senha", e.Senha);                

                int retorno = conn.Comando.ExecuteNonQuery();
                if (retorno > 0)
                {
                    return e;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception exp)
            {
                return null;
            }
            finally
            {
                conn.Conexao.Close();
            }
        }
    }
}