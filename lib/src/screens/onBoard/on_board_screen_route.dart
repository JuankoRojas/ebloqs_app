import 'dart:async';

import 'package:ebloqs_app/src/screens/onBoard/on_board_1_screen.dart';
import 'package:ebloqs_app/src/screens/onBoard/on_board_2_screen.dart';
import 'package:ebloqs_app/src/screens/onBoard/on_board_3_screen.dart';
import 'package:ebloqs_app/src/screens/onBoard/on_board_4_screen.dart';
import 'package:ebloqs_app/src/screens/onBoard/on_board_5_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardPageRoute extends StatelessWidget {
  static const routeName = 'OnBoardPageRoute';
  const OnBoardPageRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _NavegacionOnBoard(),
      child: const Scaffold(
        body: _PaginasOnBoard(),
      ),
    );
  }
}

class _NavegacionOnBoard with ChangeNotifier {
  int _paginaOnBoardActual = 0;
  final PageController _pageOnBoardController = PageController();

  int get paginaActual => _paginaOnBoardActual;

  set paginaActual(int valor) {
    _paginaOnBoardActual = valor;
    _pageOnBoardController.animateToPage(valor,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);

    notifyListeners();
  }

  PageController get pageController => _pageOnBoardController;
}

class _PaginasOnBoard extends StatefulWidget {
  const _PaginasOnBoard({Key? key}) : super(key: key);

  @override
  __PaginasOnBoardState createState() => __PaginasOnBoardState();
}

class __PaginasOnBoardState extends State<_PaginasOnBoard> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final navegacionOnBoard = Provider.of<_NavegacionOnBoard>(
      context,
    );

    Timer(const Duration(seconds: 2), () {
      switch (index) {
        case 0:
          Future.delayed(const Duration(milliseconds: 1000))
              .then((_) => navegacionOnBoard.paginaActual = 1);
          break;
        case 1:
          navegacionOnBoard.paginaActual = 2;
          break;
        case 2:
          navegacionOnBoard.paginaActual = 3;
          break;
        case 3:
          navegacionOnBoard.paginaActual = 4;
          break;
        case 4:
          navegacionOnBoard.paginaActual = 4;
          break;
        // case 5:
        //   navegacionOnBoard.paginaActual = 5;
        //   break;
        default:
          navegacionOnBoard.paginaActual = 0;
          break;
      }
    });

    // final navegacionOnBoard = Provider.of<_NavegacionOnBoard>(context);
    navegacionOnBoard.pageController.addListener(() {
      setState(() {
        index = navegacionOnBoard.pageController.page!.toInt();
      });
    });
    return Stack(
      children: [
        PageView(
          controller: navegacionOnBoard.pageController,
          children: const <Widget>[
            Onboard1Screen(),
            Onboard2Screen(),
            Onboard3Screen(),
            Onboard4Screen(),
            Onboard5Screen(),
          ],
        ),
        Positioned(
            top: size.height * 0.943,
            left: 35,
            child: SmoothPageIndicator(
              controller: navegacionOnBoard.pageController,
              count: 5,
              effect: ExpandingDotsEffect(
                dotHeight: 8.0,
                dotWidth: 8,
                spacing: 16,
                activeDotColor: const Color(0xff8966F0),
                dotColor: (navegacionOnBoard.paginaActual == 2 ||
                        navegacionOnBoard.paginaActual == 3 ||
                        navegacionOnBoard.paginaActual == 4)
                    ? const Color(0xffEAE4FC)
                    : const Color(0xffffffff),
                expansionFactor: 1.1,
              ),
            )),
      ],
    );
  }
}
