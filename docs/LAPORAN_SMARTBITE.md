# LAPORAN TUGAS AKHIR PROYEK
# TEKNOLOGI PEMROGRAMAN MOBILE

## IMPLEMENTASI FLUTTER DAN DART DALAM PEMBUATAN APLIKASI SMART MEAL PLANNER & BUDGET TRACKER (SMARTBITE APP)

---

**Oleh:**

| Nama | NIM |
|------|-----|
| Shafa Kamila Hidayah | 123230130 |
| Fadhila Haedy Rusyda | 123230159 |

---

**PROGRAM STUDI INFORMATIKA**  
**JURUSAN INFORMATIKA**  
**FAKULTAS TEKNIK INDUSTRI**  
**UNIVERSITAS PEMBANGUNAN NASIONAL "VETERAN" YOGYAKARTA**  
**2026**

---

## KATA PENGANTAR

Puji syukur kami panjatkan ke hadirat Tuhan Yang Maha Esa atas segala rahmat dan karunia-Nya sehingga laporan Tugas Akhir Proyek Teknologi Pemrograman Mobile yang berjudul **"Implementasi Flutter dan Dart dalam Pembuatan Aplikasi Smart Meal Planner & Budget Tracker (SmartBite App)"** ini dapat diselesaikan dengan baik.

Laporan ini disusun sebagai bentuk pertanggungjawaban atas pelaksanaan proyek akhir pada mata kuliah Teknologi Pemrograman Mobile, Program Studi Informatika, Fakultas Teknik Industri, Universitas Pembangunan Nasional "Veteran" Yogyakarta.

Aplikasi SmartBite dikembangkan dengan tujuan membantu pengguna dalam merencanakan pola makan sehat sekaligus mengelola anggaran konsumsi secara lebih cerdas dan efisien. Aplikasi ini mengintegrasikan berbagai teknologi modern seperti AI Gemini, sensor perangkat, database lokal SQLite, serta layanan peta dan konversi mata uang dalam satu platform mobile berbasis Flutter.

Dalam proses penyelesaian proyek dan penyusunan laporan ini, kami banyak mendapatkan bimbingan, arahan, dan dukungan dari berbagai pihak. Oleh karena itu, kami menyampaikan terima kasih kepada:

1. Bapak **Bagus Muhammad Akbar, S.ST., M.Kom.** selaku Dosen Mata Kuliah Teknologi Pemrograman Mobile yang telah memberikan bimbingan, ilmu, dan arahan selama perkuliahan.
2. Seluruh dosen dan staf Program Studi Informatika UPN "Veteran" Yogyakarta yang telah memberikan bekal ilmu pengetahuan.
3. Rekan-rekan mahasiswa yang telah memberikan dukungan dan masukan selama proses pengembangan.
4. Semua pihak yang tidak dapat disebutkan satu per satu yang telah membantu kelancaran penyelesaian proyek ini.

Kami menyadari bahwa laporan ini masih jauh dari sempurna. Oleh karena itu, kritik dan saran yang membangun sangat kami harapkan demi perbaikan di masa mendatang. Semoga laporan ini dapat bermanfaat bagi pembaca dan menjadi referensi yang berguna bagi pengembangan aplikasi mobile di masa yang akan datang.

Yogyakarta, Juni 2026

**Penulis**

---

## HALAMAN PENGESAHAN

**LAPORAN TUGAS AKHIR TEKNOLOGI PEMROGRAMAN MOBILE**

Disusun oleh:

- Shafa Kamila Hidayah — 123230130
- Fadhila Haedy Rusyda — 123230159

Telah Diperiksa dan Disetujui oleh Dosen Mata Kuliah Teknologi dan Pemrograman Mobile

Pada Tanggal: ___________________________

Menyetujui,  
Dosen Mata Kuliah Teknologi dan Pemrograman Mobile

**Bagus Muhammad Akbar S.ST., M.Kom.**  
NIP. 19890801 201903 1 013

---

## DAFTAR ISI

1. Latar Belakang
2. Tujuan dan Manfaat
3. Landasan Teori
4. Analisis Kebutuhan Sistem
5. Perancangan Sistem
6. Implementasi
7. Pengujian
8. Kesimpulan dan Saran
9. Lampiran
10. Daftar Pustaka

---

## BAB I — PENDAHULUAN

### 1.1. Latar Belakang

Pola makan yang tidak teratur dan pengelolaan keuangan yang kurang baik merupakan dua permasalahan umum yang dihadapi masyarakat modern, khususnya kalangan mahasiswa dan pekerja muda. Banyak individu mengalami kesulitan dalam merencanakan menu makan yang sehat sesuai kebutuhan gizi, sekaligus menjaga agar pengeluaran untuk konsumsi tetap berada dalam batas anggaran yang ditetapkan.

Perkembangan teknologi mobile, khususnya platform Android, memberikan peluang besar untuk membantu menyelesaikan permasalahan tersebut melalui aplikasi yang mudah diakses kapan saja dan di mana saja. Integrasi kecerdasan buatan (AI) ke dalam aplikasi mobile juga semakin memungkinkan pemberian rekomendasi yang bersifat personal, adaptif terhadap profil dan kebiasaan masing-masing pengguna.

Berdasarkan latar belakang tersebut, dikembangkanlah aplikasi **SmartBite** — sebuah Smart Meal Planner dan Budget Tracker berbasis Flutter yang mengintegrasikan AI Gemini untuk memberikan rekomendasi menu makanan personal, melacak anggaran belanja mingguan, serta menyediakan insight nutrisi berdasarkan pola makan pengguna.

### 1.2. Tujuan Proyek

1. Membangun aplikasi mobile Android menggunakan Flutter dan Dart yang mampu membantu pengguna merencanakan menu makan harian dan mingguan.
2. Mengimplementasikan fitur pelacakan anggaran (budget tracker) untuk memantau pengeluaran makanan secara real-time.
3. Mengintegrasikan AI Gemini API untuk menghasilkan rekomendasi menu yang dipersonalisasi berdasarkan profil nutrisi pengguna.
4. Menerapkan berbagai sensor perangkat (accelerometer, gyroscope) untuk meningkatkan pengalaman pengguna.
5. Mengimplementasikan sistem autentikasi yang aman menggunakan enkripsi SHA-256 dan penyimpanan sesi terenkripsi.

### 1.3. Manfaat Proyek

1. **Bagi Pengguna**: Membantu merencanakan pola makan sehat yang sesuai dengan budget dan tujuan nutrisi secara efisien.
2. **Bagi Mahasiswa**: Memberikan pengalaman praktis membangun aplikasi mobile berfitur lengkap dengan teknologi modern.
3. **Bagi Akademik**: Menjadi referensi implementasi Flutter dengan integrasi AI, sensor, database lokal, dan layanan eksternal.

---

## BAB II — LANDASAN TEORI

### 2.1. Flutter

Flutter adalah framework open-source dari Google yang digunakan untuk membangun aplikasi mobile, web, dan desktop dari satu basis kode (single codebase). Flutter menggunakan bahasa Dart dan menyediakan widget yang memudahkan pengembangan antarmuka pengguna yang konsisten di berbagai platform. Pada aplikasi SmartBite, Flutter digunakan sebagai framework utama dengan dukungan ekosistem package yang lengkap dan arsitektur berbasis widget yang reaktif.

### 2.2. Dart

Dart adalah bahasa pemrograman berorientasi objek yang dikembangkan oleh Google. Dart mendukung pemrograman asinkron melalui mekanisme `async/await` dan `Future`, yang sangat berguna dalam pengembangan aplikasi mobile yang banyak melibatkan operasi jaringan dan database. SmartBite ditulis sepenuhnya dalam Dart.

### 2.3. Provider (State Management)

Provider adalah package state management yang digunakan di SmartBite untuk memisahkan logika bisnis dari tampilan (UI). Setiap fitur memiliki class `ChangeNotifier` sendiri (seperti `BudgetProvider`, `RecommendationProvider`, `AiNutritionProvider`) yang diregistrasi melalui `MultiProvider` di `main.dart`.

### 2.4. SQLite (sqflite)

SQLite adalah database relasional ringan yang bekerja langsung sebagai file di perangkat tanpa memerlukan server terpisah. Pada SmartBite, SQLite diakses melalui package `sqflite` dan digunakan untuk menyimpan data user, budget, expenses, dan planner dalam file `smart_meal_planner.db`. Database diinisialisasi dengan versi 2 dan mendukung mekanisme upgrade skema.

### 2.5. SharedPreferences

SharedPreferences digunakan untuk menyimpan data sederhana dalam bentuk key-value secara persisten di perangkat. Pada SmartBite, SharedPreferences menyimpan data seperti menu AI tersimpan per user, riwayat chat AI, profil nutrisi, pengaturan mata uang, zona waktu, skor game, dan preferensi biometrik. Data disimpan dengan key yang di-scope per user ID untuk menghindari konflik antar akun.

