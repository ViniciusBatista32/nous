import 'dart:convert';
import 'package:nous/config.dart';
import 'package:http/http.dart' as http;

class ScheduleRequests
{
  Future getUserSchedule(user_id) async
  {
    Uri requestUri = Uri.parse("${Config().baseUrl}schedule.php?api_key=${Config().apiKey}&action=get_user_schedule&user_id=$user_id");
    http.Response response = await http.get(requestUri);
    return json.decode(response.body);
  }
}
