Kelompok: Girls KANA
Anggota : Khlillah NurAzizah   2507037
		  Ajeng Mirat Aunillah 2507051
		  Niha Nuraeni 		   2507042
		  Aulia Virganita Sari 2507047
		  


CREATE DATABASE db_electromart;

CREATE TABLE produk (
    id_produk VARCHAR(10) PRIMARY KEY NOT NULL,
    nama_produk VARCHAR(100) NOT NULL,
    kategori VARCHAR(50) NOT NULL,
    harga DECIMAL (12,2) NOT NULL,
    stok INT NOT NULL DEFAULT 0
);


CREATE TABLE pelanggan (
    id_pelanggan VARCHAR(10) PRIMARY KEY NOT NULL,
    nama_pelanggan VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    no_hp VARCHAR(20) NULL,
    alamat TEXT NULL
);


CREATE TABLE pegawai (
    id_pegawai VARCHAR(10) PRIMARY KEY NOT NULL,
    nama_pegawai VARCHAR(100) NOT NULL,
    peran VARCHAR(30) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    no_hp VARCHAR(20) NULL
);


CREATE TABLE penjualan (
    id_penjualan VARCHAR(10) PRIMARY KEY NOT NULL,
    tanggal DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_pelanggan VARCHAR(10) NOT NULL,
    id_pegawai VARCHAR(10) NOT NULL,
    total_harga DECIMAL(12,2) NOT NULL DEFAULT 0,
    diskon DECIMAL(12,2) NOT NULL DEFAULT 0,
    total_bayar DECIMAL(12,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai)
);


