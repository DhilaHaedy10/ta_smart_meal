import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/auth_service.dart';

class ChatStorageService {
  static const _key = 'ai_chat_history';
  final AuthService _authService = AuthService();

  Future<List<Map<String, dynamic>>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(await _userScopedKey());
    if (raw == null || raw.isEmpty) return [];
    final list = jsonDecode(raw) as List;
    return list.map((e) => Map<String, dynamic>.from(e)).toList();
  }

  Future<void> save(List<Map<String, dynamic>> list) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(await _userScopedKey(), jsonEncode(list));
  }

  Future<String> _userScopedKey() async {
    final userId = await _authService.getUserId();
    final suffix = userId?.trim().isNotEmpty == true ? userId!.trim() : 'guest';
    return '${_key}_$suffix';
  }
}
