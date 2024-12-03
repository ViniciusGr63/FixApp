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

  // buscar os dados
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
    //largura da tela
    double screenWidth = MediaQuery.of(context).size.width;

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
                height: screenWidth * 0.3,
                child: listOneData.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: listOneData.length,
                        itemBuilder: (context, index) {
                          var item = listOneData[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              width: screenWidth * 0.25,
                              height: screenWidth * 0.25,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    item['name'] ?? 'Sem título',
                                    style: const TextStyle(
                                      color: Color(0xff7C7C7C),
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 10),
                                  Image.network(
                                    item['imageUrl'] ??
                                        'https://via.placeholder.com/150',
                                    height: screenWidth * 0.15,
                                    fit: BoxFit.contain,
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
                height: screenWidth * 0.4,
                child: listTwoData.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: listTwoData.length,
                        itemBuilder: (context, index) {
                          var item = listTwoData[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              width: screenWidth * 0.3,
                              height: screenWidth * 0.3,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    item['name'] ?? 'Sem nome',
                                    style: const TextStyle(
                                      color: Color(0xff7C7C7C),
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 10),
                                  Image.network(
                                    item['imageUrl'] ??
                                        'https://via.placeholder.com/150',
                                    height: screenWidth * 0.2,
                                    fit: BoxFit.contain,
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
