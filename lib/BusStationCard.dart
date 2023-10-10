
import 'package:flutter/material.dart';

class BusStationCard extends StatelessWidget {
  final Function? onMapFunction;

  const BusStationCard({Key? key, this.onMapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              onMapFunction!('https://www.google.co.in/maps/search/bus+station+near+me');
            },
            child: Card(
              elevation: 6,
              color: Color(0xffff6b81),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 65,
                width: 65,
                child: Center(
                  child: Image.asset(
                    'assets/images/buss-removebg-preview.png',
                    height: 50,
                  ),
                ),
              ),
            ),
          ),
          Text('Bus Stations')
        ],
      ),
    );
  }
}
