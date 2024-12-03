import 'package:flutter/material.dart';
import '../main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var txt = "fulano";
    var wh, hg;

    return CustomScaffold(
      title: "Sobre",
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Meu Perfil',
                style: TextStyle(
                  fontSize: 15,
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
                  color: Color(0xffFFFF00),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff7C7C7C),
                      offset: Offset(10, 10),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/fotoExemplo.png',
                      height: 125,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Nome_Sobrenome',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff7C7C7C),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              caixa(txt, wh = 230, hg = 40, context),
              const SizedBox(
                height: 30,
              ),
              caixa(txt, wh = 230, hg = 40, context),
              const SizedBox(
                height: 30,
              ),
              caixa('Sair', wh = 230, hg = 40, context),
            ],
          ),
        ),
      ),
    );
  }

  caixa(txt, wh, hg, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: wh,
      height: hg,
      decoration: BoxDecoration(
        color: Color(0xffFFFF00),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xff7C7C7C),
            offset: Offset(10, 10),
            blurRadius: 0,
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          isLoggedIn = false;

          Navigator.pushReplacementNamed(context, '/home');
        },
        child: Text(
          txt,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
