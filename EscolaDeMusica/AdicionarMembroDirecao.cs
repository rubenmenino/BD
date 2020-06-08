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
    public partial class AdicionarMembroDirecao : Form
    {

        private SqlConnection cn;

        public AdicionarMembroDirecao()
        {
            InitializeComponent();
            initCargos();
        }

        private void initCargos()
        {
            cn = getSGBDConnection();
            SqlDataAdapter da = new SqlDataAdapter("SELECT Cargo FROM projeto.Direcao", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                comboBox1.Items.Add(dt.Rows[i]["Cargo"]);
            }

        }

        private void AdicionarMembroDirecao_Load(object sender, EventArgs e)
        {

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

        public DataTable getDirecao(SqlCommand command)
        {
            cn = getSGBDConnection();
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable table = new DataTable();
            adapter.Fill(table);
            return table;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            cn = getSGBDConnection();

            SqlDataAdapter adapter = new SqlDataAdapter();
            DataTable table = new DataTable();

            int id = Convert.ToInt32(textBox1.Text);
            string cargo = comboBox1.SelectedItem.ToString();
            int ano = dateTimePicker1.Value.Year;

            SqlCommand command = new SqlCommand("projeto.addProfessorDirecao @id, @cargo, @ano", cn);

            command.Parameters.Add("@id", SqlDbType.Int).Value = id;
            command.Parameters.Add("@cargo", SqlDbType.VarChar).Value = cargo;
            command.Parameters.Add("@ano", SqlDbType.Int).Value = ano;

            cn.Open();

            int i = command.ExecuteNonQuery();
            if (i == -1)
            {
                MessageBox.Show("Não foi possivel adicionar membro à direcao!", "Erro!", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            else
            {
                MessageBox.Show("Membro adicionado à direcao", "Aceite!", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }

            cn.Close();



        }

        private void direcao_lista_load(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
            SqlCommand command = new SqlCommand("SELECT * FROM projeto.PertenceDirecao", cn);
            //command.CommandType = CommandType.StoredProcedure;
            dataGridView1.ReadOnly = true;
            dataGridView1.RowTemplate.Height = 30;
            dataGridView1.DataSource = getDirecao(command);
            dataGridView1.AllowUserToAddRows = false;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            textBox1.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            comboBox1.SelectedItem = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            dateTimePicker1.Value = (DateTime)dataGridView1.CurrentRow.Cells[2].Value;

            Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
