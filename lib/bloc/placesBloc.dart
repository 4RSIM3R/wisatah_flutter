import 'package:rxdart/rxdart.dart';
import 'package:wisatah_malang/model/placesModel.dart';
import 'package:wisatah_malang/repository/apiRepository.dart';

class PlacesBloc {

  ApiRepository apiRepository = ApiRepository();
  BehaviorSubject<List<PlacesModel>> _placesData = BehaviorSubject();

  getData() async {
    List<PlacesModel> res = await apiRepository.getPlacesData();
    _placesData.sink.add(res);
  }

  BehaviorSubject<List<PlacesModel>> get placesData => _placesData;
  
}

final placesBloc = PlacesBloc();