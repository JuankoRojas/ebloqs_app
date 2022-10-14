import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPersonalSetting extends StatelessWidget {
  const CustomPersonalSetting({
    Key? key,
    required this.setting,
    required this.value,
    required this.onTap,
    required this.size,
  }) : super(key: key);
  final Size size;
  final String setting;
  final String value;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          AutoSizeText(
            setting,
            style: const TextStyle(
              color: Color(0xff170658),
              fontSize: 15,
            ),
          ),
          Expanded(child: Container()),
          AutoSizeText(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: const Color(0xff170658).withOpacity(0.6),
              fontSize: 14,
            ),
          ),
          Container(
            width: 24,
            height: 24,
            margin: EdgeInsets.only(left: size.width * 0.056),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset('assets/Vectores/Iconos/chevronright.svg'),
          ),
        ],
      ),
    );
  }
}
