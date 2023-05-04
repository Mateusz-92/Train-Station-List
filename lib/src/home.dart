import 'package:flutter/material.dart';
import 'package:train_station_list/src/api_mock.dart';
import 'package:train_station_list/src/station_list.dart';
import 'package:train_station_list/src/station.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Station> dummyApiData = Station.getStationsData(ApiMock.fetchStations());

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          color: Colors.grey,
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.only(top: 40, bottom: 15),
          width: double.maxFinite,
          height: 100,
          child: const Center(
              child: Text(
            'Stations List',
            style: TextStyle(color: Colors.white, fontSize: 27),
          )),
        ),
      ),
      body: Stack(
        children: [StationList(stations: dummyApiData)],
      ),
    );
  }
}
