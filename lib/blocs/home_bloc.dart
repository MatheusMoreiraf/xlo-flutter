import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final _searchController = BehaviorSubject<String>.seeded("");

  Stream<String> get outSearch => _searchController.stream;

  void setSearch(String string) {
    _searchController.add(string);
  }

  void dispose() {
    _searchController.close();
  }
}
