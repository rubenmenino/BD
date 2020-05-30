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
    public partial class Login_Form : Form
    {
        private SqlConnection cn;
        private int currentPessoa;
        private bool adding;

        public Login_Form()
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

        private void Login_Form_Load(object sender, EventArgs e)
        {
            pictureBox1.Image = Image.FromFile("../../images/1.jpg");
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void buttonLogin_Click(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataTable table = new DataTable();
            
            SqlCommand command = new SqlCommand("SELECT * FROM projeto.Login WHERE Utilizador=@Utilizador AND PasswordHash=@PasswordHash", cn);
            
            command.Parameters.Add("@Utilizador", SqlDbType.VarChar).Value = textBoxUsername.Text;
            command.Parameters.Add("@PasswordHash", SqlDbType.VarChar).Value = textBoxPassword.Text;

            adapter.SelectCommand = command;
            adapter.Fill(table);

            if(table.Rows.Count > 0)
            {
                this.DialogResult = DialogResult.OK;
            }
            else
            {
                MessageBox.Show("Invalid Username Or Password", "Login Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Register_Form register = new Register_Form();
            register.ShowDialog();
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if(checkBox1.Checked == true)
            {
                textBoxPassword.UseSystemPasswordChar = false;
            }
            else
            {
                textBoxPassword.UseSystemPasswordChar = true;
            }

        }
    }
}
