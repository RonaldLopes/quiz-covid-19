
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quizcovid19/models/question.dart';

class QuizApi {
  static Future<List<Question>> fetch() async {
    try {
      var url = 'https://script.google.com/macros/s/AKfycbxpYoFwlASG2zob7TvTptUBNvWjlETUJRWZ9K4_Wb4KfYuEtnI/exec';
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return List<Question>.from(
            data["questions"].map((x) => Question.fromMap(x)));
      } else {
        return List<Question>();
      }

    } catch (error) {
      print(error);
      return List<Question>();
    }
  }
}