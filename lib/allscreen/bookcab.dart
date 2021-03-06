import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BookingPage extends StatefulWidget {
  // const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  // Completer<GoogleMapController> _controller = Completer();
  //
  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  //
  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);
  List<String> bottomMenus = [
    "Mini",
    "Sedan",
    "Prime",
    "Truck",
  ];
  List<IconData> bottomMenuIcons = [
    Icons.car_rental,
    Icons.local_taxi_rounded,
    Icons.car_repair,
    Icons.local_shipping_outlined,
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Ride'),
      ),

      body: Container(
      height: double.maxFinite,
      width:  double.maxFinite,
        color: Colors.green[100],
        child: Stack(
          children: [
            // GoogleMap(
            //   mapType: MapType.hybrid,
            //   initialCameraPosition: _kGooglePlex,
            //   onMapCreated: (GoogleMapController controller) {
            //     _controller.complete(controller);
            //   },
            // ),
            Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Card(
                elevation: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0.5),
                      child: TextField(
                        decoration: const InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 8),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none),
                          prefixIcon: Icon(Icons.my_location),
                          hintText: "Enter pickup location"

                        ),
                      ),
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none),
                          prefixIcon: Icon(Icons.near_me_rounded),
                          hintText: "Enter dropoff location"
                      ),
                    ),
                  ],
                ),

              ),
            ),
                  Positioned(
                    bottom: 30,
                    left: 20,
                    right: 20,
                    child: Card(
                      elevation: 6,
                      child: Container(
                        width: double.maxFinite,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(bottomMenus.length, (index){
                              return GestureDetector(
                                onTap: (){
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(microseconds: 900),
                                  height:50,
                                  padding: const EdgeInsets.only(left: 5, right: 5),
                                  decoration: BoxDecoration(
                                    color: selectedIndex == index ? const Color(0xff3c2593) : Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Row(
                                    children: [
                                    selectedIndex == index
                                    ? Icon(
                                        bottomMenuIcons[index],
                                        color:  Colors.white,
                                      size: 30,
                                      ) : Container(),
                                          SizedBox(
                                            width: selectedIndex == index ? 5 : 0,
                                          ),

                                      Text(
                                        bottomMenus[index],
                                        style: TextStyle(
                                            color : selectedIndex == index ? Colors.white : const Color(0xff3c2593),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          ),
                      ),
                        ),
                    ),
                  ),

                  )
          ],
        ),
      ),
    );
  }
}
