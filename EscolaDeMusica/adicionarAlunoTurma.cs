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
    public partial class adicionarAlunoTurma : Form
    {
        public adicionarAlunoTurma()
        {
            InitializeComponent();

            initTurmas();
        }

        private void initTurmas()
        {
            cn = getSGBDConnection();
            SqlDataAdapter da = new SqlDataAdapter("select Numero FROM projeto.Turma", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                comboBox1.Items.Add(dt.Rows[i]["Numero"]);
            }

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


        public DataTable getTurma(SqlCommand command)
        {
            cn = getSGBDConnection();
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable table = new DataTable();
            adapter.Fill(table);
            return table;
        }
        private void adicionarAlunoTurma_Load(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
            SqlCommand command = new SqlCommand("SELECT * FROM listaTurma", cn);
            //command.CommandType = CommandType.StoredProcedure;
            dataGridView1.ReadOnly = true;
            dataGridView1.RowTemplate.Height = 30;
            dataGridView1.DataSource = getTurma(command);
            dataGridView1.AllowUserToAddRows = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlDataAdapter da = new SqlDataAdapter("select Numero FROM projeto.Turma", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                comboBox1.Items.Add(dt.Rows[i]["Numero"]);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            cn = getSGBDConnection();

            SqlDataAdapter adaptar = new SqlDataAdapter();
            DataTable table = new DataTable();

            SqlCommand command = new SqlCommand("projeto.adicionarAlunoTurma @id, @TURMA_Numero, @disciplinaID", cn);
            

            int id = Convert.ToInt32(textBox1.Text);
            int turma = Convert.ToInt32(comboBox1.SelectedItem.ToString());



            command.Parameters.Add("@id", SqlDbType.Int).Value = id;
            command.Parameters.Add("@TURMA_Numero", SqlDbType.Int).Value = turma;
            command.Parameters.Add("@disciplinaID", SqlDbType.VarChar).Value = "x";
            



            cn.Open();

            int i = command.ExecuteNonQuery();
            

            cn.Close();


            if(i == -1)
            {
                MessageBox.Show("Não foi poissivel adicionar o aluno à turma", "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            else
            {
                MessageBox.Show("O aluno foi adicionado à turma", "Aluno Adicionado", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
    }
}
