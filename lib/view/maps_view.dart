import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hydromart/view/themes/appbartheme.dart';
import 'package:hydromart/view/themes/color.dart';

import '../controller/maps_view_controller.dart';

class MapsView extends GetView<MapsViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar2('Store Location'),
        body: SafeArea(
          child: GetBuilder<MapsViewController>(
              init: Get.find<MapsViewController>(),
              builder: (mapsC) {
                Future.delayed(const Duration(seconds: 2), () {
                  mapsC.isLoading.value = false;
                  mapsC.update();
                });
                if (mapsC.isLoading.value) {
                  debugPrint(mapsC.isLoading.value.toString());
                  return Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                } else {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: GoogleMap(
                        myLocationButtonEnabled: true,
                        myLocationEnabled: true,
                        padding: const EdgeInsets.all(10),
                        zoomControlsEnabled: true,
                        markers: {mapsC.destination},
                        mapToolbarEnabled: true,
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(-8.1827965, 113.7070758),
                          zoom: 15,
                        ),
                        onTap: (argument) => debugPrint(argument.toString()),
                        polylines: {
                          Polyline(
                            polylineId: const PolylineId("route"),
                            points: [
                              const LatLng(-8.1827965, 113.7070758),
                              LatLng(
                                  mapsC.latitude.value, mapsC.longitude.value),
                            ],
                            color: backgroundAwal,
                            width: 5,
                          ),
                        },
                        buildingsEnabled: true,
                        zoomGesturesEnabled: true,
                        scrollGesturesEnabled: true,
                        compassEnabled: true,
                      ),
                    ),
                  );
                }
              }),
        ));
  }
}
