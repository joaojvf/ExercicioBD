using ExemploBD.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ExercicioBD.Models.DAO
{
    public class OS_ServicoDAO
    {
        private ConexaoBD conn;
        public OS_ServicoDAO()
        {
            conn = new ConexaoBD();
        }

        public DataTable ListarTodos()
        {
            try
            {
                DataTable table = new DataTable();
                MySqlDataAdapter sqlData;
                sqlData = new MySqlDataAdapter("SELECT * FROM os_servico", conn.Conexao);
                sqlData.Fill(table);

                return table;
            }
            catch (Exception e)
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
}