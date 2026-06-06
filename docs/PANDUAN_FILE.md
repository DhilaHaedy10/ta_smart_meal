# Panduan File SmartBite — Referensi Presentasi

> Dokumen ini menjelaskan **tiap file secara detail** agar kamu tahu perlu ubah bagian mana saat presentasi.

---

## DAFTAR ISI
1. [main.dart](#1-maindart)
2. [Auth — Splash, Login, Register](#2-auth)
3. [Home — HomePage (Bottom Nav)](#3-home)
4. [Profile — ProfilePage](#4-profile)
5. [Profile — AccountSettingsPage](#5-account-settings)
6. [Profile — FeedbackPage](#6-feedback)
7. [Budget — BudgetPage](#7-budget)
8. [Game — GamePage](#8-game)
9. [Location — LocationPage](#9-location)
10. [Meal Planner — MealPlannerPage](#10-meal-planner)
11. [AI Nutrition — AiNutritionScreen](#11-ai-nutrition)
12. [AI Recommendation — SaranMenuPage](#12-ai-recommendation-saran-menu)
13. [Core Services](#13-core-services)
14. [Shared Models](#14-shared-models)
15. [Ringkasan Warna Tema](#15-ringkasan-warna-tema)

---

## 1. `main.dart`
**Path:** `lib/main.dart`

**Fungsi:** Entry point aplikasi. Inisialisasi semua service dan provider, lalu menjalankan app.

### Apa yang dilakukan:
- Load file `.env` (berisi API key)
- Inisialisasi SQLite database
- Jadwalkan notifikasi makan
- Daftarkan semua `Provider` (state management)
- Set routing halaman
- Set tema global app

### Yang bisa kamu ubah saat presentasi:

| Bagian | Lokasi di kode | Cara ubah |
|--------|---------------|-----------|
| **Nama aplikasi** | `title: 'SmartBite'` | Ganti string-nya |
| **Warna tema utama** | `seedColor: Colors.green` dan `primary: Colors.green` | Ganti ke warna lain, misal `Colors.teal` |
| **Warna background scaffold** | `scaffoldBackgroundColor: Colors.white` | Ganti warna |
| **Halaman awal** | `initialRoute: '/splash'` | Ganti ke `/login` kalau mau skip splash |
| **Tambah provider baru** | Di dalam `MultiProvider(providers: [...])` | Tambah `ChangeNotifierProvider(create: (_) => ProviderBaru())` |

---

## 2. Auth

### 2a. `splash_page.dart`
**Path:** `lib/features/auth/screens/splash_page.dart`

**Fungsi:** Halaman loading pertama saat app dibuka. Auto-redirect ke Home (kalau sudah login) atau Login.

### Yang bisa diubah:

| Bagian | Lokasi di kode | Cara ubah |
|--------|---------------|-----------|
| **Durasi splash** | `Duration(milliseconds: 900)` | Ganti angkanya (ms) |
| **Warna gradient background** | `colors: [Color(0xFF00A878), Color(0xFF087CA7)]` | `0xFF00A878` = hijau, `0xFF087CA7` = biru |
| **Arah gradient** | `begin: Alignment.topLeft, end: Alignment.bottomRight` | Ganti alignment |
| **Logo** | `Image.asset('assets/images/smartbite_logo.png')` | Ganti path gambar |
| **Ukuran logo** | `width: 132, height: 132` | Ganti angka |
| **Radius rounded logo** | `BorderRadius.circular(32)` | Ganti angka |
| **Teks nama app** | `'SmartBite'` | Ganti string |
| **Ukuran font nama app** | `fontSize: 34` | Ganti angka |
| **Teks subtitle** | `'AI nutrition and meal planner'` | Ganti string |
| **Warna teks nama** | `color: Colors.white` | Ganti warna |

---

### 2b. `login_page.dart`
**Path:** `lib/features/auth/screens/login_page.dart`

**Fungsi:** Halaman login dengan email/password + opsi biometrik (sidik jari/wajah).

### Yang bisa diubah:

| Bagian | Lokasi di kode | Cara ubah |
|--------|---------------|-----------|
| **Warna gradient background** | `colors: [Colors.green.shade400, Colors.blue.shade900]` | Ganti kedua warna |
| **Warna tombol LOGIN** | `backgroundColor: Colors.blue.shade800` | Ganti warna |
| **Warna teks "SmartBite"** | `color: Colors.blue` di `TextStyle` | Ganti warna |
| **Radius card** | `BorderRadius.circular(20)` | Ganti angka |
| **Radius tombol LOGIN** | `BorderRadius.circular(15)` | Ganti angka |
| **Radius input field** | `BorderRadius.circular(15)` di `OutlineInputBorder` | Ganti angka (ada 2 field) |
| **Tinggi tombol LOGIN** | `height: 55` di `SizedBox` | Ganti angka |
| **Warna border tombol biometrik** | `color: Colors.blue.shade200` | Ganti warna |
| **Teks tombol biometrik** | `'Masuk dengan Biometrik'` | Ganti string |
| **Teks link register** | `'Belum punya akun? Daftar Sekarang'` | Ganti string |
| **Ukuran logo di card** | `width: 86, height: 86` | Ganti angka |

---

### 2c. `register_page.dart`
**Path:** `lib/features/auth/screens/register_page.dart`

**Fungsi:** Halaman registrasi akun baru.

### Yang bisa diubah:

| Bagian | Lokasi di kode | Cara ubah |
|--------|---------------|-----------|
| **Teks judul** | `'Mulai Hidup Sehat'` | Ganti string |
| **Warna teks judul** | `color: Colors.blue` | Ganti warna |
| **Warna background input** | `fillColor: Colors.grey.shade100` | Ganti warna |
| **Warna tombol DAFTAR** | `backgroundColor: Colors.green.shade600` | Ganti warna |
| **Tinggi tombol** | `height: 55` | Ganti angka |
| **Teks tombol** | `'DAFTAR SEKARANG'` | Ganti string |
| **Radius input field** | `BorderRadius.circular(15)` | Ganti angka |
| **Validasi min panjang password** | `pass.length < 6` | Ganti angka |

---

## 3. Home

### `home_page.dart`
**Path:** `lib/features/home/screens/home_page.dart`

**Fungsi:** Halaman utama berisi `BottomNavigationBar` dengan 5 tab:
- Index 0 → Profil
- Index 1 → Meal Planner *(default saat buka)*
- Index 2 → Budget
- Index 3 → Saran (AI Recommendation)
- Index 4 → Game

### Yang bisa diubah:

| Bagian | Lokasi di kode | Cara ubah |
|--------|---------------|-----------|
| **Tab aktif pertama** | `int _selectedIndex = 1` | Ganti angka (0–4) |
| **Warna icon aktif** | `selectedItemColor: Colors.green.shade700` | Ganti warna |
| **Warna icon tidak aktif** | `unselectedItemColor: Colors.grey` | Ganti warna |
| **Label tab** | `label: 'Profil'` dst | Ganti tiap string label |
| **Icon tab** | `icon: Icon(Icons.person_outline)` dst | Ganti icon |
| **Urutan tab** | Ubah urutan item di `items: [...]` dan `pages = [...]` | Pastikan urutan `items` dan `pages` sama |

---

## 4. Profile

### `profile_page.dart`
**Path:** `lib/features/profile/screens/profile_page.dart`

**Fungsi:** Halaman profil user. Berisi:
- Avatar + nama + email user
- Toggle biometrik
- Pilih mata uang (dengan live exchange rate)
- Pilih zona waktu
- Tampilan jam sesuai zona waktu
- Menu Saran & Kesan
- Tombol logout

### Yang bisa diubah:

| Bagian | Lokasi di kode | Cara ubah |
|--------|---------------|-----------|
| **Warna utama (biru tua)** | `final Color primaryBlue = Colors.blue.shade900` | Ganti nilai warna |
| **Warna tombol kamera (edit foto)** | `backgroundColor: Colors.green` di `CircleAvatar` | Ganti warna |
| **Warna icon container Mata Uang** | `Colors.green.shade50` (bg) dan `Colors.green` (icon) | Di `_buildCurrencyPickerTile` |
| **Warna icon container Biometrik** | `Colors.blue.shade50` dan `Colors.blue.shade800` | Di `_buildBiometricTile` |
| **Warna icon container Saran & Kesan** | `Colors.orange.shade50` dan `Colors.orange.shade700` | Di `_buildMenuItem` kalau `isSpecial: true` |
| **Warna tombol Logout** | `backgroundColor: Colors.red.shade50`, `foregroundColor: Colors.red` | Di `_buildLogoutButton` |
| **Teks judul AppBar** | `title: const Text("Profil Saya")` | Ganti string |
| **Daftar mata uang tersedia** | `_currencyOptions = [...]` | Tambah/hapus `_CurrencyOption` |
| **Daftar zona waktu** | `items: ['WIB', 'WITA', 'WIT', 'London']` | Di `_buildDropdownTile` |
| **Placeholder foto profil** | `NetworkImage('https://via.placeholder.com/150')` | Ganti URL |

---

## 5. Account Settings

### `account_setting_page.dart`
**Path:** `lib/features/profile/screens/account_setting_page.dart`

**Fungsi:** Halaman edit profil (username, email, password).

### Yang bisa diubah:

| Bagian | Lokasi di kode | Cara ubah |
|--------|---------------|-----------|
| **Warna utama** | `final Color primaryBlue = Colors.blue.shade900` | Ganti warna |
| **Warna background input field** | `fillColor: Colors.blue.shade50.withValues(alpha: 0.4)` | Ganti warna |
| **Warna border input (normal)** | `BorderSide(color: Colors.blue.shade100)` | Ganti warna |
| **Warna border input (fokus)** | `BorderSide(color: primaryColor, width: 1.5)` | Ganti warna/tebal |
| **Warna tombol Simpan** | `backgroundColor: primaryBlue` | Berubah otomatis ikut `primaryBlue` |
| **Teks tombol** | `'Simpan Perubahan'` | Ganti string |
| **Teks judul AppBar** | `'Pengaturan Akun'` | Ganti string |
| **Teks label kolom** | `'Username'`, `'Email'`, `'Password Baru ...'` | Di `_buildLabel(...)` |
| **Snackbar sukses** | `'Profil & Password diperbarui!'` dengan `Colors.green` | Ganti teks/warna |

---

## 6. Feedback

### `feedback_page.dart`
**Path:** `lib/features/profile/screens/feedback_page.dart`

**Fungsi:** Halaman statis yang menampilkan kesan & saran kuliah TPM.

### Yang bisa diubah:

| Bagian | Lokasi di kode | Cara ubah |
|--------|---------------|-----------|
| **Teks kesan** | `'Sangat menantang karena harus menggabungkan...'` | Ganti string |
| **Teks saran** | `'Semoga kedepannya waktu pengerjaan proyek...'` | Ganti string |
| **Teks judul AppBar** | `'Saran & Kesan TPM'` | Ganti string |
| **Padding konten** | `padding: EdgeInsets.all(16.0)` | Ganti angka |

---

## 7. Budget

### `budget_page.dart`
**Path:** `lib/features/budget/screens/budget_page.dart`

**Fungsi:** Budget tracker mingguan. Fitur:
- Header dengan saldo sisa + progress bar
- Grid kategori (Groceries, Protein, Fruits)
- List pengeluaran dengan filter kategori
- Tampilkan kurs mata uang aktif + info zona waktu
- Tombol navigasi ke LocationPage
- Modal tambah/edit/hapus belanjaan

### Yang bisa diubah:

| Bagian | Lokasi di kode | Cara ubah |
|--------|---------------|-----------|
| **Warna gradient header** | `colors: [Colors.greenAccent.shade400, Colors.blue.shade900]` | Ganti kedua warna |
| **Warna FAB "Add"** | `backgroundColor: const Color(0xFF1DE9B6)` | Ganti hex color |
| **Warna icon item list** | `Colors.blue.shade50` (bg) dan `Colors.blue.shade700` (icon) | Di `_buildExpenseList` |
| **Warna tombol "Tambah ke Minggu Ini"** | `backgroundColor: Colors.blue.shade600` | Di `_buildExpenseList` |
| **Warna tombol delete** | `color: Colors.redAccent` | Di `Icons.delete_outline` |
| **Kategori yang tersedia** | `["Groceries", "Protein", "Fruits"]` | Di dropdown modal dan `_buildCategoryGrid` |
| **Warna tiap kategori card** | `Colors.orange`, `Colors.redAccent`, `Colors.green` | Di `_buildCategoryGrid` |
| **Teks judul header** | `'Budget Tracker'` | Ganti string |
| **Teks label saldo** | `'Sisa Saldo'` | Ganti string |
| **Radius card belanjaan** | `BorderRadius.circular(15)` | Di `_buildExpenseList` Card |

---

## 8. Game

### `game_page.dart`
**Path:** `lib/features/game/screens/game_page.dart`

**Fungsi:** Mini game "SmartBite Catch" — tangkap makanan sehat, hindari junk food. Dikontrol dengan memiringkan HP (accelerometer).

### Yang bisa diubah:

| Bagian | Lokasi di kode | Cara ubah |
|--------|---------------|-----------|
| **Warna gradient header game** | `colors: [Color(0xFF19A974), Color(0xFF1D7DD8)]` | Ganti hex |
| **Warna keranjang (basket)** | `color: const Color(0xFF4BAE5F)` di `_Basket` | Ganti hex |
| **Warna bubble makanan sehat** | `Color(0xFFEAF7ED)` (bg) dan `Color(0xFF4BAE5F)` (icon) | Di `_FoodBubble` |
| **Warna bubble junk food** | `Color(0xFFFFEDF1)` (bg) dan `Color(0xFFE85D75)` (icon) | Di `_FoodBubble` |
| **Warna tombol Start/Main Lagi** | `backgroundColor: const Color(0xFF4BAE5F)` | Di `_buildGameBoard` |
| **Warna background halaman** | `backgroundColor: const Color(0xFFF7FAF8)` | Di `Scaffold` |
| **Durasi game** | `_timeLeft = 45` dan `if (_tick % 13 == 0) _timeLeft--` | Ganti 45 = detik; 13 = kecepatan hitung mundur |
| **Skor makanan sehat** | `_score + 10` di `_handleCollisions` | Ganti angka |
| **Penalti junk food** | `_score - 8` di `_handleCollisions` | Ganti angka |
| **Penalti miss makanan sehat** | `_score - 3` di `_foods.removeWhere` | Ganti angka |
| **Teks nama game** | `'SmartBite Catch'` | Di `_buildHeader` |
| **Daftar makanan sehat** | `_healthyFoods` list dengan icon dan label | Tambah/ganti `_FoodTemplate` |
| **Daftar junk food** | `_unhealthyFoods` list | Tambah/ganti `_FoodTemplate` |
| **Sensitivitas tilt** | `_tiltSensitivity = 0.006` | Naikkan = makin sensitif |

---

## 9. Location

### `location_page.dart`
**Path:** `lib/features/location/screens/location_page.dart`

**Fungsi:** Tampilkan peta Google Maps + daftar pasar/supermarket terdekat. Bisa langsung buka navigasi Google Maps.

### Yang bisa diubah:

| Bagian | Lokasi di kode | Cara ubah |
|--------|---------------|-----------|
| **Koordinat default (kalau GPS gagal)** | `LatLng(-7.7265, 110.6019)` | Ganti lat/lng (saat ini default Klaten) |
| **Warna gradient overlay atas peta** | `Colors.blue.shade900.withValues(alpha: 0.7)` | Ganti warna/opacity |
| **Warna AppBar** | `backgroundColor: Colors.transparent` | Ganti transparent ke warna lain |
| **Teks judul AppBar** | `'Lokasi Belanja'` | Ganti string |
| **Tinggi bottom panel** | `height: 320` | Ganti angka |
| **Warna teks judul panel** | `color: Color(0xFF1A237E)` | Ganti hex |
| **Warna background panel** | `Colors.white.withValues(alpha: 0.95)` | Ganti warna/opacity |
| **Warna avatar icon toko** | `Colors.greenAccent.shade100` (bg), `Colors.green` (icon) | Di `_buildMarketItem` |
| **Warna tombol navigasi** | `color: Colors.blue` di `Icon(Icons.directions_outlined)` | Ganti warna |
| **Radius bottom panel** | `Radius.circular(30)` | Ganti angka |
| **Teks judul daftar** | `'Pasar & Supermarket Terdekat'` | Ganti string |

---

## 10. Meal Planner

### `meal_planner_page.dart`
**Path:** `lib/features/meal_planner/screens/meal_planner_page.dart`

**Fungsi:** Planner makan mingguan (7 hari × 3 waktu makan). Fitur:
- Navigasi minggu (kiri/kanan + tilt HP)
- Tambah menu dari library tersimpan atau TheMealDB API
- Tampil kalori & harga tiap hari
- Random menu dengan shake HP
- Lihat resep detail

### Yang bisa diubah:

| Bagian | Lokasi di kode | Cara ubah |
|--------|---------------|-----------|
| **Warna gradient AppBar** | `colors: [Color(0xFF00C853), Color(0xFF2979FF)]` | Ganti hex |
| **Warna background halaman** | `backgroundColor: const Color(0xFFF5F7FA)` | Ganti hex |
| **Warna teks kalori di card hari** | `color: Colors.blue` | Di `_buildDayCard` |
| **Warna teks harga di card hari** | `color: Colors.green` | Di `_buildDayCard` |
| **Warna background slot meal terisi** | `Colors.blue.withValues(alpha: 0.05)` | Di `_buildMealRow` |
| **Warna icon cancel meal** | `color: Colors.redAccent` di `Icons.cancel` | Di `_buildMealRow` |
| **Warna fallback thumbnail** | `Colors.green.shade50` (bg), `Colors.green.shade700` (icon) | Di `_buildMealThumbnail` |
| **Teks judul AppBar** | `'Meal Planner'` | Ganti string |
| **Label waktu makan** | `'Breakfast'`, `'Lunch'`, `'Dinner'` | Di `_buildMealRow` parameter `type` |
| **Teks tombol tambah** | `'+ Tambah'` | Di `OutlinedButton` |
| **Sensitivitas tilt navigate** | `event.x.abs() < 5.5` dan `strongestTurn.abs() < 1.1` | Naikkan threshold = butuh tilt lebih kuat |

---

## 11. AI Nutrition

### `ai_nutrition_screen.dart`
**Path:** `lib/features/ai_nutrition/screens/ai_nutrition_screen.dart`

**Fungsi:** Screen container AI Nutrition. Berisi form input profil nutrisi, card insight mingguan, dan FAB untuk chat AI.

### Yang bisa diubah:

| Bagian | Lokasi di kode | Cara ubah |
|--------|---------------|-----------|
| **Teks judul AppBar** | `'AI Nutrition Assistant'` | Ganti string |
| **Teks subtitle** | `'Personalized recommendations powered by...'` | Ganti string |
| **Warna FAB** | Tidak di-set eksplisit, ikut tema global (`Colors.green` dari `main.dart`) | Ubah di `main.dart` |
| **Teks label FAB** | `'Chat with AI'` | Ganti string |
| **Padding konten** | `padding: EdgeInsets.all(16.0)` | Ganti angka |

Widget yang ditampilkan screen ini ada di:
- `lib/features/ai_nutrition/widgets/ai_form.dart`
- `lib/features/ai_nutrition/widgets/ai_weekly_card.dart`
- `lib/features/ai_nutrition/widgets/chat_bottom_sheet.dart`

---

## 12. AI Recommendation (Saran Menu)

### `ai_recommendation_page.dart`
**Path:** `lib/features/ai_recommendation/screens/ai_recommendation_page.dart`

**Fungsi:** Halaman rekomendasi menu AI lengkap. Fitur:
- Input profil nutrisi (budget, kalori, diet, aktivitas, dll)
- Tampil AI Weekly Insight (grafik kalori, prediksi berat)
- List menu rekomendasi
- Smart Daily Plan (paket 1 hari)
- Chat AI Nutrition

### Yang bisa diubah:

| Bagian | Lokasi di kode | Cara ubah |
|--------|---------------|-----------|
| **Warna gradient header** | `colors: [Color(0xFF00A878), Color(0xFF087CA7)]` | Ganti hex |
| **Background halaman** | `backgroundColor: const Color(0xFFF6FBF8)` | Ganti hex |
| **Warna chat bubble user** | `Color(0xFF31CFA3)` | Di `_showChatAssistant` |
| **Warna chat bubble AI** | `Color(0xFFF1F6F8)` | Di `_showChatAssistant` |
| **Warna icon container chatbot** | `color: const Color(0xFF31CFA3)` | Di `_buildChatbot` |
| **Warna tombol send chat** | `backgroundColor: const Color(0xFF31CFA3)` | Di `_showChatAssistant` |
| **Warna label waktu makan di daily plan** | `Colors.green.shade50` (bg) | Di `_dailyRow` |
| **Teks header** | `'AI Nutrition Assistant'` | Di `_buildHeader` |
| **Teks subtitle header** | `'Personalized recommendations powered by...'` | Di `_buildHeader` |
| **Teks tombol Generate** | `'Generate AI Nutrition Plan'` | Di `_buildInputCard` |
| **Teks tombol Apply Plan** | `'Apply 1 Hari ke Planner'` | Di `_buildDailyPlan` |
| **Nilai default budget slider** | `double _budget = 50000` | Ganti angka |
| **Nilai default kalori slider** | `double _calories = 600` | Ganti angka |
| **Opsi dropdown Diet type** | `['Balanced', 'Vegan', 'Keto', 'Low Carb']` | Tambah/hapus |
| **Opsi dropdown Activity level** | `['Sedentary', 'Lightly Active', 'Active', 'Very Active']` | Tambah/hapus |
| **Opsi dropdown Goal type** | `['Weight Loss', 'Maintain Weight', 'Muscle Gain']` | Tambah/hapus |

---

## 13. Core Services

### `auth_service.dart`
**Path:** `lib/core/services/auth_service.dart`
- Simpan/hapus session login di SharedPreferences
- Method: `saveSession`, `isLoggedIn`, `getUserId`, `logout`

### `database_service.dart`
**Path:** `lib/core/services/database_service.dart`
- SQLite local database
- Tabel `users`: id, username, email, password, profile_image
- Method: `registerUser`, `loginUser`, `database`

### `encryption_service.dart`
**Path:** `lib/core/services/encryption_service.dart`
- Hash password sebelum disimpan ke database
- Method: `hashPassword`

### `meal_storage_service.dart`
**Path:** `lib/core/services/meal_storage_service.dart`
- Simpan/load data planner dan library meal di SharedPreferences
- Method: `getSavedMeals`, `saveMeal`, `getPlannerStore`, `savePlannerStore`, `getCurrentWeekPlannerMeals`, `applyMealsToFirstEmptySlots`

### `chat_storage_service.dart`
**Path:** `lib/core/services/chat_storage_service.dart`
- Simpan/load riwayat chat AI per user di SharedPreferences
- Method: `load`, `save`

### `nutrition_ml_service.dart`
**Path:** `lib/core/services/nutrition_ml_service.dart`
- Kalkulasi insight nutrisi **secara lokal** (tanpa API)
- Menghasilkan grafik kalori harian, prediksi berat, warning, rekomendasi
- Method: `analyze`

### `ai_service.dart`
**Path:** `lib/core/services/ai_service.dart`
- Komunikasi dengan Gemini AI (Google)
- Dipakai untuk rekomendasi menu dan chat

### `currency_service.dart`
**Path:** `lib/core/services/currency_service.dart`
- Helper konversi mata uang

### `notification_service.dart`
**Path:** `lib/core/services/notification_service.dart`
- Jadwalkan notifikasi pengingat makan (Breakfast/Lunch/Dinner)
- Method: `initialize`, `scheduleMealReminders`

### `features/ai_nutrition/services/ml_service.dart`
**Path:** `lib/features/ai_nutrition/services/ml_service.dart`
- HTTP client ke **backend server** untuk endpoint AI
- **Berbeda** dari `nutrition_ml_service.dart` yang kalkulasi lokal
- Method: `analyze`, `recommend`, `sendChat`

---

## 14. Shared Models

**Path:** `lib/shared/models/`

| File | Kelas | Field penting |
|------|-------|--------------|
| `user.dart` | `User` | id, username, email, password, profileImage |
| `meal.dart` | `Meal` | id, name, description, price, calories, dietType, imageUrl, matchPercentage, mealTime, ingredients, steps, reason |
| `budget.dart` | `Budget` | weeklyLimit, spent, remaining |
| `expense.dart` | `Expense` | id, name, category, price, date, userId, isWeekly |
| `nutrition_profile.dart` | `NutritionProfile` | budget, targetCalories, dietType, activityLevel, goalType, eatingPreference, currentWeight, targetWeight, dailyWaterIntake, sleepDuration |
| `nutrition_insight.dart` | `NutritionInsight` | averageCalories, calorieDelta, dailyCalories, weightProgress, mostFrequentFood, habitWarnings, recommendations, summary, predictedWeightChange |
| `nutrition_chat_message.dart` | `NutritionChatMessage` | role, text |

---

## 15. Ringkasan Warna Tema

Ini **semua warna utama** yang dipakai di seluruh app, terurut dari yang paling sering muncul:

| Peran | Warna | Di mana dipakai |
|-------|-------|-----------------|
| **Hijau primer** | `Colors.green` / `Color(0xFF00A878)` / `Color(0xFF4BAE5F)` / `Color(0xFF00C853)` | Tema global, Splash, Header Saran, Game |
| **Biru sekunder** | `Colors.blue.shade900` / `Color(0xFF087CA7)` / `Color(0xFF2979FF)` | Login, Profile, AppBar Planner |
| **Teal/Cyan aksen** | `Color(0xFF31CFA3)` / `Color(0xFF1DE9B6)` | Chat bubble, FAB Budget |
| **Merah error/hapus** | `Colors.redAccent` / `Colors.red.shade50` | Tombol logout, delete, snackbar error |
| **Oranye special** | `Colors.orange.shade700` | Icon "Saran & Kesan" di Profile |
| **Background netral** | `Colors.white` / `Color(0xFFF5F7FA)` / `Color(0xFFF6FBF8)` / `Color(0xFFF7FAF8)` | Scaffold berbagai halaman |

### Cara ubah warna tema global (semua halaman):
Edit di `lib/main.dart` bagian `ThemeData`:
```dart
theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.green,  // <-- ubah ini
    primary: Colors.green,    // <-- dan ini
  ),
  ...
),
```

---

*Dokumen ini dibuat otomatis berdasarkan analisis kode. Update terakhir: sesuai kondisi kode saat ini.*
