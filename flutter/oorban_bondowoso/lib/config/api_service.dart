import 'package:http/http.dart' as http;
import 'package:oorban_bondowoso/model/get_login.dart';
import 'package:oorban_bondowoso/model/get_property.dart';
import 'package:oorban_bondowoso/model/get_registrasi.dart';
import 'package:oorban_bondowoso/page/login.dart';

class ApiService {


  static final String _DOMAIN = "192.168.1.19:8000";
  static final String _BASE_URL = _DOMAIN + "api/";

  static Future<GetLogin> login(String username, String password) async {
    GetLogin login;
    try {
      var url = Uri.http(_DOMAIN, '/api/login');
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
      var url = Uri.http(_DOMAIN, '/api/register');
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

  

  static Future<Property> getProperti() async {
    try {
      var url = Uri.http(_DOMAIN, '/api/all-property');
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

}