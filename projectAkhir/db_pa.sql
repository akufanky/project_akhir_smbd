CREATE DATABASE pa;
USE pa;

CREATE TABLE pasien (
  pasien_id INT PRIMARY KEY,
  nama_lengkap VARCHAR(100),
  alamat VARCHAR(200),
  tanggal_lahir DATE,
  nomer_hp VARCHAR(20),
  gender VARCHAR(10),
  riwayat_kesehatan VARCHAR(500),
  prosedur_operasi VARCHAR(500),
  konsultasi VARCHAR(500),
  alergi VARCHAR(500),
  informasi_asuransi VARCHAR(200)
);

INSERT INTO pasien
VALUES
(1,"Kipli Sukipli","Jl. Bunga Indah","1990-03-15",08181818181,"Laki-Laki","Diabetes","Tidak Ada","Umum - Dr. Lili (2022-02-15)","Tidak Ada","BPJS");

CREATE TABLE listObat (
  obat_id INT PRIMARY KEY,
  nama_obat VARCHAR(100),
  kandungan VARCHAR(500),
  harga DECIMAL(10, 2)
);

INSERT INTO listObat
VALUES
(1, 'Paracetamol', 'Paracetamol 500mg', 5000.00),
(2, 'Amoxicillin', 'Amoxicillin 250mg, Clavulanic Acid 125mg', 4000.00),
(3, 'Loratadine', 'Loratadine 10mg', 4000.00),
(4, 'Omeprazole', 'Omeprazole 20mg', 5000.00);

CREATE TABLE dokter (
  dokter_id INT PRIMARY KEY,
  nama_lengkap VARCHAR(100),
  spesialis VARCHAR(100),
  nomer_hp VARCHAR(20),
  email VARCHAR(100)
);

INSERT INTO dokter
VALUES
(1, 'Dr. Lili', 'Umum', '04731738', 'lili@dokter.com'),
(2, 'Dr. Jaden', 'Umum', '987654321', 'jaden@dokter.com'),
(3, 'Dr. Syaiful', 'Penyakit Dalam', '456789123', 'syaiful@dokter.com');

CREATE TABLE History (
  history_id INT AUTO_INCREMENT PRIMARY KEY,
  nama_tabel VARCHAR(100),
  aksi VARCHAR(100),
  tanggal TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE PROCEDURE InsertPasienBaru(
  IN p_pasien_id INT,
  IN p_nama_lengkap VARCHAR(100),
  IN p_alamat VARCHAR(200),
  IN p_tanggal_lahir DATE,
  IN p_nomer_hp VARCHAR(20),
  IN p_gender VARCHAR(10),
  IN p_riwayat_kesehatan VARCHAR(500),
  IN p_prosedur_operasi VARCHAR(500),
  IN p_konsultasi VARCHAR(500),
  IN p_alergi VARCHAR(500),
  IN p_informasi_asuransi VARCHAR(200)
)
BEGIN
  INSERT INTO pasien
  VALUES (p_pasien_id, p_nama_lengkap, p_alamat, p_tanggal_lahir,p_nomer_hp, p_gender, p_riwayat_kesehatan, p_prosedur_operasi,p_konsultasi,p_alergi,p_informasi_asuransi);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertObatBaru(
  IN o_obat_id INT,
  IN o_nama_obat VARCHAR(100),
  IN o_kandungan VARCHAR(500),
  IN o_harga VARCHAR(200)
)
BEGIN
  INSERT INTO obat
  VALUES (o_obat_id, o_nama_obat,o_kandungan,o_harga);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertDokterBaru(
  IN d_dokter_id INT,
  IN d_nama_lengkap VARCHAR(100),
  IN d_spesialis VARCHAR(100),
  IN d_nomer_hp VARCHAR(20),
  IN d_email VARCHAR(100)
)
BEGIN
  INSERT INTO dokter
  VALUES (d_dokter_id, d_nama_lengkap,d_spesialis,d_nomer_hp,d_email);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE HapusPasien(
  IN p_pasien_id INT
)
BEGIN
  DELETE FROM pasien WHERE pasien_id = p_pasien_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE HapusObat(
  IN o_obat_id INT
)
BEGIN
  DELETE FROM obat WHERE obat_id = o_obat_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE HapusDokter(
  IN d_dokter_id INT
)
BEGIN
  DELETE FROM dokter WHERE dokter_id = d_dokter_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdatePasien(
  IN p_pasien_id INT,
  IN p_nama_lengkap VARCHAR(100),
  IN p_alamat VARCHAR(200),
  IN p_tanggal_lahir DATE,
  IN p_nomer_hp VARCHAR(20),
  IN p_gender VARCHAR(10),
  IN p_riwayat_kesehatan VARCHAR(500),
  IN p_prosedur_operasi VARCHAR(500),
  IN p_konsultasi VARCHAR(500),
  IN p_alergi VARCHAR(500),
  IN p_informasi_asuransi VARCHAR(200)
)
BEGIN
  UPDATE pasien
  SET nama_lengkap = p_nama_lengkap,
      alamat = p_alamat,
      tanggal_lahir = p_tanggal_lahir,
      nomer_hp = p_nomer_hp,
      gender = p_gender,
      riwayat_kesehatan = p_riwayat_kesehatan,
      prosedur_operasi = p_prosedur_operasi,
      konsultasi = p_konsultasi,
      alergi = p_alergi,
	  informasi_asuransi = p_informasi_asuransi
  WHERE pasien_id = p_pasien_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateObat(
  IN o_obat_id INT,
  IN o_nama_obat VARCHAR(100),
  IN o_kandungan VARCHAR(500),
  IN o_harga VARCHAR(200)
)
BEGIN
  UPDATE obat
  SET nama_obat = o_nama_obat,
	  kandungan = o_kandungan,
      harga = o_harga
  WHERE obat_id = o_obat_id;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateDokter(
  IN d_dokter_id INT,
  IN d_nama_lengkap VARCHAR(100),
  IN d_spesialis VARCHAR(100),
  IN d_nomer_hp VARCHAR(20),
  IN d_email VARCHAR(100)
)
BEGIN
  UPDATE dokter
  SET nama_lengkap = d_nama_lengkap,
      spesialis = d_spesialis,
      nomer_hp = d_nomer_hp,
      email = d_email
  WHERE dokter_id = d_dokter_id;
END//
DELIMITER ;
