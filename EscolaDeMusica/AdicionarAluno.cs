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

            SqlCommand command = new SqlCommand("INSERT projeto.Aluno (Data_Nasc, Telemovel, Nome, Sexo, NIF, Email, Morada, Mensalidade) " + "VALUES (@Data_Nasc, @Telemovel, @Nome, @Sexo, @NIF, @Email, @Morada, @Mensalidade); SELECT SCOPE_IDENTITY();", cn);



            // @Data_Nasc, @Telemovel, @Nome, @Sexo, @NIF, @Email, @Morada
            command.Parameters.Add("@Data_Nasc", SqlDbType.Date).Value = dataNascimento;
            command.Parameters.Add("@Telemovel", SqlDbType.VarChar).Value = telemovel;
            command.Parameters.Add("@Nome", SqlDbType.VarChar).Value = nome;
            command.Parameters.Add("@Sexo", SqlDbType.VarChar).Value = sexo;
            command.Parameters.Add("@NIF", SqlDbType.Int).Value = nif;
            command.Parameters.Add("@Email", SqlDbType.VarChar).Value = email;
            command.Parameters.Add("@Morada", SqlDbType.VarChar).Value = morada;
            command.Parameters.Add("@Mensalidade", SqlDbType.Int).Value = 25;

            

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
            
        
        public bool updateAluno(int id, DateTime dataNascimento, string telemovel, string nome, string sexo, string nif, string email, string morada, string instrumento)
        {
            cn = getSGBDConnection();
            // @Data_Nasc, @Telemovel, @Nome, @Sexo, @NIF, @Email, @Morada
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataTable table = new DataTable();

            SqlCommand identitySet = new SqlCommand("SET IDENTITY_INSERT projeto.Aluno ON", cn);
            SqlCommand command = new SqlCommand("INSERT INTO projeto.Aluno(ALUNO_Codigo, Data_Nasc, Telemovel, Nome, sexo, NIF, Email, Morada, Mensalidade, TURMA_Numero, TURMA_ID) VALUES(@ALUNO_Codigo, @Data_Nasc, @Telemovel, @Nome, @Sexo, @NIF, @Email, @Morada, @Mensalidade, @TURMA_Numero, @TURMA_ID)", cn);



            command.Parameters.Add("@ALUNO_Codigo", SqlDbType.Int).Value = id;
            command.Parameters.Add("@Data_Nasc", SqlDbType.Date).Value = dataNascimento;
            command.Parameters.Add("@Telemovel", SqlDbType.VarChar).Value = telemovel;
            command.Parameters.Add("@Nome", SqlDbType.VarChar).Value = nome;
            command.Parameters.Add("@Sexo", SqlDbType.VarChar).Value = sexo;
            command.Parameters.Add("@NIF", SqlDbType.Int).Value = nif;
            command.Parameters.Add("@Email", SqlDbType.VarChar).Value = email;
            command.Parameters.Add("@Morada", SqlDbType.VarChar).Value = morada;

            command.Parameters.Add("@Mensalidade", SqlDbType.Int).Value = 25;
            command.Parameters.Add("@TURMA_Numero", SqlDbType.Int).Value = 1;
            command.Parameters.Add("@TURMA_ID", SqlDbType.Int).Value = 1;

            SqlCommand identityDelete = new SqlCommand("DELETE FROM projeto.Aluno WHERE ALUNO_Codigo=@ALUNO_Codigo", cn);
            identityDelete.Parameters.Add("@ALUNO_Codigo", SqlDbType.Int).Value = id;


            //command.Parameters.Add("@ALUNO_Codigo", SqlDbType.Int).Value = ALUNO_Codigo;

            //SqlCommand identityOf = new SqlCommand("SET IDENTITY_INSERT projeto.Aluno OFF", cn);

            SqlCommand addInstrumento = new SqlCommand("INSERT INTO projeto.Toca1(INSTRUMENTO_Nome, ALUNO_Codigo) VALUES(@INSTRUMENTO,  @CODIGO)", cn);
            addInstrumento.Parameters.Add("@INSTRUMENTO", SqlDbType.VarChar).Value = instrumento;
            addInstrumento.Parameters.Add("@CODIGO", SqlDbType.Int).Value = id;

            


            cn.Open();

            int aux = addInstrumento.ExecuteNonQuery();
            MessageBox.Show(" " + aux);


            if (identitySet.ExecuteNonQuery() == -1 && identityDelete.ExecuteNonQuery() == 1 && command.ExecuteNonQuery() == 1)
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

        public bool deleteAluno(int id)
        {

            cn = getSGBDConnection();

            SqlDataAdapter adapter = new SqlDataAdapter();
            DataTable table = new DataTable();

            SqlCommand command = new SqlCommand("DELETE FROM projeto.Aluno WHERE ALUNO_Codigo=@ALUNO_Codigo", cn);

            command.Parameters.Add("@ALUNO_Codigo", SqlDbType.Int).Value = id;
            

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

        private void AdicionarAluno_Load(object sender, EventArgs e)
        {

        }

        private void buttonCancelar2_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
