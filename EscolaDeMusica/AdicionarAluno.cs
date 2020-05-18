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
using System.IO;

namespace EscolaDeMusica
{
    public partial class AdicionarAluno : Form
    {
        private SqlConnection cn;
        private int currentPessoa;
        private bool adding;

        //MY_DB db = new MY_DB();
        public AdicionarAluno()
        {
            InitializeComponent();
        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void buttonAddAluno_Click(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
            //Data_Nasc, Telemovel, Nome, Sexo, NIF, Email, Morada
            DateTime dataNascimento = dateTimePicker1.Value;
            string telemovel = textBoxTelemovel.Text;
            string nome = textBoxName.Text;
            string sexo = "Masculino";
            string nif = textBoxNIF.Text;
            string email = textBoxEmail.Text;
            string morada = textBoxMorada.Text;

            if (radioButtonFeminino.Checked)
            {
                sexo = "Feminino";
            }

            int born_year = dateTimePicker1.Value.Year;
            int this_yea = DateTime.Now.Year;
            
            if(((this_yea - born_year) < 10) || ((this_yea - born_year > 100))){
                MessageBox.Show("Idade tem de ser entre 10 e 100 anos", "Data Inválida", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if(verif())
            {
                if(insertStudent(dataNascimento, telemovel, nome, sexo, nif, email, morada))
                {
                    MessageBox.Show("Novo aluno adicionado", "Adicionar Aluno", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Erro", "Adicionar Aluno", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Espaços vazios", "Adicionar Aluno", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }

        }

        bool verif()
        {
            if((textBoxName.Text.Trim() == "")       ||
                (textBoxTelemovel.Text.Trim() == "") ||
                (textBoxName.Text.Trim() == "")      ||
                (textBoxNIF.Text.Trim() == "")       ||
                (textBoxEmail.Text.Trim() == "")     ||
                (textBoxMorada.Text.Trim() == ""))
            {
                return false;
            }
            else
            {
                return true;
            }
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

        public bool insertStudent(DateTime dataNascimento, string telemovel, string nome, string sexo, string nif, string email, string morada)
        {
            //cn = getSGBDConnection();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataTable table = new DataTable();

            SqlCommand command = new SqlCommand("INSERT projeto.Pessoa (Data_Nasc, Telemovel, Nome, Sexo, NIF, Email, Morada) " + "VALUES (@Data_Nasc, @Telemovel, @Nome, @Sexo, @NIF, @Email, @Morada)", cn);

            // @Data_Nasc, @Telemovel, @Nome, @Sexo, @NIF, @Email, @Morada, @imagem
            command.Parameters.Add("@Data_Nasc", SqlDbType.Date).Value = dataNascimento;
            command.Parameters.Add("@Telemovel", SqlDbType.VarChar).Value = telemovel;
            command.Parameters.Add("@Nome", SqlDbType.VarChar).Value = nome;
            command.Parameters.Add("@Sexo", SqlDbType.VarChar).Value = sexo;
            command.Parameters.Add("@NIF", SqlDbType.Int).Value = nif;
            command.Parameters.Add("@Email", SqlDbType.VarChar).Value = email;
            command.Parameters.Add("@Morada", SqlDbType.VarChar).Value = morada;

            cn.Open();

            if (command.ExecuteNonQuery() == 1)
            {
                cn.Close();
                return true;
            }
            else
            {
                cn.Close();
                return false;
            }
        }

            

        public DataTable getAlunos(SqlCommand command)
        {
            cn = getSGBDConnection();
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable table = new DataTable();
            adapter.Fill(table);
            return table;
        }
            
        
    }
}
