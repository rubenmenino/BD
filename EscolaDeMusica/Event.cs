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
    public partial class Event : Form
    {
        private SqlConnection cn;

        public Event()
        {
            InitializeComponent();
        }


        private SqlConnection getSGBDConnection()
        {
            return new SqlConnection("Data Source = tcp:mednat.ieeta.pt\\SQLSERVER, 8101; Initial Catalog = p7g2; uid = p7g2;" + "password = BaseDeDados123");

        }

        public DataTable getEvent(SqlCommand command)
        {
            cn = getSGBDConnection();
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable table = new DataTable();
            adapter.Fill(table);
            return table;
        }


        private bool verifySGBDConnection()
        {
            if (cn == null)
                cn = getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;
        }
        private void Event_Load(object sender, EventArgs e)
        {

        }


        private void Event_add_Click(object sender, EventArgs e)
        {

            cn = getSGBDConnection();


            string nome = textBox1.Text;
            string local = textBox2.Text;
            DateTime init = dateTimePicker1.Value;
            DateTime end = dateTimePicker2.Value;
            string ctr = textBox3.Text;

            int ano = dateTimePicker2.Value.Year;
            bool accept = false;

            int  id = Convert.ToInt32(textBox4.Text);


            SqlDataAdapter adaptar = new SqlDataAdapter();
            DataTable table = new DataTable();

            SqlCommand command = new SqlCommand("projeto.criarEvento @id, @EVENTO_Nome, @Local, @Data_inicio, @Data_fim, @Caracteristica, @EVENTO_Ano", cn);

            command.Parameters.Add("@id", SqlDbType.Int).Value = id;
            command.Parameters.Add("@EVENTO_Nome", SqlDbType.VarChar).Value = nome;
            command.Parameters.Add("@Local", SqlDbType.VarChar).Value = local;
            command.Parameters.Add("@Data_inicio", SqlDbType.Date).Value = init;
            command.Parameters.Add("@Data_fim", SqlDbType.Date).Value = end;
            command.Parameters.Add("@Caracteristica", SqlDbType.VarChar).Value = ctr;
            command.Parameters.Add("@EVENTO_Ano", SqlDbType.Int).Value = ano;

            cn.Open();

            command.ExecuteNonQuery();
            MessageBox.Show("O evento foi adicionado", "Evento Adicionado", MessageBoxButtons.OK, MessageBoxIcon.Information);

            cn.Close();

        }


        public bool editarEvento(int id, string nome, string local, DateTime inicio, DateTime fim, string caract, bool Aceitar)
        {

            cn = getSGBDConnection();

            SqlDataAdapter adaptar = new SqlDataAdapter();
            DataTable table = new DataTable();

            SqlCommand command = new SqlCommand("projeto.updateEvento @id, @EVENTO_Nome, @Local, @Data_inicio, @Data_fim, @Caracteristica, @EVENTO_Ano, @Aceite", cn);
            command.Parameters.Add("@id", SqlDbType.Int).Value = id;
            command.Parameters.Add("@EVENTO_Nome", SqlDbType.VarChar).Value = nome;
            command.Parameters.Add("@Local", SqlDbType.VarChar).Value = local;
            command.Parameters.Add("@Data_inicio", SqlDbType.Date).Value = inicio;
            command.Parameters.Add("@Data_fim", SqlDbType.Date).Value = fim;
            command.Parameters.Add("@Caracteristica", SqlDbType.VarChar).Value = caract;
            command.Parameters.Add("@EVENTO_Ano", SqlDbType.Int).Value = id;

            command.Parameters.Add("@Aceite", SqlDbType.Bit).Value = Aceitar ? 1: 0;

            cn.Open();

            command.ExecuteNonQuery();


            cn.Close();
            return true;
        }
    }
}