### 2.6. Flutter Secure Storage

Flutter Secure Storage digunakan untuk menyimpan data sensitif, seperti user ID sesi login, secara terenkripsi. Pada SmartBite, `AuthService` menggunakan Flutter Secure Storage untuk menyimpan dan membaca session token, sehingga data sesi tidak dapat diakses oleh aplikasi lain.

### 2.7. Gemini API

Gemini API adalah layanan AI generatif dari Google yang mampu menghasilkan teks, menjawab pertanyaan, dan membantu proses rekomendasi berbasis prompt. SmartBite menggunakan model `gemini-2.0-flash` sebagai provider utama untuk fitur AI Nutrition Assistant. Sebagai fallback, SmartBite juga mendukung OpenRouter API yang dapat menggunakan berbagai model LLM lain. Jika kedua provider gagal, sistem akan menggunakan mekanisme rekomendasi lokal berbasis template.

### 2.8. ExchangeRate API

ExchangeRate API (`v6.exchangerate-api.com`) digunakan untuk mengambil data kurs mata uang secara real-time. SmartBite mendukung 11 mata uang (IDR, USD, EUR, GBP, JPY, CNY, AUD, CAD, CHF, SGD, INR) dan menyimpan kurs terakhir di SharedPreferences sebagai fallback saat tidak ada koneksi internet.

### 2.9. Google Maps & Places API

Google Maps Flutter digunakan untuk menampilkan peta interaktif pada fitur Location. Google Places Nearby Search API digunakan untuk mencari pasar dan supermarket dalam radius 5 km dari lokasi pengguna. Navigasi ke lokasi dipandu melalui deep link ke aplikasi Google Maps.

### 2.10. Local Notification

Local notification diimplementasikan menggunakan `flutter_local_notifications` dengan zona waktu Asia/Jakarta. SmartBite menjadwalkan tiga notifikasi pengingat makan per hari (sarapan 07.00, makan siang 12.00, makan malam 19.00) serta notifikasi peringatan budget saat pengeluaran mencapai 80% dan 90% dari limit mingguan.

### 2.11. Sensor Perangkat (sensors_plus)

Package `sensors_plus` digunakan untuk mengakses accelerometer dan gyroscope perangkat. Pada SmartBite, sensor digunakan untuk dua fitur: (1) mekanisme *shake-to-random* untuk memilih menu secara acak di Meal Planner, dan (2) kontrol pergerakan keranjang pada fitur Game menggunakan accelerometer.

### 2.12. Enkripsi SHA-256

Password pengguna dienkripsi menggunakan algoritma SHA-256 melalui package `crypto` sebelum disimpan ke database SQLite. Proses verifikasi dilakukan dengan membandingkan hash password yang diinput dengan hash yang tersimpan, sehingga password asli tidak pernah disimpan dalam bentuk plaintext.

### 2.13. Biometrik (local_auth)

Package `local_auth` digunakan untuk mengimplementasikan autentikasi biometrik (sidik jari atau pengenalan wajah). Pengguna dapat mengaktifkan fitur ini setelah login manual, dan selanjutnya dapat masuk ke aplikasi hanya dengan biometrik tanpa memasukkan password kembali.

### 2.14. TheMealDB API

TheMealDB (`www.themealdb.com`) adalah API publik gratis yang menyediakan database resep masakan dari seluruh dunia. SmartBite mengintegrasikan TheMealDB pada fitur pencarian menu di Meal Planner, memungkinkan pengguna mencari resep dari internet dan menambahkannya ke planner mingguan.

---

## BAB III — ANALISIS DAN PERANCANGAN SISTEM

### 3.1. Analisis Kebutuhan Fungsional

| No | Kebutuhan | Keterangan |
|----|-----------|------------|
| 1 | Register dan Login | User dapat membuat akun baru dan masuk ke aplikasi menggunakan email dan password. |
| 2 | Login Biometrik | User dapat login menggunakan sidik jari atau pengenalan wajah jika perangkat mendukung. |
| 3 | Profil User | User dapat mengatur profil, foto profil, mata uang tampilan, dan zona waktu. |
| 4 | Meal Planner | User dapat menyusun menu makan harian (Breakfast, Lunch, Dinner) untuk tujuh hari ke depan. || 5 | AI Nutrition Assistant | User dapat meminta rekomendasi menu personal dan bertanya kepada chatbot AI berbasis Gemini. |
| 6 | AI Weekly Insight | Aplikasi menampilkan insight kalori mingguan, prediksi perubahan berat badan, peringatan kebiasaan, dan rekomendasi. |
| 7 | Budget Tracker | User dapat mencatat pengeluaran, memantau sisa budget, dan melihat breakdown per kategori. |
| 8 | Konversi Mata Uang & Zona Waktu | Seluruh tampilan harga mengikuti mata uang dan zona waktu yang dipilih pengguna. |
| 9 | Location Grocery | User dapat melihat pasar dan supermarket terdekat di peta beserta fitur navigasi. |
| 10 | Notifikasi | Aplikasi memberikan pengingat makan tiga kali sehari dan peringatan saat budget mendekati limit. |
| 11 | Game SmartBite Catch | User dapat bermain game tangkap makanan sehat berbasis sensor accelerometer. |
| 12 | Pengaturan Akun | User dapat mengubah username, email, dan password. |
| 13 | Saran & Kesan | User dapat membaca dan mengisi halaman saran dan kesan kuliah TPM. |

### 3.2. Analisis Kebutuhan Non-Fungsional

| No | Kebutuhan | Keterangan |
|----|-----------|------------|
| 1 | Usability | Tampilan Material Design 3 yang intuitif, responsif, dan konsisten di berbagai ukuran layar Android. |
| 2 | Performance | Aplikasi merespons input pengguna dalam waktu < 2 detik untuk operasi lokal. |
| 3 | Security | Password di-hash SHA-256, session user ID disimpan di Flutter Secure Storage. |
| 4 | Reliability | Data utama tersimpan secara lokal (SQLite & SharedPreferences) tanpa ketergantungan penuh pada server. |
| 5 | Maintainability | Kode diorganisasi menggunakan arsitektur feature-based dengan pemisahan layer model, provider, service, dan screen. |
| 6 | Availability | Fitur inti (planner, budget) tetap berfungsi tanpa koneksi internet. Fitur AI dan maps memerlukan koneksi. |

### 3.3. Use Case Diagram

Aktor utama dalam sistem adalah **User** (pengguna terdaftar). Berikut daftar use case yang tersedia:

- UC-01: Register Akun
- UC-02: Login (Manual)
- UC-03: Login (Biometrik)
- UC-04: Logout
- UC-05: Edit Profil & Foto
- UC-06: Lihat & Atur Meal Planner
- UC-07: Cari Menu (Library & TheMealDB)
- UC-08: Random Menu (Shake)
- UC-09: Generate Rekomendasi AI
- UC-10: Chat dengan AI Nutrition Assistant
- UC-11: Lihat Weekly Insight
- UC-12: Tambah/Edit/Hapus Pengeluaran
- UC-13: Set Budget Mingguan
- UC-14: Pilih Mata Uang & Zona Waktu
- UC-15: Lihat Lokasi Grocery Terdekat
- UC-16: Navigasi ke Lokasi
- UC-17: Bermain Game SmartBite Catch
- UC-18: Terima Notifikasi Makan & Budget

### 3.4. Flowchart Sistem

**Alur Utama Aplikasi:**

```
[Buka App] 
    → Splash Screen (900ms)
    → Cek Session (Flutter Secure Storage)
        → [Sudah Login] → HomePage
        → [Belum Login]  → LoginPage
                            → [Login Manual] → Validasi DB → Simpan Session → HomePage
                            → [Login Biometrik] → Autentikasi → Restore Session → HomePage
```

**Alur Meal Planner:**

```
[MealPlannerPage]
    → Load Preferences (currency, timezone) dari SharedPreferences
    → Load Planner Store dari SharedPreferences
    → Tampil 7 hari × 3 waktu makan
    → [Tap "+ Tambah"]
        → SearchWidget
            → [Cari dari Library (saved meals)]
            → [Cari dari TheMealDB API] (jika aktif)
            → [Shake HP] → Random menu
        → Pilih menu → Simpan ke planner store
    → [Tap panah kiri/kanan] → Navigasi minggu sebelum/berikutnya
```

**Alur Budget Tracker:**

```
[BudgetPage]
    → Load Budget & Expenses dari SQLite
    → [Tambah Pengeluaran (FAB)]
        → Input nama, harga, kategori
        → Cek: harga ≤ sisa budget?
            → [Ya]  → Simpan ke SQLite → Update budget spent
                     → Cek threshold (80%, 90%) → Kirim notifikasi jika perlu
            → [Tidak] → Tolak & kirim notifikasi budget tidak cukup
    → [Edit/Hapus] → Update/Delete dari SQLite → Recalculate spent
```

### 3.5. Activity Diagram Login

