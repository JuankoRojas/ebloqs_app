import 'package:ebloqs_app/src/providers/avatar_user_provider.dart';
import 'package:ebloqs_app/src/screens/settings/settings_screen.dart';
import 'package:ebloqs_app/src/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:provider/provider.dart';

Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));

String payloadToJson(Payload data) => json.encode(data.toJson());

class Payload {
  Payload({
    this.status,
    this.data,
  });

  Status? status;
  List<Datum>? data;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        status: Status.fromJson(json["status"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status?.toJson(),
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.numMarketPairs,
    this.dateAdded,
    this.tags,
    this.maxSupply,
    this.circulatingSupply,
    this.totalSupply,
    this.platform,
    this.cmcRank,
    this.lastUpdated,
    this.quote,
  });

  int? id;
  String? name;
  String? symbol;
  String? slug;
  int? numMarketPairs;
  DateTime? dateAdded;
  List<Tag>? tags;
  double? maxSupply;
  double? circulatingSupply;
  double? totalSupply;
  Platform? platform;
  int? cmcRank;
  DateTime? lastUpdated;
  Quote? quote;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        slug: json["slug"],
        numMarketPairs: json["num_market_pairs"],
        dateAdded: DateTime.parse(json["date_added"]),
        // tags: List<Tag>.from(json["tags"].map((x) => tagValues.map?[x])),
        maxSupply:
            json["max_supply"] == null ? null : json["max_supply"].toDouble(),
        circulatingSupply: json["circulating_supply"] == null
            ? null
            : json["circulating_supply"].toDouble(),
        totalSupply: json["total_supply"] == null
            ? null
            : json["total_supply"].toDouble(),
        platform: json["platform"] == null
            ? null
            : Platform.fromJson(json["platform"]),
        cmcRank: json["cmc_rank"],
        lastUpdated: DateTime.parse(json["last_updated"]),
        quote: Quote.fromJson(json["quote"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "slug": slug,
        "num_market_pairs": numMarketPairs,
        "date_added": dateAdded?.toIso8601String(),
        "tags": List<dynamic>.from(tags!.map((x) => tagValues.reverse[x])),
        "max_supply": maxSupply,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply,
        "platform": platform == null ? null : platform?.toJson(),
        "cmc_rank": cmcRank,
        "last_updated": lastUpdated?.toIso8601String(),
        "quote": quote?.toJson(),
      };
}

class Platform {
  Platform({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.tokenAddress,
  });

