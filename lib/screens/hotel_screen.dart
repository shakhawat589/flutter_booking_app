import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HotelScreen extends StatelessWidget {
  final Map<String, dynamic> hotel;
  const HotelScreen({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      width: size.width*0.6,
      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15), vertical: AppLayout.getHeight(17)),
      margin: EdgeInsets.only(right: AppLayout.getHeight(17), top: AppLayout.getHeight(5)),
      decoration: BoxDecoration(
        color: Styles.primaryColor,
        borderRadius: BorderRadius.circular(AppLayout.getHeight(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 12,
            spreadRadius: 5,
            offset: const Offset(3.0, 5.0)
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: AppLayout.getHeight(180),
            decoration: BoxDecoration(
              color: Styles.primaryColor,
              borderRadius: BorderRadius.circular(AppLayout.getHeight(12)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/${hotel["image"]}'
                )
              )

            ),
          ),
          Gap(AppLayout.getHeight(10)),
          Text(hotel["place"], style: Styles.headLineStyle2.copyWith(color: Styles.KakiColor),),
          Gap(AppLayout.getHeight(5)),
          Text(hotel["destination"], style: Styles.headLineStyle3.copyWith(color: Colors.white),),
          Gap(AppLayout.getHeight(8)),
          Text("\$${hotel["price"]}/night", style: Styles.headLineStyle.copyWith(color: Styles.KakiColor),),
        ],
      ),
    );
  }
}
