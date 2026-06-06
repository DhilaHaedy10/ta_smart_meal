import 'package:flutter/material.dart';
import 'package:smart_meal_ta/core/services/database_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DatabaseService _dbService = DatabaseService();

  bool _obscurePassword = true;
  bool _isLoading = false;

  bool _isValidEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }

  void _showSnackBar(String message, Color color) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _handleRegister() async {
    final user = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final pass = _passwordController.text.trim();

    if (user.isEmpty || email.isEmpty || pass.isEmpty) {
      _showSnackBar("Semua kolom wajib diisi!", Colors.orange);
      return;
    }
    if (!_isValidEmail(email)) {
      _showSnackBar("Format email tidak valid!", Colors.redAccent);
      return;
    }
    if (pass.length < 6) {
      _showSnackBar("Password minimal 6 karakter!", Colors.orange);
      return;
    }

    setState(() => _isLoading = true);
    try {
      await _dbService.registerUser(user, email, pass);
      if (mounted) {
        _showSnackBar("Akun berhasil dibuat!", const Color(0xFF00A878));
        Navigator.pop(context);
      }
    } catch (e) {
      _showSnackBar("Username atau email sudah terdaftar!", Colors.redAccent);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // ── BACKGROUND GRADIENT ──
          Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF00A878), Color(0xFF087CA7)],
              ),
            ),
          ),

          // ── DEKORASI LINGKARAN ──
          Positioned(
            top: -40,
            left: -50,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.07),
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),

          // ── KONTEN UTAMA ──
          SafeArea(
            child: Column(
              children: [
                // BAGIAN ATAS — Teks sambutan
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Buat Akun Baru',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.3,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Mulai perjalanan makan sehat & hemat\nbersama SmartBite',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.85),
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // BAGIAN BAWAH — Panel Form
                Expanded(
                  flex: 7,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(28, 32, 28, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Step indicator kecil
                          Row(
                            children: [
                              Container(
                                width: 28,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF00A878),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Container(
                                width: 28,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // Input Username
                          _buildInputField(
                            controller: _usernameController,
                            label: 'Username',
                            hint: 'Nama panggilanmu',
                            icon: Icons.person_outline,
                          ),
                          const SizedBox(height: 16),

                          // Input Email
                          _buildInputField(
                            controller: _emailController,
                            label: 'Email',
                            hint: 'contoh@email.com',
                            icon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 16),

                          // Input Password
                          _buildInputField(
                            controller: _passwordController,
                            label: 'Password',
                            hint: 'Minimal 6 karakter',
                            icon: Icons.lock_outline,
                            isPassword: true,
                            obscure: _obscurePassword,
                            onToggleObscure: () => setState(
                                () => _obscurePassword = !_obscurePassword),
                          ),
                          const SizedBox(height: 10),

                          // Syarat password
                          Row(
                            children: [
                              Icon(Icons.info_outline,
                                  size: 13, color: Colors.grey.shade400),
                              const SizedBox(width: 5),
                              Text(
                                'Password minimal 6 karakter',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey.shade400),
                              ),
                            ],
                          ),
                          const SizedBox(height: 28),

                          // Tombol Daftar
                          _isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : SizedBox(
                                  width: double.infinity,
                                  height: 54,
                                  child: ElevatedButton(
                                    onPressed: _handleRegister,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF00A878),
                                      foregroundColor: Colors.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    child: const Text(
                                      'Daftar Sekarang',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ),

                          const SizedBox(height: 20),

                          // Link kembali ke login
                          Center(
                            child: TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Sudah punya akun? ',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14),
                                  children: const [
                                    TextSpan(
                                      text: 'Masuk',
                                      style: TextStyle(
                                        color: Color(0xFF00A878),
                                        fontWeight: FontWeight.bold,
                                      ),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
    bool obscure = false,
    VoidCallback? onToggleObscure,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: Color(0xFF1A1A2E),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscure,
          style: const TextStyle(fontSize: 15),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            prefixIcon: Icon(icon, color: const Color(0xFF00A878), size: 20),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey.shade400,
                      size: 20,
                    ),
                    onPressed: onToggleObscure,
                  )
                : null,
            filled: true,
            fillColor: const Color(0xFFF6FBF9),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide:
                  const BorderSide(color: Color(0xFF00A878), width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
