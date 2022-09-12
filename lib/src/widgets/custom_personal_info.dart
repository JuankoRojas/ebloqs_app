import 'package:flutter/material.dart';

class CustomPersonalInfo extends StatelessWidget {
  const CustomPersonalInfo({
    Key? key,
    required this.field,
    required this.value,
    required this.onTap,
  }) : super(key: key);
  final String field;
  final String value;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              field,
              style: const TextStyle(
                color: Color(0xff8f8b9f),
                fontSize: 13,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Color(0xff170658),
                fontSize: 15,
              ),
            )
          ],
        ),
        Expanded(
          child: Container(),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text(
            "Editar",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xff2504ca),
              fontSize: 14,
              fontFamily: "Archivo",
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
