import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:flutter/material.dart';

class CustomPersonalInfo extends StatefulWidget {
  CustomPersonalInfo(
      {Key? key,
      required this.field,
      required this.value,
      required this.onTap,
      this.isEditable,
      this.focusNode,
      required this.firstFocus})
      : super(key: key);
  final String field;
  TextEditingController value;
  final VoidCallback onTap;
  bool? isEditable;
  FocusNode? focusNode = FocusNode();
  bool firstFocus = false;

  @override
  State<CustomPersonalInfo> createState() => _CustomPersonalInfoState();
}

class _CustomPersonalInfoState extends State<CustomPersonalInfo> {
  @override
  void dispose() {
    widget.focusNode?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              widget.field,
              style: const TextStyle(
                color: Color(0xff8f8b9f),
                fontSize: 13,
              ),
            ),
            SizedBox(
              width: size.width * 0.7,
              height: UtilSize.height(52, context),
              child: TextFormField(
                controller: widget.value,
                enabled: widget.isEditable,
                focusNode: widget.focusNode,
                autofocus: widget.firstFocus,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  color: Color(0xff8f8b9f),
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(),
        ),
        GestureDetector(
          onTap: widget.onTap,
          child: AutoSizeText(
            "Editar",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: (widget.focusNode!.hasFocus)
                  ? const Color(0xff8f8b9f)
                  : const Color(0xff2504ca),
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