CREATE TABLE detail_penjualan (
    id_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_penjualan VARCHAR(10) NOT NULL,
    id_produk VARCHAR(10) NOT NULL,
    jumlah INT NOT NULL,
    harga_satuan DECIMAL(12,2) NOT NULL,
    subtotal DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (id_penjualan) REFERENCES penjualan(id_penjualan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

INSERT INTO produk (id_produk, nama_produk, kategori, harga, stok) VALUES
('PRD001', 'Laptop Asus ZenBook 14', 'Laptop', 14500000.00, 15),
('PRD002', 'Mouse Wireless Logitech M330', 'Aksesoris', 250000.00, 50),
('PRD003', 'Keyboard Mekanikal Keychron K2', 'Aksesoris', 1200000.00, 3),
('PRD004', 'Monitor LG 27 Inch IPS', 'Monitor', 3200000.00, 8),
('PRD005', 'Smartphone Samsung Galaxy S23', 'Smartphone', 12999000.00, 10),
('PRD006', 'Smart TV Sony 55 Inch 4K', 'TV', 8500000.00, 2),
('PRD007', 'Headphone Sony WH-1000XM5', 'Audio', 4499000.00, 12),
('PRD008', 'Flashdisk SanDisk 64GB', 'Aksesoris', 85000.00, 100),
('PRD009', 'Printer Epson EcoTank L3210', 'Periferal', 2400000.00, 4),
('PRD010', 'Webcam Logitech C920', 'Aksesoris', 950000.00, 25);

INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, email, no_hp, alamat) VALUES
('PLG001', 'Budi Santoso', 'budi.santoso@email.com', '085611223344', 'Jl. Merdeka No. 12, Jakarta'),
('PLG002', 'Siti Aminah', 'siti.aminah@email.com', '085622334455', 'Jl. Mawar No. 5, Bandung'),
('PLG003', 'Rian Hidayat', 'rian.hidayat@email.com', '085633445566', 'Jl. Pemuda No. 88, Surabaya'),
('PLG004', 'Dewi Lestari', 'dewi.lestari@email.com', '085644556677', 'Jl. Diponegoro No. 45, Semarang'),
('PLG005', 'Ahmad Fauzi', 'ahmad.fauzi@email.com', '085655667788', 'Jl. Gajah Mada No. 20, Yogyakarta');

INSERT INTO pegawai (id_pegawai, nama_pegawai, peran, email, no_hp) VALUES
('PGW001', 'Andi Wijaya', 'role_admin', 'andi.admin@electromart.com', '081234567890'),
('PGW002', 'Maya Putri', 'role_penjualan', 'maya.sales@electromart.com', '081234567891'),
('PGW003', 'Eko Prasetyo', 'role_gudang', 'eko.gudang@electromart.com', '081234567892'),
('PGW004', 'Hendra Gunawan', 'role_manajer', 'hendra.manager@electromart.com', '081234567893');

INSERT INTO penjualan (id_penjualan, tanggal, id_pelanggan, id_pegawai, total_harga, diskon, total_bayar) VALUES
('TRX001', '2026-11-01 10:15:00', 'PLG001', 'PGW002', 15000000.00, 1500000.00, 13500000.00),
('TRX002', '2026-11-03 14:30:00', 'PLG002', 'PGW002', 850000.00, 0.00, 850000.00),
('TRX003', '2026-11-05 11:00:00', 'PLG003', 'PGW002', 4400000.00, 440000.00, 3960000.00),
('TRX004', '2026-11-08 16:45:00', 'PLG004', 'PGW002', 12999000.00, 1299900.00, 11699100.00);

INSERT INTO detail_penjualan (id_detail, id_penjualan, id_produk, jumlah, harga_satuan, subtotal) VALUES
(1, 'TRX001', 'PRD001', 1, 14500000.00, 14500000.00),
(2, 'TRX001', 'PRD002', 2, 250000.00, 500000.00),
(3, 'TRX002', 'PRD008', 10, 85000.00, 850000.00),
(4, 'TRX003', 'PRD003', 1, 1200000.00, 1200000.00),
(5, 'TRX003', 'PRD004', 1, 3200000.00, 3200000.00),
(6, 'TRX004', 'PRD005', 1, 12999000.00, 12999000.00);

INSERT INTO log_stok (id_log, id_produk, jumlah_perubahan, tipe_transaksi, keterangan, tanggal) VALUES
(1, 'PRD001', 16, 'MASUK', 'Stok awal barang masuk dari distributor', '2026-10-25 08:00:00'),
(2, 'PRD001', -1, 'KELUAR', 'Pengurangan stok dari TRX001', '2026-11-01 10:15:00'),
(3, 'PRD002', 52, 'MASUK', 'Stok awal barang masuk dari distributor', '2026-10-25 08:00:00'),
(4, 'PRD002', -2, 'KELUAR', 'Pengurangan stok dari TRX001', '2026-11-01 10:15:00'),
(5, 'PRD008', 110, 'MASUK', 'Stok awal barang masuk dari distributor', '2026-10-25 08:00:00'),
(6, 'PRD008', -10, 'KELUAR', 'Pengurangan stok dari TRX002', '2026-11-03 14:30:00'),
(7, 'PRD003', 4, 'MASUK', 'Stok awal barang masuk dari distributor', '2026-10-25 08:00:00'),
(8, 'PRD003', -1, 'KELUAR', 'Pengurangan stok dari TRX003', '2026-11-05 11:00:00'),
(9, 'PRD004', 9, 'MASUK', 'Stok awal barang masuk dari distributor', '2026-10-25 08:00:00'),
(10, 'PRD004', -1, 'KELUAR', 'Pengurangan stok dari TRX003', '2026-11-05 11:00:00'),
(11, 'PRD005', 11, 'MASUK', 'Stok awal barang masuk dari distributor', '2026-10-25 08:00:00'),
(12, 'PRD005', -1, 'KELUAR', 'Pengurangan stok dari TRX004', '2026-11-08 16:45:00');

CREATE INDEX idx_produk_kategori ON produk(kategori);


CREATE INDEX idx_penjualan_tanggal ON penjualan(tanggal);


CREATE INDEX idx_composite_pelanggan_tanggal ON penjualan(id_pelanggan, tanggal);


CREATE ROLE role_admin;
CREATE ROLE role_penjualan;
CREATE ROLE role_gudang;
CREATE ROLE role_manajer;


GRANT ALL PRIVILEGES ON db_electromart TO role_admin;

GRANT SELECT ON produk TO role_penjualan;
GRANT SELECT ON pelanggan TO role_penjualan;
GRANT INSERT, SELECT ON penjualan TO role_penjualan;
GRANT INSERT, SELECT ON detail_penjualan TO role_penjualan;

GRANT SELECT ON produk TO role_gudang;
GRANT UPDATE(stok) ON produk TO role_gudang;
GRANT SELECT, INSERT ON log_stok TO role_gudang;

GRANT SELECT ON produk TO role_manajer;
GRANT SELECT ON penjualan TO role_manajer;
GRANT SELECT ON detail_penjualan TO role_manajer;


REVOKE INSERT ON db_electromart.log_stok FROM 'role_gudang';
FLUSH PRIVILEGES;

select id_pelanggan, nama_pelanggan
from pelanggan;

START TRANSACTION;

INSERT INTO penjualan (id_penjualan, tanggal, id_pelanggan, id_pegawai, total_harga, diskon, total_bayar)
VALUES ('TRX005', NOW(), 'PLG001', 'PGW002', 14750000.00, 1475000.00, 13275000.00);


INSERT INTO detail_penjualan (id_penjualan, id_produk, jumlah, harga_satuan, subtotal)
VALUES ('TRX005', 'PRD001', 1, 14500000.00, 14500000.00);

select * from detail_penjualan;

UPDATE produk SET stok = stok - 1 WHERE id_produk = 'PRD001';
UPDATE produk SET stok = stok - 1 WHERE id_produk = 'PRD002';

COMMIT;

START TRANSACTION;

ROLLBACK;

START TRANSACTION;

INSERT INTO penjualan (id_penjualan, tanggal, id_pelanggan, id_pegawai, total_harga, diskon, total_bayar)
VALUES ('TRX006', NOW(), 'PLG001', 'PGW002', 15000000.00, 1500000.00, 13275000.00);

SAVEPOINT sp_sebelum_detail;

INSERT INTO detail_penjualan (id_penjualan, id_produk, jumlah, harga_satuan, subtotal)
VALUES ('TRX006', 'PRD001', 1, 14500000.00, 14500000.00);

INSERT INTO detail_penjualan (id_penjualan, id_produk, jumlah, harga_satuan, subtotal)
VALUES ('TRX006', 'PRD999', 1, 50000.00, 50000.00);
select * from detail_penjualan;
ROLLBACK TO sp_sebelum_detail;

COMMIT;


DELIMITER //
CREATE PROCEDURE SP_Tampil_Produk()
BEGIN
    SELECT * FROM produk;
END //


CREATE PROCEDURE SP_Tambah_Produk(
    IN p_id VARCHAR(10),
    IN p_nama VARCHAR(100),
    IN p_kategori VARCHAR(50),
    IN p_harga DECIMAL(12,2),
    IN p_stok INT
)
BEGIN
    INSERT INTO produk (id_produk, nama_produk, kategori, harga, stok)
    VALUES (p_id, p_nama, p_kategori, p_harga, p_stok);
END //

CREATE PROCEDURE SP_Ubah_Harga(
    IN p_id VARCHAR(10),
    IN p_harga_baru DECIMAL(12,2)
)
BEGIN
    UPDATE produk SET harga = p_harga_baru WHERE id_produk = p_id;
END //
DELIMITER ;

CALL SP_Tampil_Produk();
CALL SP_Tambah_Produk('PRD011', 'Mousepad Gaming RGB', 'Aksesoris', 150000.00, 30);
CALL SP_Ubah_Harga('PRD011', 175000.00);

DROP PROCEDURE IF EXISTS SP_Ubah_Harga;

select * from produk;


DELIMITER //
CREATE FUNCTION hitung_diskon(total_belanja DECIMAL(12,2)) 
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    DECLARE diskon DECIMAL(12,2);
    IF total_belanja >= 1000000 THEN
        SET diskon = total_belanja * 0.10;
    ELSE
        SET diskon = 0.00;
    END IF;
    RETURN diskon;
END //
DELIMITER ;

select * from penjualan;


DELIMITER //
CREATE TRIGGER validasi_penjualan
BEFORE INSERT ON detail_penjualan
FOR EACH ROW
BEGIN
    DECLARE stok_sisa INT;
    SELECT stok INTO stok_sisa FROM produk WHERE id_produk = NEW.id_produk;
    
    IF stok_sisa < NEW.jumlah THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Transaksi ditolak: Jumlah pembelian melebihi stok produk yang tersedia!';
    END IF;
END //


CREATE TRIGGER update_stok_penjualan
AFTER INSERT ON detail_penjualan
FOR EACH ROW
BEGIN
    
    UPDATE produk 
    SET stok = stok - NEW.jumlah 
    WHERE id_produk = NEW.id_produk;
    
    
    INSERT INTO log_stok (id_produk, jumlah_perubahan, tipe_transaksi, keterangan)
    VALUES (NEW.id_produk, -NEW.jumlah, 'KELUAR', CONCAT('Pengurangan stok otomatis dari detail transaksi ID: ', NEW.id_penjualan));
END //
DELIMITER ;

select * from detail_penjualan;

CREATE VIEW View_Produk AS
SELECT id_produk, nama_produk, kategori, harga, stok 
FROM produk;

CREATE VIEW View_Transaksi AS
SELECT t.id_penjualan, t.tanggal, p.nama_pelanggan, t.total_bayar 
FROM penjualan t
JOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan;

CREATE VIEW View_Laporan_Penjualan AS
SELECT DATE(t.tanggal) AS tanggal_transaksi, 
       COUNT(t.id_penjualan) AS jumlah_transaksi, 
       SUM(t.total_bayar) AS total_pendapatan
FROM penjualan t
GROUP BY DATE(t.tanggal);

CREATE VIEW View_Stok_Rendah AS
SELECT id_produk, nama_produk, kategori, stok 
FROM produk 
WHERE stok < 5;

SELECT * FROM View_Stok_Rendah;

DROP VIEW IF EXISTS View_Produk;