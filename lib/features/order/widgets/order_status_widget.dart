import 'package:flutter/material.dart';
import 'package:flutter_multi_app/shared/assets/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderStatusWidget extends StatefulWidget {
  const OrderStatusWidget(
      {super.key, required this.length, required this.completedSteps});

  final int length;
  final int completedSteps;

  @override
  State<OrderStatusWidget> createState() => _OrderStatusWidgetState();
}

class _OrderStatusWidgetState extends State<OrderStatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(widget.length, (index) {
        final isCompleted = index < widget.completedSteps;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: Color(0xFFe2cebf),
                  shape: BoxShape.circle,
                ),
                child: isCompleted
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          Assets.check,
                          theme:
                              const SvgTheme(currentColor: Color(0xFF6f6859)),
                        ),
                      )
                    : null,
              ),
              if (index != widget.length - 1)
                Column(
                  children: List.generate(20, (dotIndex) {
                    return const SizedBox(
                      width: 1,
                      height: 4,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Color(0xFFafa9a4)),
                      ),
                    );
                  }),
                ),
            ],
          ),
        );
      }),
    );
  }
}
