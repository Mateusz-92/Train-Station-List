class ApiMock {
  static List<Map<String, dynamic>> fetchStations() {
    return [
      {
        'ibnr': '123',
        'name': 'Poznań  ',
        'epa': null,
        'isMeta': 'true',
      },
      {
        'ibnr': '345',
        'name': 'Warszawa',
        'epa': '567',
        'isMeta': 'false',
      },
      {
        'ibnr': '234',
        'name': 'Katowice Zawodzie',
        'epa': '567',
        'isMeta': 'false',
      },
      {
        'ibnr': '345',
        'name': 'Warszawa',
        'epa': '678',
        'isMeta': 'true',
      },
      {
        'ibnr': '345',
        'name': 'Gdańsk',
        'epa': '678',
        'isMeta': 'true',
      },
      {
        'ibnr': '345',
        'name': 'Gdańsk Oliwa',
        'epa': '678',
        'isMeta': 'false',
      },
      {
        'ibnr': '124',
        'name': 'Zawiercie',
        'epa': '490',
        'isMeta': 'false',
      },
      {
        'ibnr': '111',
        'name': 'Zabrze',
        'epa': '567',
        'isMeta': 'false',
      },
      {
        'ibnr': '333',
        'name': 'Toruń',
        'epa': '222',
        'isMeta': 'true',
      },
      {
        'ibnr': '231',
        'name': 'Opole',
        'epa': '133',
        'isMeta': 'true',
      },
      {
        'ibnr': '002',
        'name': 'Kraków',
        'epa': '464',
        'isMeta': 'true',
      },
    ];
  }
}
