import 'package:get/get.dart';
import 'package:nous/functions/in_app_data.dart';
import 'package:nous/functions/local_storage_functions.dart';
import 'package:nous/request_handler/todo_request_handler.dart';

class TodoFunctions
{
  snackbar(String title, String description)
  {
    if(Get.isSnackbarOpen ?? false){}
    else
      Get.snackbar(title, description);
  }
  
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

  Future createTodoTask({required user_id, required description}) async
  {
    final request = await TodoRequests().createTodoTask(user_id, description).then((value){
      if(value["request_status"]["status"] == 0)
      {
        global_todo_data = value["data"];
        taskCreated = true;

        LocalStorageFunctions().saveData(value["data"], "todo_data.json").then((value){
          snackbar("Tarefa Criada!", "A tarefa criada foi adicionada nos dias selecionados");
          return true;
        });
      }
      else if(value["request_status"]["status"] == 1)
      {
        snackbar("Não foi possível criar tarefa", "Tente novamente mais tarde");
        taskCreated = false;
        return false;
      }
      else
      {
        snackbar("Não foi possível criar tarefa", "Tente novamente mais tarde");
        taskCreated = false;
        return false;
      }
    });
  }

  Future editTodoTask({
    required task_id,
    required user_id,
    required String description,
  }) async
  {
    // edit

    final request = await TodoRequests().editTodoTask(
      task_id     : task_id,
      user_id     : user_id,
      description : description,
    ).then((value){
      if(value["request_status"]["status"] == 0)
      {
        taskCreated = true;
        global_todo_data = value["data"];

        LocalStorageFunctions().saveData(value["data"], "todo_data.json").then((ret){

          snackbar("Tarefa Editada!", "A tarefa foi edita com sucesso");

          return true;
        });
      }
      else if(value["request_status"]["status"] == 1)
      {
        snackbar("Não foi possível editar a tarefa", "Tente novamente mais tarde");
        taskCreated = false;
        return false;
      }
      else
      {
        switch (value["request_status"]["error_code"])
        {
          default:
            snackbar("Não foi possível editar tarefa", "Tente novamente mais tarde");
          break;
        }
        taskCreated = false;
        return false;
      }
    });
  }

  Future checkTodoTask(user_id, task_id, completed) async
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

  Future deleteTodoTask(user_id, task_id) async
  {
    final request = await TodoRequests().deleteTodoTask(user_id, task_id);

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