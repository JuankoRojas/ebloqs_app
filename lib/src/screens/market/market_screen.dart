import 'package:ebloqs_app/src/services/coin_market_cap_service.dart';
import 'package:flutter/material.dart';

class MarketScreen extends StatefulWidget {
  static const String routeName = 'MarketScreen';
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  Future? future;
  @override
  void initState() {
    super.initState();
    future = CoinMarketCapService().getCryptoPrices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(builder: (context, AsyncSnapshotsnapshot) {
        return Container();
      }),
    );
  }
}
