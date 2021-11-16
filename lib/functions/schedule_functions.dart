import 'package:nous/functions/in_app_data.dart';
import 'package:nous/functions/local_storage_functions.dart';
import 'package:nous/request_handler/schedule_request_handler.dart';

class ScheduleFunctions
{
  Future getUserSchedule(user_id) async
  {
    final request = await ScheduleRequests().getUserSchedule(user_id);

    if(request["request_status"]["status"] == 0)
    {
      LocalStorageFunctions().saveData(request["data"], "schedule_data.json");
      global_schedule_data = request["data"];
      return true;
    }
    else if(request["request_status"]["status"] == 1)
    {
      return false;
    }
    else
    {
      return false;
    }
  }
}