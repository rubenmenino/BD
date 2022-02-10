using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace EscolaDeMusica
{
    public partial class EventEdit : Form
    {
        public EventEdit()
        {
            InitializeComponent();
        }

        private void EventEdit_Load(object sender, EventArgs e)
        {

        }

        public void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string nome = textBox1.Text.ToString();
            string local = textBox2.Text.ToString();
            string caracteristicas = textBox3.Text.ToString();

            DateTime data_init = dateTimePicker1.Value;
            DateTime data_fim = dateTimePicker2.Value;

            bool aceite = radioButton1.Checked ? true : false;

            int id = Convert.ToInt32(textBox4.Text);
            Event evento = new Event();

            if(evento.editarEvento(id, nome, local, data_init, data_fim, caracteristicas, aceite))
            {
                MessageBox.Show("Evento editado com sussesso!", "Editar Evento", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }

            else
            {
                MessageBox.Show("Erro ao editar o evento!\n Tente Novamente.", "Editar Evento", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }


        }

        private void button2_Click(object sender, EventArgs e)
        {

        }
    }
}
