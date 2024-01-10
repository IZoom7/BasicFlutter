import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GPS Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Position myPos;
  late LocationSettings locationSettings;


  TextEditingController latCtr = TextEditingController();
  TextEditingController lngCtr = TextEditingController();

  @override
  void initState() {
    print("init state begin");
    setPos();
    print("init state end");
  }
  Future<void> setPos() async {
    myPos = await _determinePosition();
    print(myPos.latitude);
    latCtr.text = myPos.latitude.toString();
    lngCtr.text = myPos.longitude.toString();

    locationSettings = AndroidSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
      forceLocationManager: true,
      intervalDuration: const Duration(seconds: 10),
    );
    print("start stream");
    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(locationSettings:
    locationSettings).listen(
            (Position position) {
          print(position == null ? 'Unknown' : position.latitude.toString() + ', ' +
              position.longitude.toString());

          latCtr.text = position.latitude.toString();
          lngCtr.text = position.longitude.toString();
        });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GPS Test"),
      ),
      body: Center(
          child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.blue,
            child: const Center(child: Text('ค่าพิกัด GPS จากเครื่อง')),
          ),
          Container(
              height: 300,
              //color: Colors.amber[500],
              child: gpsUI()),
        ],
      )),
    );
  }

  gpsUI() {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: latCtr,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Lat',
                  hintText: 'ข้อมูล Lat',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: lngCtr,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Lng',
                  hintText: 'ข้อมูล Lng',
                ),
              ),
            ),
          ],
        ));
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    print('Location services are disabled.');
    return Future.error('Location services are disabled.');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      print('Location permissions are denied.');
      return Future.error('Location permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  print('Return position');
  return await Geolocator.getCurrentPosition();
}
