import 'package:dio/dio.dart';
import 'package:wisatah_malang/constant/constant.dart';
import 'package:wisatah_malang/model/placesModel.dart';
import 'package:wisatah_malang/service/apiBase.dart';
import 'package:wisatah_malang/service/apiException.dart';

class ApiService {
  static BaseOptions options = BaseOptions(
    baseUrl: url,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  static Dio _dio = Dio(options);

  Future<List<PlacesModel>> getPlacesData() async {
    try {
      Response response = await _dio.get(url);
      print("Datanya : ${response.statusCode}");
      return placesModelFromJson(response.data);
    } catch (e, stacktrace) {
      if (e is DioError) {
        print("Ada Error : Dio Error");
        throw AppException(dioError: e);
      } else {
        print("Ada Error : Dio Error");
        throw UnknownException(message: 'Unknown Exception');
      }
    }
  }
}
