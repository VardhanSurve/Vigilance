import 'package:flutter/material.dart';

class PoliceStationCard extends StatelessWidget {
  final Function? onMapFunction;
  const PoliceStationCard({Key? key, this.onMapFunction}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              onMapFunction!('Police stations near me');
            },
            child: InkWell(
              onTap: (){
                onMapFunction!('https://www.google.co.in/maps/search/police+stations+near+me');

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
                      'assets/images/police.png',
                      height: 50,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text('Police Stations')
        ],
      ),
    );
  }
}
