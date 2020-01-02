import 'package:wisatah_malang/model/placesModel.dart';
import 'package:wisatah_malang/service/apiService.dart';

class ApiRepository {

  ApiService apiService = ApiService();

  Future<List<PlacesModel>> getPlacesData(){
    return apiService.getPlacesData();
  }
  
}