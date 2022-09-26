import 'dart:convert';

import 'package:ebloqs_app/src/screens/market/market_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.future});
  final Future<Payload>? future;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  Future? _future;

  Future getCategories() async {
    try {
      var response = await http.get(
        Uri.parse(
            "https://pro-api.coinmarketcap.com/v1/cryptocurrency/categories"),
        headers: {
          'X-CMC_PRO_API_KEY': 'e5421cfd-c95b-49e1-8267-29777bb45e02',
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print(e);
    }
  }

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
        throw Exception('Failed to load category');
      }
    } catch (e) {
      print(e);
    }
  }

  Future getCryptoIcons({required String name}) async {
    try {
      var response = await http.get(
        Uri.parse(
            "https://pro-api.coinmarketcap.com/v1/cryptocurrency/info?symbol=$name"),
        headers: {
          'X-CMC_PRO_API_KEY': 'e5421cfd-c95b-49e1-8267-29777bb45e02',
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _future = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
            child: FutureBuilder(
                future: _future,
                builder: (context, AsyncSnapshot snapshot) {
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
                        if (snapshot.data != null) {
                          Map<String, dynamic> datos =
                              jsonDecode(snapshot.data);
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      top: size.height * 0.0357142857142857),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                datos['data'][index]['name'],
                                                style: const TextStyle(
                                                  color: Color(0xff170658),
                                                  fontSize: 13,
                                                  fontFamily: "Archivo",
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                '${datos['data'][index]["num_tokens"].toString()} Tokens',
                                                style: const TextStyle(
                                                  color: Color(0xffb3b3b3),
                                                  fontSize: 12,
                                                ),
                                              )
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '${datos['data'][index]['market_cap'].toStringAsFixed(2)} Bn',
                                                style: const TextStyle(
                                                  color: Color(0xff170658),
                                                  fontSize: 13,
                                                  fontFamily: "Archivo",
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                '${datos['data'][index]["avg_price_change"].toStringAsFixed(2)} %',
                                                style: TextStyle(
                                                  color: (datos['data'][index][
                                                              "avg_price_change"] >
                                                          0)
                                                      ? const Color(0xff00C853)
                                                      : const Color(0xffEC4141),
                                                  fontSize: 13,
                                                  fontFamily: "Archivo",
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: size.height *
                                                0.0184729064039409),
                                        child: Row(
                                          children: [
                                            const Text(
                                              "Trending Token",
                                              style: TextStyle(
                                                color: Color(0xffb3b3b3),
                                                fontSize: 12,
                                                fontFamily: "Archivo",
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const Spacer(),
                                            FutureBuilder(
                                                future: getCategory(
                                                    id: datos['data'][index]
                                                        ["id"]),
                                                builder: (context,
                                                    AsyncSnapshot
                                                        snapshotCategory) {
                                                  switch (snapshotCategory
                                                      .connectionState) {
                                                    case ConnectionState.none:
                                                      return const Text('none');
                                                    case ConnectionState
                                                        .waiting:
                                                      return const Center(
                                                          child: SizedBox());
                                                    case ConnectionState.active:
                                                      return const Text('');
                                                    case ConnectionState.done:
                                                      if (snapshotCategory
                                                          .hasError) {
                                                        return Text(
                                                          '${snapshotCategory.error}',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .red),
                                                        );
                                                      } else {
                                                        if (snapshotCategory
                                                                .data !=
                                                            null) {
                                                          Map<String, dynamic>
                                                              datos =
                                                              jsonDecode(
                                                                  snapshotCategory
                                                                      .data);
                                                          return Row(
                                                            children: [
                                                              FutureBuilder(
                                                                  future: getCryptoIcons(
                                                                      name: datos['data']['coins']
                                                                              [
                                                                              0]
                                                                          [
                                                                          'symbol']),
                                                                  builder: (context,
                                                                      AsyncSnapshot
                                                                          snapshotCryptoIcons) {
                                                                    switch (snapshotCategory
                                                                        .connectionState) {
                                                                      case ConnectionState
                                                                          .none:
                                                                        return const Text(
                                                                            'none');
                                                                      case ConnectionState
                                                                          .waiting:
                                                                        return const Center(
                                                                            child:
                                                                                SizedBox());
                                                                      case ConnectionState
                                                                          .active:
                                                                        return const Text(
                                                                            '');
                                                                      case ConnectionState
                                                                          .done:
                                                                        if (snapshotCryptoIcons
                                                                            .hasError) {
                                                                          return Text(
                                                                            '${snapshotCryptoIcons.error}',
                                                                            style:
                                                                                const TextStyle(color: Colors.red),
                                                                          );
                                                                        } else {
                                                                          if (snapshotCryptoIcons.data !=
                                                                              null) {
                                                                            Map<String, dynamic>
                                                                                datosCoin =
                                                                                jsonDecode(snapshotCryptoIcons.data);
                                                                            return CircleAvatar(
                                                                              maxRadius: 8,
                                                                              backgroundImage: NetworkImage(datosCoin['data'][datos['data']['coins'][0]['symbol']]['logo']),
                                                                            );
                                                                          } else {
                                                                            return const SizedBox();
                                                                          }
                                                                        }
                                                                    }
                                                                  }),
                                                              Padding(
                                                                padding: EdgeInsets.only(
                                                                    left: size
                                                                            .width *
                                                                        0.0213333333333333,
                                                                    right: size
                                                                            .width *
                                                                        0.00533333333333333),
                                                                child: Text(
                                                                  datos['data'][
                                                                          'coins']
                                                                      [
                                                                      0]['name'],
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Color(
                                                                        0xff170658),
                                                                    fontSize:
                                                                        12,
                                                                    fontFamily:
                                                                        "Archivo",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                "(${datos['data']['coins'][0]['symbol']})",
                                                                style:
                                                                    const TextStyle(
                                                                  color: Color(
                                                                      0xffb3b3b3),
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "Archivo",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              )
                                                            ],
                                                          );
                                                        } else {
                                                          return const SizedBox();
                                                        }
                                                      }
                                                  }
                                                })
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        } else {
                          return const SizedBox();
                        }
                      }
                  }
                }))
      ],
    );
  }
}
