CREATE DATABASE pa;
USE pa;

CREATE TABLE Pasien (
  id_pasien INT AUTO_INCREMENT PRIMARY KEY,
  nama_lengkap VARCHAR(100),
  alamat VARCHAR(200),
  tanggal_lahir DATE,
  nomer_hp VARCHAR(20),
  gender VARCHAR(10),
  kontak_darurat VARCHAR(100),
  asuransi VARCHAR(200)
);

CREATE TABLE RiwayatMedis (
  id_riwayat_medis INT AUTO_INCREMENT PRIMARY KEY,
  id_pasien INT,
  kondisi_kesehatan VARCHAR(200),
  alergi VARCHAR(200),
  riwayat_keluarga VARCHAR(200),
  catatan_lainnya TEXT,
  FOREIGN KEY (id_pasien) REFERENCES Pasien(id_pasien)
);

CREATE TABLE RiwayatKunjungan (
  id_kunjungan INT AUTO_INCREMENT PRIMARY KEY,
  id_pasien INT,
  tanggal_kunjungan DATE,
  keluhan TEXT,
  diagnosa TEXT,
  resep_obat TEXT,
  hasil_lab TEXT,
  tindakan_medis TEXT,
  FOREIGN KEY (id_pasien) REFERENCES Pasien(id_pasien)
);

CREATE TABLE CatatanDokter (
  id_catatan INT AUTO_INCREMENT PRIMARY KEY,
  id_kunjungan INT,
  nama_dokter VARCHAR(100),
  tanggal TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  catatan TEXT,
  FOREIGN KEY (id_kunjungan) REFERENCES RiwayatKunjungan(id_kunjungan)
);

CREATE TABLE HasilTesLab (
  id_tes INT AUTO_INCREMENT PRIMARY KEY,
  id_kunjungan INT,
  nama_lab VARCHAR(100),
  tanggal_tes DATE,
  hasil_tes TEXT,
  FOREIGN KEY (id_kunjungan) REFERENCES RiwayatKunjungan(id_kunjungan)
);
