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

        private void professorToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void adicionarProfessorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AdicionarProfessor addProf = new AdicionarProfessor();
            addProf.Show(this);
        }

        private void listaDeProfessoresToolStripMenuItem_Click(object sender, EventArgs e)
        {
           professoresLista profList = new professoresLista();
            profList.Show(this);
        }

        private void MainForm_Load(object sender, EventArgs e)
        {

        }

        private void eventoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            

        }

        private void adicionarEventoToolStripMenuItem_Click(object sender, EventArgs e)
        {

            Event evento = new Event();
            evento.Show(this);
        }

        private void listaDeEventosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ListEvent listaEventos = new ListEvent();
            listaEventos.Show(this);
        }

        private void editarRemoverToolStripMenuItem_Click(object sender, EventArgs e)
        {
            UpdateDelete updel = new UpdateDelete();
            updel.Show(this);
        }
    }
}
