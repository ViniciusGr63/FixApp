import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../main.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<dynamic> favoritesData = [];
  bool isLoading = true;
  String errorMessage = '';

  // Função para buscar os favoritos
  Future<void> fetchFavorites() async {
    try {
      Dio dio = Dio();
      final response =
          await dio.get('https://fixappapi.onrender.com/api/favoritos');

      if (response.statusCode == 200 && response.data is List) {
        setState(() {
          favoritesData =
              List.from(response.data); // Garantir que o tipo seja List
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Dados inválidos recebidos.';
          isLoading = false;
        });
      }
    } catch (e) {
      print('Erro ao carregar favoritos: $e');
      setState(() {
        errorMessage = 'Erro ao carregar os favoritos.';
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Favoritos',
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Favoritos',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff7C7C7C),
                ),
              ),
              const SizedBox(height: 20),
              // Indicador de progresso ou erro
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    ) // Carregando
                  : errorMessage.isNotEmpty
                      ? Center(
                          child: Text(
                            errorMessage,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        )
                      : favoritesData.isEmpty
                          ? const Center(
                              child: Text(
                                'Nenhum favorito encontrado.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 150,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: favoritesData.length,
                                itemBuilder: (context, index) {
                                  var item = favoritesData[index];

                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Container(
                                      width: 100,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color: const Color(0xfff7fb27),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(0xff7C7C7C),
                                            offset: Offset(5, 5),
                                            blurRadius: 0,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.network(
                                            item['imageUrl'] ??
                                                'https://via.placeholder.com/150',
                                            height: 60,
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            item['name'] ?? 'Nome desconhecido',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
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
