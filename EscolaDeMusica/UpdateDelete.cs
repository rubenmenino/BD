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
    public partial class UpdateDelete : Form
    {
        public UpdateDelete()
        {
            InitializeComponent();


            initInstrumentos();
        }

        private void initInstrumentos()
        {
            comboBox1.Items.Add("Violino");
            comboBox1.Items.Add("Violoncelo");
            comboBox1.Items.Add("Guitarra");
            comboBox1.Items.Add("Bateria");
            comboBox1.Items.Add("Canto");
            comboBox1.Items.Add("Piano");
            comboBox1.Items.Add("Saxofone");
            comboBox1.Items.Add("Flauta Transversal");
            comboBox1.Items.Add("Clarinete");
            comboBox1.Items.Add("Fagote");
        }

        private SqlConnection cn;
        private int id;
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



        AdicionarAluno aluno = new AdicionarAluno();
        AdicionarProfessor professor = new AdicionarProfessor();



        bool verif()
        {
            if ((textBoxName.Text.Trim() == "") ||
                (textBoxTelemovel.Text.Trim() == "") ||
                (textBoxName.Text.Trim() == "") ||
                (textBoxNIF.Text.Trim() == "") ||
                (textBoxEmail.Text.Trim() == "") ||
                (textBoxMorada.Text.Trim() == ""))
            {
                return false;
            }
            else
            {
                return true;
            }
        }


        /*
        private void buttonProcurar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBoxID.Text);
            SqlCommand command = new SqlCommand("SELECT PESSOA_Codigo, Data_Nasc, Telemovel, Nome, Sexo, NIF, Email, Morada FROM projeto.Pessoa WHERE PESSOA_Codigo=" + id, cn);
            DataTable table = aluno.getAlunos(command);
            
            if(table.Rows.Count > 0)
            {
                textBoxName.Text = table.Rows[0]["Nome"].ToString();
                textBoxTelemovel.Text = table.Rows[0]["Telemovel"].ToString();
                textBoxNIF.Text = table.Rows[0]["NIF"].ToString();
                textBoxEmail.Text = table.Rows[0]["Email"].ToString();
                textBoxMorada.Text = table.Rows[0]["Morada"].ToString();
                dateTimePicker1.Value = (DateTime)table.Rows[0]["Data_Nasc"];

                if (table.Rows[0]["Sexo"].ToString() == "Feminino")
                {
                    radioButtonFeminino.Checked = true;
                }
                else
                {
                    radioButtonMasculino.Checked = true;
                }
            }
        }*/



        private void UpdateDelete_Load(object sender, EventArgs e)
        {

        }

        private void textBoxID_TextChanged(object sender, EventArgs e)
        {

        }

        private void buttonEditar_Click(object sender, EventArgs e)
        {
            try
            {
                cn = getSGBDConnection();
                //Data_Nasc, Telemovel, Nome, Sexo, NIF, Email, Morada
                id = Convert.ToInt32(textBoxID.Text);
                string instrumento = comboBox1.SelectedItem.ToString();

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


                if (((this_yea - born_year) < 10) || ((this_yea - born_year > 100)))
                {
                    MessageBox.Show("Idade tem de ser entre 10 e 100 anos", "Data Inválida", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else if (verif())

                {
                    // É um aluno
                    if (id < 100)
                    {
                        if (aluno.updateAluno(id, dataNascimento, telemovel, nome, sexo, nif, email, morada, instrumento))
                        {
                            MessageBox.Show("Informação do Aluno Atualizada", "Editar Aluno", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        }
                        else
                        {
                            MessageBox.Show("Erro", "Editar Aluno", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }

                    // É um professor
                    else
                    {

                        if (professor.updateProfessor(id, dataNascimento, telemovel, nome, sexo, nif, email, morada, instrumento))
                        {
                            MessageBox.Show("Informação do Professor Atualizada", "Editar Professor", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        }
                        else
                        {
                            MessageBox.Show("Erro", "Editar Professor", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }

                    }

                }
                else
                {
                    MessageBox.Show("Espaços vazios", "Editar Aluno", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show("Procure por um código válido", "Editar aluno", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            
            
           

        }

        private void buttonRemover_Click_1(object sender, EventArgs e)
        {
            try
            {
                id = Convert.ToInt32(textBoxID.Text);
                string instrumento = comboBox1.SelectedItem.ToString();

                if (MessageBox.Show("De certeza que quer eliminar o aluno/professor da base de dados?", "Apagar Aluno/Professor", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    if (id < 100)
                    {
                        if (aluno.deleteAluno(id, instrumento))
                        {
                            MessageBox.Show("Aluno Apagado", "Apagar aluno", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            textBoxID.Text = "";
                            textBoxName.Text = "";
                            textBoxTelemovel.Text = "";
                            textBoxNIF.Text = "";
                            textBoxEmail.Text = "";
                            dateTimePicker1.Value = DateTime.Now;
                            textBoxMorada.Text = "";
                        }
                        else
                        {
                            MessageBox.Show("Aluno não Apagado", "Apagar aluno", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }

                    else
                    {
                        if (professor.deleteProfessor(id))
                        {
                            MessageBox.Show("Professor Apagado", "Apagar Professor", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            textBoxID.Text = "";
                            textBoxName.Text = "";
                            textBoxTelemovel.Text = "";
                            textBoxNIF.Text = "";
                            textBoxEmail.Text = "";
                            dateTimePicker1.Value = DateTime.Now;
                            textBoxMorada.Text = "";
                        }
                        else
                        {
                            MessageBox.Show("Professor não Apagado", "Apagar Professor", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }


                }
            }
            catch(Exception ex)
            {
                MessageBox.Show("Procure por um código válido", "Apagar aluno", MessageBoxButtons.OK, MessageBoxIcon.Error);
            } 
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
         
            
           

        }

        private void buttonProcurar_Click(object sender, EventArgs e)
        {
            try
            {
                cn = getSGBDConnection();
                int id = Convert.ToInt32(textBoxID.Text);
                SqlCommand command = new SqlCommand("SELECT ALUNO_Codigo, Data_Nasc, Telemovel, Nome, Sexo, NIF, Email, Morada FROM projeto.Aluno WHERE Aluno_Codigo=" + id, cn);
                DataTable table = aluno.getAlunos(command);

                if (table.Rows.Count > 0)
                {
                    textBoxName.Text = table.Rows[0]["Nome"].ToString();
                    textBoxTelemovel.Text = table.Rows[0]["Telemovel"].ToString();
                    textBoxNIF.Text = table.Rows[0]["NIF"].ToString();
                    textBoxEmail.Text = table.Rows[0]["Email"].ToString();
                    textBoxMorada.Text = table.Rows[0]["Morada"].ToString();
                    dateTimePicker1.Value = (DateTime)table.Rows[0]["Data_Nasc"];

                    if (table.Rows[0]["Sexo"].ToString() == "Feminino")
                    {
                        radioButtonFeminino.Checked = true;
                    }
                    else
                    {
                        radioButtonMasculino.Checked = true;
                    }
                }
            }
            catch
            {
                MessageBox.Show("Procure por um código válido", "Código Inválido", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void textBoxID_KeyPress(object sender, KeyPressEventArgs e)
        {
            if(!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }
    }
}
