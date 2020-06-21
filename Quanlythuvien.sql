use master;

go
if DB_ID('QuanLyThuVien') is not null
	drop database QuanLyThuVien;
go

create database QuanLyThuVien;
go

use QuanLyThuVien;
go



--------------tạo bảng-----------------------


--Nhóm loai sach
create table loaisach
	(
		maloaisach  varchar(20) not null,
		tenloaisach varchar(20) not null
		constraint pk_loaisach primary key (maloaisach)
	);


--Kệ
	create table ke
	(
		make   varchar(8) not null,
		tenke  varchar(20),
		constraint pk_ke primary key (make),
	);

--Nhân viên
	create table nhanvien
	(

		manhanvien  varchar(8) not null,
		taikhoan  varchar(20) not null,
		matkhau varchar(20) not null,
		loai varchar(20) not null ,
		tennhanvien varchar(20) not null,
		diachi  varchar(20) ,
        sex  varchar(20),
		constraint pk_nhanvien primary key (manhanvien),
	);


--Docgia
	create table docgia
	(
		madocgia varchar(8) not null,
		tendocgia   varchar(20) not null,
        gioitinh varchar(20),
        diachi  varchar(20),
		constraint pk_docgia primary key (madocgia),
	);


--Sách 
	create table sach
	(
		masach	   varchar(8) not null, 
		tensach   varchar(20) ,    
		maloaisach	varchar(20) not null,
		soluong     int,
		make  varchar (8) not null
		constraint pk_sach primary key (masach),
		constraint ck_sach_loaisach foreign key (maloaisach) references loaisach(maloaisach),
		constraint ck_sach_ke foreign key (make) references ke(make)
	);

	
--Phiếu mượn
	create table phieumuon
	(
		maphieumuon  varchar(8) not null,
		ngaymuon     date not null,
		hanngaytra   date not null,
		manhanvien  varchar(8) not null,
		masach	   varchar(8) not null,
        soluong   int,
		madocgia   varchar(8) not null,
		trangthai   varchar(20) not null,
		constraint pk_phieumuon primary key (maphieumuon),
		constraint ck_phieumuon_nv foreign key (manhanvien) references nhanvien(manhanvien),
		constraint ck_phieumuon_s foreign key (masach) references sach(masach),
		constraint ck_phieumuon_kh foreign key (madocgia) references docgia(madocgia)
	);
go
---------------------------


---------------------------Tao Check ngoại------------------------------


----------------------tao khoa ngoai SACH-------------------------
alter table sach
	with nocheck add constraint fk_sach_loaisach
	foreign key (maloaisach) references loaisach(maloaisach);

go
alter table sach
	with nocheck add constraint fk_sach_ke
	foreign key (make) references ke(make);

go
alter table sach
	check constraint fk_sach_loaisach;

go
alter table sach
	check constraint fk_sach_ke;
go	
------------------------------------------------------------------
----------------------tao khoa ngoai phieumuon--------------------


alter table phieumuon
	with nocheck add constraint fk_phieumuon_nhanvien
	foreign key (manhanvien) references nhanvien(manhanvien);

go

alter table phieumuon
	with nocheck add constraint fk_phieumuon_sach
	foreign key (masach) references sach(masach);

go
alter table phieumuon
	with nocheck add constraint fk_phieumuon_docgia
	foreign key (madocgia) references docgia(madocgia);

go
alter table phieumuon
	check constraint fk_phieumuon_nhanvien;

go
alter table phieumuon
	check constraint fk_phieumuon_sach;

go
alter table phieumuon
	check constraint fk_phieumuon_docgia;

go

--------------------------------------------------

----------------------nhập giá trị ------------------------------


insert into docgia values
('KH111','Vo Quoc Tuan','nam','Duc Linh'),
('KH112','Tien Hoa','nam','Ham Tan'),
('KH113','Quan AP','nam','Ha Noi'),
('KH114','Jack','nu','Long An');

insert into ke values
('KE001','Ke01'),
('KE002','Ke02'),
('KE003','Ke03');

insert into loaisach values
('LS001','ThamKhao'),
('LS002','GiaDinh'),
('LS003','ThienVan');


