import 'dart:async';

import 'package:ebloqs_app/src/screens/onBoard/on_board_1_screen.dart';
import 'package:ebloqs_app/src/screens/onBoard/on_board_2_screen.dart';
import 'package:ebloqs_app/src/screens/onBoard/on_board_3_screen.dart';
import 'package:ebloqs_app/src/screens/onBoard/on_board_4_screen.dart';
import 'package:ebloqs_app/src/screens/onBoard/on_board_5_screen.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

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

  int get paginaActual => _paginaOnBoardActual;

  void animationController(PageController controller, int value) {
    controller.animateToPage(value,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  void setPageIndex(PageController controller, int index) {
    _paginaOnBoardActual = index;
    animationController(controller, index);
    notifyListeners();
  }
}

class _PaginasOnBoard extends StatefulWidget {
  const _PaginasOnBoard({Key? key}) : super(key: key);

  @override
  __PaginasOnBoardState createState() => __PaginasOnBoardState();
}

class __PaginasOnBoardState extends State<_PaginasOnBoard> {
  int index = 0;
  Timer? mytimer;
  final navegacionOnBoard = _NavegacionOnBoard();
  final PageController _pageOnBoardController = PageController();

  @override
  void initState() {
    _pageOnBoardController.addListener(() {
      index = _pageOnBoardController.page!.toInt();
    });
    pagination();
    super.initState();
  }

  pagination() {
    mytimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      print(index);
      navegacionOnBoard.setPageIndex(_pageOnBoardController, index);
      if (index < 4) {
        index++;
      } else {
        timer.cancel();
      }
    });
    return mytimer;
  }

  @override
  void dispose() {
    _pageOnBoardController.dispose();
    mytimer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        PageView(
          controller: _pageOnBoardController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            GestureDetector(
                onPanUpdate: (details) {
                  if (details.delta.dx < 0) {
                    navegacionOnBoard.setPageIndex(
                      _pageOnBoardController,
                      index + 1,
                    );
                  }
                },
                child: const Onboard1Screen()),
            GestureDetector(
                onPanUpdate: (details) {
                  if (details.delta.dx < 0) {
                    navegacionOnBoard.setPageIndex(
                        _pageOnBoardController, index + 1);
                  } else {
                    navegacionOnBoard.setPageIndex(
                        _pageOnBoardController, index - 1);
                  }
                },
                child: const Onboard2Screen()),
            GestureDetector(
                onPanUpdate: (details) {
                  if (details.delta.dx < 0) {
                    navegacionOnBoard.setPageIndex(
                        _pageOnBoardController, index + 1);
                  } else {
                    navegacionOnBoard.setPageIndex(
                        _pageOnBoardController, index - 1);
                  }
                },
                child: const Onboard3Screen()),
            GestureDetector(
                onPanUpdate: (details) {
                  if (details.delta.dx < 0) {
                    navegacionOnBoard.setPageIndex(
                        _pageOnBoardController, index + 1);
                  } else {
                    navegacionOnBoard.setPageIndex(
                        _pageOnBoardController, index - 1);
                  }
                },
                child: const Onboard4Screen()),
            GestureDetector(
                onPanUpdate: (details) {
                  if (details.delta.dx < 0) {
                  } else {
                    navegacionOnBoard.setPageIndex(
                        _pageOnBoardController, index - 1);
                  }
                },
                child: const Onboard5Screen()),
          ],
        ),
        // Positioned(
        //     top: size.height * 0.943,
        //     left: 35,
        //     child: SmoothPageIndicator(
        //       controller: _pageOnBoardController,
        //       count: 5,
        //       effect: ExpandingDotsEffect(
        //         dotHeight: 8.0,
        //         dotWidth: 8,
        //         spacing: 16,
        //         activeDotColor: const Color(0xff8966F0),
        //         dotColor: (navegacionOnBoard.paginaActual == 2 ||
        //                 navegacionOnBoard.paginaActual == 3 ||
        //                 navegacionOnBoard.paginaActual == 4)
        //             ? const Color(0xffEAE4FC)
        //             : const Color(0xffffffff),
        //         expansionFactor: 1.1,
        //       ),
        //     )),
      ],
    );
  }
}
