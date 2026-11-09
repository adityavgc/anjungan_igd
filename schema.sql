-- Skema basis data SQLite, disusun dari Class Diagram pada SRS (Appendix B.8).
-- Jalankan: sqlite3 database/igd.sqlite < database/schema.sql
PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS pasien (
    nik           TEXT PRIMARY KEY,
    nama_lengkap  TEXT NOT NULL,
    tgl_lahir     TEXT NOT NULL,
    kontak        TEXT
);

CREATE TABLE IF NOT EXISTS penjamin (
    kode_penjamin  INTEGER PRIMARY KEY AUTOINCREMENT,
    nama_penjamin  TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS petugas (
    kode_petugas  INTEGER PRIMARY KEY AUTOINCREMENT,
    nama_petugas  TEXT NOT NULL,
    username      TEXT NOT NULL UNIQUE,
    password      TEXT NOT NULL,   -- catatan: hashing password belum diterapkan
    peran         TEXT NOT NULL CHECK (peran IN ('Petugas IGD', 'Administrator'))
);

-- status_kunjungan mengikuti State Machine Diagram (SRS B.7), misalnya:
-- 'Mengisi Identitas', 'Skrining Berlangsung', 'Red Flag', 'Perlu Konfirmasi Petugas', 'Non-Gawat', 'Ditinjau Petugas IGD'
CREATE TABLE IF NOT EXISTS kunjungan (
    no_kunjungan      INTEGER PRIMARY KEY AUTOINCREMENT,
    tgl_kunjungan     TEXT NOT NULL,
    waktu_kunjungan   TEXT NOT NULL,
    status_kunjungan  TEXT NOT NULL,
    nik               TEXT NOT NULL REFERENCES pasien(nik),
    kode_penjamin     INTEGER NOT NULL REFERENCES penjamin(kode_penjamin),
    kode_petugas      INTEGER REFERENCES petugas(kode_petugas)   -- kosong sampai ditinjau petugas (0..1)
);

CREATE TABLE IF NOT EXISTS pertanyaan (
    kode_pertanyaan  INTEGER PRIMARY KEY AUTOINCREMENT,
    teks_pertanyaan  TEXT NOT NULL
);

-- association class antara kunjungan dan pertanyaan
CREATE TABLE IF NOT EXISTS jawaban (
    no_kunjungan     INTEGER NOT NULL REFERENCES kunjungan(no_kunjungan),
    kode_pertanyaan  INTEGER NOT NULL REFERENCES pertanyaan(kode_pertanyaan),
    nilai_jawaban    TEXT NOT NULL CHECK (nilai_jawaban IN ('Ya', 'Tidak', 'Tidak Tahu')),
    PRIMARY KEY (no_kunjungan, kode_pertanyaan)
);

CREATE TABLE IF NOT EXISTS hasil_skrining (
    no_hasil             INTEGER PRIMARY KEY AUTOINCREMENT,
    no_kunjungan         INTEGER NOT NULL UNIQUE REFERENCES kunjungan(no_kunjungan),
    status_red_flag      INTEGER NOT NULL CHECK (status_red_flag IN (0, 1)),
    level_penanganan     TEXT NOT NULL,
    arahan_penanganan    TEXT
);

-- Data awal penjamin (SRS FR-05)
INSERT OR IGNORE INTO penjamin (nama_penjamin) VALUES ('JKN/BPJS'), ('Asuransi Lain'), ('Umum/Mandiri');
