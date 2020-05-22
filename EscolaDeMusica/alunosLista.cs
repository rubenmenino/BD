using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace EscolaDeMusica
{
    public partial class alunosLista : Form
    {
        private SqlConnection cn;
        public alunosLista()
        {
            InitializeComponent();
        }
        private SqlConnection getSGBDConnection()
        {
            return new SqlConnection("Data Source = tcp:mednat.ieeta.pt\\SQLSERVER, 8101; Initial Catalog = p7g2; uid = p7g2;" + "password = BaseDeDados123");

        }

        private bool verifySGBDConnection()
        {
            if (cn == null)
                cn = getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;
        }


        AdicionarAluno x = new AdicionarAluno();
        private void alunosLista_Load(object sender, EventArgs e) 
        {
            cn = getSGBDConnection();
            SqlCommand command = new SqlCommand("SELECT * FROM projeto.Aluno", cn);
            dataGridView1.ReadOnly = true;
            dataGridView1.RowTemplate.Height = 30;
            dataGridView1.DataSource = x.getAlunos(command);
            dataGridView1.AllowUserToAddRows = false;
        }

        private void dataGridView1_DoubleClick(object sender, EventArgs e)
        {

            UpdateDelete updelete = new UpdateDelete();
            updelete.textBoxID.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            updelete.dateTimePicker1.Value = (DateTime)dataGridView1.CurrentRow.Cells[1].Value;
            updelete.textBoxTelemovel.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
            updelete.textBoxName.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            //sexo
            if(dataGridView1.CurrentRow.Cells[4].Value.ToString() == "Feminino")
            {
                updelete.radioButtonFeminino.Checked = true;
            }
            updelete.textBoxNIF.Text = dataGridView1.CurrentRow.Cells[5].Value.ToString();
            updelete.textBoxEmail.Text = dataGridView1.CurrentRow.Cells[6].Value.ToString();
            updelete.textBoxMorada.Text = dataGridView1.CurrentRow.Cells[7].Value.ToString();
            updelete.Show();
        }

        private void Atualizar_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
