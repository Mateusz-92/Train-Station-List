class Station {
  final int ibnr;
  final String name;
  final int? epa;
  final bool isMeta;

  Station({
    required this.ibnr,
    required this.name,
    this.epa,
    this.isMeta = false,
  });

  factory Station.getData(Map<String, dynamic>? station) {
    if (station == null) {
      throw const FormatException('Station data is missing or null');
    }

    final int? ibnr = station['ibnr'] != null
        ? int.tryParse(station['ibnr'].toString())
        : null;
    final String? name = (station['name'] != null) ? station['name'] : null;
    final int? epa =
        station['epa'] != null ? int.parse(station['epa'].toString()) : null;
    final bool isMeta = station['isMeta'] != null
        ? station['isMeta'].toString().toLowerCase() == 'true'
        : false;

    if (ibnr == null || name == null || name == '') {
      throw const FormatException('IBNR or name is missing or null');
    }

    return Station(
      ibnr: ibnr,
      name: name,
      epa: epa,
      isMeta: isMeta,
    );
  }

  static List<Station> getStationsData(
    List<Map<String, dynamic>>? data,
  ) {
    if (data == null) throw const FormatException('Data is missing or null');

    return data.map((station) => Station.getData(station)).toList();
  }
}
