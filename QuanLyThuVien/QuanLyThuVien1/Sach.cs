using QuanLyThuVien1.BS_layer;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyThuVien1
{
    public partial class Sach : Form
    {
        string err = "";
        DataSet ds = null;
        DataTable dt = null;
        BLsach s = new BLsach();
        private bool them = false;
        private bool sua = false;
        public Sach()
        {
            InitializeComponent();
        }

        private void Sach_Load(object sender, EventArgs e)
        {
            load();
        }
        private void load()
        {
            if(DangNhap.h==2)
            {
                button1.Enabled = false;
                button3.Enabled = false;
                button5.Enabled = false;
                button6.Enabled = false;
            }
            tbID.Enabled = false;
            tbTS.Enabled = false;
            tbLS.Enabled = false;
            tbSL.Enabled = false;
            tbKS.Enabled = false;
            ds = s.Laysach();
            dgvS.DataSource = ds.Tables[0];
            dgvS.AutoResizeColumns();
        }

        private void dgvS_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int r = dgvS.CurrentCell.RowIndex;
            tbID.Text = dgvS.Rows[r].Cells[0].Value.ToString();
            tbTS.Text = dgvS.Rows[r].Cells[1].Value.ToString();
            tbLS.Text = dgvS.Rows[r].Cells[2].Value.ToString();
            tbSL.Text = dgvS.Rows[r].Cells[3].Value.ToString();
            tbKS.Text = dgvS.Rows[r].Cells[4].Value.ToString();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            them = true;
            sua = false;
            tbID.Enabled = true;
            tbTS.Enabled = true;
            tbLS.Enabled = true;
            tbSL.Enabled = true;
            tbKS.Enabled = true;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            sua = true;
            them = false;
            tbTS.Enabled = true;
            tbLS.Enabled = true;
            tbSL.Enabled = true;
            tbKS.Enabled = true;
        }

        private void button6_Click(object sender, EventArgs e)
        {
            if (them)
            {
                s.themsach(tbID.Text, tbTS.Text,tbLS.Text,Convert.ToInt32(tbSL.Text),tbKS.Text, ref err);
                them = false;
                load();
            }
            else if (sua)
            {
               s.suasach(tbID.Text, tbTS.Text, tbLS.Text, Convert.ToInt32(tbSL.Text), tbKS.Text, ref err);
                sua = false;
                load();
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Hide();
            GiaoDienChinh gd = new GiaoDienChinh();
            gd.ShowDialog();
            this.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            DialogResult a = MessageBox.Show("Bạn có muốn xóa sách này", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (a == DialogResult.Yes)
            {
                bool h = s.xoasach(tbID.Text, ref err);
                if (h == false)
                {
                    MessageBox.Show("Bạn cần xóa những dữ liệu liên quan đến sách này !!!");
                }
                load();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            dt = new DataTable();
            dt = s.timkiem2(tbTK.Text);
            dgvS.DataSource = dt;

        }
    }
}
