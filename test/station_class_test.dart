import 'package:flutter_test/flutter_test.dart';
import 'package:train_station_list/src/station.dart';

void main() {
  group('Test no. 1 Station  Class ', () {
    test('Station constructor creates a Station object with provided values',
        () {
      final Station station = Station(
        ibnr: 123,
        name: 'Warszawa',
        epa: 456,
        isMeta: true,
      );

      expect(station, isInstanceOf<Station>());
      expect(station.ibnr, equals(123));
      expect(station.name, equals('Warszawa'));
      expect(station.epa, equals(456));
      expect(station.isMeta, equals(true));
    });

    test(
        ' Test no. 2 Station constructor creates a Station object with default values when no   optional values are provided',
        () {
      final Station station = Station(
        ibnr: 123,
        name: 'Warszawa',
      );

      expect(station, isInstanceOf<Station>());
      expect(station.ibnr, equals(123));
      expect(station.name, equals('Warszawa'));
      expect(station.epa, equals(null));
      expect(station.isMeta, equals(false));
    });

    test('Test no. 3 Station getData from JSON object', () {
      final Map<String, dynamic> stationData = {
        'ibnr': '123',
        'name': 'Warszawa',
        'epa': '456',
        'isMeta': 'true'
      };

      final Station stationObject = Station.getData(stationData);

      expect(stationObject.ibnr, 123);
      expect(stationObject.name, 'Warszawa');
      expect(stationObject.epa, 456);
      expect(stationObject.isMeta, true);
    });
  });
  test('Test no. 4 Station getStationsData from JSON object', () {
    final List<Map<String, dynamic>> stationsData = [
      {
        'ibnr': '345',
        'name': 'Gdańsk',
        'epa': '678',
        'isMeta': 'true',
      },
      {
        'ibnr': '345',
        'name': 'Gdańsk Oliwa',
        'epa': null,
        'isMeta': 'false',
      },
    ];

    final List<Station> stationsList = Station.getStationsData(stationsData);

    expect(stationsList[0].ibnr, 345);
    expect(stationsList[0].name, 'Gdańsk');
    expect(stationsList[0].epa, 678);
    expect(stationsList[0].isMeta, true);

    expect(stationsList[1].ibnr, 345);
    expect(stationsList[1].name, 'Gdańsk Oliwa');
    expect(stationsList[1].epa, null);
    expect(stationsList[1].isMeta, false);
  });

  test('Test no. 5 Station getStationsData from Map object', () {
    final List<Map<String, dynamic>> stationsData = [
      {
        'ibnr': 345,
        'name': 'Gdańsk',
        'epa': 678,
        'isMeta': true,
      },
      {
        'ibnr': 345,
        'name': 'Gdańsk Oliwa',
        'epa': null,
        'isMeta': false,
      },
    ];

    final List<Station> stationsList = Station.getStationsData(stationsData);

    expect(stationsList[0].ibnr, 345);
    expect(stationsList[0].name, 'Gdańsk');
    expect(stationsList[0].epa, 678);
    expect(stationsList[0].isMeta, true);

    expect(stationsList[1].ibnr, 345);
    expect(stationsList[1].name, 'Gdańsk Oliwa');
    expect(stationsList[1].epa, null);
    expect(stationsList[1].isMeta, false);
  });

  test('Test no. 6 Station getStationsData if object is empty', () {
    final List<Map<String, dynamic>> stationsData = <Map<String, dynamic>>[];

    final List<Station> stationsList = Station.getStationsData(stationsData);

    expect(stationsList, []);
  });
  test(
      'Test no. 7 when station parameter in getData method is null, throw FormatException',
      () {
    expect(() => Station.getData(null), throwsA(isA<FormatException>()));
  });

  test(' Test no. 8 when `name` or `ibnr` value is null, throw FormatException',
      () {
    final Map<String, dynamic> invalidIbnr = {'ibnr': null};
    final Map<String, dynamic> invalidName = {'name': null};
    expect(() => Station.getData(invalidIbnr), throwsA(isA<FormatException>()));
    expect(() => Station.getData(invalidName), throwsA(isA<FormatException>()));
  });
}
