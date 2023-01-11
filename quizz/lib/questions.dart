import 'package:flutter/material.dart';
class Question{
  late String question_text;
  late bool answer;
  Question(String q,bool a){
    question_text = q;
    answer = a;
  }
}