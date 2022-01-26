import 'package:flutter/material.dart';
import 'package:unnicum_mobile/widgets/home_duel_2.dart';
import 'package:unnicum_mobile/widgets/home_video.dart';
import 'package:unnicum_mobile/widgets/user_tile.dart';

class SearchTileNotofier extends ChangeNotifier {
  String _searchTile = 'Style';

  String get searchTile => _searchTile;

  final List<String> _styles = [
    'Tokio',
    'Classic',
    'Avangard',
  ];

  final List<String> _foods = [
    'Pizza',
    'Hamburger',
    'Sushi',
  ];

  final List<String> _arts = [
    'Photography',
    'Ornamental',
    'Culinary',
  ];

  final List<String> _scienceAndTech = [
    'Computer',
    'Math',
    'Physics',
  ];

  final List<String> _tvAndMoviesArt = [
    'Intelstellar',
    'Batman Begin',
    'Ironman 2',
  ];

  set searchTile(String value) {
    _searchTile = value;
    notifyListeners();
  }

  List<String> getList() {
    switch (_searchTile) {
      case 'Style':
        return _styles;
      case 'Food':
        return _foods;
      case 'Art':
        return _arts;
      case 'Science & Tech':
        return _scienceAndTech;
      case 'TV & MoviesArt':
        return _tvAndMoviesArt;
    }
    return [];
  }

  final List<Widget> _popular = [
    HomeDuel2(
      firstUsername: 'Username',
      secondUsername: 'Username',
      category: 'category',
      subCategory: 'subCategory',
      dateTime: DateTime.now(),
      t1: 123456,
      t2: 123456,
    ),
    HomeVideo(
      username: 'username',
      t1: 123456,
      t2: 123456,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      dateTime: DateTime.now(),
      subCategory: 'subCategory',
      category: 'category',
    ),
  ];

  final List<Widget> _new = [
    HomeVideo(
      username: 'Username',
      t1: 123456,
      t2: 123456,
      description:
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
      dateTime: DateTime.now(),
      subCategory: 'subCategory',
      category: 'category',
    ),
    HomeVideo(
      username: 'Username',
      t1: 123456,
      t2: 123456,
      description:
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
      dateTime: DateTime.now(),
      subCategory: 'subCategory',
      category: 'category',
    ),
  ];

  final List<Widget> _duels = [
    HomeDuel2(
      firstUsername: 'Username',
      secondUsername: 'Username',
      category: 'Category',
      subCategory: 'SubCategory',
      dateTime: DateTime.now(),
      t1: 123456,
      t2: 123456,
    ),
    HomeDuel2(
      firstUsername: 'Username',
      secondUsername: 'Username',
      category: 'Category',
      subCategory: 'SubCategory',
      dateTime: DateTime.now(),
      t1: 123456,
      t2: 123456,
    )
  ];

  List<Widget> _users = [
    UserTile(
      username: 'username',
      location: 'location',
      type: 'World',
    ),
    UserTile(
      username: 'username',
      location: 'location',
      type: 'Country',
    ),
    UserTile(
      username: 'username',
      location: 'location',
      type: 'Country',
    ),
    UserTile(
      username: 'username',
      location: 'location',
      type: 'Country',
    ),
    UserTile(
      username: 'username',
      location: 'location',
      type: 'Country',
    ),
    UserTile(
      username: 'username',
      location: 'location',
      type: 'Country',
    ),
  ];

  List<Widget> getListw() {
    switch (_searchTile) {
      case '  Popular  ':
        return _popular;
      case '  New  ':
        return _new;
      case '  Duels  ':
        return _duels;
      case '  Users  ':
        return _users;
    }
    return _popular;
  }
}
