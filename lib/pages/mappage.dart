import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:store_app/helper/appcolor.dart';
import 'package:store_app/widgets/categoryicon.dart';
import 'package:store_app/widgets/mapuserbadge.dart';

const LatLng sourceLocation = LatLng(42.7477863, -71.1699932);
const LatLng destLocation = LatLng(42.743902, -71.170009);
const double cameraZoom = 16;
const double cameraTilt = 80;
const double cameraBearing = 30;

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  final Set<Marker> _markers = <Marker>{};

  late LatLng currentLocation;
  late LatLng destinationLocation;

  @override
  void initState() {
    super.initState();

    //set up initial location
    setInitialLocation();
    //set up marker icons
    setSourceAndDestinationMarkerIcons();
  }

  void setSourceAndDestinationMarkerIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.0),
      'assets/imgs/pingreen.png',
    );

    destinationIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.0),
      'assets/imgs/pinred.png',
    );
  }

  void setInitialLocation() {
    currentLocation = LatLng(
      sourceLocation.latitude,
      sourceLocation.longitude,
    );
    destinationLocation = LatLng(
      destLocation.latitude,
      destLocation.longitude,
    );
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = const CameraPosition(
      target: sourceLocation,
      zoom: cameraZoom,
      tilt: cameraTilt,
      bearing: cameraBearing,
    );

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: initialCameraPosition,
              myLocationEnabled: true,
              compassEnabled: false,
              tiltGesturesEnabled: false,
              markers: _markers,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);

                showPinOnMap();
              },
            ),
          ),
          const Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: MapUserBadge(),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/imgs/ani1_1.jpg',
                              height: 60,
                              width: 60,
                            ),
                          ),
                          const Positioned(
                            bottom: -8,
                            right: -8,
                            child: CategoryIcon(
                              color: AppColor.meat,
                              iconName: Icons.access_alarm,
                              iconsize: 10.00,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            'meat',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  showPinOnMap() {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('sourcePin'),
          position: currentLocation,
          icon: sourceIcon,
        ),
      );
      _markers.add(
        Marker(
          markerId: const MarkerId('destinationPin'),
          position: destinationLocation,
          icon: destinationIcon,
        ),
      );
    });
  }
}
