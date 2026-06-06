import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:smart_meal_ta/core/services/database_service.dart';
import 'package:smart_meal_ta/core/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  final DatabaseService _dbService = DatabaseService();
  final LocalAuthentication _auth = LocalAuthentication();

  bool _isLoading = false;
  bool _obscureText = true;
  bool _isBiometricEnabled = false;

  @override
  void initState() {
    super.initState();
    _checkBiometricStatus();
  }

  Future<void> _checkBiometricStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isBiometricEnabled = prefs.getBool('use_biometric') ?? false;
    });
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

  void _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar("Email dan password wajib diisi!", Colors.orange);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final user = await _dbService.loginUser(email, password);
      if (user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('last_user_id', user['id'].toString());
        await _authService.saveSession(user['id'].toString());
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, '/home');
        return;
      } else {
        _showSnackBar("Email atau Password salah!", Colors.redAccent);
      }
    } catch (e) {
      _showSnackBar(
          e.toString().replaceFirst('Exception: ', ''), Colors.redAccent);
    }

    if (mounted) setState(() => _isLoading = false);
  }

  Future<void> _handleBiometricLogin() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedUserId = prefs.getString('last_user_id');

      if (savedUserId == null) {
        _showSnackBar("Silakan login manual terlebih dahulu", Colors.blueGrey);
        return;
      }

      final canCheck =
          await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
      if (!canCheck) {
        _showSnackBar("Perangkat tidak mendukung biometrik", Colors.grey);
        return;
      }

      final authenticated = await _auth.authenticate(
        localizedReason: 'Gunakan sidik jari atau wajah untuk masuk',
        options: const AuthenticationOptions(
          biometricOnly: false,
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );

      if (authenticated) {
        await _authService.saveSession(savedUserId);
        if (mounted) Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      debugPrint("Biometric error: $e");
      _showSnackBar("Autentikasi gagal", Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // ── BACKGROUND GRADIENT PENUH ──
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF00A878), Color(0xFF087CA7)],
              ),
            ),
          ),

          // ── LINGKARAN DEKORASI BELAKANG ──
          Positioned(
            top: -60,
            right: -60,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
          ),
          Positioned(
            top: 60,
            right: 40,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.06),
              ),
            ),
          ),

          // ── KONTEN UTAMA ──
          SafeArea(
            child: Column(
              children: [
                // BAGIAN ATAS — Logo & Sambutan
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo dengan shadow halus
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 24,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: Image.asset(
                              'assets/images/smartbite_logo.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          'SmartBite',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Makan sehat, hemat lebih cerdas',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.85),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // BAGIAN BAWAH — Panel Form Login
                Expanded(
                  flex: 6,
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
                      padding: const EdgeInsets.fromLTRB(28, 36, 28, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Judul form
                          const Text(
                            'Selamat Datang',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF1A1A2E),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Masuk untuk melanjutkan',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          const SizedBox(height: 28),

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
                            hint: '••••••••',
                            icon: Icons.lock_outline,
                            isPassword: true,
                            obscure: _obscureText,
                            onToggleObscure: () =>
                                setState(() => _obscureText = !_obscureText),
                          ),
                          const SizedBox(height: 28),

                          // Tombol Login
                          _isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : _buildLoginButton(),

                          // Tombol Biometrik
                          if (!_isLoading && _isBiometricEnabled) ...[
                            const SizedBox(height: 16),
                            _buildDivider(),
                            const SizedBox(height: 16),
                            _buildBiometricButton(),
                          ],

                          const SizedBox(height: 20),

                          // Link Register
                          Center(
                            child: TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/register'),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Belum punya akun? ',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14),
                                  children: const [
                                    TextSpan(
                                      text: 'Daftar Sekarang',
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

  // ── WIDGET HELPER ──

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

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00A878),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text(
          'Masuk',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade300)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'atau',
            style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey.shade300)),
      ],
    );
  }

  Widget _buildBiometricButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: OutlinedButton.icon(
        onPressed: _handleBiometricLogin,
        icon: const Icon(Icons.fingerprint, size: 24, color: Color(0xFF087CA7)),
        label: const Text(
          'Masuk dengan Biometrik',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF087CA7),
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF087CA7), width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
