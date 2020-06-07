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
    public partial class professoresLista : Form
    {
        private SqlConnection cn;
        public professoresLista()
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
        AdicionarProfessor add = new AdicionarProfessor();

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void professoresLista_Load(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
            SqlCommand command = new SqlCommand("SELECT * FROM listaProfessores", cn);
            //command.CommandType = CommandType.StoredProcedure;
            dataGridView1.ReadOnly = true;
            dataGridView1.RowTemplate.Height = 30;
            dataGridView1.DataSource = add.getProfessores(command);
            dataGridView1.AllowUserToAddRows = false;
        }

        private void dataGridView1_CellMouseDoubleClick(object sender, DataGridViewCellMouseEventArgs e)
        {

        }

        private void dataGridiew1_CellMouseDoubleClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            UpdateDelete updelete = new UpdateDelete();
            updelete.textBoxID.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            updelete.dateTimePicker1.Value = (DateTime)dataGridView1.CurrentRow.Cells[1].Value;
            updelete.textBoxTelemovel.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
            updelete.textBoxName.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            //sexo
            if (dataGridView1.CurrentRow.Cells[4].Value.ToString() == "Feminino")
            {
                updelete.radioButtonFeminino.Checked = true;
            }
            updelete.textBoxNIF.Text = dataGridView1.CurrentRow.Cells[5].Value.ToString();
            updelete.textBoxEmail.Text = dataGridView1.CurrentRow.Cells[6].Value.ToString();
            updelete.textBoxMorada.Text = dataGridView1.CurrentRow.Cells[7].Value.ToString();
            updelete.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
            SqlCommand atualizar = new SqlCommand("projeto.atualizarSalario", cn);            cn.Open();            atualizar.ExecuteNonQuery();            cn.Close();

            SqlCommand command = new SqlCommand("SELECT * FROM listaProfessores", cn);
            //command.CommandType = CommandType.StoredProcedure;
            dataGridView1.ReadOnly = true;
            dataGridView1.RowTemplate.Height = 30;
            dataGridView1.DataSource = add.getProfessores(command);
            dataGridView1.AllowUserToAddRows = false;
        }
    }
}
