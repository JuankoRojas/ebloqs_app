import 'package:flutter/material.dart';

class DashedTile extends StatefulWidget {
  const DashedTile({Key? key}) : super(key: key);

  @override
  State<DashedTile> createState() => _DashedTileState();
}

class _DashedTileState extends State<DashedTile> {
  @override
  Widget build(BuildContext context) {
    var sizedwidth = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: sizedwidth.width * 0.05),
          child: const Dashes(),
        ),

        //  TODO: aqui va cualquier widget que quieras poner encima se las lineas punteadas
      ],
    );
  }
}

class Dashes extends StatelessWidget {
  const Dashes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 100,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainHeight();
          const dashWidth = 2.0;
          const dashHeight = 5.0;
          final dashCount = (boxWidth / (5 * dashWidth)).floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.vertical,
            children: List.generate(
              dashCount,
              (_) {
                return SizedBox(
                  width: dashWidth,
                  height: dashHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xff8F959A).withOpacity(0.7),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
