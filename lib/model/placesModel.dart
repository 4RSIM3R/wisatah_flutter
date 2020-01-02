import 'dart:convert';

List<PlacesModel> placesModelFromJson(String str) => List<PlacesModel>.from(json.decode(str).map((x) => PlacesModel.fromJson(x)));

String placesModelToJson(List<PlacesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlacesModel {
    String nama;
    String deskripsi;
    String gambar;
    double lat;
    double lng;

    PlacesModel({
        this.nama,
        this.deskripsi,
        this.gambar,
        this.lat,
        this.lng,
    });

    factory PlacesModel.fromJson(Map<String, dynamic> json) => PlacesModel(
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        gambar: json["gambar"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "deskripsi": deskripsi,
        "gambar": gambar,
        "lat": lat,
        "lng": lng,
    };
}
