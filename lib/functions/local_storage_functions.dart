import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';

class LocalStorageFunctions
{
  Future getFile(file_name) async
  {
    try {
      final directory = await getApplicationDocumentsDirectory();

      return File("${directory.path}/$file_name");
    }
    catch (e)
    {
      return null;
    }
  }

  Future<File> saveData(json_data, file_name) async
  {
    json_data = json.encode(json_data);

    final file = await this.getFile(file_name);

    return file.writeAsString(json_data);
  }

  Future readData(file_name) async
  {
    try
    {
      final file = await this.getFile(file_name);

      return file.readAsString();
    }
    catch (e)
    {
      return null;
    }
  }
}