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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            initID();
            initNome();
        }

        private void initID()
        {


            cn = getSGBDConnection();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM projeto.AlunosProfessor", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                comboBox1.Items.Add(dt.Rows[i]["ID"]);
            }

        }


        private void initNome()
        {
            cn = getSGBDConnection();
            SqlDataAdapter da = new SqlDataAdapter("select GRUPO_Tipo as NomeGrupo FROM projeto.Grupo", cn);
            DataTable dtt = new DataTable();
            da.Fill(dtt);

            for (int i = 0; i < dtt.Rows.Count; i++)
            {
                comboBox2.Items.Add(dtt.Rows[i]["NomeGrupo"]);
            }

        }


        public DataTable getGrupo(SqlCommand command)
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



        private void Form1_Load(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
            SqlCommand command = new SqlCommand("SELECT * FROM projeto.gruposVer", cn);
            //command.CommandType = CommandType.StoredProcedure;
            dataGridView1.ReadOnly = true;
            dataGridView1.RowTemplate.Height = 30;
            dataGridView1.DataSource = getGrupo(command);
            dataGridView1.AllowUserToAddRows = false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
            SqlCommand command = new SqlCommand("SELECT * FROM projeto.gruposVer", cn);
            //command.CommandType = CommandType.StoredProcedure;
            dataGridView1.ReadOnly = true;
            dataGridView1.RowTemplate.Height = 30;
            dataGridView1.DataSource = getGrupo(command);
            dataGridView1.AllowUserToAddRows = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            cn = getSGBDConnection();

            SqlDataAdapter adaptar = new SqlDataAdapter();
            DataTable table = new DataTable();


            int codigoP = Convert.ToInt32(comboBox1.SelectedItem.ToString());
            int codigoA = Convert.ToInt32(comboBox1.SelectedItem.ToString());
            string tipo = comboBox2.SelectedItem.ToString();

            SqlCommand command = new SqlCommand("projeto.adicionarCodigoGrupo @codigoP, @codigoA, @tipo", cn);

            command.Parameters.Add("@codigoP", SqlDbType.Int).Value = codigoP;
            command.Parameters.Add("@codigoA", SqlDbType.Int).Value = codigoA;
            command.Parameters.Add("@tipo", SqlDbType.VarChar).Value = tipo;
            


            cn.Open();

            int i = command.ExecuteNonQuery();

            MessageBox.Show("" + i, "fgg", MessageBoxButtons.OK, MessageBoxIcon.Error);




            cn.Close();
        }
    }
}
