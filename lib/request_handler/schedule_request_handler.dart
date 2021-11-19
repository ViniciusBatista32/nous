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

  Future createScheduleTask({
    required user_id,
    required String name,
    required String description,
    required initialTime,
    required finalTime,
    required int color,
    required int icon,
    required bool noRepeat,
    weekdays = "[]",
    date = null
  }) async
  {
    String url = "${Config().baseUrl}schedule.php?api_key=${Config().apiKey}&action=create_user_schedule";
    url += "&user_id=$user_id";
    url += "&name=$name";
    url += "&description=$description";

    url += "&initial_time=${initialTime.hour.toString().length == 1 ? 0 : ''}${initialTime.hour}:${initialTime.minute.toString().length == 1 ? 0 : ''}${initialTime.minute}";
    url += "&final_time=${finalTime.hour.toString().length == 1 ? 0 : ''}${finalTime.hour}:${finalTime.minute.toString().length == 1 ? 0 : ''}${finalTime.minute}";
    
    url += "&color=$color";
    url += "&icon=$icon";
    url += "&no_repeat=$noRepeat";
    url += "&weekdays=$weekdays";
    url += "&date=$date";

    Uri requestUri = Uri.parse(url);
    http.Response response = await http.get(requestUri);
    return json.decode(response.body);
  }
}
