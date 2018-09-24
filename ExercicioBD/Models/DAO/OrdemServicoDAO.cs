﻿using ExemploBD.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ExercicioBD.Models.DAO
{
    public class OrdemServicoDAO
    {
        private ConexaoBD conn;
        public OrdemServicoDAO()
        {
            conn = new ConexaoBD();
        }

        public DataTable ListarTodos(string nome)
        {
            try
            {
                DataTable table = new DataTable();
                MySqlDataAdapter sqlData;
                if (string.IsNullOrEmpty(nome))
                {
                    sqlData = new MySqlDataAdapter("SELECT * FROM cliente", conn.Conexao);
                }
                else
                {
                    sqlData = new MySqlDataAdapter("SELECT * FROM cliente WHERE nome like %" + nome + "%", conn.Conexao);
                }
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

        public Cliente BuscarPorId(int id)
        {
            try
            {
                string comando = "SELECT * from cliente WHERE id= @id";
                conn.Comando.CommandText = comando;
                conn.Comando.Parameters.AddWithValue("@id", id);

                MySqlDataReader reader = conn.Comando.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    Cliente c = new Cliente()
                    {
                        Nome = reader["nome"].ToString(),
                        Id = Convert.ToInt32(reader["id"]),
                        Cpf = reader["cpf"].ToString(),
                        Rg = reader["rg"].ToString()
                    };
                    return c;
                }
                else
                    return null;
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


        public OrdemServico Inserir(OrdemServico c)
        {
            try
            {
                //string sql = "INSERT INTO cliente(nome,cpf,rg) VALUES (@nome,@cpf,@rg)";
                //conn.Comando.CommandText = sql;
                //conn.Comando.Parameters.AddWithValue("@nome", c.Nome);
                //conn.Comando.Parameters.AddWithValue("@cpf", c.Cpf);
                //conn.Comando.Parameters.AddWithValue("@rg", c.Rg);

                //int retorno = conn.Comando.ExecuteNonQuery();
                //if (retorno > 0)
                //{
                //    c.Id = Convert.ToInt32(conn.Comando.LastInsertedId.ToString());
                //    return c;
                //}
                //else
                //{
                //    return null;
                //}
            }
            catch (Exception e)
            {
                return null;
            }
            finally
            {
                conn.Conexao.Close();
            }
            return null;
        }
        public Cliente Alterar(Cliente c)
        {
            try
            {
                string sql = "UPDATE cliente SET nome = @nome, cpf=@cpf, rg=@rg WHERE id = @id";
                conn.Comando.CommandText = sql;
                conn.Comando.Parameters.AddWithValue("@nome", c.Nome);
                conn.Comando.Parameters.AddWithValue("@cpf", c.Cpf);
                conn.Comando.Parameters.AddWithValue("@rg", c.Rg);
                conn.Comando.Parameters.AddWithValue("@id", c.Id);
                int retorno = conn.Comando.ExecuteNonQuery();
                return retorno > 0 ? c : null;
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

        public bool Deletar(Cliente c)
        {
            try
            {
                conn = new ConexaoBD();
                conn.Comando.CommandText = "DELETE FROM cliente WHERE id = @id;";
                conn.Comando.Parameters.AddWithValue("@id", c.Id);
                int retorno = conn.Comando.ExecuteNonQuery();
                return retorno > 0 ? true : false;
            }
            catch (Exception e)
            {
                return false;
            }
            finally
            {
                conn.Conexao.Close();
            }
        }
    }
}