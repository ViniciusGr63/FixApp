import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _telefoneController = TextEditingController();

  Future<void> _registerUser() async {
    final url = Uri.parse(
        "https://ideiafix-back-end-824c.onrender.com/api"); // Substitua pelo URL da sua API

    final body = {
      "nome": _nomeController.text,
      "email": _emailController.text,
      "senha": _senhaController.text,
      "fotoPerfil": "https://example.com/foto-perfil.jpg",
      "Cliente": {
        "endereco": _enderecoController.text,
        "telefone": _telefoneController.text,
      }
    };

    try {
      print('Enviando requisição para $url');
      print('Dados enviados: ${jsonEncode(body)}');

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        // Sucesso
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Usuário registrado com sucesso!')),
        );
      } else {
        // Erro
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Erro ao registrar usuário: ${response.body}')),
        );
      }
    } catch (e) {
      // Erro de conexão ou outro problema
      print('Erro de rede: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro de rede: $e')),
      );
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
              Image.asset(
                'assets/images/fix_logo.png',
                height: 70,
              ),
              const SizedBox(height: 40),
              const Text(
                'Cadastre-se',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              _buildTextField("Nome completo", _nomeController),
              _buildTextField("Email", _emailController),
              _buildTextField("Senha", _senhaController, obscureText: true),
              _buildTextField("Endereço", _enderecoController),
              _buildTextField("Telefone", _telefoneController),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _registerUser,
                child: const Text(
                  'Cadastrar',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff7C7C7C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Já possui uma conta? ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        color: Colors.white,
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

  Widget _buildTextField(String label, TextEditingController controller,
      {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label:',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15.0,
          ),
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: const InputDecoration(
            labelStyle: TextStyle(color: Color(0xff7a7a7a)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
