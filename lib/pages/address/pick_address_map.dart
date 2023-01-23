import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickAddressMap extends StatefulWidget {
  final bool fromSignup;
  final bool fromAddress;
  final GoogleMapController? googleMapController;
  const PickAddressMap({Key? key,
    required this.fromSignup,
    required this.fromAddress,
    this.googleMapController}) : super(key: key);

  @override
  State<PickAddressMap> createState() => _PickAddressMapState();
}

class _PickAddressMapState extends State<PickAddressMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