| Langkah | Aktor | Sistem |
|---------|-------|--------|
| 1 | Masukkan email & password | — |
| 2 | Tap tombol LOGIN | — |
| 3 | — | Validasi field tidak kosong |
| 4 | — | Hash password dengan SHA-256 |
| 5 | — | Query tabel `users` di SQLite |
| 6a | — | [Ditemukan] Simpan user ID ke Secure Storage → Navigasi ke HomePage |
| 6b | — | [Tidak Ditemukan] Tampilkan SnackBar error |

### 3.6. Activity Diagram Meal Planner

| Langkah | Aktor | Sistem |
|---------|-------|--------|
| 1 | Buka tab Planner | — |
| 2 | — | Load preferences (currency, timezone) |
| 3 | — | Load planner store dari SharedPreferences |
| 4 | — | Render 7 kartu hari dengan slot makan |
| 5 | Tap "+ Tambah" pada slot kosong | — |
| 6 | — | Tampilkan SearchWidget |
| 7 | Pilih menu atau shake untuk random | — |
| 8 | — | Simpan ke planner store |
| 9 | — | Update total kalori & harga hari tersebut |

### 3.7. Activity Diagram Budget Tracker

| Langkah | Aktor | Sistem |
|---------|-------|--------|
| 1 | Buka tab Budget | — |
| 2 | — | Load data dari SQLite |
| 3 | Tap FAB "Add" | — |
| 4 | Isi form (nama, harga, kategori) | — |
| 5 | Tap Simpan | — |
| 6 | — | Validasi: harga ≤ sisa budget? |
| 7a | — | [Ya] Insert ke tabel expenses, update budget |
| 7b | — | [Tidak] Tampilkan error + kirim notifikasi |
| 8 | — | Cek threshold 80%/90% untuk warning notifikasi |

### 3.8. Activity Diagram Game SmartBite Catch

| Langkah | Aktor | Sistem |
|---------|-------|--------|
| 1 | Tap "Mulai Game" | — |
| 2 | — | Inisialisasi state: score=0, timeLeft=45 |
| 3 | — | Timer berjalan setiap 80ms |
| 4 | Miringkan HP | — |
| 5 | — | Accelerometer event → geser posisi keranjang |
| 6 | — | Setiap 10 tick: spawn makanan baru (65% sehat, 35% junk) |
| 7 | — | Cek collision keranjang × makanan |
| 8a | — | [Tangkap sehat] score +10 |
| 8b | — | [Tangkap junk food] score −8 |
| 8c | — | [Miss sehat] score −3 |
| 9 | — | timeLeft = 0 → Game selesai → Simpan skor |

### 3.9. Sequence Diagram AI Chatbot

```
User → SaranMenuPage: ketik pertanyaan
SaranMenuPage → RecommendationProvider: askAssistant(question, profile)
RecommendationProvider → MealStorageService: getSavedMeals()
MealStorageService → SharedPreferences: read()
SharedPreferences → MealStorageService: List<Meal>
RecommendationProvider → NutritionMLService: analyze(profile, meals)
NutritionMLService → RecommendationProvider: NutritionInsight
RecommendationProvider → AIService: askNutritionAssistant(...)
AIService → Gemini API: POST /generateContent
Gemini API → AIService: response text
AIService → RecommendationProvider: answer string
RecommendationProvider → SharedPreferences: persist chat history
RecommendationProvider → SaranMenuPage: notifyListeners()
SaranMenuPage → User: tampil bubble chat AI
```

### 3.10. Sequence Diagram Budget Warning

```
User → BudgetPage: tambah pengeluaran
BudgetPage → BudgetProvider: addExpense(expense, userId)
BudgetProvider: cek harga ≤ remaining?
  [Tidak] → NotificationService: showExpenseRejected()
           → BudgetProvider: return false
           → BudgetPage: tampil SnackBar error
  [Ya]    → DatabaseService: insertExpense()
           → BudgetProvider: _spent += price
           → DatabaseService: insertBudget() (update)
           → NotificationService: showBudgetWarning()
             progress ≥ 80%? → kirim notifikasi level 1
             progress ≥ 90%? → kirim notifikasi level 2
           → BudgetProvider: return true
```

### 3.11. Arsitektur Layer Aplikasi

SmartBite menggunakan arsitektur **Feature-Based Clean Architecture** dengan 4 layer utama:

```
lib/
├── main.dart                    ← Entry point, DI Provider
├── core/
│   └── services/                ← Shared services (auth, db, AI, notif, dll)
├── features/
│   ├── auth/                    ← Login, Register, Splash
│   │   ├── screens/
│   │   └── providers/
│   ├── home/                    ← Bottom Navigation
│   ├── profile/                 ← Profil, Akun, Feedback
│   ├── meal_planner/            ← Planner mingguan
│   ├── budget/                  ← Budget tracker
│   │   ├── screens/
│   │   └── providers/
│   ├── ai_nutrition/            ← Form + chart + chat AI
│   │   ├── screens/
│   │   ├── providers/
│   │   ├── services/
│   │   └── widgets/
│   ├── ai_recommendation/       ← Rekomendasi menu AI
│   │   ├── screens/
│   │   └── providers/
│   ├── location/                ← Maps & nearby places
│   │   ├── screens/
│   │   └── services/
│   └── game/                    ← Mini game
│       └── screens/
└── shared/
    └── models/                  ← Data models lintas fitur
```

**Deskripsi Layer:**

- **screens**: Widget Flutter yang menangani tampilan dan interaksi pengguna
- **providers**: Class `ChangeNotifier` yang menyimpan state dan memanggil service
- **services**: Logika bisnis dan komunikasi dengan database, API, atau sensor
- **models**: Data class (POJO) untuk merepresentasikan entitas data

### 3.12. Class Diagram

**Model Classes:**

```
User
  + id: int?
  + username: String
  + email: String
  + password: String (hashed SHA-256)
  + profileImage: String?
  + toMap(): Map
  + fromMap(map): User

Meal
  + id: String
  + name: String
  + description: String
  + price: double
  + calories: int
  + dietType: String
  + imageUrl: String
  + matchPercentage: int
  + ingredients: List<String>
  + steps: List<String>
  + mealTime: String
  + reason: String
  + toJson(): Map
  + fromJson(json): Meal

Budget
  + id: int
  + weeklyLimit: double
  + spent: double
  + remaining: double
  + userId: int
  + toMap(): Map
  + fromMap(map): Budget

Expense
  + id: int
  + name: String
  + category: String
  + price: double
  + date: String (ISO 8601)
  + userId: int
  + isWeekly: int (0/1)
  + toMap(): Map
  + fromMap(map): Expense

NutritionProfile
  + budget: double
  + targetCalories: double
  + dietType: String
  + activityLevel: String
  + goalType: String
  + eatingPreference: String
  + currentWeight: double
  + targetWeight: double
  + dailyWaterIntake: double
  + sleepDuration: double
  + toJson(): Map
  + fromJson(json): NutritionProfile

NutritionInsight
  + averageCalories: double
  + calorieDelta: double
  + dailyCalories: List<int>
  + weightProgress: List<double>
  + mostFrequentFood: String
  + habitWarnings: List<String>
  + recommendations: List<String>
  + summary: String
  + predictedWeightChange: double
```

**Service Classes:**

```
AuthService
  + authenticateBiometric(): Future<bool>
  + saveSession(userId): Future<void>
  + getUserId(): Future<String?>
  + logout(): Future<void>
  + isLoggedIn(): Future<bool>

DatabaseService (Singleton)
  + database: Future<Database>
  + registerUser(username, email, password): Future<int>
  + loginUser(email, password): Future<Map?>
  + getBudgetsByUserId(userId): Future<List<Budget>>
  + insertBudget(budget): Future<int>
  + updateBudget(budget): Future<int>
  + getExpensesByUserId(userId): Future<List<Expense>>
  + insertExpense(expense): Future<int>
  + updateExpense(expense): Future<int>
  + deleteExpense(id): Future<int>
  + updateExpenseStatus(id, isWeekly): Future<int>

EncryptionService
  + hashPassword(password): String
  + verifyPassword(input, storedHash): bool

AIService
  + getSmartRecommendations(profile, ...): Future<List<Meal>>
  + askNutritionAssistant(profile, meals, history, question, ...): Future<String>

MealStorageService
  + getSavedMeals(): Future<List<Meal>>
  + saveMeal(meal): Future<void>
  + getPlannerStore(): Future<Map>
  + savePlannerStore(store): Future<void>
  + getCurrentWeekPlannerMeals(): Future<List<Meal>>
  + applyMealsToFirstEmptySlots(meals): Future<int>

NutritionMLService
  + analyze(profile, savedMeals, useSampleWhenEmpty): NutritionInsight

NotificationService (Singleton)
  + initialize(): Future<void>
  + scheduleMealReminders(...): Future<void>
  + showBudgetWarning(userId, weeklyLimit, spent): Future<void>
  + showExpenseRejected(userId, price, remaining): Future<void>

LocationService
  + getCurrentLocation(): Future<Position>
  + getNearbyMarkets(lat, lng): Future<List<dynamic>>
```

