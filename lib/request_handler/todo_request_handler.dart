import 'dart:convert';
import 'package:nous/config.dart';
import 'package:http/http.dart' as http;

class TodoRequests
{
  Future getUserTodo(user_id) async
  {
    Uri requestUri = Uri.parse("${Config().baseUrl}todo.php?api_key=${Config().apiKey}&action=get_user_todo&user_id=$user_id");
    http.Response response = await http.get(requestUri);
    return json.decode(response.body);
  }

  Future checkTodoTask(user_id, task_id, completed) async
  {
    Uri requestUri = Uri.parse("${Config().baseUrl}todo.php?api_key=${Config().apiKey}&action=check_todo_task&user_id=$user_id&task_id=$task_id&completed=$completed");
    http.Response response = await http.get(requestUri);
    return json.decode(response.body);
  }
}
