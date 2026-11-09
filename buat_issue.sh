#!/usr/bin/env bash
# Membuat label dan issue awal (backlog) memakai GitHub CLI.
# Prasyarat: https://cli.github.com/ terpasang, sudah `gh auth login`, dan dijalankan dari folder repo.
set -e

for l in "frontend:1d76db" "backend:5319e7" "database:fbca04" "ml:0e8a16" "docs:c5def5"; do
  gh label create "${l%%:*}" --color "${l##*:}" --force
done

gh issue create --title "Setup struktur proyek dan basis data" --label database,docs --body "Buat struktur folder, jalankan database/schema.sql, isi data awal pertanyaan kuesioner. (SRS bagian 2.4, 2.5, 3.3)"
gh issue create --title "Login dan logout petugas IGD" --label frontend,backend --body "Halaman login, verifikasi username dan password, pesan error, logout. (FR-01, FR-02, FR-03, NFR-04, NFR-05)"
gh issue create --title "Form identitas pasien dan pilihan penjamin" --label frontend --body "Validasi NIK dan nama, pilihan penjamin JKN/BPJS, asuransi lain, umum. (FR-04, FR-05)"
gh issue create --title "Kuesioner skrining Red Flag" --label frontend --body "Tampilkan kuesioner dan tangani jawaban Tidak Tahu. (FR-06, FR-07)"
gh issue create --title "Flask API klasifikasi Decision Tree" --label backend,ml --body "Aturan klinis dan model Decision Tree, kembalikan status penanganan Level A, B, C/D. (FR-08, FR-09, NFR-01)"
gh issue create --title "Dashboard antrean dan penanda Red Flag" --label frontend,backend --body "Daftar kunjungan, penanda merah untuk Red Flag. (FR-11)"
gh issue create --title "Filter kunjungan berdasarkan tanggal dan status Red Flag" --label frontend,backend --body "(FR-10)"
gh issue create --title "Detail pasien pada dashboard" --label frontend,backend --body "Identitas, penjamin, dan hasil skrining. (FR-12)"
gh issue create --title "Ringkasan analisis data (data mining deskriptif)" --label backend,ml --body "(FR-13)"
gh issue create --title "Cetak bukti hasil skrining" --label frontend --body "(FR-14)"
gh issue create --title "Pengujian dan perapian dokumentasi" --label docs --body "Uji alur utama, perbarui README, SRS, dan diagram bila ada perubahan."
