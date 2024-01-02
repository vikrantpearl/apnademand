

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LoadingListPage extends StatefulWidget {
  const LoadingListPage({super.key});

  @override
  State<LoadingListPage> createState() => _LoadingListPageState();
}

class _LoadingListPageState extends State<LoadingListPage> {
  bool isLoaded = false;
  int _currentIndex = 0;
  GoogleMapController? mapController;
  Location location = Location();
  LatLng currentLocation = LatLng(0, 0);




  void _getCurrentLocation() async {
    try {
      var currentLocationData = await location.getLocation();
      setState(() {
        currentLocation = LatLng(
          currentLocationData.latitude!,
          currentLocationData.longitude!,
        );
      });
    } catch (e) {
      print("Error getting current location: $e");
    }
  }


  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: isLoaded ? bodyMain() : getShimmerLoading(),
    );
  }

  Widget bodyMain() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            appBar(),
            const SizedBox(
              height: 13,
            ),
            bodyapp()
          ],
        ),
      ),
    );
  }

  Widget bodyapp() {
    return Column(
      children: [
        carouselSlider,
        const SizedBox(
          height: 9,
        ),
        BanquetHalls(),
      ],
    );
  }

  Widget BanquetHalls() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pick your Venue',
                style: TextStyle(
                  color: Color(0xFF1E2742),
                  fontSize: 21.74,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 47,
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: Color(0xFF9A2042),
                    fontSize: 11.86,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    height: 0,
                  ),
                ),
              )
            ],
          ),
          horizontalList2
        ],
      ),
    );
  }

  Widget horizontalList2 = Container(
    margin: const EdgeInsets.symmetric(vertical: 20.0),
    height: 205.0,
    child: Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) => Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/hotal.png"),
              Text(
                'Bloom Hotel',
                style: TextStyle(
                  color: Color(0xFF1E2742),
                  fontSize: 21.74.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset("assets/svg/like.svg"),
                  Text(
                    '4.93',
                    style: TextStyle(
                      color: Color(0xFF1E2742),
                      fontSize: 11.86,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Opacity(
                    opacity: 0.60,
                    child: Text(
                      '(111 reviews)',
                      style: TextStyle(
                        color: Color(0xFF1E2742),
                        fontSize: 10.87,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/svg/dil.svg")
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );

  Widget carouselSlider = SizedBox(
      height: 180,
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(height: 180.0),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFFFA6E20),
                          borderRadius: BorderRadius.circular(12)),
                      child: Stack(
                        children: [
                          Positioned(
                              left: 100,
                              top: 0,
                              child: SvgPicture.asset(
                                "assets/svg/oneimage.svg",
                                width: 100,
                                height: 190,
                              )),
                          const Positioned(
                            left: 5,
                            top: 10,
                            child: Text(
                              'Uniqlo x One Piece',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 10,
                            top: 35,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              'The story of One Piece:\n a famous songstress whom \nloved by pirates, including \nStraw Hats. With the \nrelease of 4th awaited movie,\n this UT collection is\n must-have for\n One Piece fans.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            top: 150,
                            child: Container(
                              width: 58,
                              height: 16,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 58,
                                      height: 16,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    left: 9,
                                    top: 2,
                                    child: Text(
                                      'Shop Now',
                                      style: TextStyle(
                                        color: Color(0xFFFA6E20),
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ));
                },
              );
            }).toList(),
          ),
        ],
      ));

  Widget appBar() {
    LatLng _currentLocation;
    void _onMapCreated(GoogleMapController controller) {
      setState(() {
        mapController = controller;
      });
    }
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 120, // Set this height
      flexibleSpace: Container(
        width: double.infinity,
        height: 223,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 12, right: 12),
          child: Column(
            children: [
              HeaderWidget(),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/svg/location-Icon.svg"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Current Location:  ',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                 // GoogleMap(
                 //    onMapCreated: _onMapCreated,
                 //    initialCameraPosition: CameraPosition(
                 //      target: currentLocation,
                 //      zoom: 15.0,
                 //    ),
                 //    myLocationEnabled: true,
                 //    markers: {
                 //      Marker(
                 //        markerId: MarkerId("currentLocation"),
                 //        position: currentLocation,
                 //        infoWindow: InfoWindow(title: 'Current Location'),
                 //      ),
                 //    },
                 //  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w400),
                    prefixIcon: const SizedBox(
                        width: 13, height: 13, child: Icon(Icons.search)),
                    enabledBorder: const OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    labelStyle: new TextStyle(color: Colors.green),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget HeaderWidget() {
    return Row(
      children: [Image.asset("assets/logo.png")],
    );
  }

  Shimmer getShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 234.w,
                height: 50.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF5F6F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 104.w,
                height: 50.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF5F6F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            width: 379.w,
            height: 117.h,
            decoration: ShapeDecoration(
              gradient: const RadialGradient(
                center: Alignment(1.06, 0.53),
                radius: 0.66,
                colors: [Color(0xFFF5F6F7), Color(0xFFF5F6F7)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17),
              ),
            ),
          )
        ],
      ),
    );
  }
}
