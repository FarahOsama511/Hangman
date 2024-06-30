import 'dart:io';
import 'package:english_words/english_words.dart';
import 'dart:math';

var words = nouns.take(5).toList();

class Hangman {
  late String word;
  List<String> guessedLetters = [];
  int remainingLives = 6;

  Hangman() {
    word = words[Random().nextInt(words.length)];
  }

  String getDisplayWord() {
    String display = "";
    for (var letter in word.split("")) {
      if (guessedLetters.contains(letter)) {
        display += letter;
      } else {
        display += "_";
      }
    }
    return display;
  }

  bool guess(String letter) {
    letter = letter.toLowerCase();
    if (guessedLetters.contains(letter)) {
      return false;
    }
    guessedLetters.add(letter);
    return word.contains(letter);
  }

  bool isGameOver() {
    return remainingLives == 0 || getDisplayWord() == word;
  }

  String getVictoryMessage() {
    return "Congratulations! You guessed the word: $word";
  }

  String getDefeatMessage() {
    return "Sorry, you ran out of lives. The word was: $word";
  }
}
