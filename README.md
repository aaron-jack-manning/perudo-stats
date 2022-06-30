# Perudo Statistics Calculator

[Perudo](https://en.wikipedia.org/wiki/Perudo), also known as Dudo or Liar's Dice, is a betting game played with dice. This project as a simple application for calculating betting odds throughout a game.

## Running and Modifying

A makefile is provided with commands `make install` to compile and partially clean up and `make run` to run the executable.

To change the game state open `main.ml` and modify the following variables with the data on which you wish to calculate:

```
let bet =
    {
        quantity = 5;
        face = 4;
    }

let state =
    {
        total_dice = 20;
        hand = [1; 2; 2; 5; 6];
    }
```

This example produces the following output:

```
Related Odds of Successful Bet:
5, 4s: 0.790760
5, 5s: 0.920643
5, 6s: 0.920643
6, 2s: 0.920643
6, 3s: 0.595935
6, 4s: 0.595935
6, 5s: 0.790760
6, 6s: 0.790760
3, 1s: 0.740378
Expected number of each face around the table (adjusted for ones being wild):
one : 3.5
two : 8.
three : 6.
four : 6.
five : 7.
six : 7.
```

The related odds shows the probability of a succesful bet for the specified bet, every higher face with the same number of dice, and all faces with one more dice (except for bets of ones which are calculated independently due to the unique rules surrounding them).

## Dependencies

This project has a dependency on my custom standard library for OCaml which can be found [here](https://github.com/aaron-jack-manning/ocaml-standard-library).