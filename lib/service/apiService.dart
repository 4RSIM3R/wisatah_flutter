import 'package:dio/dio.dart';
import 'package:wisatah_malang/constant/constant.dart';
import 'package:wisatah_malang/model/placesModel.dart';

class ApiService {

  final Dio _dio = Dio();
  
  Future<List<PlacesModel>> getPlacesData() async {
    try {
      Response response = await _dio.get(url);
      return placesModelFromJson(response.data);
    } catch (e, stacktrace) {
      print("Exception occured: $e stackTrace: $stacktrace");
    }
  }

}