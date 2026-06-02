# Smart Meal Project Structure

Proyek ini dipisah menjadi dua bagian utama:

- `lib/`: aplikasi Flutter.
- `backend/server/`: backend proxy Node.js untuk request AI/Gemini.

## Flutter App

Struktur Flutter memakai pendekatan feature-first supaya setiap fitur mudah ditemukan dan dijelaskan.

```text
lib/
  main.dart
  core/
    services/
    utils/
    widgets/
  shared/
    models/
  features/
    auth/
    home/
    profile/
    meal_planner/
    budget/
    ai_recommendation/
    ai_nutrition/
    location/
    game/
```

## Folder Responsibilities

- `core/`: kode umum yang dipakai banyak fitur, seperti database, autentikasi, notifikasi, utilitas, dan widget reusable.
- `shared/`: model data yang dipakai lintas fitur, seperti `Meal`, `Budget`, `Expense`, dan model nutrisi.
- `features/`: kode dipisahkan berdasarkan fitur aplikasi. Setiap fitur bisa punya `screens`, `providers`, `services`, atau `widgets`.
- `assets/`: gambar dan aset Flutter.
- `test/`: unit/widget test Flutter.

## Backend

```text
backend/server/
  index.js
  recommender.js
  analysis/
  prompts/
  utils/
  test/
```

Backend bertugas menjadi proxy API supaya API key Gemini tidak dipanggil langsung dari aplikasi Flutter.
