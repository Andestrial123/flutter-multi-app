import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/features/google_maps/domain/google_maps_bloc.dart';
import 'package:flutter_multi_app/features/google_maps/presentation/modal_google_maps.dart';
import 'package:flutter_multi_app/shared/translation/locale_keys.dart';
import 'package:flutter_multi_app/shared/widgets/text/custom_title.dart';
import 'package:flutter_multi_app/utils/app_route.gr.dart';
import 'package:flutter_multi_app/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage()
class GoogleMapsScreen extends StatefulWidget {
  final void Function(bool isVisible)? onToggleBottomNav;

  const GoogleMapsScreen({super.key, this.onToggleBottomNav});

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen>
    with SingleTickerProviderStateMixin {
  late DraggableScrollableController _controller;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _translationAnimation;
  late Animation<double> _iconOpacityAnimation;
  String? _activeMarkerId;

  @override
  void initState() {
    super.initState();
    _controller = DraggableScrollableController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _translationAnimation =
        Tween<double>(begin: 0.0, end: -ScreenUtil().setWidth(60))
            .animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _iconOpacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  void _onMarkerTapped(String markerId) {
    setState(() {
      _activeMarkerId = markerId;
    });

    _controller.animateTo(0.4,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);

    _animationController.forward();

    widget.onToggleBottomNav?.call(true);
  }

  void _onMapTapped(LatLng position) {
    setState(() {
      _activeMarkerId = null;
    });

    _controller.animateTo(0.0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);

    _animationController.reverse();

    widget.onToggleBottomNav?.call(false);
  }

  void _hideModal() {
    _controller.animateTo(0.0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    _animationController.reverse();
    widget.onToggleBottomNav?.call(false);
  }

  void _onViewMenuButtonPressed() {
    widget.onToggleBottomNav?.call(false);
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.identity()
                ..scale(_scaleAnimation.value)
                ..translate(_translationAnimation.value, 0),
              alignment: Alignment.center,
              child: CustomTitle(
                text: LocaleKeys.selectBakeryLocation.tr(),
                fontSize: ScreenUtil().setSp(22),
              ),
            );
          },
        ),
        actions: [
          FadeTransition(
            opacity: _iconOpacityAnimation,
            child: IconButton(
              icon: const Icon(Icons.shopping_basket_outlined,
                  size: 30.0, color: Colors.grey),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 16.0),
        ],
        toolbarHeight: 120,
        backgroundColor: CustomColors.whiteColor,
      ),
      body: BlocBuilder<GoogleMapsBloc, GoogleMapsState>(
        builder: (context, state) {
          switch (state) {
            case GoogleMapsLoading():
              return const Center(child: CircularProgressIndicator());
            case GoogleMapsLoaded():
              final markers = state.marks.map((mark) {
                return Marker(
                  markerId: MarkerId(mark.id ?? ''),
                  position: LatLng(mark.latitude ?? 0.0, mark.longitude ?? 0.0),
                  icon: _activeMarkerId == mark.id
                      ? BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueRed)
                      : BitmapDescriptor.defaultMarker,
                  onTap: () => _onMarkerTapped(mark.id ?? ''),
                );
              }).toSet();

              final selectedMark = state.marks.firstWhere(
                  (mark) => mark.id == _activeMarkerId,
                  orElse: () => state.marks.first);

              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              child: GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(
                                      state.marks.isNotEmpty
                                          ? state.marks.first.latitude
                                                  ?.toDouble() ??
                                              0.0
                                          : 0.0,
                                      state.marks.isNotEmpty
                                          ? state.marks.first.longitude
                                                  ?.toDouble() ??
                                              0.0
                                          : 0.0),
                                  zoom: 14,
                                ),
                                markers: markers,
                                onTap: _onMapTapped,
                                mapType: MapType.normal,
                                zoomControlsEnabled: false,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      spreadRadius: 5,
                                      blurRadius: 5,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  NotificationListener<DraggableScrollableNotification>(
                    onNotification: (notification) {
                      if (notification.extent == notification.minExtent) {
                        _hideModal();
                      }
                      return true;
                    },
                    child: ModalGoogleMaps(
                      controller: _controller,
                      address: selectedMark.address ?? '',
                      onPressed: () {
                        {
                          AutoRouter.of(context)
                              .replaceAll([const HomeRoute()]);
                          _onViewMenuButtonPressed();
                          _hideModal();
                        }
                      },
                    ),
                  ),
                ],
              );
            case GoogleMapsError():
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              });
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
