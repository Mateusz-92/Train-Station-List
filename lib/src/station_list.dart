import 'package:flutter/material.dart';
import 'station.dart';

class StationList extends StatefulWidget {
  final List<Station> stations;
  const StationList({super.key, required this.stations});

  @override
  StationListState createState() => StationListState();
}

class StationListState extends State<StationList> {
  List<Station> filteredStations = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredStations = widget.stations;
  }

  void filterStations(String value) {
    List<Station> results = [];
    if (value.isEmpty) {
      results = widget.stations;
    } else {
      results = widget.stations
          .where((station) =>
              station.name.toLowerCase().contains(value.toLowerCase()) ||
              station.ibnr
                  .toString()
                  .toLowerCase()
                  .contains(value.toLowerCase()) ||
              (int.tryParse(value) != null &&
                  station.epa == int.tryParse(value)) ||
              station.ibnr
                  .toString()
                  .toLowerCase()
                  .contains(value.toLowerCase()) ||
              (int.tryParse(value) != null &&
                  station.epa == int.tryParse(value)))
          .toList();
    }
    setState(() {
      filteredStations = results;
    });
  }

  Station? _selectedStation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(bottom: 50),
        width: 300,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'Search by name or code',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
                onChanged: (value) {
                  filterStations(value);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredStations.length,
                itemBuilder: (BuildContext context, int index) {
                  Station station = filteredStations[index];
                  return ListTile(
                    title: Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Row(
                        children: [
                          Icon(
                            station.isMeta ? Icons.train : Icons.location_city,
                            size: 40,
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  station.name.toUpperCase(),
                                  maxLines: 2,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Text(
                                  'IBNR: ${station.ibnr}${station.epa != null ? ' | EPA: ${station.epa}' : ''}',
                                  style: const TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _selectedStation = station;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            duration: const Duration(seconds: 1),
                            backgroundColor: Colors.grey,
                            content: Text(
                              'Selected Station:  ${_selectedStation?.name ?? ''}'
                                  .toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
