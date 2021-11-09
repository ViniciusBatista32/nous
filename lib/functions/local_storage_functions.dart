import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';

class UserLocalStorageFunctions
{
  Future getFile() async
  {
    try {
      final directory = await getApplicationDocumentsDirectory();

      return File("${directory.path}/user_data.json");
    }
    catch (e)
    {
      return null;
    }
  }

  Future<File> saveData(user_data) async
  {
    user_data = json.encode(user_data);

    final file = await this.getFile();

    return file.writeAsString(user_data);
  }

  Future readData() async
  {
    try
    {
      final file = await this.getFile();

      return file.readAsString();
    }
    catch (e)
    {
      return null;
    }
  }
}