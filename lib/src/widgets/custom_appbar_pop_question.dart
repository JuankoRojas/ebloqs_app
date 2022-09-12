import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppbarWithPopAndQuestion extends StatelessWidget {
  const CustomAppbarWithPopAndQuestion({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: SvgPicture.asset('assets/Vectores/Iconos/Arrow left.svg'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xff170658),
            fontSize: 17,
            fontFamily: "Archivo",
            fontWeight: FontWeight.w700,
          ),
        ),
        GestureDetector(
          child: SvgPicture.asset('assets/Vectores/Iconos/Question.svg'),
          onTap: () {},
        ),
      ],
    );
  }
}
