using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace MichaelDB67
{
    public partial class Product : Form
    {
        public Product()
        {
            InitializeComponent();
        }

        public int productID { get; set; }

        MySqlConnection con = new MySqlConnection("server=localhost;userid=root;persistsecurityinfo=True;database=sberbank;password=102505");

        private void insertButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsValid())
                {
                    MySqlCommand cmd = new MySqlCommand("INSERT INTO product (description, connection_date,id_product) VALUES (@desc,@conDate,@idProd)", con);
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@desc", text_desc.Text);
                    cmd.Parameters.AddWithValue("@conDate", text_conDate.Text);
                    cmd.Parameters.AddWithValue("@idProd", text_idProd.Text);

                    con.Open();
                    cmd.ExecuteReader();
                    con.Close();

                    MessageBox.Show("Кроссовки успешно добавлены!", "Сохранено", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    GetBankRecords();
                    ResetObjects();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                con.Close();
            }
          
        }

        private void ResetObjects()
        {
            productID = 0;
            text_desc.Clear();
            text_conDate.Clear();
            text_desc.Focus();
        }

        private bool IsValid()
        {
            if (text_desc.Text == String.Empty)
            {
                MessageBox.Show("Модель не введена", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            return true;
        }

        private void updateButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (productID > 0)
                {
                    MySqlCommand cmd = new MySqlCommand("UPDATE product SET description = @desc, connection_date = @conDate, id_product = @idProd" +
                                                        " WHERE id = @ID", con);
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@desc", text_desc.Text);
                    cmd.Parameters.AddWithValue("@conDate", text_conDate.Text);
                    cmd.Parameters.AddWithValue("@idProd", text_idProd.Text);
                    cmd.Parameters.AddWithValue("@ID", this.productID);

                    con.Open();
                    cmd.ExecuteReader();
                    con.Close();

                    MessageBox.Show("Кроссовки успешно изменены!", "Изменение", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    GetBankRecords();
                    ResetObjects();
                }
                else
                {
                    MessageBox.Show("Пожалуйста выберите кроссовки для обновления!", "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception exception)
            {
                MessageBox.Show(exception.Message);
                con.Close();
            }
        }

        private void deleteButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (productID > 0)
                {
                    MySqlCommand cmd = new MySqlCommand("DELETE FROM product WHERE id = @ID", con);
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@ID", this.productID);

                    con.Open();
                    cmd.ExecuteReader();
                    con.Close();

                    MessageBox.Show("Кроссовки успешно удалены!", "Удалено", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    GetBankRecords();
                    ResetObjects();
                }
                else
                {
                    MessageBox.Show("Пожалуйста выберите кроссовки для удаления!", "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception exception)
            {
                MessageBox.Show(exception.Message);
                con.Close();
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            ResetObjects();
        }

        private void SneakersDataGrid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            productID = Convert.ToInt32(SneakersDataGrid.SelectedRows[0].Cells[0].Value);
            text_desc.Text = SneakersDataGrid.SelectedRows[0].Cells[1].Value.ToString();
            text_conDate.Text = SneakersDataGrid.SelectedRows[0].Cells[2].Value.ToString();
            text_idProd.Text = SneakersDataGrid.SelectedRows[0].Cells[3].Value.ToString();
        }

        private void Product_Load(object sender, EventArgs e)
        {
            GetBankRecords();
        }

        private void GetBankRecords()
        {
            MySqlCommand cmd = new MySqlCommand("SELECT product.id, description, connection_date, name FROM product join product_type on product.id_product = product_type.id", con);
            DataTable dt = new DataTable();

            con.Open();

            MySqlDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            con.Close();

            SneakersDataGrid.DataSource = dt;
        }

    }
}
