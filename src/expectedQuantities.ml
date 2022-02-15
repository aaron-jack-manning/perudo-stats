open General

open Types

type expected_frequencies =
    {
        one : float;
        two : float;
        three : float;
        four : float;
        five : float;
        six : float;
    }

type frequencies =
    {
        one : int;
        two : int;
        three : int;
        four : int;
        five : int;
        six : int;
    }

let stringify_frequencies (freq : frequencies) : string =
    let open String in
    "one : " + of_int freq.one + "\ntwo : " + of_int freq.two + "\nthree : " + of_int freq.three + "\nfour : " + of_int freq.four + "\nfive : " + of_int freq.five + "\nsix : " + of_int freq.six + "\n"

let stringify_expected_frequencies (freq : expected_frequencies) : string =
    let open String in
    "one : " + of_float freq.one + "\ntwo : " + of_float freq.two + "\nthree : " + of_float freq.three + "\nfour : " + of_float freq.four + "\nfive : " + of_float freq.five + "\nsix : " + of_float freq.six + "\n"

let rec list_to_frequencies_helper (hand : int list) (freq : frequencies) =
    match hand with
    | [] -> freq
    | x :: xs ->
        begin match x with
        | 1 -> list_to_frequencies_helper xs { freq with one = Int.(freq.one + 1) }
        | 2 -> list_to_frequencies_helper xs { freq with two = Int.(freq.two + 1) }
        | 3 -> list_to_frequencies_helper xs { freq with three = Int.(freq.three + 1) }
        | 4 -> list_to_frequencies_helper xs { freq with four = Int.(freq.four + 1) }
        | 5 -> list_to_frequencies_helper xs { freq with five = Int.(freq.five + 1) }
        | 6 -> list_to_frequencies_helper xs { freq with six = Int.(freq.six + 1) }
        | _ -> Fatal.failwith "an invalid die number was provided"
        end
    
let list_to_frequencies (hand : int list) =
    list_to_frequencies_helper hand { one = 0; two = 0; three = 0; four = 0; five = 0; six = 0; }

let calculate_expected_values (state : state) : expected_frequencies =
    let hand_frequencies = list_to_frequencies state.hand in

    let other_dice_qty = Int.(state.total_dice - (List.length state.hand)) in
    let each_type_qty = Float.(of_int other_dice_qty / 6.0) in

    let open Float in
    {
        one = of_int hand_frequencies.one + each_type_qty;
        two = of_int hand_frequencies.two + each_type_qty;
        three = of_int hand_frequencies.three + each_type_qty;
        four = of_int hand_frequencies.four + each_type_qty;
        five = of_int hand_frequencies.five + each_type_qty;
        six = of_int hand_frequencies.six + each_type_qty;
    }

let expected_frequencies_adjusted_for_ones (freq : expected_frequencies) : expected_frequencies =
    let open Float in
    {
        one = freq.one;
        two = freq.two + freq.one;
        three = freq.three + freq.one;
        four = freq.four + freq.one;
        five = freq.five + freq.one;
        six = freq.six + freq.one;
    }

let betting_expectation x =
    Console.print "Expected number of each face around the table (adjusted for ones being wild):\n";
    (calculate_expected_values >> expected_frequencies_adjusted_for_ones >> stringify_expected_frequencies >> Console.print) x
