using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace EscolaDeMusica
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private void adicionarAlunoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AdicionarAluno addAlu = new AdicionarAluno();
            addAlu.Show(this);
        }

        private void listaDeAlunosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            alunosLista aluList = new alunosLista();
            aluList.Show(this);

        }
    }
}