### 3.13. Perancangan Database

SmartBite menggunakan SQLite dengan nama file `smart_meal_planner.db` (versi 2).

**Tabel: users**

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| id | INTEGER PRIMARY KEY AUTOINCREMENT | ID unik user |
| username | TEXT UNIQUE | Nama pengguna |
| email | TEXT UNIQUE | Email pengguna |
| password | TEXT | Password ter-hash SHA-256 |
| profile_image | TEXT | Path foto profil lokal |

**Tabel: budgets**

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| id | INTEGER PRIMARY KEY | ID budget (1 per user) |
| weeklyLimit | REAL | Batas budget mingguan |
| spent | REAL | Total pengeluaran minggu ini |
| remaining | REAL | Sisa budget (weeklyLimit - spent) |
| userId | INTEGER | Foreign key ke tabel users |

**Tabel: expenses**

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| id | INTEGER PRIMARY KEY AUTOINCREMENT | ID pengeluaran |
| name | TEXT | Nama barang/item |
| category | TEXT | Kategori (Groceries/Protein/Fruits) |
| price | REAL | Harga dalam IDR |
| date | TEXT | Tanggal & jam (ISO 8601 UTC) |
| userId | INTEGER | Foreign key ke tabel users |
| isWeekly | INTEGER | Flag minggu ini (0/1) |

**Tabel: planner**

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| id | INTEGER PRIMARY KEY AUTOINCREMENT | ID entri planner |
| day | TEXT | Hari (format yyyy-MM-dd) |
| mealName | TEXT | Nama menu |
| calories | INTEGER | Kalori menu |
| price | REAL | Harga menu |

> **Catatan:** Data planner detail (dengan foto, bahan, langkah masak) disimpan di SharedPreferences dalam format JSON karena lebih fleksibel untuk struktur data bersarang.

### 3.14. Perancangan Antarmuka

Aplikasi SmartBite terdiri dari halaman-halaman berikut:

1. **SplashPage** — Layar awal dengan logo dan gradient hijau-biru, durasi 900ms
2. **LoginPage** — Form login dengan email/password dan opsi biometrik
3. **RegisterPage** — Form registrasi akun baru
4. **HomePage** — Container utama dengan BottomNavigationBar 5 tab
5. **ProfilePage** — Profil user, pengaturan biometrik, mata uang, dan zona waktu
6. **AccountSettingsPage** — Edit username, email, dan password
7. **FeedbackPage** — Halaman statis saran & kesan kuliah TPM
8. **MealPlannerPage** — Grid planner mingguan dengan SearchWidget
9. **BudgetPage** — Dashboard budget dengan header gradient, kategori grid, dan list pengeluaran
10. **SaranMenuPage (AI Recommendation)** — Input profil nutrisi, insight chart, rekomendasi menu, chatbot
11. **AiNutritionScreen** — Form analisis nutrisi dengan grafik kalori dan chat AI
12. **LocationPage** — Peta Google Maps dan daftar grocery terdekat
13. **GamePage** — Mini game SmartBite Catch berbasis accelerometer

**Tema Warna Utama:**

| Peran | Warna |
|-------|-------|
| Primer (hijau) | `Colors.green` / `#00A878` / `#4BAE5F` |
| Sekunder (biru) | `Colors.blue.shade900` / `#087CA7` |
| Aksen (teal) | `#31CFA3` / `#1DE9B6` |
| Error/Hapus | `Colors.redAccent` |
| Background | `Colors.white` / `#F5F7FA` |

### 3.15. Perancangan API dan Integrasi Eksternal

| Layanan | Endpoint | Kegunaan |
|---------|----------|----------|
| Gemini API | `generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent` | Rekomendasi menu & chatbot nutrisi |
| OpenRouter API | `openrouter.ai/api/v1/chat/completions` | Fallback AI provider |
| ExchangeRate API | `v6.exchangerate-api.com/v6/{key}/pair/IDR/{currency}` | Konversi kurs mata uang |
| Google Maps | SDK Flutter (google_maps_flutter) | Tampilan peta interaktif |
| Google Places | `maps.googleapis.com/maps/api/place/nearbysearch/json` | Cari grocery terdekat |
| TheMealDB | `www.themealdb.com/api/json/v1/1/search.php` | Database resep masakan |
| TheMealDB Random | `www.themealdb.com/api/json/v1/1/random.php` | Random menu dari internet |

**Fallback Strategy:**
- Gemini gagal → coba OpenRouter → gunakan rekomendasi lokal (template 8 menu)
- ExchangeRate API gagal → gunakan kurs hardcoded terakhir yang disimpan di SharedPreferences
- Google Places gagal → tampilkan pesan error dengan koordinat default Klaten

### 3.16. Perancangan Keamanan

| Aspek | Implementasi |
|-------|--------------|
| Penyimpanan password | Hash SHA-256 via `crypto` package sebelum disimpan ke SQLite |
| Penyimpanan sesi | Flutter Secure Storage (terenkripsi, tidak bisa dibaca app lain) |
| API Key | Disimpan di file `.env` (tidak di-commit ke repository) dan dibaca saat runtime via `flutter_dotenv` |
| Validasi input | Validasi format email (regex), panjang password minimal 6 karakter |
| Scope data | Data planner, chat, dan profil per user di-scope dengan user ID sebagai suffix key |
| Biometrik | Hanya dapat diaktifkan setelah login manual berhasil |

---

## BAB IV — IMPLEMENTASI

### 4.1. Struktur Proyek

```
smart_meal_tpm/
├── lib/
│   ├── main.dart
│   ├── core/services/
│   │   ├── ai_service.dart
│   │   ├── auth_service.dart
│   │   ├── chat_storage_service.dart
│   │   ├── currency_service.dart
│   │   ├── database_service.dart
│   │   ├── encryption_service.dart
│   │   ├── meal_storage_service.dart
│   │   ├── notification_service.dart
│   │   ├── nutrition_ml_service.dart
│   │   └── gemini/
│   │       ├── chat_client.dart
│   │       └── prompt_builder.dart
│   ├── features/
│   │   ├── auth/screens/ (splash, login, register)
│   │   ├── home/screens/ (home_page)
│   │   ├── profile/screens/ (profile, account_setting, feedback)
│   │   ├── meal_planner/screens/ (meal_planner_page)
│   │   ├── budget/screens/ + providers/ (budget_page, budget_providers)
│   │   ├── ai_nutrition/screens/ + providers/ + services/ + widgets/
│   │   ├── ai_recommendation/screens/ + providers/
│   │   ├── location/screens/ + services/
│   │   └── game/screens/ (game_page)
│   └── shared/models/
│       ├── budget.dart, expense.dart, meal.dart
│       ├── nutrition_chat_message.dart, nutrition_insight.dart
│       ├── nutrition_profile.dart, user.dart
├── assets/images/smartbite_logo.png
├── .env (API keys — tidak di-commit)
├── pubspec.yaml
└── docs/
```

### 4.2. Fitur Utama dan Implementasi

#### 4.2.1. Autentikasi (Register, Login, Biometrik)

Autentikasi diimplementasikan menggunakan kombinasi SQLite dan Flutter Secure Storage. Saat register, password di-hash menggunakan SHA-256 sebelum disimpan. Saat login, hash dibandingkan langsung di query SQLite. Sesi login disimpan sebagai user ID terenkripsi di Flutter Secure Storage dan dicek saat splash screen untuk auto-login.

Login biometrik memanfaatkan `local_auth` package. Fitur ini hanya dapat diaktifkan setelah minimal satu kali login manual berhasil. User ID yang tersimpan di SharedPreferences digunakan sebagai referensi saat autentikasi biometrik berhasil.

**a. Hash password saat register (`database_service.dart`):**
```dart
Future<int> registerUser(String username, String email, String password) async {
  final db = await database;
  // Cek duplikasi email/username
  final existing = await db.query('users',
      where: 'email = ? OR username = ?', whereArgs: [email, username]);
  if (existing.isNotEmpty) throw Exception("Email atau username sudah terdaftar.");

  // Hash SHA-256 sebelum simpan
  var bytes = utf8.encode(password);
  var digest = sha256.convert(bytes);

  return await db.insert('users', {
    'username': username,
    'email': email,
    'password': digest.toString(), // disimpan hash, bukan plaintext
  });
}
```

**b. Login dengan verifikasi hash (`database_service.dart`):**
```dart
Future<Map<String, dynamic>?> loginUser(String email, String password) async {
  final db = await database;
  var bytes = utf8.encode(password);
  var digest = sha256.convert(bytes);

  final results = await db.query('users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, digest.toString()]);

  if (results.isNotEmpty) return results.first;
  throw Exception("Email atau password salah.");
}
```

