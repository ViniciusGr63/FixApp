import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFC3F75), // Cor de fundo da página
      body: SingleChildScrollView(
        // Para permitir a rolagem
        child: Padding(
          padding: const EdgeInsets.all(
              16.0), // Para adicionar um espaçamento ao redor
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/fix_logo.png',
                    height: 70, // Ajuste o tamanho conforme necessário
                  ),
                  const SizedBox(height: 40),

                  // Título "Login"
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffffffff), // Cor do título
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
                      ), // Texto branco
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelStyle:
                            TextStyle(color: Color(0xff7a7a7a)), // Cor do label
                        floatingLabelBehavior: FloatingLabelBehavior
                            .always, // Label sempre flutuante
                        fillColor: Colors.white, // Fundo branco
                        filled: true, // Necessário para aplicar o fundo branco
                        border: InputBorder.none, // Remover a borda

                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 10), // Ajusta o espaçamento interno
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Senha',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ), // Texto branco
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelStyle:
                            TextStyle(color: Color(0xff646464)), // Cor do label
                        floatingLabelBehavior: FloatingLabelBehavior
                            .always, // Label sempre flutuante
                        fillColor: Colors.white, // Fundo branco
                        filled: true, // Necessário para aplicar o fundo branco
                        border: InputBorder.none, // Remover a borda
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 10), // Ajusta o espaçamento interno
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Lógica de autenticação aqui
                  print('Entrar pressionado');
                },
                child: const Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white), // Texto branco
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff7C7C7C), // Cor do fundo do botão

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
                    'Não tem uma conta? ',
                    style: TextStyle(
                      color: Color(0xff000000), // Cor do texto
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navegar para a página de cadastro
                      Navigator.pushNamed(context, "/register");
                    },
                    child: const Text(
                      'Cadastre-se',
                      style: TextStyle(
                        color: Color(0xffffffff), // Texto azul
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