insert into nhanvien values

('NV01','hoa1234','1234','1','Phan Thanh Hoai','Binh Dinh','Nam'),
('NV02','hoa1235','1234','2','Le Tien Hoa','Ninh Thuan','Nu'),
('NV03','hoa1236','1234','3','Nhat Nguyen','Khanh Hoa','Nam'),
('NV04','hoa1237','1234','3','Pham Quynh Anh','Dong Nai','Nu');


insert into sach values
('S0001','Toi Thay Hoa Vang','LS001',105,'KE001'),
('S0002','Bai Tap Vat Ly 2','LS001',87,'KE002'),
('S0003','Bai Tap Toan 1','LS001',34,'KE002'),
('S0004','Huong Dan nau an','LS001',55,'KE003');



insert into phieumuon values
('PX001','2020-05-25','2020-06-14','NV01','S0003','2','KH113','0'),
('PX002','2020-05-24','2020-05-23','NV04','S0001','3','KH112','1'),
('PX003','2020-03-31','2020-04-15','NV04','S0002','1','KH114','1'),
('PX004','2020-04-30','2020-05-15','NV01','S0003','2','KH113','1');






-----------------------------------------

-- tạo proc ,funtion ,trigger

-----------------ACCOUNT-----------------------------
Go

create proc dangnhap (@tendangnhap varchar(20),@matkhau varchar(20))
as 
	select * from nhanvien where taikhoan=@tendangnhap and matkhau=@matkhau
go

exec dbo.dangnhap N'hoa1234',N'1234'
go

--------------------------------------------------------------------------

-----------------------docgia-----------------------------------------

--lấy full độc giả
create proc  thongtinfulldocgia
as
	select *from docgia
go

--xóa 1 độc giả
create proc xoadocgia @madocgia varchar(8)
as
	begin
		delete  from docgia where madocgia=@madocgia
	end
go 

--thêm một độc giả
----kiểm tra trước khi thêm
create proc kiemtradocgia(@madocgia varchar(8))
as
	select *from docgia where madocgia=@madocgia
go
--kiem tra xong thi them thoi =))))

create proc themdocgia(@madocgia varchar(8),@tendocgia varchar(20),@gioitinh varchar(20),@diachi varchar(20))
	as
		begin
			insert into docgia values(@madocgia,@tendocgia,@gioitinh,@diachi)
		end
	go

--sửa một độc giả

create proc suadocgia(@madocgia varchar(8),@tendocgia varchar(20),@gioitinh varchar(20),@diachi varchar(20))
	as
		begin
			update docgia set tendocgia= @tendocgia,
			gioitinh=@gioitinh,diachi=@diachi where madocgia=@madocgia
		end
	go




---------------------------------Phiếu mượn-----------------------------------
-- lấy thông tin từ phiếu mượn
create proc  thongtinphieumuon
as
	select *from phieumuon
go
--xóa phiếu mượn------
create proc xoaphieumuon @maphieumuon varchar(8)
as
	begin
		delete  from phieumuon where maphieumuon=@maphieumuon
	end
go
--lay ma nhan vien
create proc  phieumuonnv
as
	select manhanvien from nhanvien
go

--lay ma sach
create proc  phieumuons
as
	select masach from sach
go

--lay ma độc giả
create proc  phieumuonmkh
as
	select madocgia from docgia
go

create proc thongtinphieumuonid @idsach varchar(8)
as
	select * from  phieumuon where maphieumuon=@idsach
go


--exec infophieumuon; ----test
go


-- kiểm tra trước khi lập phiếu mượn
create proc kiemtraphieumuon(@maphieumuon varchar(8))
as
	select *from phieumuon where maphieumuon=@maphieumuon
go


