open General


let empty : 'a list = []

let rec length_helper (list : 'a list) (length : int) =
    match list with
    | [] -> length
    | _ :: xs -> length_helper xs Int.(length + 1)

let length (list : 'a list) = length_helper list 0

let head (ls : 'a list) : 'a option =
    match ls with
    | x :: xs -> Some x
    | [] -> None

let tail (ls : 'a list) : 'a list =
    match ls with
    | x :: xs -> xs
    | [] -> []

let rec reverse_helper (ls : 'a list) (acc : 'a list) : 'a list =
    match ls with
    | x :: xs -> reverse_helper xs (x :: acc)
    | [] -> acc

let reverse (ls : 'a list) : 'a list =
    reverse_helper ls []

let rec append_tr_helper (ls1_rev : 'a list) (ls2 : 'a list) : 'a list =
    match ls1_rev with
    | [] -> ls2
    | x :: xs ->
        append_tr_helper xs (x :: ls2)

let append_tr (ls1 : 'a list) (ls2 : 'a list) : 'a list =
    append_tr_helper (reverse ls1) ls2

let ( @ ) = append_tr

let rec map (f : 'a -> 'b) (ls : 'a list) : 'b list =
    match ls with
    | x :: xs -> f x :: map f xs
    | [] -> []

let rec map_rev_tr_helper (f : 'a -> 'b) (ls : 'a list) (acc : 'b list) : 'b list =
    match ls with
    | x :: xs -> map_rev_tr_helper f xs (f x :: acc)
    | [] -> acc

let map_rev_tr (f : 'a -> 'b) (ls : 'a list) : 'b list =
    map_rev_tr_helper f ls []

let rec map_tr_helper (f : 'a -> 'b) (ls : 'a list) (acc : 'b list) : 'b list =
    match ls with
    | x :: xs -> map_tr_helper f xs (f x :: acc)
    | [] -> reverse acc

let rec map_tr (f : 'a -> 'b) (ls : 'a list) : 'b list =
    map_tr_helper f ls []

let rec foldl (f : 's -> 'a -> 's) (init : 's) (ls : 'a list) : 's =
    match ls with
    | x :: xs -> xs |> foldl f (f init x)
    | [] -> init

let rec foldr (f : 's -> 'a -> 's) (init : 's) (ls : 'a list) : 's =
    foldl f init (reverse ls)

let rec zip2_rev_tr_helper (ls1 : 'a list) (ls2 : 'b list) (acc : ('a * 'b) list) : ('a * 'b) list result =
    
    let first_head = head ls1 in
    let second_head = head ls2 in

    if first_head = None & second_head = None then
        Success acc
    else if (first_head = None & second_head <> None) or (first_head <> None & second_head = None) then
        Error "The two lists must be of the same length."
    else
        let a = match first_head with | Some x -> x | None -> Fatal.failwith "if this exception is raised there is an error in the implementation of the function that called it" in
        let b = match second_head with | Some x -> x | None -> Fatal.failwith "if this exception is raised there is an error in the implementation of the function that called it" in

        zip2_rev_tr_helper (tail ls1) (tail ls2) ((a, b) :: acc)

let rec zip2_rev_tr (ls1 : 'a list) (ls2 : 'b list) : ('a * 'b) list result =
    zip2_rev_tr_helper ls1 ls2 []

let zip2_tr (ls1 : 'a list) (ls2 : 'b list) : ('a * 'b) list result =
    match zip2_rev_tr ls1 ls2 with
    | Success x -> Success (reverse x)
    | Error message -> Error message

let rec unzip2_rev_tr_helper (ls : ('a * 'b) list) (acc1 : 'a list) (acc2 : 'b list) : ('a list) * ('b list) =
    match ls with
    | (first, second) :: xs -> unzip2_rev_tr_helper xs (first :: acc1) (second :: acc2)
    | [] -> (acc1, acc2)

let unzip2_rev_tr (ls : ('a * 'b) list) : ('a list) * ('b list) =
    unzip2_rev_tr_helper ls [] []

let rec pairwise_helper (ls : 'a list) (h : 'a) (acc : ('a * 'a) list) : ('a * 'a) list =
    match ls with
    | a :: (b :: tail) ->
        let remaining = b :: tail in
        let new_acc = ((a, b) :: acc) in
        pairwise_helper remaining h new_acc
    | [a] -> (a, h) :: acc
    | _ -> acc

let pairwise (ls : 'a list) : ('a * 'a) list =
    match ls with
    | [] -> []
    | [_] -> []
    | x :: xs ->
        pairwise_helper ls x []

let rec contains (a : 'a) (ls : 'a list) : bool =
    match ls with
    | x :: xs -> if x = a then true else contains a xs
    | [] -> false

let singleton (a : 'a) : 'a list =
    a :: []

let rec filter_rev_tr_helper (f : 'a -> bool) (ls : 'a list) (acc : 'a list) : 'a list =
    match ls with
    | x :: xs ->
        if f x then
            filter_rev_tr_helper f xs (x :: acc) 
        else
            filter_rev_tr_helper f xs acc
    | [] -> acc

let filter_rev_tr (f : 'a -> bool) (ls : 'a list) : 'a list =
    filter_rev_tr_helper f ls []

let rec find_helper (f : 'a -> bool) (ls : 'a list) (index : int) : ('a * int) option = 
    match ls with
    | x :: xs -> if f x then Some (x, index) else find_helper f xs Int.(1 + index)
    | [] -> None 

let find (f : 'a -> bool) (ls : 'a list) : ('a * int) option =
    find_helper f ls 0

let rec initialize_helper (f : int -> 'a) (length : int) (index : int) (acc : 'a list) : 'a list =
    if length = index then
        acc
    else
        initialize_helper f length Int.(index + 1) ((f index) :: acc)

let initialize (f : int -> 'a) (length : int) : 'a list =
    initialize_helper f length 0 []





external unsafe_get: 'a array -> int -> 'a = "%array_unsafe_get"
external array_length : 'a array -> int = "%array_length"

let rec of_array_helper arr i res =
    let open Int in
    if i < 0 then
        res
    else
        of_array_helper arr (i - 1) (unsafe_get arr i :: res)
    

let of_array arr =
    let open Int in
    of_array_helper arr (array_length arr - 1) []
    