  int? id;
  Name? name;
  Symbol? symbol;
  Slug? slug;
  String? tokenAddress;

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
        id: json["id"],
        name: nameValues.map?[json["name"]],
        symbol: symbolValues.map?[json["symbol"]],
        slug: slugValues.map?[json["slug"]],
        tokenAddress: json["token_address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "symbol": symbolValues.reverse[symbol],
        "slug": slugValues.reverse[slug],
        "token_address": tokenAddress,
      };
}

enum Name {
  ETHEREUM,
  TRON,
  OMNI,
  RSK_SMART_BITCOIN,
  BINANCE_COIN,
  STELLAR,
  NEO,
  V_SYSTEMS,
  ARDOR,
  QTUM,
  XRP,
  WAVES,
  ONTOLOGY,
  EOS,
  NEBULAS,
  NEM,
  BIT_SHARES,
  BITCOIN_CASH,
  INT_CHAIN,
  COSMOS,
  UBIQ,
  VE_CHAIN,
  NU_BITS,
  PIVX,
  COUNTERPARTY,
  KOMODO,
  ICON,
  GX_CHAIN,
  VITE,
  WANCHAIN,
  IOST,
  TRUE_CHAIN,
  ETHEREUM_CLASSIC
}

final nameValues = EnumValues({
  "Ardor": Name.ARDOR,
  "Binance Coin": Name.BINANCE_COIN,
  "Bitcoin Cash": Name.BITCOIN_CASH,
  "BitShares": Name.BIT_SHARES,
  "Cosmos": Name.COSMOS,
  "Counterparty": Name.COUNTERPARTY,
  "EOS": Name.EOS,
  "Ethereum": Name.ETHEREUM,
  "Ethereum Classic": Name.ETHEREUM_CLASSIC,
  "GXChain": Name.GX_CHAIN,
  "ICON": Name.ICON,
  "INT Chain": Name.INT_CHAIN,
  "IOST": Name.IOST,
  "Komodo": Name.KOMODO,
  "Nebulas": Name.NEBULAS,
  "NEM": Name.NEM,
  "Neo": Name.NEO,
  "NuBits": Name.NU_BITS,
  "Omni": Name.OMNI,
  "Ontology": Name.ONTOLOGY,
  "PIVX": Name.PIVX,
  "Qtum": Name.QTUM,
  "RSK Smart Bitcoin": Name.RSK_SMART_BITCOIN,
  "Stellar": Name.STELLAR,
  "TRON": Name.TRON,
  "TrueChain": Name.TRUE_CHAIN,
  "Ubiq": Name.UBIQ,
  "VeChain": Name.VE_CHAIN,
  "VITE": Name.VITE,
  "v.systems": Name.V_SYSTEMS,
  "Wanchain": Name.WANCHAIN,
  "Waves": Name.WAVES,
  "XRP": Name.XRP
});

enum Slug {
  ETHEREUM,
  TRON,
  OMNI,
  RSK_SMART_BITCOIN,
  BINANCE_COIN,
  STELLAR,
  NEO,
  V_SYSTEMS,
  ARDOR,
  QTUM,
  XRP,
  WAVES,
  ONTOLOGY,
  EOS,
  NEBULAS_TOKEN,
  NEM,
  BITSHARES,
  BITCOIN_CASH,
  INT_CHAIN,
  COSMOS,
  UBIQ,
  VECHAIN,
  NUBITS,
  PIVX,
  COUNTERPARTY,
  KOMODO,
  ICON,
  GXCHAIN,
  VITE,
  WANCHAIN,
  IOSTOKEN,
  TRUECHAIN,
  ETHEREUM_CLASSIC
}

final slugValues = EnumValues({
  "ardor": Slug.ARDOR,
  "binance-coin": Slug.BINANCE_COIN,
  "bitcoin-cash": Slug.BITCOIN_CASH,
  "bitshares": Slug.BITSHARES,
  "cosmos": Slug.COSMOS,
  "counterparty": Slug.COUNTERPARTY,
  "eos": Slug.EOS,
  "ethereum": Slug.ETHEREUM,
  "ethereum-classic": Slug.ETHEREUM_CLASSIC,
  "gxchain": Slug.GXCHAIN,
  "icon": Slug.ICON,
  "int-chain": Slug.INT_CHAIN,
  "iostoken": Slug.IOSTOKEN,
  "komodo": Slug.KOMODO,
  "nebulas-token": Slug.NEBULAS_TOKEN,
  "nem": Slug.NEM,
  "neo": Slug.NEO,
  "nubits": Slug.NUBITS,
  "omni": Slug.OMNI,
  "ontology": Slug.ONTOLOGY,
  "pivx": Slug.PIVX,
  "qtum": Slug.QTUM,
  "rsk-smart-bitcoin": Slug.RSK_SMART_BITCOIN,
  "stellar": Slug.STELLAR,
  "tron": Slug.TRON,
  "truechain": Slug.TRUECHAIN,
  "ubiq": Slug.UBIQ,
  "vechain": Slug.VECHAIN,
  "vite": Slug.VITE,
  "v-systems": Slug.V_SYSTEMS,
  "wanchain": Slug.WANCHAIN,
  "waves": Slug.WAVES,
  "xrp": Slug.XRP
});

enum Symbol {
  ETH,
  TRX,
  OMNI,
  RBTC,
  BNB,
  XLM,
  NEO,
  VSYS,
  ARDR,
  QTUM,
  XRP,
  WAVES,
  ONT,
  EOS,
  NAS,
  XEM,
  BTS,
  BCH,
  INT,
  ATOM,
  UBQ,
  VET,
  USNBT,
  PIVX,
  XCP,
  KMD,
  ICX,
  GXC,
  VITE,
  WAN,
  IOST,
  TRUE,
  ETC
}

final symbolValues = EnumValues({
  "ARDR": Symbol.ARDR,
  "ATOM": Symbol.ATOM,
  "BCH": Symbol.BCH,
  "BNB": Symbol.BNB,
  "BTS": Symbol.BTS,
  "EOS": Symbol.EOS,
  "ETC": Symbol.ETC,
  "ETH": Symbol.ETH,
  "GXC": Symbol.GXC,
  "ICX": Symbol.ICX,
  "INT": Symbol.INT,
  "IOST": Symbol.IOST,
  "KMD": Symbol.KMD,
  "NAS": Symbol.NAS,
  "NEO": Symbol.NEO,
  "OMNI": Symbol.OMNI,
  "ONT": Symbol.ONT,
  "PIVX": Symbol.PIVX,
  "QTUM": Symbol.QTUM,
  "RBTC": Symbol.RBTC,
  "TRUE": Symbol.TRUE,
  "TRX": Symbol.TRX,
  "UBQ": Symbol.UBQ,
  "USNBT": Symbol.USNBT,
  "VET": Symbol.VET,
  "VITE": Symbol.VITE,
  "VSYS": Symbol.VSYS,
  "WAN": Symbol.WAN,
  "WAVES": Symbol.WAVES,
  "XCP": Symbol.XCP,
  "XEM": Symbol.XEM,
  "XLM": Symbol.XLM,
  "XRP": Symbol.XRP
});

class Quote {
  Quote({
    this.usd,
  });

