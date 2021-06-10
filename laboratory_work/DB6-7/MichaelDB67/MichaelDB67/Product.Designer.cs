
namespace MichaelDB67
{
    partial class Product
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
            this.text_conDate = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.text_desc = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.button3 = new System.Windows.Forms.Button();
            this.deleteButton = new System.Windows.Forms.Button();
            this.updateButton = new System.Windows.Forms.Button();
            this.insertButton = new System.Windows.Forms.Button();
            this.SneakersDataGrid = new System.Windows.Forms.DataGridView();
            this.label3 = new System.Windows.Forms.Label();
            this.text_idProd = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.SneakersDataGrid)).BeginInit();
            this.SuspendLayout();
            // 
            // text_conDate
            // 
            this.text_conDate.Location = new System.Drawing.Point(287, 17);
            this.text_conDate.Name = "text_conDate";
            this.text_conDate.Size = new System.Drawing.Size(100, 20);
            this.text_conDate.TabIndex = 30;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(199, 20);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(83, 13);
            this.label2.TabIndex = 29;
            this.label2.Text = "connectionDate";
            // 
            // text_desc
            // 
            this.text_desc.Location = new System.Drawing.Point(95, 17);
            this.text_desc.Name = "text_desc";
            this.text_desc.Size = new System.Drawing.Size(100, 20);
            this.text_desc.TabIndex = 28;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(31, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(58, 13);
            this.label1.TabIndex = 27;
            this.label1.Text = "description";
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(530, 59);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(103, 37);
            this.button3.TabIndex = 26;
            this.button3.Text = "RESET";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // deleteButton
            // 
            this.deleteButton.Location = new System.Drawing.Point(346, 59);
            this.deleteButton.Name = "deleteButton";
            this.deleteButton.Size = new System.Drawing.Size(103, 37);
            this.deleteButton.TabIndex = 25;
            this.deleteButton.Text = "DELETE";
            this.deleteButton.UseVisualStyleBackColor = true;
            this.deleteButton.Click += new System.EventHandler(this.deleteButton_Click);
            // 
            // updateButton
            // 
            this.updateButton.Location = new System.Drawing.Point(171, 59);
            this.updateButton.Name = "updateButton";
            this.updateButton.Size = new System.Drawing.Size(103, 37);
            this.updateButton.TabIndex = 24;
            this.updateButton.Text = "UPDATE";
            this.updateButton.UseVisualStyleBackColor = true;
            this.updateButton.Click += new System.EventHandler(this.updateButton_Click);
            // 
            // insertButton
            // 
            this.insertButton.Location = new System.Drawing.Point(12, 59);
            this.insertButton.Name = "insertButton";
            this.insertButton.Size = new System.Drawing.Size(103, 37);
            this.insertButton.TabIndex = 23;
            this.insertButton.Text = "INSERT";
            this.insertButton.UseVisualStyleBackColor = true;
            this.insertButton.Click += new System.EventHandler(this.insertButton_Click);
            // 
            // SneakersDataGrid
            // 
            this.SneakersDataGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.SneakersDataGrid.Location = new System.Drawing.Point(12, 111);
            this.SneakersDataGrid.Name = "SneakersDataGrid";
            this.SneakersDataGrid.RowHeadersWidth = 47;
            this.SneakersDataGrid.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.SneakersDataGrid.Size = new System.Drawing.Size(621, 207);
            this.SneakersDataGrid.TabIndex = 22;
            this.SneakersDataGrid.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.SneakersDataGrid_CellContentClick);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(393, 20);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(57, 13);
            this.label3.TabIndex = 31;
            this.label3.Text = "id_product";
            // 
            // text_idProd
            // 
            this.text_idProd.Location = new System.Drawing.Point(456, 17);
            this.text_idProd.Name = "text_idProd";
            this.text_idProd.Size = new System.Drawing.Size(100, 20);
            this.text_idProd.TabIndex = 32;
            // 
            // Product
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(657, 339);
            this.Controls.Add(this.text_idProd);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.text_conDate);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.text_desc);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.deleteButton);
            this.Controls.Add(this.updateButton);
            this.Controls.Add(this.insertButton);
            this.Controls.Add(this.SneakersDataGrid);
            this.Name = "Product";
            this.Text = "Product";
            this.Load += new System.EventHandler(this.Product_Load);
            ((System.ComponentModel.ISupportInitialize)(this.SneakersDataGrid)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox text_conDate;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox text_desc;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button deleteButton;
        private System.Windows.Forms.Button updateButton;
        private System.Windows.Forms.Button insertButton;
        private System.Windows.Forms.DataGridView SneakersDataGrid;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox text_idProd;
    }
}