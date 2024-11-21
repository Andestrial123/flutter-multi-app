import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/features/home/domain/discount_bloc/discount_bloc.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscountBloc, DiscountState>(
      builder: (context, state) {
        switch (state) {
          case DiscountsLoadingState():
            return const Center(child: CircularProgressIndicator());
          case DiscountsLoadedState():
            final discounts = state.discounts;
            return Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: CarouselSlider(
                        items: discounts.map((discounts) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Center(
                              child: Image.network(
                                discounts.imageUrl ??
                                    'https://via.placeholder.com/150',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          );
                        }).toList(),
                        carouselController: _controller,
                        options: CarouselOptions(
                          autoPlay: false,
                          enlargeCenterPage: true,
                          viewportFraction: 1.0,
                          aspectRatio: 1.7,
                          initialPage: 0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: IconButton(
                        onPressed: () => _controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        ),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: const Icon(Icons.arrow_back_ios),
                        iconSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: IconButton(
                        onPressed: () => _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        ),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: const Icon(Icons.arrow_forward_ios),
                        iconSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: discounts.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: _currentIndex == entry.key ? 8.0 : 6.0,
                        height: _currentIndex == entry.key ? 8.0 : 6.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == entry.key
                              ? Colors.black
                              : Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          case DiscountsErrorState():
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            });
        }
        return const SizedBox.shrink();
      },
    );
  }
}
