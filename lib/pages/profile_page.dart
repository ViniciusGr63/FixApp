import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? _userData;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      final userId = prefs.getString('user_id');

      if (token == null) {
        setState(() {
          _errorMessage = 'Usuário não autenticado';
        });
        print('Token não encontrado'); // Imprimir erro no terminal
        return;
      }

      final response = await http.get(
        Uri.parse('https://ideiafix-back-end-824c.onrender.com/api/$userId'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          _userData = jsonDecode(response.body);
        });
      } else {
        setState(() {
          _errorMessage = 'Erro ao buscar dados do usuário';
        });
        print(
            'Erro ao buscar dados: ${response.statusCode} - ${response.body}'); // Imprimir erro no terminal
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Erro de conexão: $e';
      });
      print('Erro de conexão: $e'); // Imprimir erro no terminal
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        backgroundColor: Colors.yellow,
      ),
      body: _errorMessage.isNotEmpty
          ? Center(
              child: Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            )
          : _userData == null
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Meu Perfil',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff7C7C7C),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFF00),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xff7C7C7C),
                              offset: Offset(10, 10),
                              blurRadius: 0,
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/images/fotoExemplo.png',
                          height: 125,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _userData?['nome'] ?? 'Nome não disponível',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff7C7C7C),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _userData?['email'] ?? 'Email não disponível',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xff7C7C7C),
                        ),
                      ),
                      const SizedBox(height: 30),
                      _buildButton('Alterar Dados', 230, 40),
                      const SizedBox(height: 30),
                      _buildButton('Configurações', 230, 40),
                      const SizedBox(height: 30),
                      _buildButton('Sair', 230, 40, onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.remove('auth_token');
                        if (context.mounted) {
                          Navigator.pushReplacementNamed(context, '/login');
                        }
                      }),
                    ],
                  ),
                ),
    );
  }

  Widget _buildButton(String text, double width, double height,
      {VoidCallback? onPressed}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xffFFFF00),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0xff7C7C7C),
            offset: Offset(10, 10),
            blurRadius: 0,
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
