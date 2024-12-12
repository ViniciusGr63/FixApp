import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> listOneData = [];
  List<dynamic> listTwoData = [];

  // Buscar os dados
  Future<void> fetchData() async {
    try {
      Dio dio = Dio();
      final responseOne =
          await dio.get('https://fixappapi.onrender.com/api/categorias');
      final responseTwo =
          await dio.get('https://fixappapi.onrender.com/api/profissionais');

      setState(() {
        listOneData = responseOne.data;
        listTwoData = responseTwo.data;
      });
    } catch (e) {
      print('Erro ao carregar dados: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    int minCategories = 8;
    int minProfessionals = 8;

    List<dynamic> extendedCategories = List.from(listOneData)
      ..addAll(List.generate(minCategories - listOneData.length,
          (index) => {'name': 'Categoria $index', 'imageUrl': null}));

    List<dynamic> extendedProfessionals = List.from(listTwoData)
      ..addAll(List.generate(minProfessionals - listTwoData.length,
          (index) => {'name': 'Profissional $index', 'imageUrl': null}));

    return CustomScaffold(
      title: 'Home',
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const Text(
                'Home',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff7C7C7C),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Categorias',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff7C7C7C),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: screenWidth * 0.55,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: extendedCategories.length,
                  itemBuilder: (context, index) {
                    var item = extendedCategories[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: screenWidth * 0.45,
                        height: screenWidth * 0.45,
                        decoration: BoxDecoration(
                          color: const Color(0xfff7fb27),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xff7C7C7C),
                              offset: Offset(5, 5),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              item['name'] ?? 'Sem título',
                              style: const TextStyle(
                                color: Color(0xff7C7C7C),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            // Imagem do ícone da categoria
                            Image.network(
                              item['imageUrl'] ??
                                  'https://via.placeholder.com/150',
                              height: screenWidth * 0.3,
                              width: screenWidth * 0.3,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 10),

                            Text(
                              'Informações adicionais',
                              style: const TextStyle(
                                color: Color(0xff7C7C7C),
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              const Divider(thickness: 2),
              const Text(
                'Profissionais',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff7C7C7C),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: screenWidth *
                    0.6, // Aumentei ainda mais a altura para os profissionais
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: extendedProfessionals.length,
                  itemBuilder: (context, index) {
                    var item = extendedProfessionals[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width:
                            screenWidth * 0.45, // Aumentei ainda mais a largura
                        height:
                            screenWidth * 0.45, // Ajustei para o mesmo tamanho
                        decoration: BoxDecoration(
                          color: const Color(0xfff7fb27), // Amarelo suave
                          borderRadius: BorderRadius.circular(
                              15), // Bordas mais arredondadas
                          border: Border.all(
                            color: Colors.white, // Bordas brancas
                            width: 2,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xff7C7C7C), // Sombra suave
                              offset: Offset(5, 5),
                              blurRadius: 3, // Sombra mais suave
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              item['name'] ?? 'Sem nome',
                              style: const TextStyle(
                                color: Color(0xff7C7C7C),
                                fontSize: 14, // Ajuste no tamanho da fonte
                                fontWeight:
                                    FontWeight.bold, // Fonte mais ousada
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            // Imagem do profissional
                            Image.network(
                              item['imageUrl'] ??
                                  'https://via.placeholder.com/150', // Placeholder caso não haja imagem
                              height: screenWidth *
                                  0.3, // Aumentei o tamanho da imagem
                              width: screenWidth *
                                  0.3, // Aumentei o tamanho da imagem
                              fit: BoxFit.cover, // Melhor ajuste de imagem
                            ),
                            const SizedBox(height: 10),
                            // Adicionando texto adicional para o profissional
                            Text(
                              'Informações adicionais',
                              style: const TextStyle(
                                color: Color(0xff7C7C7C),
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