**c. Simpan dan baca sesi login (`auth_service.dart`):**
```dart
// Simpan user ID ke secure storage setelah login berhasil
Future<void> saveSession(String userId) async {
  await storage.write(key: 'user_id', value: userId);
}

// Cek status login untuk auto-redirect di splash screen
Future<bool> isLoggedIn() async {
  String? userId = await storage.read(key: 'user_id');
  return userId != null;
}
```

**d. Autentikasi biometrik (`auth_service.dart`):**
```dart
Future<bool> authenticateBiometric() async {
  bool canCheck = await auth.canCheckBiometrics;
  bool isSupported = await auth.isDeviceSupported();
  if (!canCheck || !isSupported) return false;

  return await auth.authenticate(
    localizedReason: 'Silakan scan sidik jari untuk login ke Smart Meal',
    options: const AuthenticationOptions(
      biometricOnly: false,
      stickyAuth: true,
      useErrorDialogs: true,
    ),
  );
}
```

**e. Auto-redirect di splash screen (`splash_page.dart`):**
```dart
Future<void> _goNext() async {
  await Future.delayed(const Duration(milliseconds: 900));
  final loggedIn = await AuthService().isLoggedIn();
  if (!mounted) return;
  Navigator.pushReplacementNamed(context, loggedIn ? '/home' : '/login');
}
```

---

#### 4.2.2. Meal Planner

Meal Planner menyimpan data menu dalam struktur `Map<String, Map<String, dynamic>>` di SharedPreferences, dengan key berupa tanggal (format `yyyy-MM-dd`) dan value berupa map untuk slot Breakfast, Lunch, dan Dinner. Data dikelola oleh `MealStorageService`.

Fitur navigasi minggu menggunakan tombol panah (kiri/kanan) di bagian atas halaman. Fitur random menu menggunakan accelerometer dengan threshold gaya > 28 m/s² untuk mendeteksi gerakan shake.

**a. Simpan dan load planner store (`meal_storage_service.dart`):**
```dart
// Struktur data: { "2026-06-06": { "Breakfast": {...}, "Lunch": null, "Dinner": {...} } }
Future<Map<String, Map<String, dynamic>>> getPlannerStore() async {
  final prefs = await SharedPreferences.getInstance();
  final raw = prefs.getString(await _userScopedKey(_plannerKey));
  if (raw == null || raw.isEmpty) return {};

  final decoded = jsonDecode(raw) as Map<String, dynamic>;
  return decoded.map((date, meals) {
    final dayMeals = Map<String, dynamic>.from(meals as Map);
    for (final type in ['Breakfast', 'Lunch', 'Dinner']) {
      final meal = dayMeals[type];
      if (meal is Map) dayMeals[type] = _normalizePlannerMeal(Map<String, dynamic>.from(meal));
    }
    return MapEntry(date, dayMeals);
  });
}

Future<void> savePlannerStore(Map<String, Map<String, dynamic>> store) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(await _userScopedKey(_plannerKey), jsonEncode(store));
}
```

**b. Load data mingguan berdasarkan offset (`meal_planner_page.dart`):**
```dart
void _loadWeekData() {
  setState(() {
    _isLoading = true;
    _weeklyMeals = List.generate(7, (index) {
      DateTime date = _getStartOfTargetWeek().add(Duration(days: index));
      String dateKey = DateFormat('yyyy-MM-dd').format(date);

      Map<String, dynamic> existingData = _savedMealsStore[dateKey] ??
          {'Breakfast': null, 'Lunch': null, 'Dinner': null};

      return {
        'hari': DateFormat('EEEE', 'id_ID').format(date),
        'tanggal': DateFormat('dd MMMM', 'id_ID').format(date),
        'dateKey': dateKey,
        'meals': Map<String, dynamic>.from(existingData),
      };
    });
    _isLoading = false;
  });
}
```

**c. Shake-to-random menggunakan accelerometer (`_SearchWidgetState`):**
```dart
_shakeSubscription = accelerometerEventStream().listen((event) {
  final force = event.x.abs() + event.y.abs() + event.z.abs();
  final canShakeAgain =
      DateTime.now().difference(_lastShakeAt) > const Duration(seconds: 1);
  if (_shakeMode && force > 28 && canShakeAgain) {
    _lastShakeAt = DateTime.now();
    _pickRandomMeal(); // pilih menu acak dari library atau TheMealDB
  }
});
```

**d. Tampil kalori & harga per hari (`meal_planner_page.dart`):**
```dart
void _calculateTotalsLocally(int dayIndex) {
  int cal = 0;
  double price = 0;
  _weeklyMeals[dayIndex]['meals'].forEach((k, v) {
    if (v != null) {
      cal += (v['cal'] as num).toInt();
      price += (v['harga'] as num).toDouble() * _exchangeRate;
    }
  });
  _weeklyMeals[dayIndex]['total_cal'] = cal;
  _weeklyMeals[dayIndex]['total_harga'] = price;
}
```

---

#### 4.2.3. Budget Tracker

Budget Tracker menggunakan SQLite untuk persistensi data dan `BudgetProvider` (ChangeNotifier) untuk state management. Setiap pengeluaran baru divalidasi terhadap sisa budget sebelum disimpan. Jika pengeluaran ditolak atau threshold tercapai, `NotificationService` mengirimkan notifikasi lokal ke perangkat.

**a. Validasi dan tambah pengeluaran (`budget_providers.dart`):**
```dart
Future<bool> addExpense(Expense exp, int userId, bool addToBudget) async {
  _errorMessage = null;

  // Tolak jika saldo tidak cukup
  if (addToBudget && !_canAddWeeklyExpense(exp.price)) {
    _errorMessage = 'Pengeluaran melebihi sisa budget.';
    notifyListeners();
    await NotificationService.instance.showExpenseRejected(
      userId: userId,
      price: exp.price,
      remaining: remaining,
    );
    return false;
  }

  if (addToBudget) exp.isWeekly = 1;
  await DatabaseService().insertExpense(exp);

  if (addToBudget) {
    _spent += exp.price;
    _recentExpenses.insert(0, exp);
    notifyListeners();
    await _updateDBBudget(userId);
  }
  await loadData(userId);
  return true;
}

bool _canAddWeeklyExpense(double price) =>
    _weeklyLimit > 0 && remaining > 0 && (_spent + price) <= _weeklyLimit;
```

**b. Sinkronisasi budget ke database + trigger warning notifikasi:**
```dart
Future<void> _updateDBBudget(int userId) async {
  await DatabaseService().insertBudget(Budget(
    id: 1,
    weeklyLimit: _weeklyLimit,
    spent: _spent,
    remaining: _weeklyLimit - _spent,
    userId: userId,
  ));
  // Cek threshold 80% dan 90% untuk notifikasi peringatan
  await NotificationService.instance.showBudgetWarning(
    userId: userId,
    weeklyLimit: _weeklyLimit,
    spent: _spent,
  );
}
```

**c. Hapus pengeluaran dan recalculate saldo:**
```dart
Future<void> deleteExpense(int id, int userId) async {
  final item = _recentExpenses.firstWhere((e) => e.id == id);
  if (item.isWeekly == 1) {
    _spent -= item.price; // kembalikan saldo
    _recentExpenses.removeWhere((e) => e.id == id);
    notifyListeners();
    await _updateDBBudget(userId);
  }
  await DatabaseService().deleteExpense(id);
  await loadData(userId);
}
```

**d. Breakdown pengeluaran per kategori:**
```dart
double getWeeklyTotalByCategory(String category) {
  return _recentExpenses
      .where((e) => e.category == category && e.isWeekly == 1)
      .fold(0.0, (sum, item) => sum + item.price);
}
```

---

#### 4.2.4. AI Nutrition & Rekomendasi

AI Service (`AIService`) mendukung dua provider: Gemini API dan OpenRouter API, dengan mekanisme fallback otomatis. Prompt dikirim dengan konteks lengkap berupa profil nutrisi pengguna agar rekomendasi lebih personal.

**a. Strategi fallback otomatis (`ai_service.dart`):**
```dart
Future<List<Meal>> getSmartRecommendations({
  required NutritionProfile profile,
  String contextSummary = '',
  List<Meal> avoidMeals = const [],
}) async {
  final prompt = _buildPrompt(profile: profile, contextSummary: contextSummary,
      avoidMeals: avoidMeals);

  // Urutan provider tergantung konfigurasi .env
  final attempts = _provider == 'openrouter'
      ? [_getOpenRouterRecommendations, _getGeminiRecommendations]
      : [_getGeminiRecommendations, _getOpenRouterRecommendations];

  for (final attempt in attempts) {
    final meals = await attempt(prompt);
    if (meals != null && meals.isNotEmpty) {
      return _postProcessMeals(meals, profile).take(3).toList();
    }
  }

  // Fallback lokal jika semua provider gagal
  return _getLocalRecommendations(profile: profile);
}
```

