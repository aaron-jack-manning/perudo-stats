open General


module type Map = sig
    type key

    type 'v map

    val empty : 'v map

    val insert : (key * 'v) -> 'v map -> 'v map

    val fetch : key -> 'v map -> 'v option
end

module type MapSpecification = sig
    type key
    
    val comparison : key -> key -> int
end

module RBTreeMap (M : MapSpecification) : Map with type key = M.key = struct

    type colour =
        | Red
        | Black

    type key = M.key

    type 'v map =
        | Leaf
        | Branch of colour * (key * 'v) * 'v map * 'v map
    
    let empty = Leaf

    let rec fetch k = function
        | Leaf -> None
        | Branch (_, (key, value), left, right) ->
            if M.comparison k key < 0 then
                fetch k left
            else if M.comparison k key > 0 then
                fetch k right
            else
                Some value

    let balance = function
        | Black, z, Branch (Red, y, Branch (Red, x, a, b), c), d
        | Black, z, Branch (Red, x, a, Branch (Red, y, b, c)), d
        | Black, x, a, Branch (Red, z, Branch (Red, y, b, c), d)
        | Black, x, a, Branch (Red, y, b, Branch (Red, z, c, d)) ->
            Branch (Red, y, Branch (Black, x, a, b), Branch (Black, z, c, d))
        | a, b, c, d -> Branch (a, b, c, d)

    let rec insert_helper (k, v) = function
        | Leaf -> Branch (Red, (k, v), Leaf, Leaf)
        | Branch (colour, (key, value), left, right) ->
            if M.comparison k key < 0 then
                balance (colour, (key, value), insert_helper (k, v) left, right)
            else if M.comparison k key > 0 then
                balance (colour, (key, value), left, insert_helper (k, v) right)
            else
                Branch (colour, (key, v), left, right)

    let insert ((k, v) : (key * 'v)) map =
        match insert_helper (k, v) map with
        | Branch (_, (key, value), left, right) ->  Branch (Black, (key, value), left, right)
        | Leaf -> Fatal.failwith "if this exception is raised there is an error in the implementation of the function that called it"

end