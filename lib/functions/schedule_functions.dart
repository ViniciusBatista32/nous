import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nous/functions/in_app_data.dart';
import 'package:nous/functions/local_storage_functions.dart';
import 'package:nous/request_handler/schedule_request_handler.dart';

class ScheduleFunctions
{
  snackbar(String title, String description)
  {
    if(Get.isSnackbarOpen ?? false){}
    else
      Get.snackbar(title, description);
  }

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

  Future createScheduleTask({
    required user_id,
    required String name,
    required String description,
    required initialTime,
    required finalTime,
    required int color,
    required int icon,
    required bool noRepeat,
    required weekdays,
    required String date
  }) async
  {
    var getInitialTime = initialTime.hour * 60 + initialTime.minute;
    var getFinalTime = finalTime.hour * 60 + finalTime.minute;

    if(getInitialTime > getFinalTime)
    {
      snackbar("Horário inválido", "O horário de inicio não pode ser maior que o horário final");
      taskCreated = false;
      return false;
    }
    else if(getInitialTime == getFinalTime)
    {
      snackbar("Horário inválido", "O horário de inicio não pode ser igual ao horário final");
      taskCreated = false;
      return false;
    }

    // create

    var atLeastOneDay = false;

    if(!noRepeat)
    {
      weekdays.forEach((weekday) {
        atLeastOneDay = weekday == true ? true : atLeastOneDay;
      });
    }
    else
      atLeastOneDay = true;

    if(atLeastOneDay)
    {
      final request = await ScheduleRequests().createScheduleTask(
        user_id     : user_id,
        name        : name,
        description : description,
        initialTime : initialTime,
        finalTime   : finalTime,
        color       : color,
        icon        : icon,
        noRepeat    : noRepeat,
        weekdays    : jsonEncode(weekdays),
        date        : date
      ).then((value){
        if(value["request_status"]["status"] == 0)
        {
          dashboard_page = 1;
          taskCreated = true;
          global_schedule_data = value["data"];

          LocalStorageFunctions().saveData(value["data"], "schedule_data.json").then((ret){

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
          switch (value["request_status"]["error_code"])
          {
            case 17:
              if(!noRepeat)
                snackbar("Não foi possível criar tarefa", "O horário da tarefa não pode sobrepor o horário de outras tarefas");
              else
                snackbar("Não foi possível criar tarefa", "O horário da tarefa não pode sobrepor o horário de outras tarefas\nIsso se aplica somente a tarefas que não repetem");
            break;

            default:
              snackbar("Não foi possível criar tarefa", "Tente novamente mais tarde");
            break;
          }
          taskCreated = false;
          return false;
        }
      });
    }
    else
    {
      snackbar("Dias da semana inválidos", "Selecione pelo menos um dia da semana");
      taskCreated = true;
      return false;
    }
  }
}