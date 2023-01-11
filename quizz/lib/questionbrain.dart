import 'package:flutter/material.dart';
import 'questions.dart';
import 'dart:math';
class QuizBrain{
  int _qnumber = 0;
  var list = {};
  final List<Question> _questions = [
    Question('In the animation film “Finding Nemo,” the main protagonist is a pufferfish.', false),
    Question('Is Mount Kilimanjaro the world’s tallest peak? ', false),
    Question('Spaghetto is the singular form of the word spaghetti. ', true),
    Question('Pinocchio was Walt Disney’s first animated feature film in full color. ', false),
    Question('Venezuela is home to the world’s highest waterfall. ', true),
    Question('Coffee is a berry-based beverage. ', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question('No piece of square dry paper can be folded in half more than 7 times.', false),
    Question('In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', true),
    Question('The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', false),
    Question('The total surface area of two human lungs is approximately 70 square metres.', true),
    Question('Google was originally called \"Backrub\".', true),
    Question('Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', true),
    Question('In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', true),
    Question('The hummingbird egg is the world\'s smallest bird egg', true),
    Question('Pigs roll in the mud because they don\’t like being clean', false),
    Question('A dog sweats by panting its tongue', false),
    Question('When exiting a cave, bats always go in the direction of the wind', false),
    Question('The Unicorn is the national animal of Scotland', true),
  ];

  void init(int count){
    _qnumber = 0;
    list = {};
    while(true){
      var flag = 1;
      var x = Random().nextInt(_questions.length);
      for(int i = 0; i<list.length ;i++){
        if (list[i] == x){
          flag = 0;
          count--;
        }
      }
      if(flag == 1){
        list[count++] = x;
      }
      if(count == 10) break;
    }
  }
  QuizBrain(){
    init(0);
  }
  int nextQuestion(){
    if(_qnumber < list.length-1){
      _qnumber++;
    }
    if(_qnumber >= list.length -1) {
      return -1;
    }
    return _qnumber;
  }
  String getQuestion(){
    return _questions[list[_qnumber]].question_text;
  }
  bool getAnswer(){
    return _questions[list[_qnumber]].answer;
  }
}