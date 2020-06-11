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

        private void verTurmasToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void adicionarAlunoATurmaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Turma t = new Turma();
            t.Show(this);
        }

        private void listaDeTurmasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            TurmaLista aaa = new TurmaLista();
            aaa.Show(this);
        }

        private void adicionarAlunoATurmaToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            adicionarAlunoTurma q = new adicionarAlunoTurma();
            q.Show(this);
        }

        private void adicionarMembroToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AdicionarMembroDirecao add = new AdicionarMembroDirecao();
            add.Show(this);
        }

        private void listaDeAlunosDoProfessorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ListadeAlunosProfessor list = new ListadeAlunosProfessor();
            list.Show(this);
        }

        private void criarGrupoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Grupos ggg = new Grupos();
            ggg.Show(this);
        }

        private void adicioanrMembroAGrupoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form1 form = new Form1();
            form.Show(this);
        }
    }
}
