open General

open Types

let rec factorial n =
    if n = 0 then
        1
    else
        Int.(n * factorial (n - 1))

let rec binom n k =
    Int.(factorial n / (factorial k * factorial (n - k)))

let power (base : float) (exponent : int) =
    let total = ref 1.0 in

    for i = 1 to exponent do
        Float.(total := !total * base)
    done;

    (!total)

let binomial_probability_equal n k p =

    let q = Float.(1.0 - p) in
    let success_cases = power p k in
    let failure_cases = power q Int.(n - k) in
    let combinations = binom n k in

    let open Float in
    Float.(of_int combinations * success_cases * failure_cases)

let binomial_probability_greater_equal n k p =
    let total = ref 0.0 in

    for i = k to n do
        Float.(total := !total + (binomial_probability_equal n i p))
    done;

    (!total)

let bet_odds (bet : bet) (state : state) : float =
    let open Int in

    let other_dice_qty = state.total_dice - List.length state.hand in

    match bet.face with
    | 1 ->
        let known_quantity =
            state.hand
            |> List.foldl (fun count element -> if element = 1 then count + 1 else count) 0
        in

        if known_quantity >= bet.quantity then
            1.0
        else
            binomial_probability_greater_equal other_dice_qty (bet.quantity - known_quantity) Float.(1.0 / 6.0)

    | face ->
        let known_quantity =
            state.hand
            |> List.foldl (fun count element -> if element = face or element = 1 then count + 1 else count) 0
        in

        if known_quantity >= bet.quantity then
            1.0
        else
            binomial_probability_greater_equal other_dice_qty (bet.quantity - known_quantity) Float.(1.0 / 3.0)

let related_odds (bet : bet) (state : state) =
    Terminal.print "Related Odds of Successful Bet:\n";

    match bet.face with
    | 1 ->
        let open Int in

        for current_quantity = bet.quantity to 6 do
            let current_bet =
                {
                    quantity = current_quantity;
                    face = 1;
                } in
            let odds = bet_odds current_bet state in

            Terminal.printf "%d, %ds: %f\n" current_bet.quantity current_bet.face odds;
        done;

        for current_quantity = bet.quantity * 2 to bet.quantity * 2 + 1 do
            for current_face = 2 to 6 do
                let current_bet =
                    {
                        quantity = current_quantity;
                        face = current_face;
                    } in

                let odds = bet_odds current_bet state in

                Terminal.printf "%d, %ds: %f\n" current_bet.quantity current_bet.face odds;
            done;
        done;

    | face ->
        for current_face = bet.face to 6 do
            let current_bet =
                {
                    quantity = bet.quantity;
                    face = current_face;
                } in

            let odds = bet_odds current_bet state in

            Terminal.printf "%d, %ds: %f\n" current_bet.quantity current_bet.face odds;
        done;

        for current_face = 2 to 6 do
            let current_bet =
                {
                    quantity = Int.(bet.quantity + 1);
                    face = current_face;
                } in
            
            let odds = bet_odds current_bet state in

            Terminal.printf "%d, %ds: %f\n" current_bet.quantity current_bet.face odds;
        done;

        let ones_bet =
            {
                quantity = Int.(bet.quantity / 2 + 1);
                face = 1;
            } in

        Terminal.printf "%d, %ds: %f\n" ones_bet.quantity ones_bet.face (bet_odds ones_bet state);


