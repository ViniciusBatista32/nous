import 'package:get/get.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:nous/functions/local_storage_functions.dart';
import 'package:nous/request_handler/users_request_handler.dart';

class UsersFunctions
{
  Future loginFunction(emailRawValue, passwordRawValue) async
  {
    dynamic emailInputValue = Uri.encodeComponent(emailRawValue.toLowerCase().replaceAll(" ", ''));
    dynamic passwordInputValue = md5.convert(utf8.encode(passwordRawValue)).toString();

    final request = await UsersRequests().loginRequest(emailInputValue, passwordInputValue);

    if(request["request_status"]["status"] == 0)
    {
      UserLocalStorageFunctions().saveData(request["data"]).then((data)
      {
        Get.offAndToNamed("/dashboard");
      });

      return true;
    }
    else if(request["request_status"]["status"] == 1)
    {
      Get.snackbar("Servidor em Manutenção", "Tente novamente mais tarde");

      return false;
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

        case 11:
          Get.snackbar("Cadastro não confirmado", "Um email de confirmação foi enviado para sua caixa de emails\nVerifique a caixa de spam");
        break;

        default:
          Get.snackbar("Não foi possível fazer login", "Tente novamente mais tarde");
        break;
      }

      return false;
    }
  }

  Future signUpFunction(nameRawValue, emailRawValue, passwordRawValue) async
  {
    dynamic nameInputValue = Uri.encodeComponent(nameRawValue);
    dynamic emailInputValue = Uri.encodeComponent(emailRawValue.toLowerCase().replaceAll(" ", ''));
    dynamic passwordInputValue = md5.convert(utf8.encode(passwordRawValue)).toString();

    final request = await UsersRequests().signUpRequest(nameInputValue, emailInputValue, passwordInputValue);

    if(request["request_status"]["status"] == 0)
    {
      Get.snackbar("Cadastrado com sucesso", "Um email de confirmação foi enviado para sua caixa de emails\nVerifique a caixa de spam");

      return true;
    }
    else if(request["request_status"]["status"] == 1)
    {
      Get.snackbar("Servidor em Manutenção", "Tente novamente mais tarde");

      return false;
    }
    else
    {
      switch (request["request_status"]["error_code"])
      {
        case 8:
          Get.snackbar("Email inválido", "O email informado já está cadastrado");
        break;

        default:
          Get.snackbar("Não foi possível fazer o cadastro", "Tente novamente mais tarde");
        break;
      }

      return false;
    }
  }

  Future resetPasswordFunction(emailRawValue) async
  {
    dynamic emailInputValue = Uri.encodeComponent(emailRawValue.toLowerCase().replaceAll(" ", ''));

    final request = await UsersRequests().resetPasswordRequest(emailInputValue);

    if(request["request_status"]["status"] == 0)
    {
      Get.snackbar("Email de redefinição enviado", "Um email de redefinição de senha foi enviado para sua caixa de emails\nVerifique a caixa de spam");

      return true;
    }
    else if(request["request_status"]["status"] == 1)
    {
      Get.snackbar("Servidor em Manutenção", "Tente novamente mais tarde");

      return false;
    }
    else
    {
      switch (request["request_status"]["error_code"])
      {
        case 4:
          Get.snackbar("Email inválido", "O email informado não existe");
        break;

        default:
          Get.snackbar("Não foi possível fazer a requisição de redefinição", "Tente novamente mais tarde");
        break;
      }

      return false;
    }
  }
}