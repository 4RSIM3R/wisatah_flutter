import 'package:rxdart/rxdart.dart';
import 'package:wisatah_malang/model/placesModel.dart';
import 'package:wisatah_malang/repository/apiRepository.dart';
import 'package:wisatah_malang/service/apiException.dart';
import 'package:wisatah_malang/service/apiModel.dart';

class PlacesBloc {
  ApiRepository _apiRepository = ApiRepository();
  final _placesData = PublishSubject<ApiModel<List<PlacesModel>>>();

  Stream<ApiModel<List<PlacesModel>>> get placesData => _placesData;

  getData() async {
    try {
      final placesData = await _apiRepository.getPlacesData();
      _placesData.sink.add(ApiModel.completed(placesData));
    } catch (e) {
      if (e is AppException) {
        _placesData.sink.add(ApiModel.dioError(e));
      } else {
        _placesData.sink.add(ApiModel.error('Unknown Exception'));
      }
    }
  }

  dispose() {
    _placesData.close();
  }
}

final placesBloc = PlacesBloc();
