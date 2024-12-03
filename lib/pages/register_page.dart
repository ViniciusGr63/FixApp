import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFC3F75),
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
                    'Cadastre-se',
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
                      'Nome completo:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    TextField(
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
                      'Data de nascimento:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    TextField(
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
                    const SizedBox(height: 20),
                    const Text(
                      'Endereço:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    TextField(
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
                    const SizedBox(height: 20),
                    const Text(
                      '---------------:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    TextField(
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
                    const SizedBox(height: 20),
                    const Text(
                      '---------------:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    TextField(
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
                onPressed: () {
                  print('Entrar pressionado');
                },
                child: const Text(
                  'Cadastrar',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff7C7C7C),
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
                      color: Color(0xff000000),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    child: const Text(
                      'Entrar',
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
