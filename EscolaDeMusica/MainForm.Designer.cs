namespace EscolaDeMusica
{
    partial class MainForm
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
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.alunoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.adicionarAlunoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.listaDeAlunosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.editarRemoverToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aulasToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.professorToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.adicionarProfessorToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.listaDeProfessoresToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gruposToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.turmaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.direçãoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.alunoToolStripMenuItem,
            this.aulasToolStripMenuItem,
            this.professorToolStripMenuItem,
            this.gruposToolStripMenuItem,
            this.turmaToolStripMenuItem,
            this.direçãoToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(842, 28);
            this.menuStrip1.TabIndex = 1;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // alunoToolStripMenuItem
            // 
            this.alunoToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.adicionarAlunoToolStripMenuItem,
            this.listaDeAlunosToolStripMenuItem,
            this.editarRemoverToolStripMenuItem});
            this.alunoToolStripMenuItem.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.alunoToolStripMenuItem.Name = "alunoToolStripMenuItem";
            this.alunoToolStripMenuItem.Size = new System.Drawing.Size(60, 24);
            this.alunoToolStripMenuItem.Text = "Aluno";
            // 
            // adicionarAlunoToolStripMenuItem
            // 
            this.adicionarAlunoToolStripMenuItem.Name = "adicionarAlunoToolStripMenuItem";
            this.adicionarAlunoToolStripMenuItem.Size = new System.Drawing.Size(186, 24);
            this.adicionarAlunoToolStripMenuItem.Text = "Adicionar Aluno";
            this.adicionarAlunoToolStripMenuItem.Click += new System.EventHandler(this.adicionarAlunoToolStripMenuItem_Click);
            // 
            // listaDeAlunosToolStripMenuItem
            // 
            this.listaDeAlunosToolStripMenuItem.Name = "listaDeAlunosToolStripMenuItem";
            this.listaDeAlunosToolStripMenuItem.Size = new System.Drawing.Size(186, 24);
            this.listaDeAlunosToolStripMenuItem.Text = "Lista de alunos";
            this.listaDeAlunosToolStripMenuItem.Click += new System.EventHandler(this.listaDeAlunosToolStripMenuItem_Click);
            // 
            // editarRemoverToolStripMenuItem
            // 
            this.editarRemoverToolStripMenuItem.Name = "editarRemoverToolStripMenuItem";
            this.editarRemoverToolStripMenuItem.Size = new System.Drawing.Size(186, 24);
            this.editarRemoverToolStripMenuItem.Text = "Editar/ Remover";
            // 
            // aulasToolStripMenuItem
            // 
            this.aulasToolStripMenuItem.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.aulasToolStripMenuItem.Name = "aulasToolStripMenuItem";
            this.aulasToolStripMenuItem.Size = new System.Drawing.Size(57, 24);
            this.aulasToolStripMenuItem.Text = "Aulas";
            // 
            // professorToolStripMenuItem
            // 
            this.professorToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.adicionarProfessorToolStripMenuItem,
            this.listaDeProfessoresToolStripMenuItem});
            this.professorToolStripMenuItem.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.professorToolStripMenuItem.Name = "professorToolStripMenuItem";
            this.professorToolStripMenuItem.Size = new System.Drawing.Size(82, 24);
            this.professorToolStripMenuItem.Text = "Professor";
            this.professorToolStripMenuItem.Click += new System.EventHandler(this.professorToolStripMenuItem_Click);
            // 
            // adicionarProfessorToolStripMenuItem
            // 
            this.adicionarProfessorToolStripMenuItem.Name = "adicionarProfessorToolStripMenuItem";
            this.adicionarProfessorToolStripMenuItem.Size = new System.Drawing.Size(208, 24);
            this.adicionarProfessorToolStripMenuItem.Text = "Adicionar Professor";
            this.adicionarProfessorToolStripMenuItem.Click += new System.EventHandler(this.adicionarProfessorToolStripMenuItem_Click);
            // 
            // listaDeProfessoresToolStripMenuItem
            // 
            this.listaDeProfessoresToolStripMenuItem.Name = "listaDeProfessoresToolStripMenuItem";
            this.listaDeProfessoresToolStripMenuItem.Size = new System.Drawing.Size(208, 24);
            this.listaDeProfessoresToolStripMenuItem.Text = "Lista de Professores";
            this.listaDeProfessoresToolStripMenuItem.Click += new System.EventHandler(this.listaDeProfessoresToolStripMenuItem_Click);
            // 
            // gruposToolStripMenuItem
            // 
            this.gruposToolStripMenuItem.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gruposToolStripMenuItem.Name = "gruposToolStripMenuItem";
            this.gruposToolStripMenuItem.Size = new System.Drawing.Size(68, 24);
            this.gruposToolStripMenuItem.Text = "Grupos";
            // 
            // turmaToolStripMenuItem
            // 
            this.turmaToolStripMenuItem.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.turmaToolStripMenuItem.Name = "turmaToolStripMenuItem";
            this.turmaToolStripMenuItem.Size = new System.Drawing.Size(63, 24);
            this.turmaToolStripMenuItem.Text = "Turma";
            // 
            // direçãoToolStripMenuItem
            // 
            this.direçãoToolStripMenuItem.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.direçãoToolStripMenuItem.Name = "direçãoToolStripMenuItem";
            this.direçãoToolStripMenuItem.Size = new System.Drawing.Size(73, 24);
            this.direçãoToolStripMenuItem.Text = "Direção";
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(842, 457);
            this.Controls.Add(this.menuStrip1);
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "MainForm";
            this.Text = "MainForm";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem alunoToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem adicionarAlunoToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem listaDeAlunosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem editarRemoverToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aulasToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem professorToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem gruposToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem turmaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem direçãoToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem adicionarProfessorToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem listaDeProfessoresToolStripMenuItem;
    }
}