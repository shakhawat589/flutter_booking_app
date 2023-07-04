import 'package:booktickets/screens/ticket_view.dart';
import 'package:booktickets/utils/app_info_list.dart';
import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:booktickets/widgets/column_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/dashed_line_widget.dart';
import '../widgets/ticket_tab.dart';
import 'package:barcode_widget/barcode_widget.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric( horizontal: AppLayout.getWidth(20), vertical: AppLayout.getHeight(20)),
            children: [
              Gap(AppLayout.getHeight(40)),
              Text( "Tickets", style: Styles.headLineStyle.copyWith(fontSize: AppLayout.getWidth(35)),),
              Gap(AppLayout.getHeight(20)),
              /*------------- Airline Hotels Box -----------*/
              const TicketTabs(firstTab: 'Upcoming', secondTab: 'Previous'),
              Gap(AppLayout.getHeight(25)),
              Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                child: TicketView(ticket: ticketList[0], isColor: true,),
              ),
              const SizedBox(height: 1,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: size.width*0.85,
                color: Colors.white,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnWidget(firstText: 'Flutter DB', secondText: "Passenger", alignment: CrossAxisAlignment.start, isColor: true),
                        ColumnWidget(firstText: '5221 364869', secondText: "Passport", alignment: CrossAxisAlignment.end, isColor: true),
                      ],
                    ),
                    Gap(AppLayout.getHeight(20)),
                    const DashedLineWidget(isColor: true, section: 15, dashSize: 5,),
                    Gap(AppLayout.getHeight(20)),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnWidget(firstText: '364738 28274478', secondText: "Number of E-ticket", alignment: CrossAxisAlignment.start, isColor: true),
                        ColumnWidget(firstText: 'B2SG28', secondText: "Booking Code", alignment: CrossAxisAlignment.end, isColor: true),
                      ],
                    ),
                    Gap(AppLayout.getHeight(20)),
                    const DashedLineWidget(isColor: true, section: 15, dashSize: 5,),
                    Gap(AppLayout.getHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/visa.png", scale: 11,),
                                Text(" *** 2462", style: Styles.headLineStyle3,)
                              ],
                            ),
                            const Gap(5),
                            Text("Payment method", style: Styles.headLineStyle4,)
                          ],
                        ),
                        const ColumnWidget(firstText: '\$249.99', secondText: "Price", alignment: CrossAxisAlignment.end, isColor: true),
                      ],

                    ),

                  ],
                ),
              ),
              const SizedBox(height: 1.1,),
              Container(
                margin: EdgeInsets.only(left: AppLayout.getHeight(15), right: AppLayout.getHeight(15)),
                padding: EdgeInsets.only(top: AppLayout.getHeight(20), bottom: AppLayout.getHeight(20)),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(21), bottomRight: Radius.circular(21))
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15)),
                  child: ClipRRect(
                    borderRadius:BorderRadius.circular(AppLayout.getHeight(15)),
                    child: BarcodeWidget(
                      data: 'https://huelab.net',
                      barcode: Barcode.code128(),
                      drawText: false,
                      color: Styles.textColor,
                      height: 70,
                    ),
                  ),
                ),
              ),
              Gap(AppLayout.getHeight(25)),
              Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                child: TicketView(ticket: ticketList[0]),
              ),

            ]
          ),
          Positioned(
            left: AppLayout.getHeight(22),
            top: AppLayout.getHeight(295),
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Styles.textColor, width: 2)
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: Styles.textColor,
              ),
            ),
          ),
          Positioned(
            right: AppLayout.getHeight(22),
            top: AppLayout.getHeight(295),
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Styles.textColor, width: 2)
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: Styles.textColor,
              ),
            ),
          ),
        ]
      ),
    );
  }
}
