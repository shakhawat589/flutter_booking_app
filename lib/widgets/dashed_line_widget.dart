import 'package:flutter/material.dart';

import '../utils/app_layout.dart';
class DashedLineWidget extends StatelessWidget {
  final bool? isColor;
  final int dashSize;
  final int section;
  const DashedLineWidget({super.key, this.isColor, required this.section, required this.dashSize});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: List.generate((constraints.constrainWidth()/section).floor(), (index) => SizedBox(
            width: AppLayout.getWidth(dashSize.toDouble()), height: AppLayout.getHeight(1),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: isColor == null ? Colors.white : Colors.grey.shade300
              ),
            ),
          )),
        );
      },
    );
  }
}