  Usd? usd;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        usd: Usd.fromJson(json["USD"]),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd?.toJson(),
      };
}

class Usd {
  Usd({
    this.price,
    this.volume24H,
    this.percentChange1H,
    this.percentChange24H,
    this.percentChange7D,
    this.marketCap,
    this.lastUpdated,
  });

  double? price;
  double? volume24H;
  double? percentChange1H;
  double? percentChange24H;
  double? percentChange7D;
  double? marketCap;
  DateTime? lastUpdated;

  factory Usd.fromJson(Map<String, dynamic> json) => Usd(
        price: json["price"] == null ? null : json["price"].toDouble(),
        volume24H:
            json["volume_24h"] == null ? null : json["volume_24h"].toDouble(),
        percentChange1H: json["percent_change_1h"] == null
            ? null
            : json["percent_change_1h"].toDouble(),
        percentChange24H: json["percent_change_24h"] == null
            ? null
            : json["percent_change_24h"].toDouble(),
        percentChange7D: json["percent_change_7d"] == null
            ? null
            : json["percent_change_7d"].toDouble(),
        marketCap:
            json["market_cap"] == null ? null : json["market_cap"].toDouble(),
        lastUpdated: DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "volume_24h": volume24H,
        "percent_change_1h": percentChange1H,
        "percent_change_24h": percentChange24H,
        "percent_change_7d": percentChange7D,
        "market_cap": marketCap,
        "last_updated": lastUpdated?.toIso8601String(),
      };
}

enum Tag { MINEABLE }

final tagValues = EnumValues({"mineable": Tag.MINEABLE});

class Status {
  Status({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
    this.notice,
  });

  DateTime? timestamp;
  int? errorCode;
  dynamic? errorMessage;
  int? elapsed;
  int? creditCount;
  dynamic? notice;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        timestamp: DateTime.parse(json["timestamp"]),
        errorCode: json["error_code"],
        errorMessage: json["error_message"],
        elapsed: json["elapsed"],
        creditCount: json["credit_count"],
        notice: json["notice"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp?.toIso8601String(),
        "error_code": errorCode,
        "error_message": errorMessage,
        "elapsed": elapsed,
        "credit_count": creditCount,
        "notice": notice,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map?.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}

class MarketScreen extends StatefulWidget {
  static const routeName = 'MarketScreen';
  const MarketScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final int _counter = 0;
  Future<Payload>? _future;

