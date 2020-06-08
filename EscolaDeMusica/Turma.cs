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
    public partial class Turma : Form
    {
        public Turma()
        {
            InitializeComponent();
            initDisciplina();
        }

  

        private void initDisciplina()
        {
            cn = getSGBDConnection();
            SqlDataAdapter da = new SqlDataAdapter("select Nome FROM projeto.Disciplina", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                comboBox4.Items.Add(dt.Rows[i]["Nome"]);
            }

        }

        public DataTable getTurma(SqlCommand command)
        {
            cn = getSGBDConnection();
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable table = new DataTable();
            adapter.Fill(table);
            return table;
        }

        private SqlConnection cn;

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

        private void button2_Click(object sender, EventArgs e)
        {
            cn = getSGBDConnection();

            


            SqlDataAdapter adaptar = new SqlDataAdapter();
            DataTable table = new DataTable();

            SqlCommand command = new SqlCommand("projeto.criarTurma @numero, @capacidade, @disciplina", cn);

            int numero = Convert.ToInt32(textBox2.Text);
            int capacidade = Convert.ToInt32(textBox3.Text);
            string disciplina = comboBox4.SelectedItem.ToString();
            //int capacidade =Convert.ToInt32(textBox3.Text);


            command.Parameters.Add("@numero", SqlDbType.Int).Value = numero;
            command.Parameters.Add("@capacidade", SqlDbType.Int).Value = capacidade;
            command.Parameters.Add("@disciplina", SqlDbType.VarChar).Value = disciplina;

            

            cn.Open();

            int i = command.ExecuteNonQuery();
            

            cn.Close();

            if(i == -1)
            {
                MessageBox.Show("Não foi possivel criar uma turma.", "Aluno Adicionado", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            else
            {
                MessageBox.Show("Turma adicionada!", "Aluno Adicionado", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void Turma_Load(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void comboBox4_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
