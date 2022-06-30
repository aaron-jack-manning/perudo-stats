open General

external unsafe_get: 'a array -> int -> 'a = "%array_unsafe_get"
external unsafe_set: 'a array -> int -> 'a -> unit = "%array_unsafe_set"
external create: int -> 'a -> 'a array = "caml_make_vect"






external length : 'a array -> int = "%array_length"

external get : 'a array -> int -> 'a = "%array_safe_get"

external set : 'a array -> int -> 'a -> unit = "%array_safe_set"

let of_list = function
    | [] -> [||]
    | x :: xs as l ->
        let a = create (List.length l) x in
        let rec fill i = function
            | [] ->
                a
            | x::xs ->
                unsafe_set a i x;
                fill Int.(i + 1) xs
        in
        fill 1 xs

let create (length : int) (f : int -> 'a) : 'a array =
    if length = 0 then
        [||]
    else if length < 0 then
        Fatal.failwith "Cannot create an array with a size less than 0."
    else
    let result = create length (f 0) in
    for i = 1 to Int.(length - 1) do
        unsafe_set result i (f i)
    done;
    result

let append (arr1 : 'a array) (arr2 : 'b array) =
    let open Int in
    let arr1_length = length arr1 in
    let arr2_length = length arr2 in

    let init i =
        if i < arr1_length then
            get arr1 i
        else
            (get arr2 (i - arr1_length))
    in
        
    create (arr1_length + arr2_length) init

let concat (arrays : 'a array list) : 'a array =
    arrays |> List.foldl append [||]

let map_mutate (f : 'a -> 'a) (arr : 'a array) : unit =
    let open Int in
    for i = 0 to length arr - 1 do
        set arr i ((get arr i) |> f);
    done;;

let copy (arr : 'a array) =
    create (length arr) (fun i -> get arr i)

let map (f : 'a -> 'b) (arr : 'a array) : 'b array =
    create (length arr) (fun i -> (get arr i) |> f)

let linear_search (arr : 'a array) (value : 'a) =
    let i = ref 0 in
    
    while (!i < length arr) & (get arr !i <> value) do
        i := Int.(!i + 1)
    done;

    get arr !i

let rec binary_search_helper (arr : 'a array) (value : 'a) (first : int) (last : int) =
    let midpoint = Int.((first + last) / 2) in

    if midpoint < first or midpoint > last then
        None
    else if value < (get arr midpoint) then
        binary_search_helper arr value first Int.(midpoint - 1)
    else if (get arr midpoint) < value then
        binary_search_helper arr value Int.(midpoint + 1) last
    else if get arr midpoint = value then
        Some (get arr midpoint)
    else
        None

let binary_search (arr : 'a array) (value : 'a) =
    binary_search_helper arr value 0 Int.(length arr - 1)