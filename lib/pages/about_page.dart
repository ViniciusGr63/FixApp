import 'package:flutter/material.dart';
import '../main.dart'; // Verifique se o caminho de importação do CustomScaffold está correto

// Classe ServicePage representando a tela do serviço
class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      // Título da página
      title: "Serviço_ x",

      // Corpo da página centralizado
      body: Center(
        child: Padding(
          // Espaçamento ao redor do conteúdo
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // Alinhamento no início para os elementos da coluna
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Texto de título "Sobre"
              const Text(
                'Sobre',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff7C7C7C),
                ),
              ),

              // Espaçamento vertical
              const SizedBox(height: 20),

              // Container para exibir informações detalhadas
              Container(
                padding: const EdgeInsets.all(16.0), // Espaçamento interno
                width: 250, // Largura fixa
                height: 400, // Altura fixa
                decoration: BoxDecoration(
                  color: Color(0xffFFFF00), // Cor de fundo amarela
                  borderRadius: BorderRadius.circular(20), // Bordas arredondadas
                  border: Border.all(
                    color: Colors.white, // Cor da borda
                    width: 1, // Largura da borda
                  ),
                  // Sombra para dar um efeito de profundidade
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff7C7C7C), // Cor da sombra
                      offset: Offset(20, 20), // Deslocamento da sombra
                      blurRadius: 0, // Raio de desfoque
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Alinhamento dos textos
                  children: [
                    // Texto de descrição longa
                    const Text(
                      'descrição: Lorem Ipsum is simply dus standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7C7C7C),
                      ),
                    ),

                    // Espaçamento vertical
                    const SizedBox(height: 10),

                    // Informações adicionais (repetitivas)
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

                    // Botão de ação
                    ElevatedButton(
                      onPressed: () {
                        // Lógica do botão será adicionada aqui
                      },
                      child: const Text("Adicionar"),
                    )
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
