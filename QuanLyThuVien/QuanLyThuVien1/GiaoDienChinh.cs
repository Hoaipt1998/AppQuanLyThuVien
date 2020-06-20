using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Printing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyThuVien1
{
    public partial class GiaoDienChinh : Form
    {
        public static string mk;
        public static string tk;

        public GiaoDienChinh()
        {

        InitializeComponent();
        }
        private void btnS_Click(object sender, EventArgs e)
        {
            this.Hide();
            Sach s = new Sach();
            s.ShowDialog();
            this.Close();
        }

        private void btnLS_Click(object sender, EventArgs e)
        {
            this.Hide();
            LoaiSach s = new LoaiSach();
            s.ShowDialog();
            this.Close();
        }

        private void btnKS_Click(object sender, EventArgs e)
        {
            this.Hide();
            KeSach s = new KeSach();
            s.ShowDialog();
            this.Close();
        }

        private void btnNV_Click(object sender, EventArgs e)
        {
            this.Hide();
            NhanVien s = new NhanVien();
            s.ShowDialog();
            this.Close();
        }

        private void btnDG_Click(object sender, EventArgs e)
        {
            this.Hide();
            DocGia s = new DocGia();
            s.ShowDialog();
            this.Close();
        }

        private void btnPM_Click(object sender, EventArgs e)
        {
            this.Hide();
            PhieuMuon s = new PhieuMuon();
            s.ShowDialog();
            this.Close();
        }

        private void btnAC_Click(object sender, EventArgs e)
        {
            this.Hide();
            TaiKhoan s = new TaiKhoan();
            s.ShowDialog();
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            ThongKe s = new ThongKe();
            s.ShowDialog();
            this.Close();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void GiaoDienChinh_Load(object sender, EventArgs e)
        {
            if(DangNhap.h==1)
            {
                btnAC.Enabled=true;
                btnDG.Enabled = true;
                btnKS.Enabled = true;
                btnTK.Enabled = true;
                btnLS.Enabled = true;
                btnNV.Enabled = true;
                btnPM.Enabled = true;
                btnS.Enabled = true;
            }    
            else if(DangNhap.h==2)
            {
                btnAC.Enabled = true;
                btnDG.Enabled = true;
                btnKS.Enabled = false;
                btnTK.Enabled = true;
                btnLS.Enabled = false;
                btnNV.Enabled = false;
                btnPM.Enabled = true;
                btnS.Enabled = true;
            }    
            else if(DangNhap.h==3)
            {
                btnAC.Enabled = true;
                btnDG.Enabled = false;
                btnKS.Enabled = true;
                btnTK.Enabled = false;
                btnLS.Enabled = true;
                btnNV.Enabled = false;
                btnPM.Enabled = false;
                btnS.Enabled = true;
            }
        }

        private void btnLO_Click(object sender, EventArgs e)
        {
            DangNhap.h = 0;
            this.Hide();
            TrangChu gdc = new TrangChu();
            gdc.ShowDialog();
            this.Close();
        }
    }
}
