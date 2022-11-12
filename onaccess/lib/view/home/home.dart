import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:onaccess/components/verif_local/verif_local.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String latitude = '';
  String longitude = '';
    @override
  void initState(){
    getLocal();
    super.initState();
  }

  getLocal() async {
    Position position = await getCurrentLocation();
    setState(() {
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();
    });
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled){
      return Future.error('Serviços de localização estão desabilitados!');
    }

    permission = await Geolocator.checkPermission();
    if (permission== LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied){
        return Future.error('Permissão rejeitada');
      }
    }

    if (permission == LocationPermission.deniedForever){
      return Future.error('Localização permanentemente rejeitada');
    }

    return await Geolocator.getCurrentPosition();

    // var position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);

    // var lati = position.latitude;
    // var long = position.longitude;

    // latitude = "$lati";
    // longitude = "$long";

    // setState() {
    //   locationMessage = "Latitude: $lati and Longitude: $long";
    // }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            latitude,textAlign: TextAlign.center,
          ),
          Text(longitude,textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}