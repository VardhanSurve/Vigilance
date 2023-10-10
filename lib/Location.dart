import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;
import 'package:telephony/telephony.dart';
import 'pop.dart';
import 'dart:async';
import 'notification_manager.dart';

class Safety {
  late final String line;
  Safety({
    required this.line,
  });
}

class LocationData {
  final String name;
  final double latitude;
  final double longitude;
  final double distance; // Add this property
  final double crimeRate; // Add this property
  final int cctvCameras; // Add this property

  LocationData({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.distance,
    required this.crimeRate,
    required this.cctvCameras, // Add this property
  });
}
String popupMessage = " ";
class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};
  List<LocationData> _locations = [];

  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(19.174472, 72.866),
    zoom: 15,
  );
  int _selectedListIndex = 0;

  bool _isLocationMenuOpen = false;
  bool _isOverlayOpen = false;
  bool _isSidebarOpen = false;

  @override
  void initState() {
    super.initState();
    _loadLocations();
    _getCurrentLocation();
  }

  String getColumn8Value(int selectedIndex, List<List<dynamic>> csvTable) {
    if (selectedIndex >= 0 && selectedIndex < csvTable.length) {
      return csvTable[selectedIndex][8].toString();
    } else {
      return 'Invalid index';
    }
  }

  Future<void>  _loadLocations() async {
    final String data = await rootBundle.loadString('assets/data.csv');
    List<List<dynamic>> csvTable = const CsvToListConverter().convert(data);
    csvTable.removeAt(0);

    _locations = csvTable.map((row) {
      return LocationData(
        name: row[1].toString(),
        latitude: double.parse(row[3].toString()),
        longitude: double.parse(row[4].toString()),
        distance: double.parse(row[5].toString()), // Assuming it's in the 6th column
        crimeRate: double.parse(row[6].toString()), // Assuming it's in the 7th column
        cctvCameras: int.parse(row[7].toString()),
      );
    }).toList();

    // Print the loaded data
    for (var location in _locations) {
      print('Name: ${location.name}, Latitude: ${location.latitude}, Longitude: ${location.longitude}, Distance: ${location.distance}, Crime Rate: ${location.crimeRate}, CCTV Cameras: ${location.cctvCameras}');
    }
  }


  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Window Title'),

          content: Text("hello "),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    LatLng latLng = LatLng(position.latitude, position.longitude);
    _mapController?.animateCamera(CameraUpdate.newLatLng(latLng));
    print(latLng);
  }

  void _onLocationSelected(LocationData location) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId(location.name),
          position: LatLng(location.latitude, location.longitude),
          infoWindow: InfoWindow(title: location.name),
        ),
      );
    });
    _mapController?.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(location.latitude, location.longitude),
      ),
    );
  }

  void _toggleLocationMenu() {
    setState(() {
      _isLocationMenuOpen = !_isLocationMenuOpen;
    });
  }

  void _toggleOverlay() {
    setState(() {
      _isOverlayOpen = !_isOverlayOpen;
    });
  }


  Future<void> _openPopUpWindow(int selectedIndex) async {

    print("object");







    // Check if the selected index is within valid range
    if (selectedIndex >= 0 && selectedIndex < _locations.length) {
      double distance = _locations[selectedIndex].distance;
      double crimeRate = _locations[selectedIndex].crimeRate;
      int cctvCameras = _locations[selectedIndex].cctvCameras;
      print(selectedIndex);
      print(distance);
      print(crimeRate);
      print(cctvCameras);
      // Make your API call with these values and handle the response
      final String popupMessage = await _makeApiCall(distance, crimeRate, cctvCameras);

      // Show the dialog with the received popup message
      _showPopupDialog(context, popupMessage);
    } else {
      // Handle invalid index
      _showPopupDialog(context, 'Invalid index');
    }


  }

  Future<String> _makeApiCall(double distance, double crimeRate, int cctvCameras) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.43.141:8000/predict'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "Distance": distance,
          "Crime_Rate": crimeRate,
          "CCTV_Cameras": cctvCameras,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return data['prediction'];
      } else {
        return 'Error: ${response.statusCode}';
      }
    } catch (error) {
      return 'Error: $error';
    }
  }

  void _showPopupDialog(BuildContext context, String message) {
    NotificationManager.addNotification(message);
    print("added noti");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Popup Window'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialCameraPosition,
            onMapCreated: (controller) {
              _mapController = controller;
            },
            markers: _markers,
          ),
          Positioned(
            bottom:90,
            left: 15,
            child: FloatingActionButton(
              onPressed: () async {
                _openPopUpWindow(_selectedListIndex);
              },
              child: Icon(Icons.add_alert_sharp),
            ),
          ),
          if (_isOverlayOpen)
            GestureDetector(
              onTap: _toggleOverlay,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    'This is a placeholder message for the overlay.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          Positioned(
            top: 30,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xff37949d).withOpacity(0.6), // Adjust opacity as needed
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                // Add blur effect
                // backdropFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                // Add border
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80, // Custom height for the image container
                    width: 80,  // Custom width for the image container
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 10), // Add some space between the image and text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "SAFE-ROUTES",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      // Add more Text widgets if needed
                    ],
                  ),
                ],
              ),
            ),
          )

        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _toggleLocationMenu,
            child: _isLocationMenuOpen
                ? const Icon(Icons.arrow_circle_down)
                : const Icon(Icons.arrow_circle_up),
          ),
          const SizedBox(height: 75),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomSheet: _isLocationMenuOpen
          ? Container(
              height: MediaQuery.of(context).size.height / 3,
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Expanded(
                    child:
                       ListView.builder(
                      itemCount: _locations.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_locations[index].name),
                          onTap: () {
                            _selectedListIndex = index;
                            _onLocationSelected(_locations[index]);
                            _toggleLocationMenu();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }

}
