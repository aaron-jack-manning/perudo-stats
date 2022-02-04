open General


let of_list = Stdlib.Array.of_list

let length = Stdlib.Array.length

let concat = Stdlib.Array.concat

let append = Stdlib.Array.append

let get = Stdlib.Array.get

let set = Stdlib.Array.set

let map = Stdlib.Array.map

let create = Stdlib.Array.init

let heap_sort = Stdlib.Array.sort

let merge_sort = Stdlib.Array.stable_sort

let copy = Stdlib.Array.copy

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