  Future<Payload>? getCryptoPrices() async {
    var response = await http.get(
        Uri.parse(
            "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"),
        headers: {
          'X-CMC_PRO_API_KEY': 'e5421cfd-c95b-49e1-8267-29777bb45e02',
          "Accept": "application/json",
        });

    if (response.statusCode == 200) {
      return payloadFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
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
    // TODO: implement initState
    super.initState();
    _future = getCryptoPrices();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final avatarSelected = Provider.of<AvatarUserProvider>(context).avatarUser;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: size.width * 0.035,
            top: size.height * 0.07,
            right: size.width * 0.035),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      color: const Color(0xffeae4fc),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: (avatarSelected == null || avatarSelected.isEmpty)
                          ? SvgPicture.asset(
                              'assets/avatares/mascota/pet-4.svg',
                              width: size.width * 0.067,
                            )
                          : SvgPicture.asset(
                              avatarSelected,
                              width: size.width * 0.067,
                            ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, SettingsScreen.routeName);
                  },
                ),
                SizedBox(
                  width: size.width * 0.69,
                  height: size.height * 0.047,
                  child: OutlineSearchBar(
                    borderRadius: BorderRadius.circular(100),
                    borderColor: const Color(0xffeae4fc),
                    searchButtonIconColor: const Color(0xff170658),
                    hideSearchButton: true,
                    hintText: 'Buscar Inversiones',
                    hintStyle: const TextStyle(
                      color: Color(0xff170658),
                      fontSize: 13,
                    ),
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/Vectores/Iconos/Bell.svg',
                    width: size.width * 0.06,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0184729064039409,
                  right: size.width * 0.352,
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
                    child: const Center(
                      child: Text(
                        "USD",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 12,
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
                    child: const Center(
                      child: Text(
                        "24H %",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 12,
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
                    child: const Center(
                      child: Text(
                        "Top 100",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 12,
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
                      "Market cap",
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
                    padding:
                        EdgeInsets.only(left: size.width * 0.197333333333333),
                    child: const Text(
                      "Precio (USD)",
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
                    padding:
                        EdgeInsets.only(left: size.width * 0.0853333333333333),
                    child: const Text(
                      "24h %",
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
                future: _future,
                builder: (context, AsyncSnapshot<Payload> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Text('none');
                    case ConnectionState.waiting:
                      return const Center(child: CircularProgressIndicator());
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text((index + 1).toString(),
                                            style: const TextStyle(
                                                color: Color(0xff170658),
                                                fontFamily: 'Archivo',
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400)),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: size.width *
                                                  0.0266666666666667,
                                              right: size.width *
                                                  0.0346666666666667),
                                          child: FutureBuilder(
                                              future: getCryptoIcons(
                                                  name: snapshot.data!
                                                      .data![index].symbol!),
                                              builder: (context,
                                                  AsyncSnapshot snapshotIcon) {
                                                switch (snapshotIcon
                                                    .connectionState) {
                                                  case ConnectionState.none:
                                                    return const Text('none');
                                                  case ConnectionState.waiting:
                                                    return const Center(
                                                        child:
                                                            CircularProgressIndicator());
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
                                                        Map<String, dynamic>
                                                            datos = jsonDecode(
                                                                snapshotIcon
                                                                    .data);
                                                        return CircleAvatar(
                                                          maxRadius: 20,
                                                          backgroundImage:
                                                              NetworkImage(datos[
                                                                      'data'][
                                                                  snapshot
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .symbol!]['logo']),
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
                                              style: const TextStyle(
                                                  color: Color(0xff170658),
                                                  fontFamily: 'Archivo',
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              '${snapshot.data!.data![index].quote!.usd!.marketCap!.toStringAsFixed(2)} Bn',
                                              style: const TextStyle(
                                                  color: Color(0xff8F8B9F),
                                                  fontFamily: 'Archivo',
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Text(
                                          snapshot.data!.data![index].quote!
                                              .usd!.price!
                                              .toStringAsFixed(3),
                                          style: const TextStyle(
                                              color: Color(0xff170658),
                                              fontFamily: 'Archivo',
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const Spacer(),
                                        Container(
                                          width: size.width * 0.197333333333333,
                                          height:
                                              size.height * 0.0307881773399015,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                              (snapshot
                                                          .data!
                                                          .data![index]
                                                          .quote!
                                                          .usd!
                                                          .percentChange24H! >
                                                      0)
                                                  ? SvgPicture.asset(
                                                      'assets/Vectores/Iconos/Polygon 1.svg')
                                                  : SvgPicture.asset(
                                                      'assets/Vectores/Iconos/Polygon 2.svg'),
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
                                                        ? const Color(
                                                            0xff00C853)
                                                        : const Color(
                                                            0xffEC4141),
                                                    fontFamily: 'Archivo',
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
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
        ),
      ),
      bottomNavigationBar: const CustomNavigator(),
    );
  }
}
