using QuanLyThuVien1.BS_layer;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyThuVien1
{
    public partial class DangKy : Form
    {
        string err;
        BLnhanvien nv = new BLnhanvien();
        public DangKy()
        {
            InitializeComponent();
        }


        private void buttonThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void buttonDangKy_Click(object sender, EventArgs e)
        {
            if (tbSEX.Text == "" || tbDC.Text == "" || tbID.Text == "" || tbMK.Text == "" || tbNV.Text == "" || tbSDT.Text == "" || tbTK.Text == "")
                MessageBox.Show("Xin hãy điền đầy đủ thông tin!!!");
            else
            {
                try
                {
                    nv.themnvn(tbID.Text, tbTK.Text, tbMK.Text, tbLTK.Text, tbNV.Text, tbDC.Text, tbSEX.Text, ref err);
                    MessageBox.Show("Đã thêm xong rồi nè, hihi");
                }
                catch (SqlException)
                {
                    MessageBox.Show("Bị lỗi khi thêm rồi !!!");
                }
            }
        }
    }
}
