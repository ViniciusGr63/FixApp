import 'package:flutter/material.dart';
import '../main.dart';

// Classe que representa a página "Sobre"
class AboutPage extends StatelessWidget {
  const AboutPage({super.key}); // Construtor padrão para widgets sem estado (StatelessWidget)

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Sobre", // Título da página exibido no AppBar
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Espaçamento em torno do conteúdo
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Alinha os filhos à esquerda
            children: <Widget>[
              // Texto do cabeçalho "Sobre"
              const Text(
                'Sobre',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff7C7C7C), // Cor do texto (cinza)
                ),
              ),
              const SizedBox(height: 20), // Espaço entre o cabeçalho e o conteúdo
              
              // Caixa amarela com borda arredondada e sombra
              Container(
                padding: const EdgeInsets.all(16.0), // Espaçamento interno do container
                width: 250, // Largura do container
                height: 400, // Altura do container
                decoration: BoxDecoration(
                  color: Color(0xffFFFF00), // Cor de fundo amarela
                  borderRadius: BorderRadius.circular(20), // Bordas arredondadas
                  border: Border.all(
                    color: Colors.white, // Cor da borda (branca)
                    width: 1, // Largura da borda
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff7C7C7C), // Cor da sombra (cinza)
                      offset: Offset(20, 20), // Posição da sombra (deslocamento)
                      blurRadius: 0, // Controle do desfoque da sombra
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Alinha os elementos internos à esquerda
                  children: [
                    // Saudação inicial dentro do container
                    const Text(
                      'Olá!!!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7C7C7C), // Cor do texto (cinza)
                      ),
                    ),
                    const SizedBox(height: 10), // Espaço entre os textos

                    // Texto explicativo sobre o aplicativo
                    const Text(
                      'Este é um aplicativo simples feito com Flutter. '
                      'Aqui você pode aprender como navegar entre páginas e '
                      'fazer chamadas de API. A página "Sobre" é destinada a '
                      'informar ao usuário mais sobre o app.',
                      textAlign: TextAlign.left, // Alinha o texto à esquerda
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff7C7C7C), // Cor do texto (cinza)
                      ),
                    ),
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
