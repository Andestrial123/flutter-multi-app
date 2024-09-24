import 'package:flutter/material.dart';
import 'package:flutter_multi_app/shared/service/api/model/discount_model.dart';

class DailyDiscountWidget extends StatefulWidget {
  final List<DiscountModel> discounts;

  const DailyDiscountWidget({super.key, required this.discounts});

  @override
  State<DailyDiscountWidget> createState() => _DailyDiscountWidgetState();
}

class _DailyDiscountWidgetState extends State<DailyDiscountWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _onPrevious() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _pageController.animateToPage(
        widget.discounts.length - 1,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInBack,
      );
    }
  }

  void _onNext() {
    if (_currentPage < widget.discounts.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _pageController.animateToPage(
        0,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Daily discounts',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: widget.discounts.length,
                itemBuilder: (context, index) {
                  final discount = widget.discounts[index];
                  return Image.network(
                    discount.imageUrl,
                    fit: BoxFit.contain,
                  );
                },
              ),
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.brown),
                  onPressed: _onPrevious,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.brown),
                  onPressed: _onNext,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.discounts.length, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? Colors.brown : Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }
}
