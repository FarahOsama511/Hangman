import "dart:io";

import "Hangman.dart";

void main() {
  var game = Hangman();
  print("Welcome to Hangman!");

  while (!game.isGameOver()) {
    print("Guess a letter: ");
    String guess = stdin.readLineSync()!;

    if (game.guess(guess)) {
      print("Correct!");
    } else {
      print("Incorrect! You have ${game.remainingLives} lives remaining.");
      game.remainingLives--;
    }

    print(game.getDisplayWord());
  }

  if (game.isGameOver() && game.getDisplayWord() == game.word) {
    print(game.getVictoryMessage());
  } else {
    print(game.getDefeatMessage());
  }
}
