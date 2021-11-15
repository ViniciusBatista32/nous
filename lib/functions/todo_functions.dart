import 'package:nous/functions/in_app_data.dart';
import 'package:nous/functions/local_storage_functions.dart';
import 'package:nous/request_handler/todo_request_handler.dart';

class TodoFunctions
{
  Future getUserTodo(user_id) async
  {
    final request = await TodoRequests().getUserTodo(user_id);

    if(request["request_status"]["status"] == 0)
    {
      LocalStorageFunctions().saveData(request["data"], "todo_data.json");
      global_todo_data = request["data"];
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

  Future checkUserTodo(user_id, task_id, completed) async
  {
    final request = await TodoRequests().checkTodoTask(user_id, task_id, completed);

    if(request["request_status"]["status"] == 0)
    {
      LocalStorageFunctions().saveData(global_todo_data, "todo_data.json");
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