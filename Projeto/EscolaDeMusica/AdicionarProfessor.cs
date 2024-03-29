﻿using System;
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
    public partial class AdicionarProfessor : Form
    {
        public AdicionarProfessor()
        {
            InitializeComponent();
            
        }


        private SqlConnection cn;

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click_1(object sender, EventArgs e)
        {

        }

        private void label1_Click_2(object sender, EventArgs e)
        {

        }

        private void label1_Click_3(object sender, EventArgs e)
        {

        }

        private void label1_Click_4(object sender, EventArgs e)
        {

        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {

        }

        private void toolStripContainer1_TopToolStripPanel_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void InstrumentoLabel_Click(object sender, EventArgs e)
        {

        }

        private void AdicionarProfessor_Load(object sender, EventArgs e)
        {

        }

        public bool updateProfessor(int id, DateTime dataNascimento, string telemovel, string nome, string sexo, string nif, string email, string morada, string instrumento)
        {
            cn = getSGBDConnection();
            // @Data_Nasc, @Telemovel, @Nome, @Sexo, @NIF, @Email, @Morada
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataTable table = new DataTable();

            SqlCommand command = new SqlCommand("projeto.updateProfessor @PROFESSOR_Codigo, @Data_Nasc, @Telemovel, @Nome, @Sexo, @NIF, @Email, @Morada, @DISCIPLINA_ID, @inst", cn);

            
            command.Parameters.Add("@PROFESSOR_Codigo", SqlDbType.Int).Value = id;
            command.Parameters.Add("@Data_Nasc", SqlDbType.Date).Value = dataNascimento;
            command.Parameters.Add("@Telemovel", SqlDbType.VarChar).Value = telemovel;
            command.Parameters.Add("@Nome", SqlDbType.VarChar).Value = nome;
            command.Parameters.Add("@Sexo", SqlDbType.VarChar).Value = sexo;
            command.Parameters.Add("@NIF", SqlDbType.Int).Value = nif;
            command.Parameters.Add("@Email", SqlDbType.VarChar).Value = email;
            command.Parameters.Add("@Morada", SqlDbType.VarChar).Value = morada;
            command.Parameters.Add("@DISCIPLINA_ID", SqlDbType.Int).Value = 1;


            command.Parameters.Add("@inst", SqlDbType.VarChar).Value = instrumento;
            
            
            



            cn.Open();

            int i = command.ExecuteNonQuery();

            //MessageBox.Show("" + i , "sdsd", MessageBoxButtons.OK, MessageBoxIcon.Information);

            cn.Close();


            if(i == -1)
            {
                
                return false;
            }

            else
            {
               
                return true;
            }
            
        }

        public bool deleteProfessor(int id)
        {

            cn = getSGBDConnection();

            SqlDataAdapter adapter = new SqlDataAdapter();
            DataTable table = new DataTable();

            SqlCommand command = new SqlCommand("projeto.deleteProfessor @id", cn);

            command.Parameters.Add("@id", SqlDbType.Int).Value = id;
            


            cn.Open();

            command.ExecuteNonQuery();

            

            cn.Close();
            return true;
        }


        private void AddButton_Click(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
            //Data_Nasc, Telemovel, Nome, Sexo, NIF, Email, Morada
            DateTime dataNascimento = dateTimePicker2.Value;
            string telemovel = teleLabel.Text;
            string nome = nametextbox.Text;
            string sexo = "Masculino";
            string nif = textBox1.Text;
            string email = textBox2.Text;
            string morada = textBox3.Text;

            if (FemaleradioButton1.Checked)
            {
                sexo = "Feminino";
            }

            int born_year = dateTimePicker2.Value.Year;
            int this_yea = DateTime.Now.Year;

            if (((this_yea - born_year) < 10) || ((this_yea - born_year > 100)))
            {
                MessageBox.Show("Idade tem de ser entre 10 e 100 anos", "Data Inválida", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (verif())
            {
                if (insertProfessor(dataNascimento, telemovel, nome, sexo, nif, email, morada))
                {
                    MessageBox.Show("Novo professor adicionado", "Adicionar professor", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Erro", "Adicionar professor", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Espaços vazios", "Adicionar professor", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }

        }

        bool verif()
        {
            if ((nametextbox.Text.Trim() == "") ||
                (teleLabel.Text.Trim() == "") ||
                (nametextbox.Text.Trim() == "") ||
                (textBox1.Text.Trim() == "") ||
                (textBox2.Text.Trim() == "") ||
                (textBox3.Text.Trim() == ""))
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


        public bool insertProfessor(DateTime dataNascimento, string telemovel, string nome, string sexo, string nif, string email, string morada)
        {
            cn = getSGBDConnection();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataTable table = new DataTable();

            //SqlCommand identitySet = new SqlCommand("SET IDENTITY_INSERT projeto.Professor ON", cn);
            SqlCommand command = new SqlCommand("projeto.criarProfessor", cn);
            command.CommandType = CommandType.StoredProcedure;



            // @Data_Nasc, @Telemovel, @Nome, @Sexo, @NIF, @Email, @Morada
            command.Parameters.Add("@Data_Nasc", SqlDbType.Date).Value = dataNascimento;
            command.Parameters.Add("@Telemovel", SqlDbType.VarChar).Value = telemovel;
            command.Parameters.Add("@Nome", SqlDbType.VarChar).Value = nome;
            command.Parameters.Add("@Sexo", SqlDbType.VarChar).Value = sexo;
            command.Parameters.Add("@NIF", SqlDbType.Int).Value = nif;
            command.Parameters.Add("@Email", SqlDbType.VarChar).Value = email;
            command.Parameters.Add("@Morada", SqlDbType.VarChar).Value = morada;
            command.Parameters.Add("@Salario", SqlDbType.Int).Value = 0;


            command.Parameters.Add("@DISCIPLINA_ID", SqlDbType.Int).Value = 1;

            cn.Open();



            command.ExecuteNonQuery();
         
            cn.Close();
            return true;
            
           
        }

        public DataTable getProfessores(SqlCommand command)
        {
            cn = getSGBDConnection();
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable table = new DataTable();
            adapter.Fill(table);
            return table;
        }

        private void CancelButton_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
