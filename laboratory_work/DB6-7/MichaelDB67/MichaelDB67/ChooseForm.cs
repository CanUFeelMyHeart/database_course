using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MichaelDB67
{
    public partial class ChooseForm : Form
    {
        public ChooseForm()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form toCl = new Client();
            toCl.Owner = this;
            toCl.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form toPr = new Product();
            toPr.Owner = this;
            toPr.Show();
        }
    }
}
