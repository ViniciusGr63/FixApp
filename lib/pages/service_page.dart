import 'package:flutter/material.dart';
import '../main.dart'; // Verifique se o caminho de importação do CustomScaffold está correto




class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Serviço_ x",
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Sobre',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff7C7C7C),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                width: 250,
                height: 400,
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
                      offset: Offset(20, 20),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'descrição: Lorem Ipsum is simply dus standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7C7C7C),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'info',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff7C7C7C),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'info',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff7C7C7C),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'info',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff7C7C7C),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'info',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff7C7C7C),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // Adicione a lógica desejada para o botão
                        },
                        child: const Text("Adicionar"))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
