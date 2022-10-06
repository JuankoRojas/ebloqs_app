import 'dart:convert';

import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/screens/market/market_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class CoinsScreen extends StatefulWidget {
  const CoinsScreen({super.key, required this.future});
  final Future<Payload>? future;
  @override
  State<CoinsScreen> createState() => _CoinsScreenState();
}

class _CoinsScreenState extends State<CoinsScreen> {
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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: size.height * 0.0184729064039409,
              left: size.width * 0.04,
              right: size.width * 0.288,
              bottom: size.height * 0.0394088669950739),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * 0.157333333333333,
                height: size.height * 0.0381773399014778,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xffeae4fc),
                ),
                child: Center(
                  child: Text(
                    "USD",
                    style: TextStyle(
                      color: const Color(0xff170658),
                      fontSize: UtilSize.width(12, context),
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.157333333333333,
                height: size.height * 0.0381773399014778,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xffeae4fc),
                ),
                child: Center(
                  child: Text(
                    "24H %",
                    style: TextStyle(
                      color: const Color(0xff170658),
                      fontSize: UtilSize.width(12, context),
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.157333333333333,
                height: size.height * 0.0381773399014778,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xffeae4fc),
                ),
                child: Center(
                  child: Text(
                    "Top 100",
                    style: TextStyle(
                      color: const Color(0xff170658),
                      fontSize: UtilSize.width(12, context),
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.016, right: size.width * 0.016),
          child: Row(
            children: [
              Text(
                "#",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xff170658),
                  fontSize: UtilSize.width(12, context),
                  fontFamily: "Archivo",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SvgPicture.asset(
                'assets/Vectores/Iconos/Polygon 3.svg',
                width: UtilSize.width(10, context),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.016),
                child: Text(
                  "Market cap",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xff170658),
                    fontSize: UtilSize.width(12, context),
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SvgPicture.asset(
                'assets/Vectores/Iconos/Polygon 3.svg',
                width: UtilSize.width(10, context),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.197333333333333),
                child: Text(
                  "Precio (USD)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xff170658),
                    fontSize: UtilSize.width(12, context),
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SvgPicture.asset(
                'assets/Vectores/Iconos/Polygon 3.svg',
                width: UtilSize.width(10, context),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.0853333333333333),
                child: Text(
                  "24h %",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xff170658),
                    fontSize: UtilSize.width(12, context),
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SvgPicture.asset(
                'assets/Vectores/Iconos/Polygon 3.svg',
                width: UtilSize.width(10, context),
              ),
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
                        itemCount: snapshot.data?.data?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: size.height * 0.0123152709359606,
                                left: size.width * 0.016,
                                right: size.width * 0.016),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text((index + 1).toString(),
                                        style: TextStyle(
                                            color: const Color(0xff170658),
                                            fontFamily: 'Archivo',
                                            fontSize:
                                                UtilSize.width(13, context),
                                            fontWeight: FontWeight.w400)),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: size.width * 0.0266666666666667,
                                          right:
                                              size.width * 0.0346666666666667),
                                      child: FutureBuilder(
                                          future: getCryptoIcons(
                                              name: snapshot
                                                  .data!.data![index].symbol!),
                                          builder: (context,
                                              AsyncSnapshot snapshotIcon) {
                                            switch (
                                                snapshotIcon.connectionState) {
                                              case ConnectionState.none:
                                                return const Text('none');
                                              case ConnectionState.waiting:
                                                return const Center(
                                                    child: SizedBox());
                                              case ConnectionState.active:
                                                return const Text('');
                                              case ConnectionState.done:
                                                if (snapshotIcon.hasError) {
                                                  return Text(
                                                    '${snapshotIcon.error}',
                                                    style: const TextStyle(
                                                        color: Colors.red),
                                                  );
                                                } else {
                                                  if (snapshotIcon.data !=
                                                      null) {
                                                    Map<String, dynamic> datos =
                                                        jsonDecode(
                                                            snapshotIcon.data);
                                                    return CircleAvatar(
                                                      maxRadius: UtilSize.width(
                                                          18, context),
                                                      backgroundImage:
                                                          NetworkImage(datos[
                                                                      'data'][
                                                                  snapshot
                                                                      .data!
                                                                      .data![index]
                                                                      .symbol!]
                                                              ['logo']),
                                                    );
                                                  } else {
                                                    return const SizedBox();
                                                  }
                                                }
                                            }
                                          }),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data!.data![index].name!,
                                          style: TextStyle(
                                              color: const Color(0xff170658),
                                              fontFamily: 'Archivo',
                                              fontSize:
                                                  UtilSize.width(13, context),
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          '${snapshot.data!.data![index].quote!.usd!.marketCap!.toStringAsFixed(2)} Bn',
                                          style: TextStyle(
                                              color: const Color(0xff8F8B9F),
                                              fontFamily: 'Archivo',
                                              fontSize:
                                                  UtilSize.width(13, context),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      snapshot
                                          .data!.data![index].quote!.usd!.price!
                                          .toStringAsFixed(3),
                                      style: TextStyle(
                                          color: const Color(0xff170658),
                                          fontFamily: 'Archivo',
                                          fontSize: UtilSize.width(13, context),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: size.width * 0.197333333333333,
                                      height: size.height * 0.0307881773399015,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: (snapshot
                                                    .data!
                                                    .data![index]
                                                    .quote!
                                                    .usd!
                                                    .percentChange24H! >
                                                0)
                                            ? const Color(0xffceffdc)
                                            : const Color(0xfffbe0e0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          (snapshot.data!.data![index].quote!
                                                      .usd!.percentChange24H! >
                                                  0)
                                              ? SvgPicture.asset(
                                                  'assets/Vectores/Iconos/Polygon 1.svg',
                                                  width: UtilSize.width(
                                                      10, context),
                                                )
                                              : SvgPicture.asset(
                                                  'assets/Vectores/Iconos/Polygon 2.svg',
                                                  width: UtilSize.width(
                                                      10, context),
                                                ),
                                          Text(
                                            '${snapshot.data!.data![index].quote!.usd!.percentChange24H!.toStringAsFixed(3)} %',
                                            style: TextStyle(
                                                color: (snapshot
                                                            .data!
                                                            .data![index]
                                                            .quote!
                                                            .usd!
                                                            .percentChange24H! >
                                                        0)
                                                    ? const Color(0xff00C853)
                                                    : const Color(0xffEC4141),
                                                fontFamily: 'Archivo',
                                                fontSize:
                                                    UtilSize.width(12, context),
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        });
                  }
              }
            },
          ),
        ),
      ],
    );
  }
}
