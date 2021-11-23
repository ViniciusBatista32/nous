import 'package:flutter/material.dart';

class CreateTaskArguments {
  final int actualPage;
  final int globalWeekday;

  CreateTaskArguments(this.actualPage, this.globalWeekday);
}

class EditTaskArguments {
  final bool todo;
  final taskData;

  EditTaskArguments(this.todo, this.taskData);
}

class Config {
  // Api key for database communication
  final String apiKey = "ZDMyMTliMDA1NTk3Mjg4Njk3YTE4NzkyMzQ2ZWU4OWQ=";

  // URL base for database request
  final String baseUrl = "http://nous.allvinatto.com/";

  getTaskColor(colorNumber)
  {
    switch (colorNumber.toString())
    {
      case "0":
        return Colors.red;

      case "1":
        return Colors.orange;
      
      case "2":
        return Colors.yellow;

      case "3":
        return Colors.lime;

      case "4":
        return Colors.green;

      case "5":
        return Colors.lightBlue;

      case "6":
        return Colors.purple;

      case "7":
        return Colors.pink;

      case "8":
        return Colors.brown;

      case "9":
        return Colors.black;

      default:
        return Colors.black;
    }
  }

  getTaskIcon(iconNumber)
  {
    switch (iconNumber.toString())
    {
      case "0":
        return Icons.task;

      case "1":
        return Icons.work;

      case "2":
        return Icons.fitness_center;

      case "3":
        return Icons.local_grocery_store;

      case "4":
        return Icons.local_dining;

      case "5":
        return Icons.games;

      case "6":
        return Icons.free_breakfast;

      case "7":
        return Icons.hotel;

      case "8":
        return Icons.music_note;

      case "9":
        return Icons.directions_run;

      case "10":
        return Icons.drive_eta;

      case "11":
        return Icons.directions_bike;

      case "12":
        return Icons.import_contacts;

      case "13":
        return Icons.build;

      case "14":
        return Icons.computer;

      case "15":
        return Icons.directions_boat;

      case "16":
        return Icons.directions_railway;

      case "17":
        return Icons.directions_bus;

      case "18":
        return Icons.event_seat;

      case "19":
        return Icons.flight;

      case "20":
        return Icons.format_paint;

      case "21":
        return Icons.hot_tub;

      case "22":
        return Icons.healing;

      case "23":
        return Icons.local_gas_station;

      case "24":
        return Icons.local_laundry_service;

      case "25":
        return Icons.local_movies;

      case "26":
        return Icons.local_print_shop;

      case "27":
        return Icons.people;

      case "28":
        return Icons.pets;

      case "29":
        return Icons.rowing;

      case "30":
        return Icons.smoking_rooms;

      case "31":
        return Icons.video_call;

      case "32":
        return Icons.palette;

      case "33":
        return Icons.camera_alt;

      case "34":
        return Icons.code;

      default:
        return Icons.task;
    }
  }
}
