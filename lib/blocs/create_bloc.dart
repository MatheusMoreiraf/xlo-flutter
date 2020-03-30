import 'package:rxdart/rxdart.dart';
import 'package:xlo/models/ad.dart';

enum CreateStete { IDLE, LOADING, DONE }

class CreateBloc {

  final _stateControlle = BehaviorSubject<CreateStete>.seeded(CreateStete.IDLE);

  Stream<CreateStete> get outState => _stateControlle.stream;

  Future<bool> saveAd(Ad ad) async{
    _stateControlle.add(CreateStete.LOADING);

    // Todo: Send Ad to the repository
    await Future.delayed(Duration(seconds: 3));

    _stateControlle.add(CreateStete.DONE);
    return true;
  }

  void dispose() {
    _stateControlle.close();
  }

}