# Panduan Git dan GitHub untuk Tim

## A. Satu orang (ketua tim) menyiapkan repository
1. Buat repository baru di GitHub, misalnya `anjungan-skrining-igd` (jangan centang "Add README", karena sudah ada).
2. Undang anggota: **Settings > Collaborators > Add people**.
3. Dari folder proyek di komputer:
```bash
git init -b main
git add .
git commit -m "chore: inisialisasi struktur proyek"
git remote add origin https://github.com/<username>/anjungan-skrining-igd.git
git push -u origin main
git checkout -b develop && git push -u origin develop
```
4. (Opsional) Aktifkan perlindungan branch: **Settings > Branches > Add rule** untuk `main`, centang *Require a pull request before merging*.
5. (Opsional) Buat issue awal dengan GitHub CLI: `bash scripts/buat_issue.sh`.

## B. Setiap anggota tim
```bash
git clone https://github.com/<username>/anjungan-skrining-igd.git
cd anjungan-skrining-igd
git config user.name  "Nama Anda"
git config user.email "email-github-anda@contoh.com"
```
Pastikan nama dan email sesuai akun GitHub masing-masing, supaya kontribusi tercatat atas nama Anda.

## C. Alur kerja harian
```bash
git checkout develop && git pull                  # ambil perubahan terbaru
git checkout -b feature/login-petugas             # satu branch untuk satu fitur
# ... edit kode ...
git add .
git commit -m "feat: tambah halaman login petugas"
git push -u origin feature/login-petugas
```
Lalu di GitHub: **Compare & pull request** ke `develop`, isi template, minta review, dan merge setelah disetujui.

## D. Menangani konflik
```bash
git checkout feature/login-petugas
git fetch origin
git merge origin/develop          # bila ada konflik, edit berkas bertanda <<<<<<<, lalu:
git add <berkas>
git commit
git push
```

## E. Perintah yang sering dipakai
| Perintah | Fungsi |
|---|---|
| `git status` | melihat berkas yang berubah |
| `git log --oneline --graph --all` | melihat riwayat commit dan cabang |
| `git diff` | melihat perubahan yang belum di-commit |
| `git branch -d <nama>` | menghapus branch lokal setelah merge |
| `git restore <berkas>` | membatalkan perubahan yang belum di-commit |

## F. Bukti yang perlu diambil untuk laporan
Ambil tangkapan layar pada GitHub:
1. Halaman utama repository (README, daftar folder).
2. **Insights > Contributors** atau daftar commit yang menunjukkan kontribusi semua anggota.
3. Tab **Issues** (sebagian terbuka, sebagian tertutup) dan penugasan (*assignee*).
4. Minimal satu **Pull Request** beserta komentar review dan status *merged*.
5. Grafik cabang: **Insights > Network** atau `git log --oneline --graph --all`.