**b. Prompt builder untuk Gemini (`ai_service.dart`):**
```dart
String _buildPrompt({required NutritionProfile profile, ...}) {
  return '''
Buat tepat 3 rekomendasi menu sehat untuk 1 hari di aplikasi SmartBite.
Kriteria:
- Budget maksimal Rp ${profile.budget.toInt()} per menu
- Target kalori sekitar ${profile.targetCalories.toInt()} kcal
- Tipe diet: ${profile.dietType}
- Activity level: ${profile.activityLevel}
- Goal: ${profile.goalType}
- Eating preference: ${profile.eatingPreference}
- Current weight: ${profile.currentWeight} kg, Target: ${profile.targetWeight} kg
- Hindari menu: ${avoidNames.isEmpty ? 'tidak ada' : avoidNames}

Balas hanya JSON array valid. Tiap item wajib punya:
id, name, description, price, calories, dietType, imageUrl,
matchPercentage, ingredients, steps, mealTime, reason.
''';
}
```

**c. Kirim request ke Gemini API:**
```dart
Future<List<Meal>?> _getGeminiRecommendations(String prompt) async {
  if (_geminiApiKey.isEmpty) return null;

  final url = Uri.parse(
    'https://generativelanguage.googleapis.com/v1beta/models/$_geminiModel'
    ':generateContent?key=$_geminiApiKey',
  );

  final response = await http.post(url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'contents': [{'parts': [{'text': prompt}]}],
      'generationConfig': {
        'temperature': 0.95,
        'topP': 0.92,
        'responseMimeType': 'application/json',
      }
    }),
  ).timeout(const Duration(seconds: 25));

  if (response.statusCode != 200) return null;

  final data = jsonDecode(response.body) as Map<String, dynamic>;
  final text = data['candidates']?[0]?['content']?['parts']?[0]?['text'] ?? '';
  return _parseMealList(text);
}
```

**d. Kalkulasi insight nutrisi lokal (`nutrition_ml_service.dart`):**
```dart
NutritionInsight analyze({
  required NutritionProfile profile,
  required List<Meal> savedMeals,
  bool useSampleWhenEmpty = true,
}) {
  final meals = savedMeals.isEmpty && useSampleWhenEmpty
      ? _sampleMeals(profile) : savedMeals;

  final baseDaily = meals.fold<int>(0, (sum, meal) => sum + meal.calories);
  final activityAdjustment = switch (profile.activityLevel) {
    'Sedentary' => -150, 'Active' => 150, 'Very Active' => 300, _ => 0,
  };
  final goalAdjustment = switch (profile.goalType) {
    'Weight Loss' => -250, 'Muscle Gain' => 250, _ => 0,
  };
  final maintenance = profile.targetCalories + activityAdjustment + goalAdjustment;

  final averageCalories = meals.isEmpty
      ? profile.targetCalories.toDouble()
      : baseDaily / meals.length;

  final calorieDelta = averageCalories - maintenance;
  // Estimasi perubahan berat: 7700 kcal ≈ 1 kg
  final predictedWeightChange = (calorieDelta * 7) / 7700;

  return NutritionInsight(
    averageCalories: averageCalories,
    calorieDelta: calorieDelta,
    predictedWeightChange: predictedWeightChange,
    dailyCalories: _generateDailyCalories(averageCalories, profile),
    // ... field lainnya
  );
}
```

**e. Chat AI dengan scope filter topik (`ai_service.dart`):**
```dart
Future<String> askNutritionAssistant({...}) async {
  // Tolak pertanyaan di luar topik nutrisi
  if (!_isNutritionScope(question)) {
    return 'Aku bisa bantu seputar makanan, nutrisi, diet, olahraga, '
        'hidrasi, tidur, berat badan, dan budget makan.';
  }
  // Kirim ke Gemini dengan riwayat chat terakhir
  for (final attempt in attempts) {
    final answer = await attempt(context, recentHistory);
    if (answer != null && answer.trim().isNotEmpty) return answer;
  }
  return _localChatAnswer(question: question, insightSummary: insightSummary);
}

bool _isNutritionScope(String question) {
  final lower = question.toLowerCase();
  final allowed = ['makan', 'menu', 'kalori', 'protein', 'diet', 'berat',
      'olahraga', 'air', 'tidur', 'budget', 'sehat', ...];
  return allowed.any(lower.contains);
}
```

---

#### 4.2.5. Konversi Mata Uang dan Zona Waktu

Pengaturan mata uang dan zona waktu tersimpan di SharedPreferences dan dibaca oleh `BudgetPage` dan `MealPlannerPage` saat inisialisasi. Kurs diambil dari ExchangeRate API dan di-cache di SharedPreferences.

**a. Fetch kurs dan cache fallback (`budget_page.dart`):**
```dart
Future<void> _loadRegionalSettings() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.reload();
  final currency = prefs.getString('user_currency') ?? 'IDR';
  final previousRate = prefs.getDouble('last_rate_$currency');
  var rate = 1.0;

  if (currency != 'IDR') {
    try {
      final url = Uri.parse(
          'https://v6.exchangerate-api.com/v6/$apiKey/pair/IDR/$currency');
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        rate = (jsonDecode(response.body)['conversion_rate'] as num).toDouble();
      }
    } catch (_) {
      rate = _fallbackRate(currency); // gunakan kurs hardcoded jika API gagal
    }
  }

  await prefs.setDouble('last_rate_$currency', rate); // cache untuk offline
  setState(() { _currentCurrency = currency; _exchangeRate = rate; });
}
```

**b. Format tampilan harga sesuai mata uang aktif:**
```dart
NumberFormat get _formatter => NumberFormat.currency(
  locale: _currentCurrency == 'IDR' ? 'id_ID' : 'en_US',
  symbol: _currencySymbol(_currentCurrency),
  decimalDigits: _currentCurrency == 'IDR' ? 0 : 2,
);

String _formatMoney(double amountIdr) {
  return _formatter.format(amountIdr * _exchangeRate);
}
```

**c. Konversi waktu sesuai zona waktu yang dipilih:**
```dart
DateTime _nowForSelectedTimeZone() {
  final utc = DateTime.now().toUtc();
  final offsetHours = switch (_selectedTimeZone) {
    'WITA' => 8,
    'WIT'  => 9,
    'London' => 1,
    _ => 7, // default WIB (UTC+7)
  };
  return utc.add(Duration(hours: offsetHours));
}
```

---

#### 4.2.6. Location (Grocery Finder)

`LocationService` mengakses GPS melalui `geolocator`, kemudian mengirim koordinat ke Google Places Nearby Search API. Hasil ditampilkan di `GoogleMap` widget dengan marker dan daftar scrollable.

**a. Request izin dan ambil koordinat GPS (`location_service.dart`):**
```dart
Future<Position> getCurrentLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) return Future.error('Location services disabled.');

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied)
      return Future.error('Permission denied');
  }
  if (permission == LocationPermission.deniedForever)
    return Future.error('Aktifkan izin lokasi dari Settings.');

  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}
```

**b. Cari grocery terdekat via Google Places API (`location_service.dart`):**
```dart
Future<List<dynamic>> getNearbyMarkets(double lat, double lng) async {
  final url = Uri.parse(
    'https://maps.googleapis.com/maps/api/place/nearbysearch/json'
    '?location=$lat,$lng'
    '&radius=5000'
    '&keyword=pasar%20OR%20supermarket%20OR%20minimarket'
    '&key=$apiKey'
  );
  final response = await http.get(url).timeout(const Duration(seconds: 15));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['status'] == 'OK') return data['results'] as List;
  }
  throw Exception('Gagal memuat data tempat');
}
```

**c. Tampilkan marker dan navigasi ke lokasi (`location_page.dart`):**
```dart
// Render marker dari hasil Places API
markers: _markets.map((m) {
  return Marker(
    markerId: MarkerId(m['place_id']),
    position: LatLng(
      m['geometry']['location']['lat'],
      m['geometry']['location']['lng'],
    ),
    infoWindow: InfoWindow(title: m['name']),
  );
}).toSet(),

// Buka Google Maps untuk navigasi
Future<void> _openGoogleMaps(double lat, double lng) async {
  final url = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    final webUrl = Uri.parse(
        "https://www.google.com/maps/dir/?api=1&destination=$lat,$lng");
    await launchUrl(webUrl, mode: LaunchMode.externalApplication);
  }
}
```

---

#### 4.2.7. Game SmartBite Catch

Game diimplementasikan menggunakan Flutter `Stack` dan `Positioned` widget sebagai game loop, dengan `Timer.periodic` 80ms. Accelerometer menggerakkan posisi keranjang secara halus menggunakan smoothing factor.

