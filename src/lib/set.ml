open General


module type RBTreeSet = sig
    type member

    type set

    val empty : set

    val insert : member -> set -> set

    val member : member -> set -> bool

    val union : set -> set -> set

    val of_list : member list -> set

    val remove : member -> set -> set

    val difference : set -> set -> set

    val cardinality : set -> int
end

module type SetSpecification = sig    
    type member

    val comparison : member -> member -> int
end

module RBTreeSet (M : SetSpecification) : RBTreeSet with type member = M.member = struct

    type colour =
        | Red
        | Black

    type member = M.member

    type set =
        | Leaf
        | Branch of colour * member * set * set
    
    let empty = Leaf

    let rec member v = function
        | Leaf -> false
        | Branch (_, value, left, right) ->
            if M.comparison v value < 0 then
                member v left
            else if M.comparison v value > 0 then
                member v right
            else
                true

    let balance = function
        | Black, z, Branch (Red, y, Branch (Red, x, a, b), c), d
        | Black, z, Branch (Red, x, a, Branch (Red, y, b, c)), d
        | Black, x, a, Branch (Red, z, Branch (Red, y, b, c), d)
        | Black, x, a, Branch (Red, y, b, Branch (Red, z, c, d)) ->
            Branch (Red, y, Branch (Black, x, a, b), Branch (Black, z, c, d))
        | a, b, c, d -> Branch (a, b, c, d)

    let rec insert_helper v = function
        | Leaf -> Branch (Red, v, Leaf, Leaf)
        | Branch (colour, value, left, right) ->
            if M.comparison v value < 0 then
                balance (colour, value, insert_helper v left, right)
            else if M.comparison v value > 0 then
                balance (colour, value, left, insert_helper v right)
            else
                Branch (colour, v, left, right)

    let insert (v : member) (set : set) : set =
        match insert_helper v set with
        | Branch (_, value, left, right) ->  Branch (Black, value, left, right)
        | Leaf -> Fatal.failwith "if this exception is raised there is an error in the implementation of the function that called it"

    let rec union set1 set2 =
        match set1 with
        | Leaf -> set2
        | Branch (colour, value, left, right) ->
            union left (union right (insert value set2))

    let rec of_list_helper (ls : member list) (acc : set) : set =
        match ls with
        | x :: xs -> of_list_helper xs (insert x acc)
        | [] -> acc

    let of_list ls = of_list_helper ls empty
    
    let rec remove (v : member) (set : set) : set =
        match set with
        | Leaf -> Leaf
        | Branch (colour, value, left, right) ->
            if M.comparison v value < 0 then
                balance (colour, value, remove v left, right)
            else if M.comparison v value > 0 then
                balance (colour, value, left, remove v right)
            else
                union left right

    (* This needs a more efficient implementation. *)
    let rec difference (set1 : set) (set2 : set) : set =
        match set2 with
        | Leaf -> set1
        | Branch (_, value, left, right) ->
            difference (union left right) (remove value set1)

    (* Need a tail recursive implementation. *)
    let rec cardinality (set : set) : int =
        match set with
        | Leaf -> 0
        | Branch (_, _, left, right) ->
            Int.(cardinality left + cardinality right + 1)
end

(* Planned Functions:
    - to_list
    - intersection
    - equal
*)