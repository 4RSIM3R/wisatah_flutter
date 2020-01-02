import 'package:sailor/sailor.dart';
import 'package:wisatah_malang/widget/detail.dart';
import 'package:wisatah_malang/widget/home.dart';

class Routes {

  static Sailor sailor = Sailor();

  static void createRoutes(){
    sailor.addRoutes([
      SailorRoute(
        name: "/home",
        builder: (context, args, params) => Home()
      ),
      SailorRoute(
        name: "/detail",
        builder: (context, args, params) => Detail()
      )
    ]);
  }

}