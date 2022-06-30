open General

open Types
open Odds
open ExpectedQuantities

let bet =
    {
        quantity = 5;
        face = 4;
    }

let state =
    {
        total_dice = 25;
        hand = [1; 2; 2; 5; 6];
    }

let _ = related_odds bet state
let _ = betting_expectation state