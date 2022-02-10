namespace EscolaDeMusica
{
    partial class AdicionarProfessor
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.namelabel = new System.Windows.Forms.Label();
            this.nametextbox = new System.Windows.Forms.TextBox();
            this.sexlabel = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.FemaleradioButton1 = new System.Windows.Forms.RadioButton();
            this.MaleRadioButton1 = new System.Windows.Forms.RadioButton();
            this.TelemovelLabel = new System.Windows.Forms.Label();
            this.teleLabel = new System.Windows.Forms.TextBox();
            this.niflabel = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.EmailLabel = new System.Windows.Forms.Label();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.DataLabel = new System.Windows.Forms.Label();
            this.dateTimePicker2 = new System.Windows.Forms.DateTimePicker();
            this.MoaradaLabel = new System.Windows.Forms.Label();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.AddButton = new System.Windows.Forms.Button();
            this.CancelButton = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // namelabel
            // 
            this.namelabel.AutoSize = true;
            this.namelabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.namelabel.Location = new System.Drawing.Point(26, 47);
            this.namelabel.Name = "namelabel";
            this.namelabel.Size = new System.Drawing.Size(57, 18);
            this.namelabel.TabIndex = 0;
            this.namelabel.Text = "Nome: ";
            this.namelabel.Click += new System.EventHandler(this.label1_Click);
            // 
            // nametextbox
            // 
            this.nametextbox.Location = new System.Drawing.Point(142, 39);
            this.nametextbox.Name = "nametextbox";
            this.nametextbox.Size = new System.Drawing.Size(216, 20);
            this.nametextbox.TabIndex = 1;
            // 
            // sexlabel
            // 
            this.sexlabel.AutoSize = true;
            this.sexlabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sexlabel.Location = new System.Drawing.Point(26, 84);
            this.sexlabel.Name = "sexlabel";
            this.sexlabel.Size = new System.Drawing.Size(46, 18);
            this.sexlabel.TabIndex = 2;
            this.sexlabel.Text = "Sexo:";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.FemaleradioButton1);
            this.groupBox1.Controls.Add(this.MaleRadioButton1);
            this.groupBox1.Location = new System.Drawing.Point(142, 65);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(216, 43);
            this.groupBox1.TabIndex = 3;
            this.groupBox1.TabStop = false;
            this.groupBox1.Enter += new System.EventHandler(this.groupBox1_Enter);
            // 
            // FemaleradioButton1
            // 
            this.FemaleradioButton1.AutoSize = true;
            this.FemaleradioButton1.BackColor = System.Drawing.Color.BurlyWood;
            this.FemaleradioButton1.Location = new System.Drawing.Point(97, 15);
            this.FemaleradioButton1.Name = "FemaleradioButton1";
            this.FemaleradioButton1.Size = new System.Drawing.Size(67, 17);
            this.FemaleradioButton1.TabIndex = 1;
            this.FemaleradioButton1.Text = "Feminino";
            this.FemaleradioButton1.UseVisualStyleBackColor = false;
            // 
            // MaleRadioButton1
            // 
            this.MaleRadioButton1.AutoSize = true;
            this.MaleRadioButton1.BackColor = System.Drawing.Color.BurlyWood;
            this.MaleRadioButton1.Checked = true;
            this.MaleRadioButton1.Location = new System.Drawing.Point(13, 15);
            this.MaleRadioButton1.Name = "MaleRadioButton1";
            this.MaleRadioButton1.Size = new System.Drawing.Size(73, 17);
            this.MaleRadioButton1.TabIndex = 0;
            this.MaleRadioButton1.TabStop = true;
            this.MaleRadioButton1.Text = "Masculino";
            this.MaleRadioButton1.UseVisualStyleBackColor = false;
            this.MaleRadioButton1.CheckedChanged += new System.EventHandler(this.radioButton1_CheckedChanged);
            // 
            // TelemovelLabel
            // 
            this.TelemovelLabel.AutoSize = true;
            this.TelemovelLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TelemovelLabel.Location = new System.Drawing.Point(26, 131);
            this.TelemovelLabel.Name = "TelemovelLabel";
            this.TelemovelLabel.Size = new System.Drawing.Size(84, 18);
            this.TelemovelLabel.TabIndex = 4;
            this.TelemovelLabel.Text = "Telemovel: ";
            this.TelemovelLabel.Click += new System.EventHandler(this.label1_Click_1);
            // 
            // teleLabel
            // 
            this.teleLabel.Location = new System.Drawing.Point(142, 124);
            this.teleLabel.Name = "teleLabel";
            this.teleLabel.Size = new System.Drawing.Size(216, 20);
            this.teleLabel.TabIndex = 5;
            // 
            // niflabel
            // 
            this.niflabel.AutoSize = true;
            this.niflabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.niflabel.Location = new System.Drawing.Point(26, 175);
            this.niflabel.Name = "niflabel";
            this.niflabel.Size = new System.Drawing.Size(39, 18);
            this.niflabel.TabIndex = 6;
            this.niflabel.Text = "NIF: ";
            this.niflabel.Click += new System.EventHandler(this.label1_Click_2);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(142, 175);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(216, 20);
            this.textBox1.TabIndex = 7;
            // 
            // EmailLabel
            // 
            this.EmailLabel.AutoSize = true;
            this.EmailLabel.Location = new System.Drawing.Point(26, 213);
            this.EmailLabel.Name = "EmailLabel";
            this.EmailLabel.Size = new System.Drawing.Size(38, 13);
            this.EmailLabel.TabIndex = 8;
            this.EmailLabel.Text = "Email: ";
            this.EmailLabel.Click += new System.EventHandler(this.label1_Click_3);
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(142, 210);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(216, 20);
            this.textBox2.TabIndex = 9;
            // 
            // DataLabel
            // 
            this.DataLabel.AutoSize = true;
            this.DataLabel.Location = new System.Drawing.Point(26, 283);
            this.DataLabel.Name = "DataLabel";
            this.DataLabel.Size = new System.Drawing.Size(104, 13);
            this.DataLabel.TabIndex = 10;
            this.DataLabel.Text = "Data de Nascimento";
            // 
            // dateTimePicker2
            // 
            this.dateTimePicker2.Cursor = System.Windows.Forms.Cursors.Default;
            this.dateTimePicker2.CustomFormat = "dd/MM/yyyy";
            this.dateTimePicker2.Location = new System.Drawing.Point(142, 283);
            this.dateTimePicker2.Name = "dateTimePicker2";
            this.dateTimePicker2.Size = new System.Drawing.Size(216, 20);
            this.dateTimePicker2.TabIndex = 11;
            // 
            // MoaradaLabel
            // 
            this.MoaradaLabel.AutoSize = true;
            this.MoaradaLabel.Location = new System.Drawing.Point(26, 353);
            this.MoaradaLabel.Name = "MoaradaLabel";
            this.MoaradaLabel.Size = new System.Drawing.Size(46, 13);
            this.MoaradaLabel.TabIndex = 12;
            this.MoaradaLabel.Text = "Morada:";
            this.MoaradaLabel.Click += new System.EventHandler(this.label1_Click_4);
            // 
            // textBox3
            // 
            this.textBox3.Location = new System.Drawing.Point(142, 350);
            this.textBox3.Multiline = true;
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(216, 55);
            this.textBox3.TabIndex = 15;
            // 
            // AddButton
            // 
            this.AddButton.BackColor = System.Drawing.Color.LawnGreen;
            this.AddButton.Location = new System.Drawing.Point(240, 429);
            this.AddButton.Name = "AddButton";
            this.AddButton.Size = new System.Drawing.Size(118, 48);
            this.AddButton.TabIndex = 17;
            this.AddButton.Text = "Adicionar";
            this.AddButton.UseVisualStyleBackColor = false;
            this.AddButton.Click += new System.EventHandler(this.AddButton_Click);
            // 
            // CancelButton
            // 
            this.CancelButton.BackColor = System.Drawing.Color.OrangeRed;
            this.CancelButton.Location = new System.Drawing.Point(29, 429);
            this.CancelButton.Name = "CancelButton";
            this.CancelButton.Size = new System.Drawing.Size(123, 48);
            this.CancelButton.TabIndex = 18;
            this.CancelButton.Text = "Cancelar";
            this.CancelButton.UseVisualStyleBackColor = false;
            this.CancelButton.Click += new System.EventHandler(this.CancelButton_Click);
            // 
            // AdicionarProfessor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.BurlyWood;
            this.ClientSize = new System.Drawing.Size(411, 528);
            this.Controls.Add(this.CancelButton);
            this.Controls.Add(this.AddButton);
            this.Controls.Add(this.textBox3);
            this.Controls.Add(this.MoaradaLabel);
            this.Controls.Add(this.dateTimePicker2);
            this.Controls.Add(this.DataLabel);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.EmailLabel);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.niflabel);
            this.Controls.Add(this.teleLabel);
            this.Controls.Add(this.TelemovelLabel);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.sexlabel);
            this.Controls.Add(this.nametextbox);
            this.Controls.Add(this.namelabel);
            this.Name = "AdicionarProfessor";
            this.Text = "AdicionarProfessor";
            this.Load += new System.EventHandler(this.AdicionarProfessor_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label namelabel;
        private System.Windows.Forms.TextBox nametextbox;
        private System.Windows.Forms.Label sexlabel;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton MaleRadioButton1;
        private System.Windows.Forms.RadioButton FemaleradioButton1;
        private System.Windows.Forms.Label TelemovelLabel;
        private System.Windows.Forms.TextBox teleLabel;
        private System.Windows.Forms.Label niflabel;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label EmailLabel;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.Label DataLabel;
        private System.Windows.Forms.DateTimePicker dateTimePicker2;
        private System.Windows.Forms.Label MoaradaLabel;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.Button AddButton;
        private System.Windows.Forms.Button CancelButton;
    }
}