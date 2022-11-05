import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../view/splash/splash.dart';

void main() {
  runApp(SplashView());
}

class local extends StatefulWidget {
  local({Key? key}) : super(key: key);

  var locationMessage = '';
  String latitude = '';
  String longitude = '';

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var lati = position.latitude;
    var long = position.longitude;

    latitude = "$lati";
    longitude = "$long";

    setState() {
      locationMessage = "Latitude: $lati and Longitude: $long";
    }

    ;
  }

  //funcao para abrir com o google maps

  void googleMap() async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=16query=$latitude,$longitude";

    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else
      throw ("Couldn't open google maps");
  }

  @override
  State<local> createState() => _localState();
}

class _localState extends State<local> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