**a. Game loop utama (`game_page.dart`):**
```dart
void _startGame() {
  setState(() {
    _foods.clear();
    _score = 0;
    _timeLeft = 45;
    _tick = 0;
    _isRunning = true;
  });

  _gameTimer = Timer.periodic(const Duration(milliseconds: 80), (timer) {
    setState(() {
      _tick++;
      if (_tick % 10 == 0) _spawnFood();   // spawn tiap 10 tick
      if (_tick % 13 == 0) _timeLeft--;    // hitung mundur

      for (final food in _foods) food.y += food.speed; // gerak makanan turun

      _handleCollisions();
      _foods.removeWhere((food) {
        if (food.y > 1.08) {
          if (food.isHealthy) _score = max(0, _score - 3); // penalti miss
          return true;
        }
        return false;
      });

      if (_timeLeft <= 0) _finishGame();
    });
  });
}
```

**b. Kontrol keranjang menggunakan accelerometer dengan smoothing:**
```dart
void _startAccelerometer() {
  _accelerometerSubscription = accelerometerEventStream().listen((event) {
    if (!_isRunning || !mounted) return;

    // Dead zone untuk mencegah pergerakan saat HP diam
    final rawTiltX = event.x.abs() < _tiltDeadZone ? 0.0 : event.x;

    // Smoothing: hindari gerakan tiba-tiba
    _smoothedTiltX = (_smoothedTiltX * (1 - _tiltSmoothing))
        + (rawTiltX * _tiltSmoothing);

    final step = (-_smoothedTiltX * _tiltSensitivity)
        .clamp(-_maxTiltStep, _maxTiltStep).toDouble();

    setState(() {
      _basketX = (_basketX + step).clamp(0.08, 0.92).toDouble();
    });
  });
}
```

**c. Deteksi collision makanan dengan keranjang:**
```dart
void _handleCollisions() {
  final caught = <_FallingFood>[];
  for (final food in _foods) {
    final isInCatchZone  = food.y >= 0.76 && food.y <= 0.92;
    final isNearBasket   = (food.x - _basketX).abs() < 0.13;
    if (isInCatchZone && isNearBasket) {
      _score = max(0, _score + (food.isHealthy ? 10 : -8));
      caught.add(food);
    }
  }
  _foods.removeWhere(caught.contains);
}
```

**d. Spawn makanan dengan probabilitas sehat 65%:**
```dart
void _spawnFood() {
  final useHealthy = _random.nextDouble() > 0.35; // 65% sehat
  final pool = useHealthy ? _healthyFoods : _unhealthyFoods;
  final template = pool[_random.nextInt(pool.length)];
  _foods.add(_FallingFood(
    x: 0.12 + _random.nextDouble() * 0.76,
    y: -0.08,
    speed: 0.012 + _random.nextDouble() * 0.012,
    icon: template.icon,
    label: template.label,
    isHealthy: template.isHealthy,
  ));
}
```

**e. Simpan dan load leaderboard lokal:**
```dart
Future<void> _saveBestScore() async {
  if (_score <= 0) return;
  final prefs = await SharedPreferences.getInstance();
  final history = [
    _ScoreRow(_playerName, _score, DateTime.now()),
    ..._scoreHistory,
  ]..sort((a, b) => b.score.compareTo(a.score));

  final trimmed = history.take(10).toList();
  if (_score > _bestScore)
    await prefs.setInt('smartbite_catch_best_score', _score);
  await prefs.setString('smartbite_catch_leaderboard',
      _encodeScoreRows(trimmed));
}
```

---

#### 4.2.8. Notifikasi Lokal

Notifikasi dijadwalkan menggunakan `flutter_local_notifications` dengan timezone `Asia/Jakarta`. Terdapat dua jenis notifikasi: pengingat makan harian (recurring) dan peringatan budget (triggered).

**a. Jadwalkan pengingat makan harian (`notification_service.dart`):**
```dart
Future<void> scheduleMealReminders() async {
  await _scheduleDaily(2001, 7,  0, 'Waktunya sarapan',
      'Jaga energi pagimu dengan makanan bergizi.');
  await _scheduleDaily(2002, 12, 0, 'Waktunya makan siang',
      'Istirahat sejenak dan konsumsi makanan bergizi.');
  await _scheduleDaily(2003, 19, 0, 'Waktunya makan malam',
      'Pilih makanan ringan dan mudah dicerna untuk malam.');
}

Future<void> _scheduleDaily(int id, int hour, int minute,
    String title, String body) async {
  final now = tz.TZDateTime.now(tz.local);
  var scheduled = tz.TZDateTime(
      tz.local, now.year, now.month, now.day, hour, minute);
  if (scheduled.isBefore(now))
    scheduled = scheduled.add(const Duration(days: 1));

  await _plugin.zonedSchedule(id, title, body, scheduled,
    const NotificationDetails(android: AndroidNotificationDetails(
      'meal_reminder_channel', 'Meal Reminders',
      importance: Importance.high, priority: Priority.high,
    )),
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time, // repeat harian
  );
}
```

**b. Peringatan budget bertingkat (80% dan 90%):**
```dart
Future<void> showBudgetWarning({
  required int userId, required double weeklyLimit, required double spent,
}) async {
  if (weeklyLimit <= 0 || spent <= 0) return;

  final progress = spent / weeklyLimit;
  final level = progress >= 0.9 ? 2 : progress >= 0.8 ? 1 : 0;
  if (level == 0) return;

  final prefs = await SharedPreferences.getInstance();
  final lastLevel = prefs.getInt('budget_warning_level_$userId') ?? 0;
  if (level <= lastLevel) return; // jangan kirim notifikasi duplikat

  await _plugin.show(1000 + userId,
    level == 2 ? 'Budget mingguan sudah 90%' : 'Budget mingguan hampir habis',
    'Pengeluaranmu sudah ${(progress * 100).round()}% dari limit.',
    const NotificationDetails(android: AndroidNotificationDetails(
      'budget_warning_channel', 'Budget Warning',
      importance: Importance.high,
    )),
  );
  await prefs.setInt('budget_warning_level_$userId', level);
}
```

### 4.3. Daftar Package (Dependencies)

| Package | Versi | Kegunaan |
|---------|-------|----------|
| provider | ^6.1.2 | State management |
| sqflite | ^2.3.0 | Database SQLite lokal |
| path | ^1.8.3 | Path management untuk SQLite |
| flutter_secure_storage | ^9.0.0 | Penyimpanan sesi terenkripsi |
| http | ^0.13.3 | HTTP request ke API eksternal |
| dio | ^5.4.1 | HTTP client alternatif |
| local_auth | ^2.1.6 | Login biometrik |
| shared_preferences | ^2.2.0 | Penyimpanan key-value |
| crypto | ^3.0.3 | Enkripsi SHA-256 |
| geolocator | ^11.0.0 | Akses GPS perangkat |
| google_maps_flutter | ^2.5.3 | Tampilan peta |
| flutter_local_notifications | ^17.0.0 | Notifikasi lokal |
| sensors_plus | ^4.0.2 | Accelerometer & gyroscope |
| flutter_dotenv | ^5.1.0 | Membaca file .env |
| intl | ^0.19.0 | Format mata uang & tanggal |
| timezone | ^0.9.4 | Zona waktu untuk notifikasi |
| fl_chart | ^1.2.0 | Grafik kalori dan nutrisi |
| image_picker | ^1.0.7 | Pilih foto profil dari galeri |
| flame | ^1.14.0 | Game engine (diregistrasi) |
| url_launcher | ^6.3.2 | Buka URL eksternal / deep link |

---

## BAB V — PENGUJIAN

### 5.1. Tabel Pengujian Fungsional

