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
    public partial class Client : Form
    {
        public Client()
        {
            InitializeComponent();
        }


        public int clientID { get; set; }

        MySqlConnection con = new MySqlConnection("server=localhost;userid=root;persistsecurityinfo=True;database=sberbank;password=102505");
        private void insertButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsValid())
                {
                    MySqlCommand cmd = new MySqlCommand("INSERT INTO client (fullname, mobile_phone) VALUES (@fn,@mp)", con);
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@fn", text_fullname.Text);
                    cmd.Parameters.AddWithValue("@mp", text_mobilephone.Text);

                    con.Open();
                    cmd.ExecuteReader();
                    con.Close();

                    MessageBox.Show("Кроссовки успешно добавлены!", "Сохранено", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    GetBankRecords();
                    ResetObjects();
                }
            }
            catch (Exception exception)
            {
                MessageBox.Show(exception.Message);
                con.Close();
            }
        }

        private void ResetObjects()
        {
            clientID = 0;
            text_fullname.Clear();
            text_mobilephone.Clear();
            text_fullname.Focus();
        }

        private bool IsValid()
        {
            if (text_fullname.Text == String.Empty)
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
                if (clientID > 0)
                {
                    MySqlCommand cmd = new MySqlCommand("UPDATE client SET fullname = @fn, mobile_phone = @mp" +
                                                        " WHERE id = @ID", con);
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@fn", text_fullname.Text);
                    cmd.Parameters.AddWithValue("@mp", text_mobilephone.Text);
                    cmd.Parameters.AddWithValue("@ID", this.clientID);

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
                if (clientID > 0)
                {
                    MySqlCommand cmd = new MySqlCommand("DELETE FROM client WHERE id = @ID", con);
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@ID", this.clientID);

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
            clientID = Convert.ToInt32(SneakersDataGrid.SelectedRows[0].Cells[0].Value);
            text_fullname.Text = SneakersDataGrid.SelectedRows[0].Cells[1].Value.ToString();
            text_mobilephone.Text = SneakersDataGrid.SelectedRows[0].Cells[2].Value.ToString();
        }

        private void Client_Load(object sender, EventArgs e)
        {
            GetBankRecords();
        }

        private void GetBankRecords()
        {
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM client", con);
            DataTable dt = new DataTable();

            con.Open();

            MySqlDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            con.Close();

            SneakersDataGrid.DataSource = dt;
        }

    }
}
