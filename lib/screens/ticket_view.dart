import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/widgets/dashed_line_widget.dart';
import 'package:booktickets/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../utils/app_styles.dart';
import '../widgets/column_widget.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  const TicketView({super.key, required this.ticket, this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width*0.85,
      height: AppLayout.getHeight(GetPlatform.isAndroid == true ? 167 : 169),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16)),

        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: isColor == null ? Styles.blueColor : Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(AppLayout.getHeight(21)), topRight: Radius.circular(AppLayout.getHeight(21)))
              ),
              padding: EdgeInsets.all(AppLayout.getHeight(16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        ticket['from']['code'],
                        style: isColor == null ? Styles.headLineStyle3.copyWith(color: Colors.white) :  Styles.headLineStyle3,
                      ),
                      Expanded(child: Container()),
                      const ThickContainer(isColor: true),
                      Expanded(child: Stack(
                        children: [
                          SizedBox(
                            height: AppLayout.getHeight(24),
                            child: LayoutBuilder(
                              builder: (BuildContext context, BoxConstraints constraints) {
                                return Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate((constraints.constrainWidth()/6).floor(), (index) => SizedBox(
                                    width: AppLayout.getHeight(3), height: AppLayout.getHeight(1),
                                    child: DecoratedBox(decoration: BoxDecoration(
                                      color: isColor == null ? Colors.white : const Color(0xFF8ACCF7),
                                    ),),
                                  )),
                                );
                              },
                            ),
                          ),
                          Center(child: Transform.rotate(angle: 1.5, child: Icon(Icons.local_airport_rounded, color: isColor == null ? Colors.white : const Color(0xFF8ACCF7),),)),
                        ],
                      )),

                      const ThickContainer(isColor: true),
                      Expanded(child: Container()),
                      Text(ticket['to']['code'], style: isColor == null ? Styles.headLineStyle3.copyWith(color: Colors.white) :  Styles.headLineStyle3,),
                    ],
                  ),
                  Gap(AppLayout.getHeight(3)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppLayout.getWidth(100), child: Text(ticket['from']['name'], style: isColor == null ? Styles.headLineStyle4.copyWith(color: Colors.white) :  Styles.headLineStyle4,),
                      ),
                      Text(ticket['flying_time'], style: isColor == null ? Styles.headLineStyle4.copyWith(color: Colors.white) :  Styles.headLineStyle4,),
                      SizedBox(
                        width: AppLayout.getWidth(100), child: Text(ticket['to']['name'], textAlign: TextAlign.end, style: isColor == null ? Styles.headLineStyle4.copyWith(color: Colors.white) :  Styles.headLineStyle4,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: isColor == null ? Styles.orangeColor : Colors.white,
              child: Row(
                children: [
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: isColor == null ? Styles.bgColor : Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(AppLayout.getHeight(10)),
                          bottomRight: Radius.circular(AppLayout.getHeight(10)),
                        )
                      ),
                    ),
                  ),
                  Expanded(child: Padding(
                    padding: EdgeInsets.all(AppLayout.getHeight(12)),
                    child: DashedLineWidget(isColor: isColor, section: 15, dashSize: 5,),
                  )),
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color:  isColor == null ? Styles.bgColor : Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppLayout.getHeight(10)),
                          bottomLeft: Radius.circular(AppLayout.getHeight(10)),
                        )
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: isColor == null ? Styles.orangeColor : Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(isColor == null ? AppLayout.getHeight(21) : 0),
                      bottomRight: Radius.circular(isColor == null ? AppLayout.getHeight(21) : 0)
                  )
              ),
              padding: EdgeInsets.only(
                  left: AppLayout.getHeight(16),
                  top: AppLayout.getHeight(10),
                  right: AppLayout.getHeight(16),
                  bottom: AppLayout.getHeight(16)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ColumnWidget(firstText: ticket['date'], secondText: "Date", alignment: CrossAxisAlignment.start, isColor: isColor),
                  ColumnWidget(firstText: ticket['departure_time'], secondText: "Departure time", alignment: CrossAxisAlignment.center, isColor: isColor),
                  ColumnWidget(firstText: ticket['number'].toString(), secondText: "Number", alignment: CrossAxisAlignment.end, isColor: isColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
