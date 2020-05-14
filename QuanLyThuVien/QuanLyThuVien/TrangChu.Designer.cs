namespace QuanLyThuVien
{
    partial class TrangChu
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
            this.label1 = new System.Windows.Forms.Label();
            this.btnDangnhap = new System.Windows.Forms.Button();
            this.btnThoat = new System.Windows.Forms.Button();
            this.btnSach = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.label1.Location = new System.Drawing.Point(94, 104);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(425, 29);
            this.label1.TabIndex = 11;
            this.label1.Text = "THƯ VIỆN BÁCH KHOA TOÀN THƯ";
            // 
            // btnDangnhap
            // 
            this.btnDangnhap.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnDangnhap.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDangnhap.ForeColor = System.Drawing.Color.Navy;
            this.btnDangnhap.ImageAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btnDangnhap.Location = new System.Drawing.Point(482, 10);
            this.btnDangnhap.Name = "btnDangnhap";
            this.btnDangnhap.Size = new System.Drawing.Size(91, 58);
            this.btnDangnhap.TabIndex = 10;
            this.btnDangnhap.Text = "Đăng Nhập";
            this.btnDangnhap.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnDangnhap.UseVisualStyleBackColor = true;
            // 
            // btnThoat
            // 
            this.btnThoat.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnThoat.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThoat.ForeColor = System.Drawing.Color.Navy;
            this.btnThoat.ImageAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btnThoat.Location = new System.Drawing.Point(579, 10);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(59, 58);
            this.btnThoat.TabIndex = 9;
            this.btnThoat.Text = "Thoát";
            this.btnThoat.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnThoat.UseVisualStyleBackColor = true;
            // 
            // btnSach
            // 
            this.btnSach.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnSach.Font = new System.Drawing.Font("Microsoft Sans Serif", 13F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSach.ForeColor = System.Drawing.Color.Navy;
            this.btnSach.ImageAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btnSach.Location = new System.Drawing.Point(236, 174);
            this.btnSach.Name = "btnSach";
            this.btnSach.Size = new System.Drawing.Size(145, 60);
            this.btnSach.TabIndex = 8;
            this.btnSach.Text = "Tìm Kiếm";
            this.btnSach.UseVisualStyleBackColor = true;
            // 
            // TrangChu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(649, 350);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnDangnhap);
            this.Controls.Add(this.btnThoat);
            this.Controls.Add(this.btnSach);
            this.Name = "TrangChu";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnDangnhap;
        private System.Windows.Forms.Button btnThoat;
        private System.Windows.Forms.Button btnSach;
    }
}

