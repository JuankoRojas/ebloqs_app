import 'package:ebloqs_app/src/screens/market/market_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExchangesScreen extends StatefulWidget {
  const ExchangesScreen({super.key, required this.future});
  final Future<Payload>? future;

  @override
  State<ExchangesScreen> createState() => _ExchangesScreenState();
}

class _ExchangesScreenState extends State<ExchangesScreen> {
  Future getCategory({required String id}) async {
    try {
      var response = await http.get(
        Uri.parse(
            "https://pro-api.coinmarketcap.com/v1/cryptocurrency/category?id=$id"),
        headers: {
          'X-CMC_PRO_API_KEY': 'e5421cfd-c95b-49e1-8267-29777bb45e02',
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load categoryE');
      }
    } catch (e) {
      print(e);
    }
  }

  Future getExchange({required List<String> id}) async {
    try {
      final str = id.join(',');
      print('str: $str');
      var response = await http.get(
        Uri.parse("https://pro-api.coinmarketcap.com/v1/exchange/info?id=$str"),
        headers: {
          'X-CMC_PRO_API_KEY': 'e5421cfd-c95b-49e1-8267-29777bb45e02',
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load exchanges');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: size.height * 0.0357142857142857,
              left: size.width * 0.016,
              right: size.width * 0.016),
          child: Row(
            children: [
              const Text(
                "#",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff170658),
                  fontSize: 12,
                  fontFamily: "Archivo",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SvgPicture.asset('assets/Vectores/Iconos/Polygon 3.svg'),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.016),
                child: const Text(
                  "Intercambio",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 12,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SvgPicture.asset('assets/Vectores/Iconos/Polygon 3.svg'),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.128),
                child: const Text(
                  "24h Volume",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 12,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SvgPicture.asset('assets/Vectores/Iconos/Polygon 3.svg'),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.0853333333333333),
                child: const Text(
                  "Puntuación",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 12,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SvgPicture.asset('assets/Vectores/Iconos/Polygon 3.svg'),
            ],
          ),
        ),
        Expanded(
            child: FutureBuilder(
                future: widget.future,
                builder: (context, AsyncSnapshot<Payload> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Text('none');
                    case ConnectionState.waiting:
                      return const Center(child: SizedBox());
                    case ConnectionState.active:
                      return const Text('');
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Text(
                          '${snapshot.error}',
                          style: const TextStyle(color: Colors.red),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.data!.length,
                            itemBuilder: (context, index) {
                              return FutureBuilder(
                                  future: getCategory(
                                      id: "605e2ce9d41eae1066535f7c"),
                                  builder: (context,
                                      AsyncSnapshot snapshotCategory) {
                                    switch (snapshotCategory.connectionState) {
                                      case ConnectionState.none:
                                        return const Text('none');
                                      case ConnectionState.waiting:
                                        return const Center(child: SizedBox());
                                      case ConnectionState.active:
                                        return const Text('');
                                      case ConnectionState.done:
                                        if (snapshotCategory.hasError) {
                                          return Text(
                                            '${snapshotCategory.error}',
                                            style: const TextStyle(
                                                color: Colors.red),
                                          );
                                        } else {
                                          final List<String> idExchanges = [];
                                          for (var i = 0;
                                              i < snapshot.data!.data!.length;
                                              i++) {
                                            idExchanges.add(snapshot
                                                .data!.data![i].id!
                                                .toString());
                                          }

                                          return FutureBuilder(
                                              future:
                                                  getExchange(id: idExchanges),
                                              builder: (context,
                                                  AsyncSnapshot
                                                      snapshotExchange) {
                                                switch (snapshotExchange
                                                    .connectionState) {
                                                  case ConnectionState.none:
                                                    return const Text('none');
                                                  case ConnectionState.waiting:
                                                    return const Center(
                                                        child: SizedBox());
                                                  case ConnectionState.active:
                                                    return const Text('');
                                                  case ConnectionState.done:
                                                    if (snapshotExchange
                                                        .hasError) {
                                                      return Text(
                                                        '${snapshotExchange.error}',
                                                        style: const TextStyle(
                                                            color: Colors.red),
                                                      );
                                                    } else {
                                                      print(
                                                          'Exchan: $snapshotExchange');
                                                      return Container();
                                                    }
                                                }
                                              });
                                        }
                                    }
                                  });
                            });
                      }
                  }
                }))
      ],
    );
  }
}
