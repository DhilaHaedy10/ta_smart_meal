import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  // Konstanta Warna berdasarkan UI SmartBite
  static const Color primaryColor = Color(0xFF00A877); // Hijau utama tombol & aksen
  static const Color gradientTop = Color(0xFF02A674);  // Teal atas
  static const Color gradientBottom = Color(0xFF007A60); // Teal tua bawah
  static const Color textDark = Color(0xFF1E1E2A);     // Warna teks utama "Selamat Datang"
  static const Color textMuted = Color(0xFF7D838B);    // Warna teks sub-informasi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Saran & Kesan TPM",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // Menjaga tombol back tetap putih
      ),
      body: Container(
        // Gradasi disesuaikan dengan bagian atas aplikasi SmartBite
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              gradientTop,
              gradientBottom,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Elemen ikon rate atas yang disederhanakan agar menyatu dengan gradasi
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.chat_bubble_outline_rounded,
                  size: 48,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              
              // Pembungkus putih melengkung di bawah, mirip gaya card login SmartBite
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Ulasan Kuliah",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: textDark,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Terima kasih telah menyelesaikan modul ini.",
                          style: TextStyle(
                            fontSize: 14,
                            color: textMuted,
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        // --- CARD KESAN ---
                        _buildFeedbackCard(
                          icon: Icons.lightbulb_outline_rounded,
                          title: "Kesan Kuliah TPM",
                          content: "Sangat menantang karena harus menggabungkan banyak fitur mobile dalam satu aplikasi.",
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // --- CARD SARAN ---
                        _buildFeedbackCard(
                          icon: Icons.assignment_turned_in_outlined,
                          title: "Saran untuk Kedepannya",
                          content: "Saya berharap kedepannya pada tiap kelas, waktu presentasi bisa lebih terorganisir.",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget Card dengan styling ala SmartBite input field (clean, subtle border/background)
  Widget _buildFeedbackCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA), // Latar belakang abu-abu sangat muda seperti text field SmartBite
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE9ECEF)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ikon menggunakan warna primary hijau SmartBite
            Icon(icon, size: 28, color: primaryColor),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textDark,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Color(0xFF495057), // Teks konten yang sedikit lebih kontras di background putih
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}