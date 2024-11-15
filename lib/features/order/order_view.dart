import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_app/features/order/widgets/order_status_widget.dart';
import 'package:flutter_multi_app/features/order/widgets/status_info_widget.dart';
import 'package:flutter_multi_app/shared/assets/assets.dart';
import 'package:flutter_multi_app/shared/translation/locale_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  final screenUtil = ScreenUtil();
  var count = 0;
  var maxCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf2e9e2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenUtil.setHeight(60)),
              Center(
                child: Text(
                  LocaleKeys.orderTracking.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenUtil.setSp(32),
                    color: Colors.brown,
                  ),
                ),
              ),
              SizedBox(height: screenUtil.setHeight(60)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OrderStatusWidget(
                    length: maxCount,
                    completedSteps: count,
                  ),
                  Column(children: [
                    const StatusInfoWidget(
                        image: Assets.strawberry,
                        textUpper: LocaleKeys.orderPlaced,
                        textLower: LocaleKeys.loremPlaceholder),
                    SizedBox(height: screenUtil.setHeight(30)),
                    const StatusInfoWidget(
                        image: Assets.strawberry,
                        textUpper: LocaleKeys.onTheWay,
                        textLower: LocaleKeys.loremPlaceholder),
                    SizedBox(height: screenUtil.setHeight(30)),
                    const StatusInfoWidget(
                        image: Assets.strawberry,
                        textUpper: LocaleKeys.orderReady,
                        textLower: LocaleKeys.loremPlaceholder),
                  ])
                ],
              ),
              SizedBox(height: screenUtil.setHeight(40)),
              //TEST BUTTON
              Center(
                child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        if (count == maxCount) {
                          count = 0;
                        } else {
                          count++;
                        }
                      });
                    },
                    child: const Text('Change check')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