-- thêm phiếu xuất 
create proc themphieumuon(@maphieumuon varchar(8),@ngaymuon date,@hanngaytra date,@manhanvien varchar(8),
	@masach varchar(8),@madocgia varchar(8),@trangthai   varchar(20))
	as
		begin
			IF	1>(SELECT soluong FROM sach WHERE masach=@masach) THROW 50001,'Số lượng hàng trong kho không đủ!',1;
			IF	@maphieumuon = '' THROW 50001, 'Mã phiếu xuất không được để trống!', 1;
			IF	@madocgia = '' THROW 50001, 'Mã khách hàng không được để trống!', 1;
			IF	@manhanvien='' THROW 50001, 'Mã thủ kho không được để trống!', 1;
			IF	@ngaymuon ='' THROW 50001, 'Ngày không được để trống!', 1;
			IF	@hanngaytra ='' THROW 50001, 'Ngày không được để trống!', 1;
			IF	@trangthai ='' THROW 50001, 'Trạng thái không được để trống!', 1;
			insert into phieumuon values(@maphieumuon,@ngaymuon,@hanngaytra,@manhanvien,@masach,1,@madocgia,@trangthai)
		end
	go


	   

--sửa phiếu xuất
create proc suaphieumuon(@maphieumuon varchar(8),@ngaymuon date,@hanngaytra date,@manhanvien varchar(8),
	@masach varchar(8),@madocgia varchar(8),@trangthai   varchar(20))
	as
		begin
			IF	1>(SELECT soluong FROM sach WHERE masach=@masach) THROW 50001,'Số lượng hàng trong kho không đủ!',1;
			IF	@maphieumuon = '' THROW 50001, 'Mã phiếu xuất không được để trống!', 1;
			IF	@madocgia = '' THROW 50001, 'Mã khách hàng không được để trống!', 1;
			IF	@manhanvien='' THROW 50001, 'Mã thủ kho không được để trống!', 1;
			IF	@ngaymuon ='' THROW 50001, 'Ngày không được để trống!', 1;
			IF	@hanngaytra ='' THROW 50001, 'Ngày không được để trống!', 1;
			IF	@trangthai ='' THROW 50001, 'Trạng thái không được để trống!', 1;
			update phieumuon set ngaymuon= @ngaymuon,
			hanngaytra=@hanngaytra,manhanvien= @manhanvien,masach= @masach,madocgia= @madocgia,trangthai= @trangthai where maphieumuon=@maphieumuon
		end
	go

	----------xóa hết ---------------
	

------------------------------------------------------------------------------------

--------------------------------SOLUONG---------------------------------------------

-- cập nhập số lượng khi xuất sản phẩm
create trigger trinphieumuon on phieumuon after insert as
	begin 
		update sach 
		set soluong= sach.soluong-(
		select soluong from inserted
		where inserted.masach=sach.masach)
		from sach join inserted on
		sach.masach=inserted.masach
	end 
go



--cap nhap so luong sau khi xoa phieu muon 
create trigger trdephieumuon on phieumuon for delete as
	begin
		update sach
		set soluong=sach.soluong+(
		select soluong from deleted
		where masach=sach.masach)
		from sach join deleted on sach.masach=deleted.masach
	end;
go


---------------------------------------------------------------------------

-----------------------------NHÂN VIÊN----------------------------------

-- tra cứu thông tin nhân viên
create proc thongtinnv
as
	select * from  nhanvien
go

create proc thongtinvid @idmanv varchar(20)
as
	select * from  nhanvien where tennhanvien=@idmanv
go

--kiem tra truoc khi them vao
create proc kiemtranv(@manhanvien varchar(8))
as
	select * from nhanvien where manhanvien=@manhanvien
go

-- thêm nhân viên
create proc themnv(@manhanvien varchar(8),@taikhoan varchar(20),@matkhau varchar(20),@loai varchar(20),@tennv varchar(20),@diachi varchar(20),@sex varchar(20))
as
	insert into nhanvien values(@manhanvien,@taikhoan,@matkhau,@loai,@tennv,@diachi,@sex)
go

--sửa nhân viên
create proc suanv (@manhanvien varchar(8),@loai varchar(20),@tennv varchar(20),@diachi varchar(20),@sex varchar(20))
as
	begin
		update nhanvien set loai= @loai,
		tennhanvien= @tennv,diachi = @diachi ,sex=@sex where manhanvien =@manhanvien
	end
go

create proc xoanv @manhanvien varchar(8)
as
	begin
		delete  from nhanvien where manhanvien=@manhanvien
	end
