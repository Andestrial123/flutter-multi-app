import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/features/google_maps/domain/google_maps_bloc.dart';
import 'package:flutter_multi_app/features/google_maps/presentation/modal_google_maps.dart';
import 'package:flutter_multi_app/shared/translation/locale_keys.dart';
import 'package:flutter_multi_app/shared/widgets/text/custom_title.dart';
import 'package:flutter_multi_app/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({super.key});

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  late DraggableScrollableController _controller;
  String? _activeMarkerId;

  @override
  void initState() {
    super.initState();
    _controller = DraggableScrollableController();
  }

  void _onMarkerTapped(String markerId) {
    setState(() {
      _activeMarkerId = markerId;
    });

    _controller.animateTo(0.35,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  void _onMapTapped(LatLng position) {
    setState(() {
      _activeMarkerId = null;
    });

    _controller.animateTo(0.0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTitle(
          text: LocaleKeys.selectBakeryLocation.tr(),
          fontSize: ScreenUtil().setSp(22),
        ),
        toolbarHeight: 120,
        backgroundColor: CustomColors.whiteColor,
      ),
      body: BlocBuilder<GoogleMapsBloc, GoogleMapsState>(
        builder: (context, state) {
          switch (state) {
            case GoogleMapsLoaded():
              final markers = state.marks.map((mark) {
                return Marker(
                  markerId: MarkerId(mark.id ?? ''),
                  position: LatLng(mark.latitude ?? 0.0,
                      mark.longitude ?? 0.0),
                  icon: _activeMarkerId == mark.id
                      ? BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueRose)
                      : BitmapDescriptor.defaultMarker,
                  onTap: () => _onMarkerTapped(mark.id ?? ''),
                );
              }).toSet();

              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 4,
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
                                          : 37.7749, // fallback coordinates
                                      state.marks.isNotEmpty
                                          ? state.marks.first.longitude
                                                  ?.toDouble() ??
                                              0.0
                                          : -122.4194 // fallback coordinates
                                      ),
                                  zoom: 14,
                                ),
                                markers: markers,
                                onTap: _onMapTapped,
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
                  ModalGoogleMaps(controller: _controller),
                ],
              );
            case GoogleMapsLoading():
              return const Center(child: CircularProgressIndicator());
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
