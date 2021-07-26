import 'package:http/http.dart' as http;
import 'package:oorban_bondowoso/model/favorit_res.dart';
import 'package:oorban_bondowoso/model/get_lengkapi.dart';
import 'package:oorban_bondowoso/model/get_login.dart';
import 'package:oorban_bondowoso/model/get_property.dart';
import 'package:oorban_bondowoso/model/get_registrasi.dart';
import 'package:oorban_bondowoso/model/get_riwayat.dart';
import 'package:oorban_bondowoso/model/list_favorit.dart';
import 'package:oorban_bondowoso/page/Riwayat.dart';
import 'package:oorban_bondowoso/page/login.dart';

class ApiService {


  // static final String _DOMAIN = "192.168.43.86:8000";
  static final String _DOMAIN = "wsjti.id";
  static final String _BASE_URL = _DOMAIN + "api/";

  static Future<GetLogin> login(String username, String password) async {
    GetLogin login;
    try {
      var url = Uri.https(_DOMAIN, '/Oorbanbondowoso/public/api/login');
      var response = await http.post(
        url, 
        body: {
        "username": username,
        "password": password,
        },
      );
      final GetLogin login = getLoginFromJson(response.body);

      return login;
    } catch (e) {
      throw Exception('error : ' + e.toString());

      // return e.toString();
    }
  }

  static Future<Register> newRegister(
      String nama, String username, String email, String password) async {
    try {
      var url = Uri.https(_DOMAIN, '/Oorbanbondowoso/public/api/register');
      var response = await http.post(
        url,
        body: {
          "nama_lengkap": nama,
          "username": username,
          "email": email,
          "password": password,
        },
      );
      final Register register = registerFromJson(response.body);
      return register;

      // if (response.statusCode == 200) {
      //   return response.body;
      // } else {
      //   return null;
      // }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<LengkapiData> get_lengkapi(
   String id, String nama, String username, String password, String email, String alamat, String nik, String no_hp, String gender) async {
   try {
     print('-----api service -------');
      print('id :$id');
      print('nama :$nama');
      print('username :$username');
      print('password :$password');
      print('email :$email');
      print('alamat :$alamat');
      print('nik :$nik');
      print('no_hp :$no_hp');
      print('gender :$gender');
     var url = Uri.https(_DOMAIN, '/Oorbanbondowoso/public/api/update');
     var response = await http.post(
       url,
       body: {
         "id": id,
         "nama_lengkap": nama,
         "username": username,
         "password": password,
         "email": email,
         "alamat": alamat,
         "nik": nik,
         "no_hp": no_hp,
         "gender": gender,
       },
     );
      final LengkapiData lengkapiData = lengkapiDataFromJson(response.body);
      return lengkapiData;

    } catch (e) {
     throw Exception('eror : ' + e.toString());
    }
  }

  static Future<Property> getProperti() async {
    try {
      var url = Uri.https(_DOMAIN, '/Oorbanbondowoso/public/api/all-property');
      var response = await http.get(url);

      final Property property = propertyFromJson(response.body);
      print('length data : ${property.data.length}');
      
      return property;

      // if (response.statusCode == 200) {
      //   final Property property = propertyFromJson(response.body);

      //   return property;
      // } else {
      //   return Property();
      // }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<RiwayatRes> getRiwayat(int id_pengguna_android) async {
    try {
      print('id user : $id_pengguna_android');
      var queryParameters = {
        'id_pengguna_android': id_pengguna_android.toString(),
      };

      var url = Uri.https(_DOMAIN, '/Oorbanbondowoso/public/api/riwayattransaksi', queryParameters);
      var response = await http.get(url);
      print('response : ${response.body}');

      final RiwayatRes riwayat = riwayatResFromJson(response.body);
      print('length data : ${riwayat.data.length}');

      return riwayat;
      
      // if (response.statusCode == 200) {
      //   final Property property = propertyFromJson(response.body);

      //   return property;
      // } else {
      //   return Property();
      // }

    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<Property> listFavorit(int id_pengguna_android) async {
    try {
      var queryParameters = {
        'id_pengguna_android': id_pengguna_android.toString(),
      };

      var url = Uri.https(_DOMAIN, '/Oorbanbondowoso/public/api/listfavorit', queryParameters);
      var response = await http.get(url);

      final Property listData = propertyFromJson(response.body);
      print('length data : ${listData.data.length}');
      
      return listData;

      // if (response.statusCode == 200) {
      //   final Property property = propertyFromJson(response.body);

      //   return property;
      // } else {
      //   return Property();
      // }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<FavoritRes> addFavorit(int id_properti, int id_pengguna_android) async {
    try {
      var queryParameters = {
        'id_properti': id_properti.toString(),
        'id_pengguna_android': id_pengguna_android.toString(),
      };
      print('id_properti $id_properti');
      print('id_pengguna_android $id_pengguna_android');
      var url = Uri.https(_DOMAIN, '/Oorbanbondowoso/public/api/addfavorit');
      var response = await http.post(url, body: queryParameters);
      // print('res : ${response.body}');
      final FavoritRes favorit = favoritResFromJson(response.body);
      
      return favorit;
    }
    catch(e) {
      throw Exception('error : ${e.toString()}');
    }
  }

  static Future<FavoritRes> deleteFavorit(int id_properti, int id_pengguna_android) async {
    try {
      var queryParameters = {
        'id_properti': id_properti.toString(),
        'id_pengguna_android': id_pengguna_android.toString(),
      };
      var url = Uri.https(_DOMAIN, '/Oorbanbondowoso/public/api/deletefavorit');
      var response = await http.post(url, body: queryParameters);
      print('res : ${response.body}');
      final FavoritRes favorit = favoritResFromJson(response.body);
      
      return favorit;
    }
    catch(e) {
      throw Exception('error : ${e.toString()}');
    }
  }

  static Future<FavoritRes> checkFavorit(int id_properti, int id_pengguna_android) async {
    try {
      var queryParameters = {
        'id_properti': id_properti.toString(),
        'id_pengguna_android': id_pengguna_android.toString(),
      };
      var url = Uri.https(_DOMAIN, '/Oorbanbondowoso/public/api/checkfavorit', queryParameters);
      var response = await http.get(url);
      print('res : ${response.body}');
      final FavoritRes favorit = favoritResFromJson(response.body);
      
      return favorit;
    }
    catch(e) {
      throw Exception('error : ${e.toString()}');
    }
  }

}