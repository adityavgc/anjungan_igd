# Panduan Kontribusi

## Alur kerja (branching)
| Branch | Fungsi |
|---|---|
| `main` | Kode stabil, siap dikumpulkan/didemokan. Tidak boleh di-push langsung. |
| `develop` | Gabungan fitur yang sudah selesai dan diuji. |
| `feature/<nama-fitur>` | Pengerjaan satu fitur, contoh `feature/login-petugas`. |
| `fix/<nama-bug>` | Perbaikan bug, contoh `fix/validasi-nik`. |
| `docs/<topik>` | Perubahan dokumentasi saja. |

Langkah singkat:
1. Ambil tugas dari tab **Issues**, lalu tulis nama Anda di *Assignees*.
2. Buat branch dari `develop`: `git checkout develop && git pull && git checkout -b feature/<nama>`.
3. Commit kecil dan sering, lalu `git push -u origin feature/<nama>`.
4. Buka **Pull Request** ke `develop`, isi template, dan hubungkan ke issue (`Closes #nomor`).
5. Minta minimal satu anggota lain mereview. Setelah disetujui, gabungkan (*merge*) dan hapus branch.
6. Setelah `develop` stabil, buat Pull Request `develop` ke `main`.

## Format pesan commit
Format: `jenis: ringkasan singkat (maks. 72 karakter)`

| Jenis | Dipakai untuk |
|---|---|
| `feat` | fitur baru |
| `fix` | perbaikan bug |
| `docs` | dokumentasi |
| `style` | format/tampilan tanpa mengubah logika |
| `refactor` | merapikan kode tanpa mengubah perilaku |
| `test` | pengujian |
| `chore` | pengaturan proyek, dependensi |

Contoh: `feat: tambah validasi NIK pada form identitas`, `fix: tampilkan pesan error saat login gagal`.

## Aturan penting
- Jangan commit berkas `.sqlite`, `.env`, atau folder `venv/`.
- Satu Pull Request untuk satu fitur atau perbaikan.
- Selesaikan konflik di branch Anda sebelum meminta review.
