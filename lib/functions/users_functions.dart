import 'package:get/get.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:nous/functions/local_storage_functions.dart';
import 'package:nous/request_handler/users_request_handler.dart';

class UsersFunctions
{
  void loginFunction(loginFormKey, emailRawValue, passwordRawValue) async
  {
    dynamic emailInputValue = emailRawValue.toLowerCase().replaceAll(" ", '');
    dynamic passwordInputValue = md5.convert(utf8.encode(passwordRawValue)).toString();

    if(loginFormKey.currentState!.validate())
    {
      final request = await UsersRequests().loginRequest(emailInputValue, passwordInputValue);

      if(request["request_status"]["status"] == 0)
      {
        UserLocalStorageFunctions().saveData(request["data"]).then((data)
        {
          Get.offAndToNamed("/dashboard");
        });
      }
      else if(request["request_status"]["status"] == 1)
      {
        Get.snackbar("Servidor em Manutenção", "Tente novamente mais tarde");
      }
      else
      {
        switch (request["request_status"]["error_code"])
        {
          case 4:
            Get.snackbar("Login Inválido", "O email informado não existe");
          break;

          case 6:
            Get.snackbar("Login Inválido", "A senha informada está incorreta");
          break;

          default:
            Get.snackbar("Não foi possível fazer login", "Tente novamente mais tarde");
          break;
        }
      }
    }
  }

  void signUpFunction(signUpFormKey, nameRawValue, emailRawValue, passwordRawValue) async
  {
    dynamic emailInputValue = emailRawValue.toLowerCase().replaceAll(" ", '');
    dynamic passwordInputValue = md5.convert(utf8.encode(passwordRawValue)).toString();

    if(signUpFormKey.currentState!.validate())
    {
      final request = await UsersRequests().signUpRequest(nameRawValue, emailInputValue, passwordInputValue);

      if(request["request_status"]["status"] == 0)
      {
      }
      else if(request["request_status"]["status"] == 1)
      {
      }
      else
      {
        switch (request["request_status"]["error_code"])
        {
          default:
            Get.snackbar("Não foi possível fazer login", "Tente novamente mais tarde");
          break;
        }
      }
    }
  }
}