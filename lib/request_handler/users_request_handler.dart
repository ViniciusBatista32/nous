import 'dart:convert';
import 'package:nous/config.dart';
import 'package:http/http.dart' as http;

class UsersRequests {
  Future<Map> loginRequest(emailInputValue, passwordInputValue) async
  {
    Uri requestUri = Uri.parse("${Config().baseUrl}user.php?api_key=${Config().apiKey}&action=login&email=$emailInputValue&password=$passwordInputValue");
    http.Response response = await http.get(requestUri);
    return json.decode(response.body);
  }

  Future<Map> signUpRequest(nameInputValue, emailInputValue, passwordInputValue) async
  {
    Uri requestUri = Uri.parse("${Config().baseUrl}user.php?api_key=${Config().apiKey}&action=signup&name=$nameInputValue&email=$emailInputValue&password=$passwordInputValue");
    http.Response response = await http.get(requestUri);
    return json.decode(response.body);
  }

  Future<Map> resetPasswordRequest(emailInputValue) async
  {
    Uri requestUri = Uri.parse("${Config().baseUrl}user.php?api_key=${Config().apiKey}&action=reset_password&email=$emailInputValue");
    http.Response response = await http.get(requestUri);
    return json.decode(response.body);
  }
}
