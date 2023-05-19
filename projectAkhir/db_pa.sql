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