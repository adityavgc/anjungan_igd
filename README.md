# Sistem Anjungan Skrining Mandiri & Manajemen IGD (RSUD Jaya Utama)

Aplikasi web untuk skrining kegawatdaruratan mandiri di Instalasi Gawat Darurat (IGD). Pasien mengisi identitas dan kuesioner gejala *Red Flag* pada mesin anjungan (kiosk); sistem mengklasifikasikan hasilnya dengan aturan klinis dan model *Decision Tree*, lalu petugas IGD memantau antrean melalui *dashboard*.

Proyek mata kuliah Rekayasa Perangkat Lunak, Universitas Indraprasta PGRI (UNINDRA), 2026.

## Fitur utama
- Pendaftaran identitas pasien dan pemilihan penjamin (FR-04, FR-05)
- Kuesioner skrining *Red Flag* dan penanganan jawaban "Tidak Tahu" (FR-06, FR-07)
- Klasifikasi otomatis dengan Flask API, aturan klinis, dan *Decision Tree* (FR-08, FR-09)
- Login petugas, *dashboard* antrean, filter, detail pasien, dan ringkasan analisis data (FR-01 sampai FR-03, FR-10 sampai FR-13)
- Cetak bukti hasil skrining (FR-14)

Spesifikasi lengkap ada di [`docs/SRS_Self_Registrasi.docx`](docs/SRS_Self_Registrasi.docx).

## Teknologi
| Lapisan | Teknologi |
|---|---|
| Antarmuka | HTML5, Tailwind CSS, PHP 8.x |
| Backend / data mining | Python 3, Flask API, scikit-learn, numpy |
| Basis data | SQLite |
| Komunikasi | HTTP, REST API (JSON) |

## Struktur folder
```
anjungan-skrining-igd/
├── frontend/          # halaman PHP + HTML (public/) dan berkas bersama (includes/)
├── backend/           # Flask API, aturan klinis, model Decision Tree (model/)
├── database/          # schema.sql (basis data .sqlite tidak ikut di-commit)
├── docs/              # SRS, diagram UML, panduan Git, laporan tugas
├── scripts/           # skrip bantu (membuat issue awal)
└── .github/           # template issue dan pull request
```

## Menjalankan di komputer lokal
> Sesuaikan perintah dengan struktur kode yang sebenarnya.

```bash
# 1. Basis data
sqlite3 database/igd.sqlite < database/schema.sql

# 2. Backend Flask
cd backend
python -m venv venv && source venv/bin/activate      # Windows: venv\Scripts\activate
pip install -r requirements.txt
python app.py

# 3. Antarmuka PHP (terminal lain)
php -S localhost:8000 -t frontend/public
```

## Tim
| Nama | GitHub | Peran |
|---|---|---|
| Agam Maharaka Ditya | @isi-username | isi |
| Ardika Julianto | @isi-username | isi |
| Saeful Anan | @isi-username | isi |

## Kontribusi
Baca [`CONTRIBUTING.md`](CONTRIBUTING.md) dan [`docs/PANDUAN_GIT.md`](docs/PANDUAN_GIT.md) sebelum mulai bekerja.
