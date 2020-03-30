import 'package:rxdart/rxdart.dart';
import 'package:xlo/models/ad.dart';

class HomeBloc {
  final _searchController = BehaviorSubject<String>.seeded("");
  final _adController = BehaviorSubject<List<Ad>>.seeded([]);

  Stream<String> get outSearch => _searchController.stream;
  Stream<List<Ad>> get outAd => _adController.stream;

  void addAd(Ad ad) {
    _adController.add(_adController.value..add(ad));
  }

  void setSearch(String string) {
    _searchController.add(string);
  }

  void dispose() {
    _adController.close();
    _searchController.close();
  }
}