go 

create proc searchnv @id varchar(8)
as
	select * from nhanvien where manhanvien=@id
go

--- Đổi mật khẩu

create proc doimatkhau @mk varchar(20),@id varchar(8)
as
	begin 
	update nhanvien set matkhau=@mk where manhanvien=@id
	end
go 

--exec dbo.themnv 'NV06','Pham Quynh Anh','Tien Giang','Nu','BP01'



-----------------------------------------------------------------
--------------------------KỆ SÁCH--------------------------------
	
--thông tin kệ
create proc thongtinke
as
	select * from  ke
go

create proc thongtinkeid @idsach varchar(8)
as
	select * from  ke where make=@idsach
go

--kiem tra truoc khi them vao
create proc kiemtrake(@make varchar(8))
as
	select * from ke where make =@make
go

-- thêm vào 
create proc themke(@make varchar(8),@tenke varchar(20))
as
	insert into ke values(@make,@tenke)
go
 
-- chinh sua ke
create proc suake(@make varchar(8),@tenke varchar(20))
	as
		begin
			update ke set tenke= @tenke
            where make=@make
		end
	go
--xóa kệ
create proc xoake(@make varchar(8))
	as 
		begin
			delete from ke where make=@make
		end
	go 



---------------------------LOAISACH-----------------------------------
--chỉnh sửa loại sách

create proc thongtinloaisach
as
	select * from  loaisach
go

--create proc thongtinkeid @idsach varchar(8)
--as
--	select * from  ke where make=@idsach
--go

--kiem tra truoc khi them vao
create proc kiemtraloaisach(@maloaisach varchar(20))
as
	select * from loaisach where maloaisach =@maloaisach
go

-- thêm vào 
create proc themloaisach(@maloaisach varchar(20),@tenloaisach varchar(20))
as
	insert into loaisach values(@maloaisach,@tenloaisach)
go
 
-- chinh sua ke
create proc sualoaisach(@maloaisach varchar(20),@tenloaisach varchar(20))
	as
		begin
			update loaisach set tenloaisach= @tenloaisach
            where maloaisach=@maloaisach
		end
	go
--xóa loại sach
create proc xoaloaisach(@maloaisach varchar(20))
	as 
		begin
			delete from loaisach where maloaisach=@maloaisach
		end
	go 

	---tim loai sach

	create proc timkiem(@maloaisach varchar(20))
	as 
	 select * from loaisach where tenloaisach=@maloaisach
	 go


---------------------------------------------------------
----------------------------SÁCH-----------------------------

--Tìm kiếm theo tên sách
create proc timkiemsach2(@tensach varchar(20))
as
	select * from sach 
	where tensach=@tensach
go

--Tìm kiếm theo mã sách
create proc timkiemsach1(@masach varchar(8))
as
	select * from sach 
	where masach=@masach
go

--exec dbo.timkiemsach1 N'S0001'
--go

--chỉnh sửa sách

create proc thongtinsach
as
	select * from  sach
go



--kiem tra truoc khi them vao
create proc kiemtrasach(@masach varchar(8))
as
	select * from sach where masach =@masach
go

-- thêm vào 
create proc themsach(@masach	   varchar(8), 
		@tensach   varchar(20) ,    
		@maloaisach	varchar(20),
		@soluong     int,
		@make  varchar (8))
as
	insert into sach values(@masach,@tensach,@maloaisach,@soluong,@make)
go
 
-- chinh sua ke
create proc suasach(@masach	   varchar(8), 
		@tensach   varchar(20) ,    
		@maloaisach	varchar(20),
		@soluong     int,
		@make  varchar (8))
	as
		begin
			update sach set tensach=@tensach,maloaisach= @maloaisach,soluong=@soluong,make=@make
			where masach=@masach
		end
	go
--xóa loại sach
create proc xoasach(@masach varchar(8))
	as 
		begin
			delete from sach where masach=@masach
		end
	go 


	--------- tạo lọc phiếu----------------
	create proc thongke @dau date,@sau date
as
	begin
		select * from phieumuon where ngaymuon BETWEEN  @dau AND @sau
	end
go 
