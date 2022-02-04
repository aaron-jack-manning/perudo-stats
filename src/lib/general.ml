type 'a queue = { front : 'a list; back : 'a list }

type 'a result =
    | Error of string
    | Success of 'a

type 'a stack =
    | Empty
    | Stacked of 'a * 'a stack

type 'a tree =
    | Leaf
    | Branch of 'a * 'a tree list

let ignore (a : 'a) = ()

let id (x : 'a) = x

let ( >> ) f g x = g (f x)

let ( << ) g f x = g (f x)

let ( |> ) f g = g f

external ( = ) : 'a -> 'a -> bool = "%equal"

external ( <> ) : 'a -> 'a -> bool = "%notequal"

external ( < ) : 'a -> 'a -> bool = "%lessthan"

external ( > ) : 'a -> 'a -> bool = "%greaterthan"

external ( <= ) : 'a -> 'a -> bool = "%lessequal"

external ( >= ) : 'a -> 'a -> bool = "%greaterequal"

let not = function
    | true -> false
    | false -> true

external ( or ) : bool -> bool -> bool = "%sequor"

external ( & ) : bool -> bool -> bool = "%sequand"

type 'a ref =
    { mutable contents : 'a }

let ref a =
    { contents = a }

let ( := ) (cell : 'a ref) (contents : 'a) =
    cell.contents <- contents

let ( ! ) (cell : 'a ref) =
    cell.contents


