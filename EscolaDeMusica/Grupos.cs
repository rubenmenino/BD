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
    public partial class Grupos : Form
    {
        public Grupos()
        {
            InitializeComponent();
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

        public DataTable getGrupo(SqlCommand command)
        {
            cn = getSGBDConnection();
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable table = new DataTable();
            adapter.Fill(table);
            return table;
        }


        private void Grupos_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            {
                cn = getSGBDConnection();

                SqlDataAdapter adaptar = new SqlDataAdapter();
                DataTable table = new DataTable();

                SqlCommand command = new SqlCommand("projeto.criarGrupo @representante, @tipo", cn);
                int representante = Convert.ToInt32(textBox1.Text);
                string tipo = textBox2.Text;


                command.Parameters.Add("@representante", SqlDbType.Int).Value = representante;
                command.Parameters.Add("@tipo", SqlDbType.VarChar).Value = tipo;




                cn.Open();

                int i = command.ExecuteNonQuery();
                //MessageBox.Show(i.ToString, "este", MessageBoxButtons.OK, MessageBoxIcon.Information);
                MessageBox.Show(i.ToString());

               

                if (i == -1)
                {
                    MessageBox.Show("Não foi possivel criar um grupo.", "Grupo Adicionado", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

                else
                {
                    MessageBox.Show("Grupa adicionado!", "Grupo Adicionado", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                cn.Close();

            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
