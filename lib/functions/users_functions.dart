import 'dart:convert';
import 'package:nous/config.dart';
import 'package:http/http.dart' as http;

class UsersFunctions
{
  Future<Map> loginRequest(emailInputValue, passwordInputValue) async
  {
    Uri requestUri = Uri.parse("http://10.0.0.194/nous_api/user.php?api_key=${Config().apiKey}&action=login&email=$emailInputValue&password=$passwordInputValue");
      http.Response response = await http.get(requestUri);

      return json.decode(response.body);
  }
}