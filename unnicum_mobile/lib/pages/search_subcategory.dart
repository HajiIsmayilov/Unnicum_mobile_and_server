import 'package:unnicum_mobile/widgets/cities_row.dart';
import 'package:unnicum_mobile/widgets/continents_row.dart';
import 'package:unnicum_mobile/widgets/countries_row.dart';
import 'package:flutter/material.dart';

class SearchSubCategoryPage extends StatelessWidget {
  final String subCategory;

  SearchSubCategoryPage({
    required this.subCategory,
  });

  List<String> continents = [
    'Asia',
    'Africa',
    'North America',
    'South America',
    'Antarctica',
    'Europe',
    'Australia',
  ];

  List<String> countries = [
    'Azerbaijan',
    'Turkey',
    'Dominica',
    'Egypt',
    'Finland',
    'Italy',
  ];

  List<String> cities = [
    'Baku',
    'Ankara',
    'Bodrum',
    'Antalya',
    'Roma',
    'Tokio',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.0689655172413793,
                  right: MediaQuery.of(context).size.width * 0.06312,
                ),
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.0256266666666667,
                        ),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios))),
                    Expanded(child: Container()),
                    Text(
                      subCategory,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.0426666666666667,
                  right: MediaQuery.of(context).size.width * 0.0373333333333333,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.0203940886699507,
                      ),
                      child: Text(
                        'World',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.0123152709359606,
                      ),
                      height: MediaQuery.of(context).size.height * 0.204433497536946,
                      width: MediaQuery.of(context).size.width * 0.92,
                      color: Color.fromRGBO(128, 128, 128, 1),
                    ),
                    ContinentRow(
                      continents: continents,
                    ),
                    CountriesRow(
                      countries: countries,
                    ),
                    CitiesRow(
                      cities: cities,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