| No | Fitur | Skenario Uji | Input | Expected Output | Status |
|----|-------|--------------|-------|-----------------|--------|
| 1 | Register | Daftar dengan data valid | username, email, password ≥ 6 karakter | Akun terbuat, redirect ke login | ✅ Pass |
| 2 | Register | Email sudah terdaftar | Email yang sudah ada | SnackBar "sudah terdaftar" | ✅ Pass |
| 3 | Register | Password terlalu pendek | Password 4 karakter | SnackBar "minimal 6 karakter" | ✅ Pass |
| 4 | Login | Kredensial benar | Email & password valid | Masuk ke HomePage | ✅ Pass |
| 5 | Login | Kredensial salah | Email/password salah | SnackBar error merah | ✅ Pass |
| 6 | Login Biometrik | Autentikasi berhasil | Sidik jari valid | Masuk ke HomePage | ✅ Pass |
| 7 | Meal Planner | Tambah menu ke slot | Pilih menu dari library | Menu tampil di slot, kalori terupdate | ✅ Pass |
| 8 | Meal Planner | Hapus menu dari slot | Tap ikon X | Slot kembali kosong | ✅ Pass |
| 9 | Meal Planner | Navigasi minggu | Tap panah kiri/kanan | — | Tampil minggu sebelum/berikutnya | ✅ Pass |
| 10 | Meal Planner | Shake random menu | Shake HP di SearchWidget | Threshold gaya > 28 m/s² | Menu random muncul | ✅ Pass |
| 11 | Budget | Tambah pengeluaran valid | Harga < sisa budget | Pengeluaran tersimpan, saldo berkurang | ✅ Pass |
| 12 | Budget | Tambah pengeluaran melebihi budget | Harga > sisa budget | Ditolak + notifikasi | ✅ Pass |
| 13 | Budget | Edit pengeluaran | Data baru valid | Data terupdate di list | ✅ Pass |
| 14 | Budget | Hapus pengeluaran | Konfirmasi hapus | Data terhapus, saldo kembali | ✅ Pass |
| 15 | Budget | Set limit budget | Angka baru | Limit terupdate, saldo recalculate | ✅ Pass |
| 16 | AI Rekomendasi | Generate dengan profil lengkap | Semua field terisi | 3 menu rekomendasi muncul | ✅ Pass |
| 17 | AI Chat | Tanya tentang nutrisi | Pertanyaan relevan | Jawaban AI muncul di bubble | ✅ Pass |
| 18 | AI Chat | Tanya di luar topik | Pertanyaan non-nutrisi | Respon penolakan sopan | ✅ Pass |
| 19 | Weekly Insight | Lihat grafik kalori | — | Grafik 7 hari + summary tampil | ✅ Pass |
| 20 | Konversi | Ganti ke USD | Pilih USD di profil | Harga di Budget & Planner berubah ke USD | ✅ Pass |
| 21 | Zona Waktu | Ganti ke WITA | Pilih WITA | Jam di profil & label budget berubah | ✅ Pass |
| 22 | Location | Cari grocery terdekat | Izin lokasi diberikan | Daftar & marker maps tampil | ✅ Pass |
| 23 | Notifikasi | Pengingat makan | Waktu sesuai jadwal | Notifikasi muncul di panel | ✅ Pass |
| 24 | Notifikasi | Budget 80% | Spent ≥ 80% limit | Notifikasi "hampir habis" muncul | ✅ Pass |
| 25 | Game | Mulai game | Tap "Mulai Game" | Timer berjalan, makanan mulai jatuh | ✅ Pass |
| 26 | Game | Tangkap makanan sehat | Tilt HP | Score +10 | ✅ Pass |
| 27 | Game | Kena junk food | Tilt HP ke junk food | Score −8 | ✅ Pass |
| 28 | Profil | Upload foto | Pilih dari galeri | Foto profil terupdate | ✅ Pass |
| 29 | Akun | Edit username/email/password | Data baru valid | Profil terupdate di database | ✅ Pass |
| 30 | Logout | Tap keluar | Konfirmasi Ya | Session terhapus, redirect ke login | ✅ Pass |

### 5.2. Pengujian Non-Fungsional

| No | Aspek | Pengujian | Hasil |
|----|-------|-----------|-------|
| 1 | Keamanan | Password tidak tersimpan plaintext di database | SHA-256 hash tersimpan, bukan password asli ✅ |
| 2 | Keamanan | Session ID tidak dapat diakses aplikasi lain | Flutter Secure Storage (AES encryption) ✅ |
| 3 | Keamanan | API Key tidak hard-coded di source | Tersimpan di .env, tidak dicommit ✅ |
| 4 | Reliabilitas | App tetap berfungsi tanpa internet | Budget & planner berjalan offline ✅ |
| 5 | Reliabilitas | AI fallback saat API gagal | Local template digunakan ✅ |
| 6 | Performa | Waktu load planner | < 1 detik (data lokal) ✅ |
| 7 | Performa | Waktu respons AI | 2–8 detik (tergantung jaringan) |
| 8 | Usability | Responsivitas UI | Tidak ada lag pada navigasi antar tab ✅ |

---

## BAB VI — KESIMPULAN DAN SARAN

### 6.1. Kesimpulan

1. Aplikasi SmartBite berhasil diimplementasikan menggunakan Flutter dan Dart dengan arsitektur feature-based yang terstruktur dan maintainable.
2. Integrasi AI Gemini berhasil memberikan rekomendasi menu personal yang adaptif terhadap profil nutrisi pengguna, dengan mekanisme fallback berlapis untuk menjaga ketersediaan fitur.
3. Sistem budget tracker yang terintegrasi dengan notifikasi lokal berhasil membantu pengguna memantau dan mengontrol pengeluaran makanan mingguan secara real-time.
4. Pemanfaatan sensor perangkat (accelerometer, gyroscope) berhasil meningkatkan pengalaman pengguna melalui navigasi tilt dan fitur shake-to-random.
5. Implementasi keamanan menggunakan SHA-256 dan Flutter Secure Storage memastikan data sensitif pengguna terlindungi dengan baik.
6. Semua 30 skenario pengujian fungsional berhasil dilewati, membuktikan bahwa seluruh fitur yang direncanakan berjalan sesuai spesifikasi.

### 6.2. Saran Pengembangan

1. **Backend Service**: Menambahkan backend server untuk sinkronisasi data antar perangkat dan backup cloud.
2. **Notifikasi Budget Kustom**: Memungkinkan pengguna mengatur jam pengingat makan sendiri melalui UI.
3. **Sosial/Sharing**: Fitur berbagi meal plan atau rekomendasi ke pengguna lain.
4. **Machine Learning Lokal**: Implementasi model TFLite untuk rekomendasi offline yang lebih akurat.
5. **iOS Support**: Penyesuaian untuk deployment ke platform iOS.
6. **Integrasi Wearable**: Sinkronisasi data aktivitas dari smartwatch untuk insight nutrisi yang lebih akurat.

---

## LAMPIRAN

### Lampiran A — Konfigurasi Environment (.env.example)

```
# AI Provider: gemini atau openrouter
AI_PROVIDER=gemini

# Gemini API Key (Google AI Studio)
GEMINI_API_KEY=your_gemini_api_key_here
GEMINI_MODEL=gemini-2.0-flash

# OpenRouter API Key (fallback)
OPENROUTER_API_KEY=your_openrouter_api_key_here
OPENROUTER_MODEL=liquid/lfm-2.5-1.2b-instruct:free

# Google Services
GOOGLE_MAPS_API_KEY=your_google_maps_api_key_here

# Currency Conversion
CURRENCY_API_KEY=your_exchangerate_api_key_here

# Backend (opsional)
BACKEND_URL=http://10.0.2.2:8080
```

### Lampiran B — Skema Database SQLite

```sql
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE,
  email TEXT UNIQUE,
  password TEXT,
  profile_image TEXT
);

CREATE TABLE budgets (
  id INTEGER PRIMARY KEY,
  weeklyLimit REAL,
  spent REAL,
  remaining REAL,
  userId INTEGER
);

CREATE TABLE expenses (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  category TEXT,
  price REAL,
  date TEXT,
  userId INTEGER,
  isWeekly INTEGER DEFAULT 0
);

CREATE TABLE planner (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  day TEXT,
  mealName TEXT,
  calories INTEGER,
  price REAL
);
```

### Lampiran C — Contoh Response AI (Gemini)

```json
[
  {
    "id": "menu-001",
    "name": "Nasi Ayam Panggang Sayur",
    "description": "Menu balanced tinggi protein cocok untuk goal Weight Loss.",
    "price": 28000,
    "calories": 520,
    "dietType": "Balanced",
    "imageUrl": "",
    "matchPercentage": 92,
    "mealTime": "Lunch",
    "reason": "Kalori sesuai target 600 kcal dengan protein ayam untuk mendukung penurunan berat badan.",
    "ingredients": ["Nasi", "Dada ayam", "Buncis", "Wortel", "Bawang putih"],
    "steps": ["Panggang ayam", "Tumis sayuran", "Sajikan bersama nasi"]
  }
]
```

---

## DAFTAR PUSTAKA

1. Google LLC. (2024). *Flutter Documentation*. https://flutter.dev/docs
2. Google LLC. (2024). *Dart Programming Language*. https://dart.dev/guides
3. Google LLC. (2024). *Gemini API Documentation*. https://ai.google.dev/docs
4. Google LLC. (2024). *Google Maps Platform Documentation*. https://developers.google.com/maps
5. ExchangeRate-API. (2024). *ExchangeRate-API Documentation*. https://www.exchangerate-api.com/docs
6. TheMealDB. (2024). *TheMealDB API Documentation*. https://www.themealdb.com/api.php
7. pub.dev. (2024). *sqflite package*. https://pub.dev/packages/sqflite
8. pub.dev. (2024). *provider package*. https://pub.dev/packages/provider
9. pub.dev. (2024). *flutter_local_notifications package*. https://pub.dev/packages/flutter_local_notifications
10. pub.dev. (2024). *sensors_plus package*. https://pub.dev/packages/sensors_plus
11. pub.dev. (2024). *local_auth package*. https://pub.dev/packages/local_auth
12. pub.dev. (2024). *flutter_secure_storage package*. https://pub.dev/packages/flutter_secure_storage
13. pub.dev. (2024). *crypto package*. https://pub.dev/packages/crypto
14. National Institute of Standards and Technology. (2001). *FIPS PUB 180-4: Secure Hash Standard (SHS)*. U.S. Department of Commerce.
15. OpenRouter. (2024). *OpenRouter API Documentation*. https://openrouter.ai/docs
