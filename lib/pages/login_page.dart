import 'package:flutter/material.dart';
import '../main.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  bool _isLoading = false;
  String _errorMessage = '';

  Future<bool> login(String email, String senha) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://ideiafix-back-end-824c.onrender.com/api/login'), // Substitua pela URL do seu backend
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': email,
          'senha': senha,
        }),
      );

      print(
          'Status code: ${response.statusCode}'); // Exibe o código de status no terminal

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Resposta do servidor: $data'); // Exibe a resposta do servidor

        // Verifica se a resposta contém o token e o usuário
        if (data.containsKey('token') && data.containsKey('user')) {
          String token = data['token'];
          var user = data['user'];

          // Aqui você pode armazenar o token para autenticação posterior
          print('Token: $token');
          print('Usuário: ${user['email']}');

          return true;
        } else {
          print('Erro: resposta sem token ou usuário');
          return false;
        }
      } else {
        print('Erro: Status não é 200');
        throw Exception('Falha no login');
      }
    } catch (e) {
      print('Erro de requisição: $e'); // Exibe o erro da requisição
      rethrow;
    }
  }

  void _handleLogin() async {
    setState(() {
      isLoggedIn = false;
      _errorMessage = '';
    });

    try {
      bool isAuthenticated = await login(
        _emailController.text,
        _senhaController.text,
      );
      if (isAuthenticated) {
        setState(() {
          isLoggedIn = false;
        });
        isLoggedIn = true;
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() {
          isLoggedIn = false;
          _errorMessage = 'Credenciais inválidas';
        });
      }
    } catch (e) {
      setState(() {
        isLoggedIn = false;
        _errorMessage = 'Erro de conexão';
      });
      print('Erro no login: $e'); // Exibe erro do login no terminal
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFC3F75),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/fix_logo.png',
                    height: 70,
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffffffff),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Color(0xff7a7a7a)),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        fillColor: Colors.white,
                        filled: true,
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Senha',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    TextField(
                      controller: _senhaController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Color(0xff646464)),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        fillColor: Colors.white,
                        filled: true,
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _isLoading ? null : _handleLogin,
                child: _isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white),
                      ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff7C7C7C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Não tem uma conta? ',
                    style: TextStyle(
                      color: Color(0xff000000),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context,
                          "/register"); // Adicione lógica para navegar para a tela de registro, se necessário
                    },
                    child: const Text(
                      'Cadastre-se',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Inicial'),
      ),
      body: Center(
        child: const Text('Bem-vindo ao sistema!'),
      ),
    );
  }
}
