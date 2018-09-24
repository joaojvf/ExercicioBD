using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExercicioBD.Models
{
    public class OS_Servico
    {
        OrdemServico ordemServico = new OrdemServico();
        Servico servico = new Servico();
        public int Quantidade { get; set; }
        public double Valor { get; set; }
        public int Prazo { get; set; }
    }
}