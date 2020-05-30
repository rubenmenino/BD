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
    public partial class Register_Form : Form
    {
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

        public Register_Form()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Register_Form_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            MessageBoxButtons btn = MessageBoxButtons.OK;
            MessageBoxIcon ico = MessageBoxIcon.Information;
            string caption = "Save Data : fdfdf tutorial";

            if (string.IsNullOrEmpty(textBox1.Text))
            {
                MessageBox.Show("Adiciona o primeiro nome.", caption, btn, ico);
                textBox1.Select();
                return;
            }

            if (string.IsNullOrEmpty(textBox2.Text))
            {
                MessageBox.Show("Adiciona o ultimo nome.", caption, btn, ico);
                textBox2.Select();
                return;
            }

            if (string.IsNullOrEmpty(textBox5.Text))
            {
                MessageBox.Show("Adiciona o nome de utilizador:", caption, btn, ico);
                textBox5.Select();
                return;
            }

            if (string.IsNullOrEmpty(textBox4.Text))
            {
                MessageBox.Show("Adiciona a password.", caption, btn, ico);
                textBox4.Select();
                return;
            }

            if (string.IsNullOrEmpty(textBox3.Text))
            {
                MessageBox.Show("Adiciona novamente a password.", caption, btn, ico);
                textBox3.Select();
                return;
            }

            if (textBox4.Text != textBox3.Text)
            {
                MessageBox.Show("As passwords não coincidem.", caption, btn, ico);
                textBox3.SelectAll();
                return;
            }


            cn = getSGBDConnection();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataTable table2 = new DataTable();
            DataTable table3 = new DataTable();

            SqlCommand command = new SqlCommand("SELECT Login.Utilizador FROM projeto.Login WHERE Utilizador = '" + textBox5.Text + "'", cn);

            adapter.SelectCommand = command;
            adapter.Fill(table2);

            if (table2.Rows.Count > 0)
            {
                MessageBox.Show("O utilizador já existe. Por favor use outro nome de utilizador.", "C# Register", MessageBoxButtons.OK, MessageBoxIcon.Information);
                textBox5.SelectAll();
                return;
            }
            //else
            //{
                //MessageBox.Show("Invalid Username Or Password", "Login Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}


            DialogResult result;
            result = MessageBox.Show("Queres salvar a conta", "Save data", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            if(result == DialogResult.Yes)
            {
                string mySQl = string.Empty;

                mySQl += "INSERT INTO projeto.Login (Utilizador, PasswordHash , Fname, Lname)";
                mySQl += "VALUES ('" + textBox5.Text + "','" + textBox4.Text + "','" + textBox1.Text + "','" + textBox2.Text + "')";

                SqlCommand command2 = new SqlCommand(mySQl, cn);
                adapter.SelectCommand = command2;
                adapter.Fill(table3);
                MessageBox.Show("A conta foi guardada.", "C# Register", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }



        }
    }
}
