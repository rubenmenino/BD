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
            SqlCommand command = new SqlCommand("projeto.MostrarProfessores", cn);
            command.CommandType = CommandType.StoredProcedure;
            dataGridView1.ReadOnly = true;
            dataGridView1.RowTemplate.Height = 30;
            dataGridView1.DataSource = add.getProfessores(command);
            dataGridView1.AllowUserToAddRows = false;
        }
    }
}
