import 'package:flutter/material.dart';

class Config {
  // Api key for database communication
  final String apiKey = "ZDMyMTliMDA1NTk3Mjg4Njk3YTE4NzkyMzQ2ZWU4OWQ=";

  // URL base for database request
  final String baseUrl = "http://nous.allvinatto.com/";

  getTaskColor(colorNumber)
  {
    switch (colorNumber) {
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
    switch (iconNumber) {
      case 0:
        return Icons.task;
        
      default:
        return Icons.task;
    }
  }
}
